class StudentsController < ApplicationController
    before_action :set_student, only: [:show, :update, :destroy]

    def index
        render json: Student.all, status: :ok
    end

    def show
        render json: @student, status: :ok
    end

    def update
        @student.update!(student_params)
        render json: @student, status: :accepted
    end

    def destroy
        @student.destroy
        head :no_content
    end

    def create
        student = Student.create!(student_params)
        render json: student, status: :created
    end
    
    private
    def set_student
        @student = Student.find(params[:id])
    end

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

end
