class ActionsController < ApplicationController
  def index
    @actions = Action.all.order(:name)
  end

  def show
    @action = Action.find_by_id(params[:id])
  end

  def new
    @action = Action.new
  end

  def create
    @action = Action.new(action_params)
    if @action.save
      flash[:message] = 'Action created.'
      redirect_to action_path(@action)
    else
      render :new
    end
  end

  def edit
    @action = Action.find_by_id(params[:id])
  end

  def update
    @action = Action.find_by_id(params[:id])
    @action.update(action_params)
    if @action.save
      flash[:message] = 'Action updated.'
      redirect_to action_path(@action)
    else
      render :edit
    end
  end

  def destroy
    @action = Action.find_by_id(params[:id])
    @action.destroy
    redirect_to root_path
  end

  private

  def action_params
    params.require(:action).permit(:act_type, :act_date, :act_result, :act_next, :act_next_due_date, :contact_id, :company_id, :job_id)
  end
end
