import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="theme-toggle"
export default class extends Controller {
    static targets = ["darkIcon", "lightIcon"]

    connect() {
        this.updateIcons()
    }

    toggle() {
        this.darkIconTarget.classList.toggle('hidden')
        this.lightIconTarget.classList.toggle('hidden')

        if (localStorage.getItem('color-theme')) {
            if (localStorage.getItem('color-theme') === 'light') {
                document.documentElement.classList.add('dark')
                localStorage.setItem('color-theme', 'dark')
            } else {
                document.documentElement.classList.remove('dark')
                localStorage.setItem('color-theme', 'light')
            }
        } else {
            if (document.documentElement.classList.contains('dark')) {
                document.documentElement.classList.remove('dark')
                localStorage.setItem('color-theme', 'light')
            } else {
                document.documentElement.classList.add('dark')
                localStorage.setItem('color-theme', 'dark')
            }
        }
    }

    updateIcons() {
        if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
            this.darkIconTarget.classList.remove('hidden')
            document.documentElement.classList.add('dark')
        } else {
            this.lightIconTarget.classList.remove('hidden')
            document.documentElement.classList.remove('dark')
        }
    }
}
