class MeetingsController < ApplicationController
  before_action :set_meeting, only: [ :show, :edit, :update, :destroy]

  # GET /meetings
  # GET /meetings.json
  def index
    @client = Client.find(params[:client_id])
    @meetings = @client.meetings
  end

  def all_meetings
    @meetings = current_user.meetings
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
  end

  # GET /meetings/new
  def new
    @client = Client.find(params[:client_id])
    @meeting = @client.meetings.new
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @client = Client.find(params[:client_id])
    @meeting = @client.meetings.new(meeting_params)

    respond_to do |format|
      if !@meeting.check_unavailable_dates 
        if  @meeting.store_range
            @meeting.save
 
          format.html { redirect_to client_meetings_path, notice: 'Meeting was successfully created.' }
          format.json { render :show, status: :created, location: @meeting }
        else
          format.html { render :new}
          format.json { render json: @meeting.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to new_client_meeting_path(@client), alert: 'Those date are taken use the Calendar to see what days and Times in your chosen month are available'}
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to client_meeting_path(@client, @meeting), notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
  def set_meeting
    @client = Client.find(params[:client_id])
    @meeting = @client.meetings.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def meeting_params
    params.require(:meeting).permit(:start_time, :end_time, :client_id, :user_id, :duration_hours, :duration_minutes)
  end
end
