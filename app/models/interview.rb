class Interview < ActiveRecord::Base
	belongs_to :candidate
	belongs_to :interviewer
	belongs_to :position
end
