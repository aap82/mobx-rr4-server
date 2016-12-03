require './style.scss'
React = require 'react'
{inject, observer} = require 'mobx-react'
Redirect = require('react-router/Redirect').default
actions = require './actions'
LoginModal = require('../components/LoginModal').default




class EntryPage extends React.Component
  constuctor: (props) ->
    super props
    @state
      referrer: null

  componentDidMount: ->
    if @props.location.state? then  @setState referrer: @props.location.state.from
    { entryPage } = @props
    return actions.onMount(entryPage)


  onLoginSubmit: ({username, password}) =>
    console.log 'user submit'
    console.log username, password

  render: ->
    {redirectToReferrer, loginRequired, isLoading} = @props.entryPage
    <div className="entry-page">
      <div className="entry-container">
       {
        if redirectToReferrer
          if @props.location.state?
            <Redirect to={@props.location.state.from} />
          else
            <Redirect to={{pathname: '/dashboard', state: { user: 'busty'}}} />
        else if loginRequired
          <LoginModal onLogin={@onLoginSubmit}/>

        else if isLoading
          <div>LOADING</div>
       }
      </div>
    </div>


`export default inject('app','entryPage')(observer(EntryPage))`

