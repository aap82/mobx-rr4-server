require './style.scss'
React = require 'react'
{inject, observer} = require 'mobx-react'
Redirect = require('react-router/Redirect').default
actions = require './actions'
LoginModal = require('../components/LoginModal').default
Loading = require('react-loading')



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
    {currentView} = @props.entryPage
    <div className="entry-page">
      <div className="entry-container">
       {
        switch currentView
          when 'Login' then <LoginModal onLogin={@onLoginSubmit}/>
          when 'Loading' then <Loading type="spokes" color="#5BC0BE"/>
       }
      </div>
    </div>


`export default inject('app','entryPage')(observer(EntryPage))`

