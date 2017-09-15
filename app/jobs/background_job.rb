class BackgroundJob < ApplicationJob
  RUN_EVERY = 5.minutes
  queue_as :default

  def perform
    Updatetrain.query()

    self.class.perform_later(wait: RUN_EVERY)
  end
end
