import { observable, action } from 'mobx'



class GridLayoutPropsStore {
  @observable autoSize = false
  @observable cols = 6
  @observable isDraggable = false
  @observable isResizeable = false
  @observable margin = [10, 10]
  @observable containerPadding = [0, 0]
  @observable rowHeight = 150
  @observable layout  = []

  constructor(init = {}) {
    if()

    this.autoSize = init.autoSize



  }









}