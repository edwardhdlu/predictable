class VotesController < ApplicationController
	def new

		v = Vote.new
		v.user_id = current_user.id
		v.prediction_id = params[:id]
		v.agree = params[:agree]

		p = Prediction.find_by_id(params[:id])
		if v.agree and v.valid?
			v.save
			p.y_count += 1
		elsif !v.agree and v.valid?
			v.save
			p.n_count += 1
		end
		p.save

		redirect_to(:back)
	end
end
