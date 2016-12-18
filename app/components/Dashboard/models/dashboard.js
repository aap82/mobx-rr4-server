import React from 'react'

export default class DashboardModel {
  static create(title) {
    return {
      _id : null,
      title  : title,
      isHidden : false,
      widgets : []
    }
  }
}