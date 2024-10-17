require "active_support/testing/time_helpers"

namespace :jobs do
  desc "Generate dummy data for jobs"
  task :generate_dummy_data, [ :count ] => :environment do |t, args|
    include ActiveSupport::Testing::TimeHelpers

    count = (args[:count] || 100).to_i

    job_classes = [
      GoodJob,
      # FewSecondsJob,
      RandomFailJob,
      AlwaysFailJob,
      RetryingJob
    ]

    # Random arguments
    arguments = [
      [ { "key" => "value", "another_key" => false, truth: 42 } ],
      [ "hello_world", true, nil ],
      [ 451 ],
      [ Time.now.utc ]
    ]

    count.times do
      # Generate a random time in the past (between 1 and 10 days ago)
      random_past_time = rand(1..10).days.ago + rand(1..23).hours + rand(1..59).minutes

      # Travel to the random past time and enqueue a random job
      travel_to(random_past_time) do
        job_class = job_classes.sample
        job_arguments = arguments.sample

        job_class.perform_later(*job_arguments)
      end
    end

    # Reset the time back to the present
    travel_back
  end
end
