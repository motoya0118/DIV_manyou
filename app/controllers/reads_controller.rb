class ReadsController < ApplicationController
  def create
    @read = Read.new(user_id: current_user.id, task_id: )
  end
end
