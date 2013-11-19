class Interview < ActiveRecord::Base
	belongs_to :candidate
	# has_one :interviewer
end
