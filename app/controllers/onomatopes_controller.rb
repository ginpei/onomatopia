class OnomatopesController < ApplicationController
  before_action :set_onomatope, only: [:show, :edit, :update, :destroy]

  # GET /onomatopes
  # GET /onomatopes.json
  def index
    @onomatopes = Onomatope.all
  end

  # GET /onomatopes/1
  # GET /onomatopes/1.json
  def show
  end

  # GET /onomatopes/new
  def new
    @onomatope = Onomatope.new
  end

  # GET /onomatopes/1/edit
  def edit
  end

  # POST /onomatopes
  # POST /onomatopes.json
  def create
    @onomatope = Onomatope.new(onomatope_params)

    respond_to do |format|
      if @onomatope.save
        format.html { redirect_to @onomatope, notice: 'Onomatope was successfully created.' }
        format.json { render :show, status: :created, location: @onomatope }
      else
        format.html { render :new }
        format.json { render json: @onomatope.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /onomatopes/1
  # PATCH/PUT /onomatopes/1.json
  def update
    respond_to do |format|
      if @onomatope.update(onomatope_params)
        format.html { redirect_to @onomatope, notice: 'Onomatope was successfully updated.' }
        format.json { render :show, status: :ok, location: @onomatope }
      else
        format.html { render :edit }
        format.json { render json: @onomatope.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /onomatopes/1
  # DELETE /onomatopes/1.json
  def destroy
    @onomatope.destroy
    respond_to do |format|
      format.html { redirect_to onomatopes_url, notice: 'Onomatope was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_onomatope
      @onomatope = Onomatope.find_by_name(params[:name])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def onomatope_params
      params.require(:onomatope).permit(:name)
    end
end
