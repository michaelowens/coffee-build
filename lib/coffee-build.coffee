CoffeeBuildView = require './coffee-build-view'

module.exports =
  coffeeBuildView: null

  activate: (state) ->
    @coffeeBuildView = new CoffeeBuildView(state.coffeeBuildViewState)

  deactivate: ->
    @coffeeBuildView.destroy()

  serialize: ->
    coffeeBuildViewState: @coffeeBuildView.serialize()
