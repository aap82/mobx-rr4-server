require './style.scss'
React = require 'react'
{inject, observer} = require 'mobx-react'

class LoginModal extends React.Component
  constructor: (props) ->
    super props
    @state =
      username: 'Username'
      password: 'password'
  componentDidMount: => setTimeout((=> @props.loginModal.open()), 200)

  onUserNameFocus: => if @state.username is 'Username' then @setState username: ''
  onUserNameBlur: => if @state.username  is '' then @setState username: 'Username'

  onPasswordFocus: => if @state.password is 'password' then @setState password: ''
  onPasswordBlur: => if @state.password is '' then @setState password: 'password'


  onUserNameChange: (event) =>  @setState username: event.target.value
  onPasswordChange: (event) =>  @setState password: event.target.value


  render: ->
    {isOpen} = @props.loginModal
    submitLogin = () => if @state.username not in ['Username', ''] and @state.password not in ['password', '']
       @props.onLogin @state

    <div className={"login-container " + isOpen}>
      <div id="login">
        <form>
          <fieldset className="clearfix">
            <p>
              <span className="fontawesome-user"></span>
              <input type="text" onFocus={@onUserNameFocus} onBlur={@onUserNameBlur}  value={@state.username} onChange={@onUserNameChange}/>
            </p>
            <p>
              <span className="fontawesome-lock"></span>
              <input type="password" onFocus={@onPasswordFocus} onBlur={@onPasswordBlur}  value={@state.password} onChange={@onPasswordChange} />
            </p>
          </fieldset>
        </form>
        <button onClick={submitLogin}>Login</button>
      </div>
    </div>

`export default inject('loginModal')(observer(LoginModal))`

