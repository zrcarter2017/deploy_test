class VizusController < ApplicationController
  before_action :set_vizu, only: [:show, :edit, :update, :destroy]

  # GET /vizus
  # GET /vizus.json
  def index
    @vizus = Vizu.all
  end

  # GET /vizus/1
  # GET /vizus/1.json
  def show
  end

  # GET /vizus/new
  def new
    @vizu = Vizu.new
  end

  # GET /vizus/1/edit
  def edit
  end

  # POST /vizus
  # POST /vizus.json
  def create
    @vizu = Vizu.new(vizu_params)

    respond_to do |format|
      if @vizu.save
        format.html { redirect_to @vizu, notice: 'Vizu was successfully created.' }
        format.json { render :show, status: :created, location: @vizu }
      else
        format.html { render :new }
        format.json { render json: @vizu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vizus/1
  # PATCH/PUT /vizus/1.json
  def update
    respond_to do |format|
      if @vizu.update(vizu_params)
        format.html { redirect_to @vizu, notice: 'Vizu was successfully updated.' }
        format.json { render :show, status: :ok, location: @vizu }
      else
        format.html { render :edit }
        format.json { render json: @vizu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vizus/1
  # DELETE /vizus/1.json
  def destroy
    @vizu.destroy
    respond_to do |format|
      format.html { redirect_to vizus_url, notice: 'Vizu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vizu
      @vizu = Vizu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vizu_params
      params.fetch(:vizu, {})
    end
end
