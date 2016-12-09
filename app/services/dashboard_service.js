export default class DashboardService {
  constructor() {
    this.service= "dashboards";
    this.instanceService = null
  }

  static setInstance(instanceService) {
    this.instanceService = instanceService
  }

  static getInstance() {
    if (!this.instanceService) {
      this.instanceService = new DashboardService()
    }
    return this.instanceService
  }
}
