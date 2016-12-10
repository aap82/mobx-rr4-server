React = require 'react'
{inject, observer} = require 'mobx-react'

class SettingsMenu extends React.Component
  render: ->

SettingsMenu = observer(({appBar}) => (
  <Sidebar animation='push' direction='bottom' visible={appBar.isSettingsMenuOpen}>
    <Segment  floated="right" className="menu-sections"  vertical={true} >
      <Button onClick={actions.closeSettingsMenu} className="app-button" content="Settings 1" />
      <Button onClick={actions.closeSettingsMenu} className="app-button" content="Settings 2" />
      <Button onClick={actions.closeSettingsMenu} className="app-button" content="Close" />
    </Segment>
  </Sidebar>
))



`export default observer(SettingsMenu)`

