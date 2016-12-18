React = require 'react'
{inject, observer} = require 'mobx-react'
{ Segment, Sidebar, Button, Popup, Input, Label}  = require('semantic-ui-react')
NumericInput = require('react-numeric-input')
actions = require './actions'

popupStyle = {
  paddingLeft: 5
  paddingRight: 5
  width: 175
  opacity: 0.8
  color: 'white'
}

dropdownRows = [
  {id: "cols", label: "Columns"}
  {id: "rowHeight", label: "Row Height"}
  {id: "marginX", label: "Margin X"}
  {id: "marginY", label: "Margin Y"}
]



InputItem = observer((({id, label, grid: {props}, selectText, inputChange}) =>
  return <Input fluid focus id={id} label={label} onClick={selectText} onChange={inputChange} transparent className="dashboard-settings-item" defaultValue={props.get(id)} />
))


class DashBoardSettingsDropDown extends React.Component
  selectText = (e) ->
      e.target.select()
      return
  inputChange = (_, e) ->
      actions.editGridSettings(e)
      return
  render: ->
    {grid} = @props
    getDropDownRows = =>
      for item in dropdownRows
        {id, label} = item
        <InputItem key={id} id={id} label={label}  grid={grid} selectText={selectText} inputChange={inputChange} />
    <div>
     {getDropDownRows()}
    </div>
DashBoardSettingsDropDown = inject('grid')(observer(DashBoardSettingsDropDown))




class DashBoardSettingsPopUp extends React.Component
  render: ->
    {appBar: {isSettingsMenuOpen: isSettingsMenuOpen}} = @props
    <Popup
      style={popupStyle}
      trigger={<Button className="app-button" content="Dashboard" />}
      content={<DashBoardSettingsDropDown />}
      on='click'
      open={isSettingsMenuOpen}
      onOpen={actions.openSettingsMenu}
      onClose={actions.closeSettingsMenu}
      positioning='bottom center' />
DashBoardSettingsPopUp = inject('appBar')(observer(DashBoardSettingsPopUp))





class EditMenu extends React.Component
  render: ->
    {isOpen} = @props
    <Sidebar animation='push' direction='bottom' visible={isOpen}>
     <Segment  floated="right" className="menu-sections"  vertical={true} >
      <Button onClick={actions.addWidget} className="app-button" content="Add Widget" />
      <DashBoardSettingsPopUp />
      <Button onClick={actions.closeEditMenu} className="app-button" content="Exit" />
     </Segment>
    </Sidebar>

class MainMenu extends React.Component
  render: ->
    {isOpen} = @props
    <Sidebar animation='push' direction='top' visible={isOpen}>
      <Segment  floated="right" className="menu-sections"  vertical={true} >
        <Button size="medium" onClick={actions.openEditMenu} className="app-button" content="Edit" />
      </Segment>
    </Sidebar>



class MenuSections extends React.Component
  render: ->
    {appBar: {isEditMenuOpen: isEditMenuOpen}} = @props
    <Segment floated="right" vertical={true} className="menu-section" >
      <Sidebar.Pushable>
        <Segment floated="right" className="menu-sections"  vertical={true} >
          <MainMenu isOpen={!isEditMenuOpen} />
          <EditMenu isOpen={isEditMenuOpen} />
        </Segment>
      </Sidebar.Pushable>
    </Segment>


`export default inject('appBar')(observer(MenuSections))`


