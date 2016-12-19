React = require 'react'

{inject, observer} = require 'mobx-react'
ReactGridLayout = require 'react-grid-layout'
ResponsiveReactGridLayout = require('react-grid-layout').Responsive
{ WidthProvider}  = require 'react-grid-layout'
GridLayout = WidthProvider(ReactGridLayout)
actions = require './actions'
ResponsiveReactGridLayout = WidthProvider(ResponsiveReactGridLayout)
Grid = require('./Grid').default


class Dashboard extends React.Component
  render: ->
    {widgetLayout, renderWidget} = @props.dashboard
    <Grid onChange={handleLayoutChange}>
      {
        for widget in widgetLayout
          layout = {}
          layout = widget.position
          layout.i = widget.id
          <div key={widget.id} data-grid={layout} style={background: "green"} >
            {renderWidget(widget)}
          </div>
      }

    </Grid>
  handleLayoutChange = (layout) ->
    console.log layout


`export default inject('dashboard')(observer(Dashboard))`

