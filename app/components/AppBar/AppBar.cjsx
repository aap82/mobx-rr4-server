require './style.scss'
React = require 'react'
MenuSections = require('./MenuSections').default
{inject, observer} = require 'mobx-react'
actions = require './actions'

height = 45

class AppBar extends React.Component
  render: ->
    {appBar} = @props
    <div style={{height: height}} className="AppBar-Container">
      <MenuSections appBar={appBar} />
    </div>

  toggleSideNav = () ->
    actions.toggleSideNav()
    return


`export default inject('appBar', 'sideNav')(observer(AppBar))`

