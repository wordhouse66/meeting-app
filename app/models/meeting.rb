class Meeting < ApplicationRecord
  belongs_to :client
  belongs_to :user

	# before_save do
	#   self.end_time = self.start_time.advance(hours: (self.duration_hours if attribute_present?("duration_hours")), minutes: (self.duration_minutes if attribute_present?("duration_minutes")) ) if attribute_present?("start_time") 
	# end

	def store_range
		DateRange.create(start: self.start_time, finish: self.end_time)
	end

	def check_unavailable_dates
		DateRange.all.detect do |r|
			(self.start_time).between?(r.start, r.finish) || (self.end_time).between?(r.start, r.finish) || (r.start).between?(self.start_time, self.end_time) || (r.finish).between?(self.start_time, self.end_time)
		end
  end
end
