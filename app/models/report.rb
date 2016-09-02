class Report < ActiveRecord::Base
	validates :reason, presence: true
end
