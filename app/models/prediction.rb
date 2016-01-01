class Prediction < ActiveRecord::Base

	belongs_to :user

	validates :title, presence: true
	validates :expire, presence: true

	validate :prevent_after_support, :prevent_before_vote, :prevent_expired_prediction, on: :update

	def prevent_after_support
		errors.add(:supporters, "Expired") if
    	self.supporters_changed? and self.expire < Time.now
	end

	def prevent_before_vote
		errors.add(:y_count, "Can't vote yet") if
    	self.y_count_changed? and self.expire > Time.now

    	errors.add(:n_count, "Can't vote yet") if 
    	self.n_count_changed? and self.expire > Time.now
	end

	def prevent_expired_prediction
		errors.add(:expire, "Expired") if 
		self.expire_changed? and self.expire < Time.now
	end
end
