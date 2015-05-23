class OnomatopoeiasController < ApplicationController
  before_action :set_onomatopoeia, only: [:show, :edit, :update, :destroy]
  before_action :set_page_title, only: [:show, :edit]

  # GET /onomatopoeias
  # GET /onomatopoeias.json
  def index
    @onomatopoeias = Onomatopoeia.all
  end

  # GET /onomatopoeias/1
  # GET /onomatopoeias/1.json
  def show
    @illustrations = @onomatopoeia.illustrations.all
  end

  # GET /onomatopoeias/new
  def new
    @onomatopoeia = Onomatopoeia.new
  end

  # GET /onomatopoeias/1/edit
  def edit
  end

  # POST /onomatopoeias
  # POST /onomatopoeias.json
  def create
    @onomatopoeia = Onomatopoeia.new(onomatopoeia_params)

    respond_to do |format|
      if @onomatopoeia.save
        format.html { redirect_to @onomatopoeia, notice: 'Onomatopoeia was successfully created.' }
        format.json { render :show, status: :created, location: @onomatopoeia }
      else
        format.html { render :new }
        format.json { render json: @onomatopoeia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /onomatopoeias/1
  # PATCH/PUT /onomatopoeias/1.json
  def update
    respond_to do |format|
      if @onomatopoeia.update(onomatopoeia_params)
        format.html { redirect_to @onomatopoeia, notice: 'Onomatopoeia was successfully updated.' }
        format.json { render :show, status: :ok, location: @onomatopoeia }
      else
        format.html { render :edit }
        format.json { render json: @onomatopoeia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /onomatopoeias/1
  # DELETE /onomatopoeias/1.json
  def destroy
    @onomatopoeia.destroy
    respond_to do |format|
      format.html { redirect_to onomatopoeias_url, notice: 'Onomatopoeia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_onomatopoeia
      @onomatopoeia = Onomatopoeia.find_by_name(params[:name])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def onomatopoeia_params
      params.require(:onomatopoeia).permit(:name)
    end

    def set_page_title
      @page_title = @onomatopoeia.name
    end
end
