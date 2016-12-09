import { observable, computed, action } from 'mobx';


export default class AppStore {
  @observable user;
  @observable isAuthenticated = false;
  @observable isActive = false;
  @observable isVisible = false;

  @action
  show() {
    this.isVisible = true
  }

  @action
  hide() {
    this.isVisible = false;
  }

}






