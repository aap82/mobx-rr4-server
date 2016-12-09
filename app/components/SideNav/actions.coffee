sideNavStore = require './store'

exports.setState = (open) =>
  console.log(open)
  return sideNavStore.setState(open)