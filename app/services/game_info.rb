class GameInfo
  def initialize(page)
    @page = page
  end
  
  def get_game_info
    response = HTTParty.get('https://api.mysportsfeeds.com/v2.1/pull/nfl/2018-regular/week/' + @page + '/games.json', { headers: {"Authorization" => "Basic ZThkNTg1MjctZjIzYy00YmI5LWI3OTctYzg4MWU0Ok1ZU1BPUlRTRkVFRFM="}})
    response["games"]
  end
end