class NotifiesController < ApplicationController
  before_action :set_notify, only: [:show, :edit, :update, :destroy]

  # GET /notifies
  # GET /notifies.json
  def index
    @notifies = Notify.all
  end

  # GET /notifies/1
  # GET /notifies/1.json
  def show
  end

  # GET /notifies/new
  def new
    @notify = Notify.new
  end

  # GET /notifies/1/edit
  def edit
  end

  # POST /notifies
  # POST /notifies.json
  def create
    @notify = Notify.new(notify_params)

    respond_to do |format|
      if @notify.save
        format.html { redirect_to @notify, notice: 'Notify was successfully created.' }
        format.json { render :show, status: :created, location: @notify }
      else
        format.html { render :new }
        format.json { render json: @notify.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifies/1
  # PATCH/PUT /notifies/1.json
  def update
    respond_to do |format|
      if @notify.update(notify_params)
        format.html { redirect_to @notify, notice: 'Notify was successfully updated.' }
        format.json { render :show, status: :ok, location: @notify }
      else
        format.html { render :edit }
        format.json { render json: @notify.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifies/1
  # DELETE /notifies/1.json
  def destroy
    @notify.destroy
    respond_to do |format|
      format.html { redirect_to notifies_url, notice: 'Notify was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notify
      @notify = Notify.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notify_params
      params.require(:notify).permit(:entity_name, :first_name, :last_name)
    end
end
