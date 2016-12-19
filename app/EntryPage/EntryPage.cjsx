require './style.scss'
React = require 'react'
{inject, observer} = require 'mobx-react'
Redirect = require('react-router/Redirect').default
actions = require './actions'
LoginModal = require('../components/LoginModal').default
Loading = require('react-loading')

onLoginSubmit = ({username, password}) => actions.login(username, password)
CurrentView = (observer(({store}) => (
    switch store.currentView
      when 'Ready' then <Redirect to={{pathname: '/dashboard'}} />
      when 'Login' then <LoginModal onLogin={onLoginSubmit} />
      else <Loading type="spokes" color="#5BC0BE"/>)

))


class EntryPage extends React.Component
  constuctor: (props) ->
    super props



  componentDidMount: ->
    return actions.onMount()

  render: ->
    console.log @props
    {entryPage} = @props
    <div className="entry-page">
      <div className="entry-container">
        <CurrentView store={entryPage} />
      </div>
    </div>

  onLoginSubmit = ({username, password}) => actions.login(username, password)


`export default inject('entryPage')(observer(EntryPage))`

