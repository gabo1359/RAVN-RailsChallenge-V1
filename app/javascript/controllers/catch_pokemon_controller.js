import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["catchModal"]

  showCatchModal(event) {
    event.preventDefault();
    this.catchModalTarget.classList.remove("hidden");
  }

  hideCatchModal() {
    this.catchModalTarget.classList.add("hidden");
  }
}
