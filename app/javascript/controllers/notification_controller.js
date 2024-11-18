import { Controller } from "@hotwired/stimulus"

// data-controller="notification"
// data-action="click->notification#close" - this will close the notification when clicked
// data-notification-animation-class - defines the list of classes that will be added to animate the notification, like fade out or slide out.
// data-notification-auto-close="5000" - can be used to set the duration (micro seconds) to auto close.
export default class extends Controller {
  
  connect() {
    this.animateClasses = (this.data.get('animationClass') || 'hidden').split(' ')

    if (this.data.has("autoClose")) {
      setTimeout(() => this.close(), this.data.get("autoClose"))
    }
  }

  close() {
    if (this.element) {
      this.element.classList.add(...this.animateClasses) // add the animation class to hide elelment from dom
      setTimeout(() => this.element.remove(), 0.5 * 1000) // remove from dom after 1/2 second
    }
  }
}