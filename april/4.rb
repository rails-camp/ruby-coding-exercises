require 'rspec'
require 'date'

class RollCallBooleanError < StandardError
  def message
    'Status needs to be either true or false'
  end
end

class RollCallPercentError < StandardError
  def message
    'Grouping needs to be either present or absent'
  end
end

class RollCall
  attr_reader :roll

  def initialize
    @string_date = Date.today.to_s
    @roll = roll_builder
    @q = @roll[@string_date]
  end

  def roll_builder
    {
      @string_date => {
        :present => [],
        :absent => []
      }
    }
  end

  def student_check(name:, status:)
    raise RollCallBooleanError unless (status == true || status == false)

    if status
      @q[:present].push(name)
    else
      @q[:absent].push(name)
    end
  end

  def save_to_file
    File.open('support/roll_log.md', 'a') do |f|
      f << formatted_roll
    end
  end

  def roll_percentage(grouping)
    total_students = @q.values.flatten.count
    present_percent = (@q[:present].count.to_f / total_students.to_f) * 100.0

    if grouping == 'present'
      present_percent
    elsif grouping == 'absent'
      100 - present_percent
    else
      raise RollCallPercentError
    end
  end

  def formatted_roll
    <<~ROLLDOC
      ## Roll call for #{@string_date}

      ### #{roll_percentage('present')}% Present
      #{@q[:present].join(', ')}

      ### #{roll_percentage('absent')}% Absent
      #{@q[:absent].join(', ')}

      #{'-' * 42}

    ROLLDOC
  end
end

describe RollCall do
  before do
    @rc = RollCall.new
    @rc.student_check(name: 'Ryan', status: true)
    @rc.student_check(name: 'Chase', status: true)
    @rc.student_check(name: 'KJ', status: true)
    @rc.student_check(name: 'Hunter', status: false)
    @rc.student_check(name: 'Devan', status: false)
    @rc.student_check(name: 'Zach', status: true)
    @rc.student_check(name: 'Ben', status: true)
    @rc.student_check(name: 'Stephanie', status: true)
    @rc.student_check(name: 'Ian', status: true)
    @rc.student_check(name: 'Alex', status: true)
    @rc.student_check(name: 'Cody', status: true)
    @rc.student_check(name: 'Preston', status: true)
    @rc.student_check(name: 'Andrew', status: true)
    @rc.student_check(name: 'Jason', status: true)
    @rc.student_check(name: 'Christian', status: false)
  end

  it 'can take roll for students and return a hash that lists the students that were present and absent' do
    expect(@rc.roll).to eq(
      {
        "2017-04-12"=>
        {
          :present=>[
            "Ryan",
            "Chase",
            "KJ",
            "Zach",
            "Ben",
            "Stephanie",
            "Ian",
            "Alex",
            "Cody",
            "Preston",
            "Andrew",
            "Jason"
          ],
          :absent=>[
            "Hunter",
            "Devan",
            "Christian"
          ]
        }
      })
  end

  it 'can give a percent of absent and present' do
    expect(@rc.roll_percentage('present')).to eq(80.0)
    expect(@rc.roll_percentage('absent')).to eq(20.0)
  end

  it 'appends the daily roll call to a file' do
    # In order for this test you to pass, you will need to have a directory
    # named 'support' on the path that you call the RSpec test from
    @rc.save_to_file
    content = <<~CONTENT
      ## Roll call for 2017-04-12

      ### 80.0% Present
      Ryan, Chase, KJ, Zach, Ben, Stephanie, Ian, Alex, Cody, Preston, Andrew, Jason

      ### 20.0% Absent
      Hunter, Devan, Christian

      ------------------------------------------
    CONTENT
    expect(File.read('support/roll_log.md')).to match(content)
  end
end
