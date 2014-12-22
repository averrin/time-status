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
    span.textContent = 'Time status'
    @appendChild(span)

  update: ->
    setInterval ( =>
      currentDate = new Date
      currentTime = currentDate.getHours() + ":" + currentDate.getMinutes()
      currentTime = currentTime.replace( /\b(\d)\b/g, "0$1" )
      currentTime.replace /\s/g, ""

      @time.textContent = currentTime
    ), 1000

module.exports = document.registerElement('time-status',
                                          prototype: TimeStatusView.prototype,
                                          extends: 'div')
