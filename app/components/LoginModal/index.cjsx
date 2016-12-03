require './style.scss'
React = require 'react'
ReactCSSTransitionGroup = require('react-addons-css-transition-group').default
{inject, observer} = require 'mobx-react'
# react-progress-button
# https://cloudflare.github.io/cf-ui/#cf-component-loading
class LoginModal extends React.Component
  constructor: (props) ->
    super props
    @state =
      username: 'Tessdfsft'
      password: ''
  componentDidMount: => setTimeout((=> @props.loginModal.open()), 500)



  onUserNameChange: (event) =>  @setState username: event.target.value
  onPasswordChange: (event) =>  @setState password: event.target.value
  render: ->
    {isOpen} = @props.loginModal
    console.log @props
    submitLogin = () => @props.onLogin @state

    <div className={"login-container " + isOpen}>
      <div id="login">
        <form>
          <fieldset className="clearfix">
            <p>
              <span className="fontawesome-user"></span>
              <input type="text" value={@state.username} onChange={@onUserNameChange}/>
            </p>
            <p>
              <span className="fontawesome-lock"></span>
              <input type="password" value={@state.password} onChange={@onPasswordChange} />
            </p>
          </fieldset>
        </form>
        <button onClick={submitLogin}>Login</button>
      </div>
    </div>

`export default inject('loginModal')(observer(LoginModal))`

