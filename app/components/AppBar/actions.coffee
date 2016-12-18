{transaction} = require 'mobx'
dashboardStore = require '../Dashboard/store'
gridStore = require '../Dashboard/gridStore'
appBarStore = require './store'

exports.openEditMenu = ->
  transaction(->
    gridStore.changeEditability(yes)
    appBarStore.isEditMenuOpen = yes
  )


exports.closeEditMenu = ->
  transaction(->
    gridStore.changeEditability(no)
    appBarStore.isEditMenuOpen = no
  )


exports.editGridSettings = (e) ->
  if e?.id? and e?.value?
    if e.value isnt '' or 0
      value = parseInt e.value, 10
      gridStore.editAttribute(e.id, value)
  return


exports.addWidget = () ->
  dashboardStore.addWidget 'widget_3', 'me'