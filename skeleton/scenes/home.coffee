class Home extends Spine.Controller
  className: "act home"

  constructor: ->
    super

  render: =>
    @html @template("home")()
    @el.append @stack.footer.el.html()
    @

@app.exports["module home"] = Home
