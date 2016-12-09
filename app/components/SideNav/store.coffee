{extendObservable, action, transaction, computed} = require 'mobx'


class SideNavStore
  constructor: () ->
    extendObservable @, {

      isOpen: no


      open: action(->
        @isOpen= yes
      )

      close: action(->
        @isOpen = no
      )

      setState: action((state)->
        @isOpen = state
      )

      toggle: action(->
        @isOpen = !@isOpen
      )
    }

module.exports = new SideNavStore()



