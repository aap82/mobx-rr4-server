import React, { Component, PropTypes } from 'react'
import {inject, observer} from 'mobx-react'
import LoginModal from '../components/LoginModal'

export const EntryPageView = inject('entryPage')(observer(props => {
  switch (props.entryPage.currentView) {
    case "Loading":
      return <div>LOADING</div>
    case "Login":
      return <LoginModal onLogin={props.onLogin}/>
  };
}))
