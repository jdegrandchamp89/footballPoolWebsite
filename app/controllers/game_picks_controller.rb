class GamePicksController < ApplicationController
  before_action :set_game_pick, only: [:show, :edit, :update, :destroy]

  # GET /game_picks
  # GET /game_picks.json
  def index
    if current_user
    else
      redirect_to "/login"
    end
    week = params[:week]
    if week == nil
      week = "1"
    end
    game_info_object = GameInfo.new(week)
    @game_infos = game_info_object.get_game_info()      
    @game_picks = GamePick.all
    
    @game_infos.each do |game_info|
      correct_game = @game_picks.select{ |game_pick| game_pick.team1 == game_info["schedule"]["homeTeam"]["abbreviation"] && game_pick.team2 == game_info["schedule"]["awayTeam"]["abbreviation"] && game_pick.week == game_info["schedule"]["week"]}
      if correct_game[0] != nil
        game = correct_game[0]
        game_info["schedule"]["pickedTeam"] = game.pickedteam
        game_info["schedule"]["spread"] = game.spread
      else
        game_info["schedule"]["pickedTeam"] = ""
        game_info["schedule"]["spread"] = 0
      end
      
    end
    
    respond_to do |format|
      format.html {render :index}
      format.json {render :index, status: :ok}
      format.xml {render xml: @game_picks.as_json}
    end 
  end

  # GET /game_picks/1
  # GET /game_picks/1.json
  def show
  end

  # GET /game_picks/new
  def new
    @game_pick = GamePick.new
  end

  # GET /game_picks/1/edit
  def edit
  end

  # POST /game_picks
  # POST /game_picks.json
  def create
    @game_pick = GamePick.find_or_initialize_by(team1: game_pick_params[:team1], team2: game_pick_params[:team2], week: game_pick_params[:week])
    @game_pick[:pickedteam] = game_pick_params[:pickedteam]
    @game_pick[:spread] = game_pick_params[:spread]
    @game_pick[:gamedatetime] = game_pick_params[:gamedatetime]
    
    @game_pick.build_user(:id => session[:user_id])

    respond_to do |format|
      puts @game_pick.inspect
      if @game_pick.save
        format.html { redirect_to @game_pick, notice: 'Game pick was successfully created.' }
        format.json { render :show, status: :created, location: @game_pick }
      else
        format.html { render :new }
        format.json { render json: @game_pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_picks/1
  # PATCH/PUT /game_picks/1.json
  def update
    respond_to do |format|
      if @game_pick.update(game_pick_params)
        format.html { redirect_to @game_pick, notice: 'Game pick was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_pick }
      else
        format.html { render :edit }
        format.json { render json: @game_pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_picks/1
  # DELETE /game_picks/1.json
  def destroy
    @game_pick.destroy
    respond_to do |format|
      format.html { redirect_to game_picks_url, notice: 'Game pick was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_pick
      @game_pick = GamePick.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_pick_params
      params.require(:game_pick).permit(:team1, :team2, :week, :pickedteam, :spread, :gamedatetime, :user_id)
    end
end
