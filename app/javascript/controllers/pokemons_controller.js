import { Controller } from "@hotwired/stimulus";
import { debounce } from "../utils/debounce";
import { requester } from "../utils/requester";

export default class extends Controller {
  static targets = ["searchInput", "typeInput"];

  static values = { url: String }

  connect() {
    this.searchInputTarget.addEventListener("input", debounce(() => this.lookForPokemons()));
    this.typeInputTarget.addEventListener("change", () => this.lookForPokemons());
  }

  async lookForPokemons() {
    const url = `${this.urlValue}?search=${this.searchInputTarget.value}&pokemon_type=${this.typeInputTarget.value}`;
    requester(url);
  }
}
