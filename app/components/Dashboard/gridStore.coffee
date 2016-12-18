{extendObservable, action, computed, asMap, toJS} = require 'mobx'

class GridStore
  constructor: ->
    @currentLayout = []
    extendObservable @, {
      autoSize: yes
      isDraggable: no
      isResizable: no
      props: asMap {
        cols: 5
        rowHeight: 150
        marginX: 10
        marginY: 10
      }

      margin: computed(->
        return [@props.get('marginX'), @props.get('marginY')]
      )
      changeEditability: action((value) ->
        @isDraggable = value
        @isResizable = value
      )


      editAttribute: action((id, value)-> @props.set(id, value))
    }

  currentGridState: ->
    return toJS(@props)





gridStore = new GridStore()

module.exports = gridStore