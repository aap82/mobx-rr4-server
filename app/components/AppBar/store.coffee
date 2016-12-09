{extendObservable, action, transaction, computed} = require 'mobx'


class AppBarStore
  constructor: () ->
    extendObservable @, {
      title: ''
      isSettingsMenuOpen: no
      isVisible: yes
      toggleSettingsMenu: action(->
        @isSettingsMenuOpen = !@isSettingsMenuOpen
      )
      show: action(->
        @isVisible = yes
      )

      hide: action(->
        @isVisible = no
      )
    }

module.exports = new AppBarStore()

#<div className="col-xs-3">
#<MenuIcon
#onClick={toggleSideNav}
#sideNav={@props.sideNav} />
#        </div>