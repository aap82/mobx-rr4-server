React = require 'react'
{inject, observer} = require 'mobx-react'
Router = require('react-router/BrowserRouter').default
Redirect = require('react-router/Redirect').default
Match = require('react-router/Match').default
Miss = require('react-router/Miss').default

MainApp = require('./MainApp/MainApp').default
EntryPage = require('./EntryPage/EntryPage').default
DevTools = require('mobx-react-devtools').default
{setLogEnabled} = require('mobx-react-devtools')


redirectToEntryPage = (props) => <Redirect to={pathname: '/', state: from: props.location} />



class App extends React.Component
  render: ->
    {isAuthenticated} = @props.app
    checkAuth = (props) => if isAuthenticated then <MainApp  {...props} /> else redirectToEntryPage(props)
    <div className='main-container'>
      <Match pattern="/dashboard" render={checkAuth} />
      <Match exactly pattern="/" component={MainApp} />
      <Miss render={redirectToEntryPage} />
      <DevTools position={{ bottom: 0, left: '20px' }} />
    </div>


`export default inject('app')(observer(App))`


