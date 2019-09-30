class Coaches::SearchService

  def initialize(params)
    @params = params
  end

  def call
    # @search = get_params(@params)
    Coach.where(@params).page(@params[:page])
  end

  def get_params(params)
    ret = {}
  end
end