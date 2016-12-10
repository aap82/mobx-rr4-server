dashboardStore = require '../Dashboard/store'
appBarStore = require './store'

exports.openSettingsMenu = ->
  appBarStore.toggleSettingsMenu(yes)
  return

exports.closeSettingsMenu = ->
  appBarStore.toggleSettingsMenu(no)
  return


exports.openEditMenu = ->
  appBarStore.toggleEditMenu(yes)
  return
exports.closeEditMenu = ->
  appBarStore.toggleEditMenu(no)
  return
