class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def activate
    @student = Student.find(params[:id])
    @student.active = !@student.active
    @student.save
    #redirect to show page
    redirect_to student_path(params[:id])
    # redirect_to student_path(@students)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end