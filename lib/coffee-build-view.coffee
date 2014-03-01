{View} = require 'atom'

module.exports =
class CoffeeBuildView extends View
  @content: ->
    @div class: 'coffee-build overlay from-top', =>
      @div "The CoffeeBuild package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "coffee-build:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "CoffeeBuildView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
