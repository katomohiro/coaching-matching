# frozen_string_literal: true

class Coaches::CoachesController < ApplicationController

  def search
    # @coaches = Coaches::SearchService.new(params).call
    @coach = Coach.new(get_params)
    @coaches = Coach.
        where_like_name(@coach.name).
        where_like_nickname(@coach.nickname).
        page(params[:page])
  end

  def show
    @coach = Coach.find(params[:id])
  end

  def get_params
    params.require(:coach).permit(:name, :nickname) if params[:coach].present?
  end
end
