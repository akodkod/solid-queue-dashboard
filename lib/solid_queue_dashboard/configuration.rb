module SolidQueueDashboard
  class Configuration
    attr_accessor :title

    def initialize
      @title = "Solid Queue Dashboard"
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
