class Dashing.Semaphore extends Dashing.Widget
  ready: ->
    @get('unordered')
    if @get('unordered')
      $(@node).find('ol').remove()
    else
      $(@node).find('ul').remove()
      @_checkStatus(@items[0].table.state)

  onData: (data) ->
    @_checkStatus(data.items[0].table.state)

  _checkStatus: (status) ->
    $(@node).removeClass('failed pending  passed')
    $(@node).addClass(status)
