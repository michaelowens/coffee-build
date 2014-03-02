CoffeeBuild = require './coffee-build'

module.exports =
  activate: =>
    @coffeeBuild = new CoffeeBuild()

  deactivate: =>
    @coffeeBuild.destroy()
