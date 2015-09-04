module Streak
  class EmailFilter < StreakObject

    def self.all(box_key)
      res = Streak.request(:get, "/boxes/#{box_key}/emailfilters")
      convert_to_streak_object(res, EmailFilter)
    end

  end
end
