module Admin
  class TrainersController < ApplicationController
    before_action :set_data, only: %i[index search]
    before_action :set_user, only: %i[show edit update destroy]

    def index; end

    def new
      @trainer = Users::Trainer.new
    end

    def create
      @trainer = Users::Trainer.new(trainer_params)

      if @trainer.save
        flash[:success] = t("trainers.create_success")
        redirect_to trainers_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def show; end

    def edit; end

    def update
      if @trainer.update(trainer_params)
        flash[:success] = t("trainers.update_success")
        redirect_to trainer_path(@trainer)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @trainer.destroy
      flash.now[:success] = t("trainers.destroy_success")
    end

    def search; end

    private

    def trainer_params
      params.require(:trainer).permit(:email, :password, :first_name, :last_name, :avatar, :country)
    end

    def set_user
      @trainer = Users::Trainer.find(params[:id])
    end

    def set_data
      trainers = Admin::Trainers::Data.call(params)
      @pagy, @trainers = pagy(trainers, limit: 4)
    end
  end
end
