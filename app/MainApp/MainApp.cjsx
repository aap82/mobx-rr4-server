require './style.scss'
React = require 'react'
{ inject, observer } = require 'mobx-react'
Dashboard = require('../components/Dashboard/Dashboard').default
AppBar = require('../components/AppBar/AppBar').default
SideNav = require('../components/SideNav/SideNav').default
actions = require './actions'

class MainApp extends React.Component
  constructor: (props) ->
    super(props)


  componentDidMount: => requestAnimationFrame((=> @props.app.show()), 100)

  render: ->
    {app} = @props
    <div className={'main-app-container ' + app.isVisible}>
      <SideNav>
        <AppBar />
        <Dashboard />
      </SideNav>
     </div>





`export default inject('app')(observer(MainApp))`

