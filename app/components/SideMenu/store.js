import {observable, action, transaction} from 'mobx'

class SideMenuStore {
  @observable content = []


}
const store = new SideMenuStore()
export default store