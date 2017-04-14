class NotetypesController < ApplicationController
  
  before_filter :authorize

  before_action :set_notetype, only: [:show, :edit, :update, :destroy]

  # GET /notetypes
  # GET /notetypes.json
  def index
    @notetypes = Notetype.all
  end

  # GET /notetypes/1
  # GET /notetypes/1.json
  def show
  end

  # GET /notetypes/new
  def new
    @notetype = Notetype.new
  end

  # GET /notetypes/1/edit
  def edit
  end

  # POST /notetypes
  # POST /notetypes.json
  def create
    @notetype = Notetype.new(notetype_params)

    respond_to do |format|
      if @notetype.save
        format.html { redirect_to @notetype, notice: 'Notetype was successfully created.' }
        format.json { render :show, status: :created, location: @notetype }
      else
        format.html { render :new }
        format.json { render json: @notetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notetypes/1
  # PATCH/PUT /notetypes/1.json
  def update
    respond_to do |format|
      if @notetype.update(notetype_params)
        format.html { redirect_to @notetype, notice: 'Notetype was successfully updated.' }
        format.json { render :show, status: :ok, location: @notetype }
      else
        format.html { render :edit }
        format.json { render json: @notetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notetypes/1
  # DELETE /notetypes/1.json
  def destroy
    @notetype.destroy
    respond_to do |format|
      format.html { redirect_to notetypes_url, notice: 'Notetype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notetype
      @notetype = Notetype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notetype_params
      params.require(:notetype).permit(:note_type, :note_program, :note_interest_rate)
    end
end
