import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["catchModal"]

  removeCatchModal() {
    this.catchModalTarget.remove();
  }
}
