class App.TextControl extends Mozart.Control
  tag: "input"
  skipTemplate: true

  init: ->
    super
    @subscribe 'change:value', @updateInputValue
      
  afterRender: =>
    @element.type = @typeHtml if @typeHtml?
    @updateInputValue()
    @element

  updateInputValue: =>
    return unless @element? and !@writing
    @element.val(@value)

  focus: ->
    return unless @element?
    @element.focus()

  blur: ->
    return unless @element?
    @element.blur()
    
  keyUp: (e) ->
    @writing = true
    @set 'value', @element.val()
    @writing = false