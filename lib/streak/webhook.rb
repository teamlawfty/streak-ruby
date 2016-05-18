module Streak
  class Webhook < StreakObject
    def self.all(pipeline_key)
      res = Streak.request(:get, "/pipelines/#{pipeline_key}/webhooks", {}, {}, 2)
      convert_to_streak_object(res, Webhook)
    end

    def self.find(webhook_key)
      res = Streak.request(:get, "/webhooks/#{webhook_key}", {}, {}, 2)
      convert_to_streak_object(res, Webhook)
    end

    def self.create(pipeline_key, params)
      res = Streak.request(:put, "/pipelines/#{pipeline_key}/webhooks", params, {}, 2)
      convert_to_streak_object(res, Webhook)
    end
  end
end

