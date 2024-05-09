import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-comment"
export default class extends Controller {
  static targets = ["comment_item", "comment_form"]

  ajout(event) {
    event.preventDefault();

    fetch(this.comment_formTarget.action,{
      method: "POST",
      headers: { "Accept": "application/json" },
      body : new FormData(this.comment_formTarget)
    })
    .then(response => response.json())
    .then((data) => {
      if (data.inserted_item) {
        this.comment_itemTarget.insertAdjacentHTML("beforeend", data.inserted_item)
      }
      this.comment_formTarget.outerHTML = data.form
    })
  }
}
