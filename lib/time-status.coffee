class TimeStatus
  view: null

  # Activates the package.
  activate: ->
    atom.packages.once 'activated', =>
      statusBar = document.querySelector("status-bar")
      if statusBar?
        TimeStatusView = require './time-status-view'
        @view = new TimeStatusView
        @view.initialize(statusBar)
        @view.attach()

  # Deactivates the package.
  deactivate: ->
    @view?.destroy()

module.exports = new TimeStatus()
