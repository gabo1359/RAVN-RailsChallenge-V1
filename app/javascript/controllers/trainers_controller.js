import { Controller } from "@hotwired/stimulus";
import { debounce } from "../utils/debounce";
import { requester } from "../utils/requester";

export default class extends Controller {
  static targets = ["searchInput"];

  static values = { searchUrl: String }

  connect() {
    this.searchInputTarget.addEventListener("input", debounce(() => this.lookForTrainers()));
  }

  lookForTrainers() {
    this.updateUrlParams();
    const url = `${this.searchUrlValue}?search=${this.searchInputTarget.value}`;
    requester(url);
  }

  updateUrlParams() {
    const queryParams = new URLSearchParams(window.location.search);
    queryParams.set("search", this.searchInputTarget.value);
    history.replaceState(null, null, `?${queryParams.toString()}`);
  }
}
