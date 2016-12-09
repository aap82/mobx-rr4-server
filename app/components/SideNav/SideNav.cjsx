require './style.scss'
React = require 'react'
Sidebar = require('react-sidebar').default
{inject, observer} = require 'mobx-react'
SideMenu = require('../SideMenu/SideMenu').default
actions = require './actions'

APPBARHEIGHT = 65
styles =
      root:
        height: "100%"
      sidebar:
        top: APPBARHEIGHT
        zIndex: 2
        width: 300
        backgroundColor: 'rgba(0,0,0,0.9)'
      overlay:
        zIndex: 1
        top: APPBARHEIGHT
        backgroundColor: 'rgba(0,0,0,.5)'


SideBarContent = (
  <SideMenu />
)


class SideNav extends React.Component
  render: ->
    {isOpen} = @props.sideNav
    <Sidebar
      onSetOpen={setOpen}
      sidebar={SideBarContent}
      styles={styles}
      open={isOpen}>
      {@props.children}
    </Sidebar>

  setOpen = (open) => return actions.setState(open)



`export default inject('sideNav')(observer(SideNav))`

