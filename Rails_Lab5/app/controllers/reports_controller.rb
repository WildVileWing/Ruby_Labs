class ReportsController < ApplicationController
  before_action :set_report, only; %i[show edit update destroy]

  #Read GET/reports
  def index
    @posts = Post.all
  end

  #Show GET/reports/333
  def show
    @post = Post.find(params[:id])
  end

  #New GET/reports/new
  def new
    @post = Report.new
  end

  #Create POST/reports
  def create
    @report = Report.new(report_arguments)
    respond_to do |format|
      if @report.save
        format.html {redirect_to report_path, notice: "Report was created!"}
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  #Edit GET/reports/edit
  def edit
  end

  #update PATCH/PUT/reports/333
  def update
    respond_to do |format|
      if @report.update(report_arguments)
        format.html {redirect_to repot_path, notice: "Report was updated!"}
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  #Destroy DELETE/reports
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: "Report was destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_arguments
    params.require(:report).permit(:user_id, :title, :description, :grade)
  end

end