class Support < ActiveRecord::Base
	belongs_to :user

	validates :user_id, uniqueness: { scope: :prediction_id }
end
