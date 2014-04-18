class Main extends Spine.Controller
  className: "act main"

  constructor: ->
    super

  render: =>
    @html @template("main")()
    @el.append @stack.footer.el.html()
    @

@app.exports["module main"] = Main
