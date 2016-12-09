require './style.scss'
React = require 'react'
{inject, observer} = require 'mobx-react'










class SideMenu extends React.Component
  render: ->
    <div className="mobx_menu">
      <ul className="mobx_menu-container">
        <li className="mobx_menu-item">
          <a className="mobx_menu-title">
            Dashboards
          </a>
        </li>
        <li className="mobx_menu-item">
          <a className="mobx_menu-link has-active-child">
            <i className="mobx_menu-icon fa fa-bolt"></i>
            Second Item
            <i className="mobx_menu-state-icon fa fa-caret-left rotate-minus-90"></i>
          </a>
          <ul className="mobx_menu-container visible">
            <li className="mobx_menu-item">
              <a className="mobx_menu-link active">
                <i className="mobx_menu-icon fa fa-icon-class-name"></i>
                Sub Menu of Second Item
              </a>
            </li>
          </ul>
        </li>
      </ul>
    </div>


`export default inject('sideMenu')(observer(SideMenu))`

