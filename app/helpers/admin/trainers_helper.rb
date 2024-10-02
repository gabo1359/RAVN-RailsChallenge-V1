module Admin::TrainersHelper
  def total_trainers
    Users::Trainer.count
  end
end
