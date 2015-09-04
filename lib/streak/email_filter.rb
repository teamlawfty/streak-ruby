module Streak
  class EmailFilter < StreakObject

    def self.all(box_key)
      res = Streak.request(:get, "/boxes/#{box_key}/emailfilters")
      convert_to_streak_object(res, EmailFilter)
    end

    def self.create(box_key, params)
      res = Streak.request(:put, "/boxes/#{box_key}/emailfilters", params)
      convert_to_streak_object(res, EmailFilter)
    end

    def self.update(box_key, email_filter_key, params={})
      res = Streak.request(:post, "/boxes/#{box_key}/emailfilters/#{email_filter_key}", MultiJson.dump(params))
      convert_to_streak_object(res, EmailFilter)
    end

  end
end
