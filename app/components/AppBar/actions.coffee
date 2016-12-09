dashboardStore = require '../Dashboard/store'
sideNavStore = require '../SideNav/store'
appBarStore = require './store'

exports.toggleSideNav = () -> return sideNavStore.toggle()
exports.settingsMenuToggle = ->
  dashboardStore.toggleDraggable()
  return
