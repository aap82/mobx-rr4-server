{transaction} = require 'mobx'
fetch = require('graphql-fetch')('/graphql')
gridStore = require '../components/Dashboard/gridStore'
query = "
  query q ($id: Int!) {

    entry {
      deviceType
      dashboards(UserId: $id) {
        id
        title
      }
      dashboard(UserId: $id) {
        id
        title
        props {
          marginX
          marginY
          cols
          rowHeight
        }
      }
    }
  }


"


exports.test = (id) =>
  fetch(query, {id: id})
  .then (results) =>
    if (results.errors)
      console.log results
      return
    else
      console.log results.data
      gridStore.props.merge(results.data.entry.dashboard.props)
      return results.data.entry
