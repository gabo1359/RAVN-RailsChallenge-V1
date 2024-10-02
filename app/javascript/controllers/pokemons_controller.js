import { Controller } from "@hotwired/stimulus";
import { debounce } from "../utils/debounce";
import { requester } from "../utils/requester";

export default class extends Controller {
  static targets = ["searchInput", "typeInput"];

  static values = { searchUrl: String }

  connect() {
    this.searchInputTarget.addEventListener("input", debounce(() => this.lookForPokemons()));
    this.typeInputTarget.addEventListener("change", () => this.lookForPokemons());
  }

  lookForPokemons() {
    this.updateUrlParams();
    const url = `${this.searchUrlValue}?search=${this.searchInputTarget.value}&pokemon_type=${this.typeInputTarget.value}`;
    requester(url);
  }

  updateUrlParams() {
    const queryParams = new URLSearchParams(window.location.search);
    queryParams.set("search", this.searchInputTarget.value);
    queryParams.set("pokemon_type", this.typeInputTarget.value);
    history.replaceState(null, null, `?${queryParams.toString()}`);
  }
}
