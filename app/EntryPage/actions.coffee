{transaction} = require 'mobx'
entryPage = require './store'
{appStore} = require '../store'
axios = require 'axios'
{test} = require('./graphql')


loginAuthorized = (user) ->
  transaction(->
    appStore.isAuthenticated = yes
    appStore.user = user
  )

  entryPage.loginRequired = no
  entryPage.loginCompleted = yes

  return

loginSubmitted = ->
  entryPage.loginRequired = no
  return


loginRequired = ->
  entryPage.loginRequired = yes

  return

checkToken = (token) ->
  axios.post('api/auth/token', {
    token: token
  }).then (res) ->
    entryPage.isLoading = no
    console.log 'this was the respone for check token'
    test res.data.id
    return setTimeout((=> loginAuthorized(res.data.user)), 1000)
  .catch (err) ->
    entryPage.isLoading = no
    console.log 'There was an error'
    console.log err
    setTimeout((=> loginRequired()), 500)


exports.login = (username, password) ->
  loginSubmitted()
  axios.post('api/auth/login', {
    username: username
    password: password
  }).then (res) =>
    console.log 'this was the respone for login'
    console.log res.data
    entryPage.saveToken res.data.token
    setTimeout((=> loginAuthorized(username)), 1000)
  .catch (err) ->
    console.log 'There was an error'
    console.log err
    setTimeout((=> loginRequired()), 500)



exports.onMount = () ->
  console.log 'MOUNTING'
  token = entryPage.loadToken()
  if !token? then return setTimeout((=> loginRequired()), 500)
  return setTimeout((=> checkToken(token)), 1000)



