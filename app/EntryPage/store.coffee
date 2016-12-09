{extendObservable, action, transaction, computed} = require 'mobx'
Promise = require 'bluebird'

class EntryPageStore
  referrer: null
  constructor: ->
    extendObservable @, {
      isLoading: yes
      loginRequired: no
      loginCompleted: no
      currentView: computed(->
        if @loginCompleted
          return 'Ready'
        if @loginRequired
          return 'Login'
        else
          return 'Loading'
      )
    }

  loadToken: ->
    _token = localStorage.getItem('dashboard-token')
    return if _token? then _token else null

  saveToken: (token) ->
    if token? then localStorage.setItem('dashboard-token', token)
    return



module.exports = new EntryPageStore()






#
#
#
#
#
#
#if @props.location.state?
#  <Redirect to={@props.location.state.from} />
#          else
#            <Redirect to={{pathname: '/dashboard', state: { user: 'busty'}}} />