class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_student!


  # GET /schools
  # GET /schools.json
  def index
    @schools = School.all
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
  end

  # GET /schools/new
  def new
    @school = current_student.schools.new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = current_student.schools.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: 'School was successfully added.' }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: 'School was successfully updated.' }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    if current_student.id == @school.student.id
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url, notice: 'School was successfully deleted.' }
      format.json { head :no_content }
    end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:name, :city, :state)
    end
end
