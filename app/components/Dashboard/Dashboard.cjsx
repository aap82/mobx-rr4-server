React = require 'react'
{inject, observer} = require 'mobx-react'
ReactGridLayout = require 'react-grid-layout'
{ WidthProvider}  = require 'react-grid-layout'
GridLayout = WidthProvider(ReactGridLayout)
actions = require './actions'

class Dashboard extends React.Component
  constructor: (props) ->
    super(props)
    @layout = null

  isDifferent = (old, nw) ->
    if (!old) then return no
    if (!nw) then return no
    isDiff = false
    for i in (old.length - 1)
      if (old[i].x isnt nw[i].x  || old[i].y isnt nw[i].y || old[i].w isnt nw[i].w || old[i].h isnt nw[i].h)
        isDiff = true
        break
    return isDiff

  updateWidget = (old, nw) ->
    for i in (old.length - 1)
      for j in (nw.length - 1)
        if old[i].i is nw[j].i
          old[i].x = nw[i].x
          old[i].y = nw[i].y
          old[i].w = nw[i].w
          old[i].h = nw[i].h
          break

  render: ->
    {isDraggable, isResizeable} = @props.dashboard
    layout = [
      {i: 'a', x: 0, y: 0, w: 1, h: 2},
      {i: 'b', x: 1, y: 0, w: 3, h: 2, minW: 2, maxW: 4},
      {i: 'c', x: 4, y: 0, w: 1, h: 2}
    ]
    <GridLayout
          className="layout"
          layout={layout}
          cols={5}
          rowHeight={30}
          width={1200}
          isDraggable={isDraggable}
          isResizeable={isResizeable}>
      <div onClick={toggleSideNav} style={background: "red"} key={'a'}>b</div>
      <div style={background: "red"} key={'b'}>esdfs</div>
      <div style={background: "red"} key={'c'}>f</div>
    </GridLayout>

  toggleSideNav = () => return actions.toggleSideNav()

`export default inject('dashboard')(observer(Dashboard))`

