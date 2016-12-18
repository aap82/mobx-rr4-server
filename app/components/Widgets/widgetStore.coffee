_ = require 'lodash'
{crel} = require 'teact'

{
  Widget1,
  Widget2,
  Widget3,
  Widget4
} = require('./Widgets')


class WidgetStore
  constructor: ->
    @refCount = 0
    @widgetsList = [
      {name: "widget_1", layout: {w: 1, h: 2, minW: 1, maxW: 4}}
      {name: "widget_2", layout: {w: 1, h: 2, minW: 0, maxW: 4}}
      {name: "widget_4", layout: {w: 1, h: 2, minW: 2, maxW: 4}}
      {name: "widget_3", layout: {w: 1, h: 2, minW: 3, maxW: 4}}
    ]
    @widgets =
      widget_1: {minW: 1, maxW: 4}
      widget_2: {minW: 0, maxW: 4}
      widget_4: {minW: 2, maxW: 4}
      widget_3: {minW: 3, maxW: 4}


  createWidget: ({type, device_id}) =>
    props = {device: device_id}
    switch type
      when "widget_1" then return crel Widget1, props
      when "widget_2" then return crel Widget2, props
      when "widget_3" then return crel Widget3, props
      when "widget_4" then return crel Widget4, props

  getWidgetNames: => _.keys @widgets



widgetStore = new WidgetStore()

module.exports = widgetStore
