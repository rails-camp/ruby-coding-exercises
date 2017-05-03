require 'rspec'

def sql_generator(*columns, number:, table_name:)
  final_sql = ""

  number.times do |i|
    final_sql << <<~SQL
      INSERT INTO #{table_name}(#{columns.join(', ')})
      VALUES ('Demo #{i}', 'test#{i}@test.com');
    SQL
  end

  final_sql
end

describe 'sql_generator' do
  it 'can create a dynamic number of sql insert commands with an auto incrementor' do
    final_sql = <<~SQL
      INSERT INTO users(users_name, users_email)
      VALUES ('Demo 0', 'test0@test.com');
      INSERT INTO users(users_name, users_email)
      VALUES ('Demo 1', 'test1@test.com');
    SQL

    expect(sql_generator('users_name', 'users_email', number: 2, table_name: 'users')).to eq(final_sql)
  end
end
