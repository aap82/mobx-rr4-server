require './style.scss'
React = require 'react'
{inject, observer} = require 'mobx-react'
actions = require './actions'
{ Button }  = require('semantic-ui-react')

const ButtonExampleGroup = () => (
  <Button.Group>
    <Button>One</Button>
    <Button>Two</Button>
    <Button>Three</Button>
  </Button.Group>
)

export default ButtonExampleGroup

height = 45

SettingsButton = (props) => (
  <div className="sub-menu-parent">
    <Button
      icon={<SettingsOptionIcon />}
      label="SETTINGS"
      onClick={actions.settingsMenuToggle}
      fill={true}
      primary={false}
      secondary={true}
      accent={false}
      plain={true}>

                  <div className="sub-menu">
                    <p>HELLO</p>
                    <p>HELLO</p>
                    <p>HELLO</p>
                  </div>

    </Button>
  </div>
)

class AppBar extends React.Component
  render: ->
    <div style={{height: height}} className="AppBar-Container container-fluid">
      <div className="row fit middle-xs end-xs">
        <div className="col-sm-offset-1 col-sm-8 last-sm">
          <div className="row end-sm fit">
            <div className="col-sm-6 app-button">
              <SettingsButton />
            </div>

          </div>
        </div>
      </div>
    </div>

  toggleSideNav = () => return actions.toggleSideNav()


`export default inject('appBar', 'sideNav')(observer(AppBar))`

