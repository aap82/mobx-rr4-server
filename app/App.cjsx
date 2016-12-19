React = require 'react'
{inject, observer} = require 'mobx-react'
Router = require('react-router/BrowserRouter').default
Redirect = require('react-router/Redirect').default
Match = require('react-router/Match').default
Miss = require('react-router/Miss').default
{crel} = require 'teact'
MainApp = require('./MainApp/MainApp').default
EntryPage = require('./EntryPage/EntryPage').default
DevTools = require('mobx-react-devtools').default
{setLogEnabled} = require('mobx-react-devtools')


redirectToEntryPage = (props) => <Redirect to={pathname: '/', state: from: props.location} />
class MatchWithProps extends React.Component
  render: ->
    <Match {...@props} render={((matchProps) => crel @props.component, @props )} />

MatchWithProps = (observer(MatchWithProps))

class ProtectedRoute extends React.Component
  render: ->
    {isAuthenticated} = @props.app
    <Match {...@props} render={((matchProps) =>
      if isAuthenticated
        crel @props.component, @props
      else
        <Redirect to={pathname: '/', state: from: matchProps.location} />
    )} />

ProtectedRoute = inject('app')(observer(ProtectedRoute))

class App extends React.Component
  render: ->
    {router} = @props
    <div className='main-container'>
      <ProtectedRoute pattern="/dashboard" component={MainApp} />
      <MatchWithProps exactly pattern="/" router={router} component={EntryPage} />
      <Miss render={redirectToEntryPage} />
      <DevTools position={{ bottom: 0, left: '20px' }} />
    </div>


`export default (observer(App))`


