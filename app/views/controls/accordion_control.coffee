class App.AccordionControl extends Mozart.Collection
  viewClassLookup: "App.AccordionPanelControl"
  activeClassName: 'active'
  idPrefix: 'accordion'
  idField: 'id'
  tag: 'div'

  init: ->
    super
    @bind 'change:value', @markActive

  draw: =>
    super
    @markActive()

  markActive: =>
    view.element.toggleClass(@activeClassName, view.content[@idField] == @value) for id, view of @itemViews when view.element?
      
