import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.removeFlashAfter(5000);
  }

  removeFlashAfter(ms) {
    setTimeout(() => {
      this.element.remove();
    }, ms);
  }
}
