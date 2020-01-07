require "pry"

def game_hash
  {
    away: { 
      team_name: 'Charlotte Hornets',
      colors: %w[Turquoise Purple],
      players: [
              { player_name: 'Jeff Adrien',
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2 },
              { player_name: 'Bismack Biyombo',
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10 },
              { player_name: 'DeSagna Diop',
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5 },
              { player_name: 'Ben Gordon',
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0 },
              { player_name: 'Kemba Walker',
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12 }
            ] },
    home: { team_name: 'Brooklyn Nets',
            colors: %w[Black White],
            players: [
              { player_name: 'Alan Anderson',
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1 },
              { player_name: 'Reggie Evans',
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7 },
              { player_name: 'Brook Lopez',
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15 },
              { player_name: 'Mason Plumlee',
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 11,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5 },
              { player_name: 'Jason Terry',
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1 }
            ] }
  }
end

def num_points_scored(players_name)
  game_hash.each do |place, team|
    team.each do |attribute, data| 
      if attribute == :players
        data.each do |player| 
          if player[:player_name] == players_name
            return player[:points]
          end
        end
      end
    end
  end
end

def shoe_size(players_name)
  game_hash.each do |place, team|
    team.each do |attribute, data| 
      if attribute == :players
        data.each do |player| 
          if player[:player_name] == players_name
            return player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |place, team| 
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end 

def team_names
  teams = []
  game_hash.each do |place, team| 
    teams << team[:team_name]
  end
teams
end 

def player_numbers(team_name)
  nums = []
  game_hash.each do |place, team| 
    if team[:team_name] == team_name
      team.each do |attribute, data| 
        if attribute == :players
          data.each do |player| 
            nums << player[:number]
          end 
        end
      end
    end
  end
nums 
end 

def player_stats(players_name)
  stats = {}
  game_hash.each do |place, team|
    team.each do |attribute, data| 
      if attribute == :players
       data.each do |player|
         if player[:player_name] == players_name
           stats = player.delete_if do |k, v| 
              k == :player_name
            end 
          end
        end
      end
    end
  end
  stats
end 

def big_shoe_rebounds
 big_shoe = 0 
 rebounds = 0 
 game_hash.each do |team, info| 
   info[:players].each do |player|
     if player[:shoe] > big_shoe
       big_shoe = player[:shoe]
       rebounds = player[:rebounds]
      end 
    end
  end 
  return rebounds
end 

def most_points_scored 
  points = 0 
  player_name = " "
  game_hash.each do |team, info| 
   info[:players].each do |player|
     if player[:points] > points
      points = player[:points]
      player_name = player[:player_name]
      end
    end 
  end 
return player_name 
end 

def winning_team 
  home_points = []
  away_points = [] 
  game_hash.each do |place, team| 
    if team[:team_name] == "Brooklyn Nets"
      team.each do |attributes, data| 
        if attributes == :players 
          data.each do |player| 
            home_points << player[:points]
          end
        end 
      end
    end 
  end
  if team[:team_name] == "Charlotte Hornets"
    team.each do |attributes, data| 
        if attributes == :players 
          data.each do |player| 
            away_points << player[:points]
          end
        end 
      end
    end 
if home_points.reduce > away_points.reduce 
    return "Brooklyn Nets"
else 
    return "Charlotte Hornets"
  end
end 

def player_with_longest_name
  name_length = 0 
  player_name = " "
  game_hash.each do |team, info| 
  info[:players].each do |player|
     if player[:player_name].length > name_length
       name_length = player[:player_name].length
       player_name = player[:player_name]
      end
    end
  end
return player_name 
end 


