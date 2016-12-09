React = require 'react'
{inject, observer} = require 'mobx-react'
Router = require('react-router/BrowserRouter').default
Redirect = require('react-router/Redirect').default
Match = require('react-router/Match').default
Miss = require('react-router/Miss').default

MainApp = require('./MainApp/MainApp').default
EntryPage = require('./EntryPage/EntryPage').default
DevTools = require('mobx-react-devtools').default



redirectToEntryPage = (props) => <Redirect to={pathname: '/', state: from: props.location} />



class App extends React.Component
  render: ->
    {isAuthenticated} = @props.app
    checkAuth = (props) => if isAuthenticated then <MainApp  {...props} /> else redirectToEntryPage(props)
    <Router>
      <div className='main-container'>
        <DevTools position={{ bottom: 0, left: '20px' }} />
        <Match pattern="/dashboard" render={checkAuth} />
        <Match exactly pattern="/" component={EntryPage} />
        <Miss render={redirectToEntryPage} />
      </div>
    </Router>


`export default inject('app')(observer(App))`


