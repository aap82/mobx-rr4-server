{extendObservable, action, transaction, computed} = require 'mobx'
CrudStore = require('../crud_store').default
DashboardService = require('../../services/dashboard_service').default

class DashboardStore extends CrudStore
  constructor: (state) ->
    super()
    @service = DashboardService.getInstance()
    @name = 'dashboard'
    @refCount = 0
    @layout

    extendObservable @, {
      cols: 10
      isResizable: no
      isDraggable: no

      layout: null
      toggleResizable: action(-> @isResizeable= !@isResizeable)
      toggleDraggable: action(-> @isDraggable = !@isDraggable)

    }





module.exports = new DashboardStore()