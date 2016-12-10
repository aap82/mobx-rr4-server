{extendObservable, action, transaction, computed} = require 'mobx'


class AppBarStore
  constructor: () ->
    extendObservable @, {
      title: ''
      isMainMenuOpen: yes
      isSettingsMenuOpen: no
      isEditMenuOpen: no
      isVisible: yes

      toggleSettingsMenu: action((open) ->
        if open?
          @isSettingsMenuOpen = open
        else
          @isSettingsMenuOpen = !@isSettingsMenuOpen
        return
      )

      toggleEditMenu: action((open) ->
        if open?
          @isEditMenuOpen = open
        else
          @isEditMenuOpen = !@isEditMenuOpen
        @isMainMenuOpen = !@isEditMenuOpen
        return
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