# Solid Queue Dashboard <sup>BETA</sup>

<p align="center">
  <a href="https://github.com/akodkod/solid-queue-dashboard#gh-light-mode-only">
    <img src="https://github.com/user-attachments/assets/90cb68cf-73d9-41bf-b9d5-93da7c36f204" alt="Solid Queue Dashboard Light Mode">
  </a>
  <a href="https://github.com/akodkod/solid-queue-dashboard#gh-dark-mode-only">
    <img src="https://github.com/user-attachments/assets/ea089277-67fc-4bc9-91d8-2e3e7349b0c9" alt="Solid Queue Dashboard Dark Mode">
  </a>

  _👋 I'm available for hire → [kodkod.me](https://kodkod.me)_
</p>

## Features
- 🎨 Beautiful UI
- 🧠 Smart status detection
- 📊 Track failure rates
- 💀 Find dead processes
- 📜 View execution history
- 🔍 Filter options
- 🔄 Retry jobs from the UI
- 🚫 No dependencies
- 🐒 No monkey patching
- 💈 TailwindCSS

## Roadmap
- 🏊‍♂️ Auto-pooling
- 📈 Add charts
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
gem "solid_queue_dashboard", "~> 0.1.0"
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
./bin/jobs
```

## License

This gem is open source under the [MIT License](http://opensource.org/licenses/MIT).

