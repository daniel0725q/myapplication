class EmployeesController < ApplicationController
	before_action :all_employees, only: [:index, :create]
	before_action :set_employees, only: [:edit, :update]
  respond_to :html, :js
	
	def create
		@employee = Employee.new(employee_params)

		@employee.save
	end
		
	def new
		@employee = Employee.new
	end
	
	def edit
		@employee = Employee.find(params[:id])
	end
	
	def show
		@employee = Employee.find(params[:id])
	end
	
	def update
		@employee.update(employee_params)
	end
	
	def destroy
		@employee = Employee.find(params[:id])
		@employee.destroy

		redirect_to employees_path
	end
	
	private
		def employee_params
			params.require(:employee).permit(:name, :salary)
		end
	
		def all_employees
			@employees = Employee.all
			@totalsalary = 0
			@employees.each do |employee|
				@totalsalary += employee.salary
			end
		end
	
		def set_employees
      @employee = Employee.find(params[:id])
    end
end
