Header     = @app.require 'module header'
Footer     = @app.require 'module footer'

class Stage extends Spine.Stack
  className: "stage"

  controllers:
    # Add Scenes here
    main: Main

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
    # Initialize other components here

    @append @header.render()

    @stage = new Stage
    @setStack @stage

    # Append component views
    @append @forgot.render()

    @stage.header = @header

    eval window.Profile.script if window.Profile

    @routes
      "/*": =>
        @stage.main.active()

$ ->
  moment.lang("zh-cn") if moment

  app = new APPNAME el: $("#wrapper")
  Spine.Route.setup()

  window.App = app

