require 'rspec'

describe 'Scoreboard' do
  it 'should properly calculate the total score for a team' do
    team = Scoreboard.new('Astros')
    team.add_run inning: 1
    team.add_run inning: 7
    team.add_run inning: 9
    expect(team.generate_total).to eq(3)
  end

  it 'should generate a hash with the total runs scored each inning' do
    team = Scoreboard.new('Astros')
    team.add_run inning: 3
    team.add_run inning: 3
    team.add_run inning: 5
    team.add_run inning: 8
    team.score
    expect(team.score).to eq({"Astros"=>{1=>0, 2=>0, 3=>2, 4=>0, 5=>1, 6=>0, 7=>0, 8=>1, 9=>0}})
  end

  it 'should generate a hash with the innings and 0 values for the runs each inning when a Scoreboard is created' do
    team = Scoreboard.new('Astros')
    expect(team.score).to eq({"Astros"=>{1=>0, 2=>0, 3=>0, 4=>0, 5=>0, 6=>0, 7=>0, 8=>0, 9=>0}})
  end
end

