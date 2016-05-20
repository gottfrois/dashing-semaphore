require 'delegate'
require 'net/http'
require 'uri'

module Dashing
  module Semaphore
    class Scheduler < ::SimpleDelegator

      include ActionView::Helpers::DateHelper

      attr_reader :config, :frequence

      def initialize(frequence)
        @config     = Dashing::Semaphore.config
        @frequence  = frequence
        super(config)
      end

      def call
        schedule if valid?
      end

      private

      def schedule
        Dashing.scheduler.every frequence, first_in: 1.second.since do
          projects.each do |project|
            key   = project.keys.first.to_s
            item  = update_builds(project.values.first.to_s)
            Dashing.send_event(key, items: [item])
          end
        end
      end

      def valid?
        true
      end

      def update_builds(project)
        query   = project.split('/')
        project = search_project(json_response, query.first)

        raise "no project with name #{query.first}" unless project

        branch = search_branch(project, query)

        raise "no branch with name #{query[1]} for project #{query[0]}" unless branch

        build_info(branch)
      end

      def build_info(branch)
        info        = OpenStruct.new
        info.label  = branch['branch_name']
        info.value  = "Build #{branch['build_number']}, #{branch['result']}"
        info.time   = calculate_time(branch['finished_at'])
        info.state  = branch['result']

        info
      end

      def calculate_time(time)
        time ? time_ago_in_words(Time.parse(time)) : 'Not built yet'
      end

      def search_branch(project, query)
        query.size > 1 ? search_by_branch_name(project, query) : search_within_last_build(project)
      end

      def search_by_branch_name(project, branch)
        project['branches'].find { |b| b['branch_name'] == branch[1] } if project['branches']
      end

      def search_within_last_build(project)
        project['branches'].last if project['branches']
      end

      def search_project(json, project)
        json.find { |p| p['name'] == project }
      end

      def http
        @http ||= ::Net::HTTP.new(uri.host, uri.port)
        @http.use_ssl = true
        @http
      end

      def request
        @request ||= ::Net::HTTP::Get.new(uri.request_uri)
      end

      def response
        @response ||= http.request(request)
      end

      def json_response
        JSON.parse(response.body)
      end

      def uri
        @uri ||= ::URI.parse("https://semaphoreci.com/api/v1/projects?auth_token=#{auth_token}")
      end

      def projects
        config.projects
      end

      def auth_token
        config.auth_token
      end

    end
  end
end
