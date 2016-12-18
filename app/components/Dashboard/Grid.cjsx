React = require 'react'
{inject, observer} = require 'mobx-react'
ReactGridLayout = require 'react-grid-layout'
ResponsiveReactGridLayout = require('react-grid-layout').Responsive
{ WidthProvider}  = require 'react-grid-layout'
GridLayout = WidthProvider(ReactGridLayout)
ResponsiveReactGridLayout = WidthProvider(ResponsiveReactGridLayout)

class Grid extends React.Component
  constructor: (props) ->
    super props
    @state =
      layout: null

  componentDidMount: =>
    console.log 'mounting'

  onLayoutChange:  (layout) =>
    @setState layout: layout

  render: ->
    {children, grid, onChange} = @props
    {margin, props, isDraggable, isResizeable} = grid

    <GridLayout
      className="layout"
      isDraggable={isDraggable}
      isResizable={isResizeable}
      cols={props.get('cols')}
      rowHeight={props.get('rowHeight')}
      margin = {margin}
      onLayoutChange={@onLayoutChange}>
      {children}
    </GridLayout>

`export default inject('grid')(observer(Grid))`

