sideNavStore = require '../components/SideNav/store'


exports.toggle = ->
  console.log 'toggle'
  sideNavStore.setState !sideNavStore.isOpen