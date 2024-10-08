# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "@rails/ujs", to: "https://cdn.jsdelivr.net/npm/@rails/ujs@7.0.0/lib/assets/compiled/rails-ujs.js"
pin "jquery", to: "https://code.jquery.com/jquery-3.7.0.min.js"
pin_all_from "app/javascript/employee", under: "employee"
pin_all_from "app/javascript/controllers", under: "controllers"
