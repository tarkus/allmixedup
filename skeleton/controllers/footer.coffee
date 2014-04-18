class Footer extends Spine.Controller

  render: =>
    @html @template("footer")(@)
    @

@app.exports["module footer"] = Footer
