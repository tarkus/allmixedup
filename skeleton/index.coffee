Header     = @app.require 'module header'
Home       = @app.require 'module home'
Footer     = @app.require 'module footer'

class Stage extends Spine.Stack
  className: "stage"

  controllers:
    home: Home

  constructor: ->
    @el = $("<div/>").addClass(@className).appendTo($("body")) unless @el?
    @footer = new Footer
    @footer.render()

    @swap = {}
    super
    
class APPNAME extends Spine.Controller
  className: "app"
  
  constructor: ->
    super

    @header  = new Header

    @append @header.render()

    @stage = new Stage
    @setStack @stage

    @stage.header = @header

    eval window.Profile.script if window.Profile

    @routes
      "/*": =>
        @stage.dashboard.active()

$ ->
  moment.lang("zh-cn") if moment

  app = new APPNAME el: $("#wrapper")
  Spine.Route.setup()

  window.App = app

