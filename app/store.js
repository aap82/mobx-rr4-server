import { observable, computed, action } from 'mobx';
import { fromPromise } from 'mobx-utils';
import EntryPageStore from './EntryPage/store';
import LoginModalStore from './components/LoginModal/store';


class AppStore {
  @observable user;
  @observable isAuthenticated = false;
  @observable isActive = false;
  @observable isVisible = false;

  @action
  updateUser(user = '') {
    this.user = user;
  }


}


export default function (initialState = {}) {
  const appStore = new AppStore();
  const entryPageStore = new EntryPageStore();
  const loginModalStore = new LoginModalStore();
  const stores = {
    app: appStore,
    entryPage: entryPageStore,
    loginModal: loginModalStore,
  }

  return stores;

}

