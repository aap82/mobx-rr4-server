sideNavStore = require '../SideNav/store'
exports.toggleSideNav = () ->
  sideNavStore.toggle()
  return