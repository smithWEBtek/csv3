class TeachersController < ApplicationController

  def index
    @teachers = Teacher.all 
  end

  def import
    Teacher.import
    redirect_to teachers_path
  end

  def truncate
    Teacher.truncate
    redirect_to teachers_path
  end

  def show
    @teacher = Teacher.find_by_id(params[:id])
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      flash[:message] = "Teacher created."
      redirect_to teacher_path(@teacher)
    else
      render :new
    end
  end

  def edit 
    @teacher = Teacher.find_by_id(params[:id])
  end

  def update
    @teacher = Teacher.find_by_id(params[:id])
    @teacher.updaet(teacher_params)
    if @teacher.save
      flash[:message] = "Teacher updated."
      redirect_to teacher_path(@teacher)
    else
      render :edit
    end
  end

  def destroy
    @teacher = Teacher.find_by_id(params[:id])
    @teacher.destroy
    redirect_to root_path
  end

  private 
  def teacher_params
    params.require(:teacher).permit(:name, :phone, :city, :state)
  end
end
