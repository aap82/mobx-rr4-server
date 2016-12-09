{extendObservable, action, transaction, computed} = require 'mobx'
CrudStore = require('../crud_store').default
DashboardService = require('../../services/dashboard_service').default

class DashboardStore extends CrudStore
  constructor: (state) ->
    super()
    @service = DashboardService.getInstance()
    @name = 'dashboard'
    @refCount = 0

    extendObservable @, {
      cols: 12
      isResizable: no
      toggleResizable: action(->
        @isResizeable= !@isResizeable
        return
      )

      isDraggable: no
      toggleDraggable: action(->
        @isDraggable = !@isDraggable
        return
      )
    }





module.exports = new DashboardStore()