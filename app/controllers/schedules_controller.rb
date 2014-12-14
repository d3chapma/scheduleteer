class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.all
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
    @event = Event.find(event_id)
  end

  # GET /schedules/new
  def new
    @event = Event.find(event_id)
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
    @event = Event.find(event_id)
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @event = Event.find(event_id)
    @schedule = @event.new_schedule(schedule_params)

    respond_to do |format|
      if @schedule.valid?
        format.html { redirect_to [@event, @schedule], notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    @event = Event.find(event_id)

    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to [@event, @schedule], notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to event_path(@schedule.event), notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:name, :start_on, :end_on, :event_id)
    end

    def event_id
      params.require(:event_id)
    end
end
