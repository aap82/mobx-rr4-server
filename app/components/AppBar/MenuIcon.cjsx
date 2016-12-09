React = require 'react'
{observer} = require 'mobx-react'


class MenuIcon extends React.Component
  render: ->
    {isOpen} = @props.sideNav
    isActive = if isOpen then " is-active" else ""
    <div onClick={@props.onClick} className={"hamburger hamburger--squeeze"+ isActive}>
      <div className="hamburger-box">
        <div className="hamburger-inner"></div>
      </div>
    </div>


`export default (observer(MenuIcon))`

