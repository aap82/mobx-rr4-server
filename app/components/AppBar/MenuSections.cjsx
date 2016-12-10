React = require 'react'
{inject, observer} = require 'mobx-react'
{ Sidebar, Segment, Button, Popup}  = require('semantic-ui-react')
actions = require './actions'





DashBoardSettingsPopUp = inject('appBar')(observer(({appBar}) => (
    <Popup
      trigger={<Button className="app-button" content="Dashboard" />}
      content={"HELLLLLLLLLLLLLLLLLLL OOOo"}
      on='click'
      open={appBar.isSettingsMenuOpen}
      onOpen={actions.openSettingsMenu}
      onClose={actions.closeSettingsMenu}
      positioning='bottom center'
     />

)))




EditMenu = observer(({appBar}) => (
  <Sidebar animation='push' direction='bottom' visible={appBar.isEditMenuOpen}>
    <Segment  floated="right" className="menu-sections"  vertical={true} >
      <Button onClick={actions.closeEditMenu} className="app-button" content="Add Widget" />
      <DashBoardSettingsPopUp />
      <Button onClick={actions.closeEditMenu} className="app-button" content="Exit" />
    </Segment>
  </Sidebar>
))




MainMenu = observer(({appBar}) => (
  <Sidebar animation='push' direction='bottom' visible={appBar.isMainMenuOpen}>
    <Segment  floated="right" className="menu-sections"  vertical={true} >
      <Button size="medium" onClick={actions.openEditMenu} className="app-button" content="Edit" />
    </Segment>
  </Sidebar>
))


MenuSections = ({appBar}) => (
  <Segment floated="right" vertical={true} className="menu-section" >
    <Sidebar.Pushable>
      <Segment floated="right" className="menu-sections"  vertical={true} >
        <MainMenu appBar={appBar} />
        <EditMenu appBar={appBar} />
      </Segment>
    </Sidebar.Pushable>
  </Segment>
)
`export default MenuSections`

