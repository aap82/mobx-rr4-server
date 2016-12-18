{extendObservable, action, transaction, computed, asMap} = require 'mobx'
DashboardService = require('../../services/dashboard_service').default
gridStore = require('./gridStore')
widgetStore = require '../Widgets/widgetStore'

class DashboardStore
  constructor:  ->
    @service = DashboardService.getInstance()
    @name = 'dashboard'
    @refCount = 0

    extendObservable @, {
      widgetData: [
        {id: 'abc', type: 'widget_1', device_id: 'me', position: {x: 0, y: 0, w: 1, h: 2}}
        {id: 'absdddfc', type: 'widget_1', device_id: 'me', position: {x: 0, y: 4, w: 1, h: 2}}
        {id: 'absdfc', type: 'widget_3', device_id: 'me', position: {x: 0, y: 4, w: 1, h: 2}}
        {id: 'abdfsc', type: 'widget_3', device_id: 'me', position: {x: 1, y: 0, w: 3, h: 2}}
        {id: 'absssc', type: 'widget_3', device_id: 'me', position: {x: 4, y: 0, w: 1, h: 2}}
      ]
      widgetLayout: computed(-> (@widgetData).slice())
    }


  renderWidget: (widget) => widgetStore.createWidget(widget)



  getWidgetList: ->
    test = @widgetData.findIndex( (w) => w.id is 'abdfsc')
    console.log(test)

  addWidget: (type, device) =>
    console.log @refCount
    @refCount =  @refCount + 1
    @widgetData.push({
      id: type + '_' + @refCount
      type: type
      device_id: device
      position: {x: 0, y: 0, w: 1, h: 2}
    })



dashBoard = new DashboardStore()

module.exports = dashBoard