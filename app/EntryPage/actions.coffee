










exports.onMount = (entryPage) ->
  token = entryPage.loadToken()
  setTimeout((=> entryPage.loginRequired = yes), 5000)




