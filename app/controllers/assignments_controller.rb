class AssignmentsController < ApplicationController
  before_action :set_assignment

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def toggle_confirmed
    @schedule = @assignment.day.schedule
    @event    = @schedule.event
    new_confirmed = !@assignment.confirmed
    respond_to do |format|
      if @assignment.update(confirmed: new_confirmed)
        format.html { redirect_to [@event, @schedule], notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def toggle_absent
    @schedule = @assignment.day.schedule
    @event    = @schedule.event
    new_absent = !@assignment.absent
    respond_to do |format|
      if @assignment.update(absent: new_absent)
        format.html { redirect_to [@event, @schedule], notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end
end
