# Solid Queue Dashboard <sup>BETA</sup>

<p align="center">
  <a href="https://github.com/akodkod/solid-queue-dashboard#gh-light-mode-only">
    <img src="https://github.com/user-attachments/assets/55aa4a3c-da51-471b-8f58-0cf1f9a1f8da" alt="Solid Queue Dashboard Light Mode">
  </a>
  <a href="https://github.com/akodkod/solid-queue-dashboard#gh-dark-mode-only">
    <img src="https://github.com/user-attachments/assets/645558cb-c20f-4d4b-9697-55282710ea6c" alt="Solid Queue Dashboard Dark Mode">
  </a>

  _👋 I'm Available for Hire → [kodkod.me](https://kodkod.me)_
</p>

## Features
- 🎨 Beautiful UI
- 🧠 Smart status detection
- 📊 Track failure rates
- 💀 Find dead processes
- 📜 View execution history
- 🔍 Filter options
- 🔄 Retry jobs from the UI
- 🥬 Auto-refresh
- 📈 Add charts
- 🐒 No monkey patching
- 💈 TailwindCSS

## Roadmap
- 🚀 Manually trigger jobs
- ⏹️ Cancel long jobs (if possible)
- 📊 More statistics and insights
- 🔎 Search feature
- 🔢 Sorting options
- 🏗️ Add tests

## Installation

To install, run this command in your terminal:

```bash
bundle add solid_queue_dashboard
```

Or add this line to your `Gemfile`:

```bash
gem "solid_queue_dashboard", "~> 0.2.0"
```

Add this line to `routes.rb`:

```ruby
mount SolidQueueDashboard::Engine, at: "/solid-queue"
```

**IMPORTANT: Protect your SolidQueueDashboard with authentication to prevent unauthorized access.**

For example, if using Devise:

```ruby
Rails.application.routes.draw do
  authenticate :current_admin do
    mount SolidQueueDashboard::Engine, at: "/solid-queue"
  end
end
```

## Contributing

After cloning the repo, run:

```
./bin/setup
./bin/setup-test-app
```

To run the test application:

```
gem install foreman
./bin/dev
```

To generate dummy data:

```
cd test_app
rails jobs:generate_dummy_data
```

## License

This gem is open source under the [MIT License](http://opensource.org/licenses/MIT).

---

_Made with love by Ukrainians 💙💛_  
_[Help Ukraine](https://u24.gov.ua/)_

