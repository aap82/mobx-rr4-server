{extendObservable, action, transaction} = require 'mobx'


class AppBarStore
  constructor: () ->
    extendObservable @, {
      isEditMenuOpen: no
      isVisible: yes

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
