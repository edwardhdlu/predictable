class PredictionsController < ApplicationController

    before_filter :authenticate_user!, only: [:create]

	def index

		if !signed_in?
			@user = User.new
		end

		@predictions = Prediction.where(hide: false)
		@prediction = Prediction.new

		@user_id = 0
		if signed_in?
			@user_id = current_user.id
		end

		@perc_thresh = 0.6 
		@vote_thresh = 5

		@correct_predictions = []
		Prediction.all.each do |p|
			yc = p.y_count.to_f
			nc = p.n_count.to_f
			total = yc + nc
			perc = yc / total

			if perc >= @perc_thresh and total > @vote_thresh
				@correct_predictions << p
			end
		end

		@correct_supported = []
		Support.all.each do |s|
			p = Prediction.where(id: s.prediction_id).first
			if p != nil
				yc = p.y_count.to_f
				nc = p.n_count.to_f
				total = yc + nc
				perc = yc / total

				if perc >= @perc_thresh and total > @vote_thresh
					@correct_supported << p
				end
			end
		end

		sort_mode = params[:order].to_s

		if sort_mode == "new"
			@predictions = @predictions.order(:created_at).reverse
		elsif sort_mode == "supporters"
			@predictions = @predictions.order(:supporters).reverse
		elsif sort_mode == "expire"
			@predictions = @predictions.order(:expire)
		end

		@predictions = @predictions.paginate(page: params[:page], per_page: 5)
	end

	def create
		if signed_in?
			@prediction = Prediction.create(params[:prediction].permit(:title, :expire))
			@prediction.user_id = current_user.id
			Support.create(user_id: current_user.id, prediction_id: @prediction.id)
			@prediction.supporters = 1
			@prediction.save
		end
		
		redirect_to(:back)
	end
end
