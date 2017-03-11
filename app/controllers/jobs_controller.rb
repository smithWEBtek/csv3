class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find_by_id(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:message] = 'Job created.'
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def edit
    @job = Job.find_by_id(params[:id])
  end

  def update
    @job = Job.find_by_id(params[:id])
    @job.update(job_params)
    if @job.save
      flash[:message] = 'Job updated.'
      redirect_to job_path(@job)
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find_by_id(params[:id])
    @job.destroy
    redirect_to root_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :url, :company_id, :contact_id, :instructions, :requirements, :learning, :skills, :networking, :location, :salary)
  end
end
