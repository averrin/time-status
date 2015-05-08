class TimeStatusView extends HTMLElement

  initialize: (@statusBar) ->
    @classList.add('inline-block')
    @time = @createSpan()

  attach: ->
    @statusBar?.appendRight(this)
    @update()

  createSpan: ->
    span = document.createElement('span')
    span.classList.add('time-status', 'inline-block')
    span.textContent = @getTime()
    @appendChild(span)

  update: ->
    setInterval ( =>
      @time.textContent = @getTime()
    ), 1000

  getTime: ->
    (new Date).toLocaleTimeString navigator.language,
      hour: '2-digit'
      minute:'2-digit'

module.exports = document.registerElement('time-status',
                                          prototype: TimeStatusView.prototype,
                                          extends: 'div')
