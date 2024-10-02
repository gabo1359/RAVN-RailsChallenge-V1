class CatchesController < ApplicationController
  def index
    catches = current_user.catches.ordered.includes(:pokemon)
    @pagy, @catches = pagy(catches, limit: 4)
  end

  def new
    @catch = Catch.new
  end

  def create
    @catch = Catch.new(catch_params)
    @catch.user = current_user

    if @catch.save
      flash[:success] = t("catches.create_success")
      redirect_to catches_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def catch_params
    params.require(:catch).permit(:pokemon_id, :alias)
  end

  def authorize_user!
    authorize Catch
  end
end
