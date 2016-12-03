{extendObservable, action, transaction} = require 'mobx'
Promise = require 'bluebird'

class LoginModalStore
  constructor: ->
    extendObservable @, {
      isOpen: false

      open: action(->
        @isOpen = yes
      )
      close: action( ->
        @isOpen = no
      )
    }


module.exports = LoginModalStore