{Subscriber} = require 'emissary'
CoffeeBuildView = require './coffee-build-view'

module.exports =
  class CoffeeBuild
    Subscriber.includeInto this

    coffeeBuildView: null

    constructor: ->
      atom.workspaceView.eachEditorView (editorView) =>
        @handleBufferEvents editorView

    handleBufferEvents: (editorView) ->
      buffer = editorView.editor.getBuffer()

      @subscribe buffer, 'saved', =>
        buffer.transact =>
          @build()

    build: ->
      console.log 'building...'

    deactivate: ->
      @coffeeBuildView.destroy()

    serialize: ->
      coffeeBuildViewState: @coffeeBuildView.serialize()
