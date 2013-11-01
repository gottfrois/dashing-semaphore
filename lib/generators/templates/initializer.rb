# Use this hook to configure Dashing-Semaphore bahaviors.
Dashing::Semaphore.configure do |config|
  # You semaphore auth token.
  # config.auth_token = 'your_auth_token_from_semaphore'

  # A list of hash where the key is the widget_id and the value is your
  # semaphore project name and an optional branch name.
  # config.projects = [
  #   { widget_id: 'project_name/branch_name'}
  # ]
end
