import { observable, computed, action } from 'mobx';
import { fromPromise } from 'mobx-utils';
import entryPageStore from './EntryPage/store';
import dashboardStore from './components/Dashboard/store';
import gridStore from './components/Dashboard/gridStore';
import loginModalStore from './components/LoginModal/store';
import appBarStore from './components/AppBar/store'
import sideNavStore from './components/SideNav/store'
import sideMenuStore from './components/SideMenu/store'
import widgetStore from './components/Widgets/widgetStore'

import AppStore from './MainApp/store'
export const appStore = new AppStore();

export default function (initialState = {}) {
  const stores = {
    app: appStore,
    grid: gridStore,

    entryPage: entryPageStore,
    loginModal: loginModalStore,
    dashboard: dashboardStore,
    appBar: appBarStore,
    sideNav: sideNavStore,
    sideMenu: sideMenuStore
  }

  return stores;

};

