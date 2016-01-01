class SupportController < ApplicationController
	def new
		Support.create(user_id: current_user.id, prediction_id: params[:id])

		p = Prediction.find_by_id(params[:id])
		p.supporters += 1
		p.save

		redirect_to(:back)
	end

	def destroy
		s = Support.where(user_id: current_user.id, prediction_id: params[:id]).first
		if s != nil
			s.destroy
			p = Prediction.find_by_id(params[:id])
			p.supporters -= 1
			p.save
		end
		redirect_to(:back)
	end
end
