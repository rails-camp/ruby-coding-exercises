require 'active_support/core_ext/hash'
require 'rspec'

def macbeth_counter
  xml_data = File.open('support/macbeth.xml')
  hash = Hash.from_xml(xml_data)

  counter_hash = Hash.new { |h, k| h[k] = 0 }

  hash['PLAY']['ACT'].each do |k, v|
    k['SCENE'].each do |k2, v2|
      k2['SPEECH'].each do |k3, v3|
        counter_hash[k3['SPEAKER']] += Array(k3['LINE']).count
      end
    end
  end

  counter_hash
end

describe 'XML counter' do
  it 'can count the lines in macbeth for each character' do
    expect(macbeth_counter['ROSS']).to eq(135)
    expect(macbeth_counter['FLEANCE']).to eq(2)
    expect(macbeth_counter['MACBETH']).to eq(718)
  end

  it 'produces a full line count for each character' do
    expect(macbeth_counter).to eq(
      {"First Witch"=>62,
       "Second Witch"=>27,
       "Third Witch"=>27,
       "ALL"=>24,
       "DUNCAN"=>70,
       "MALCOLM"=>212,
       "Sergeant"=>35,
       "LENNOX"=>73,
       "ROSS"=>135,
       "MACBETH"=>718,
       "BANQUO"=>113,
       "ANGUS"=>21,
       "LADY MACBETH"=>265,
       "Messenger"=>23,
       "FLEANCE"=>2,
       "Porter"=>46,
       "MACDUFF"=>180,
       ["MACBETH", "LENNOX"]=>1,
       "DONALBAIN"=>10,
       "Old Man"=>11,
       "ATTENDANT"=>1,
       "First Murderer"=>30,
       "Second Murderer"=>15,
       "Both Murderers"=>2,
       "Servant"=>5,
       "Third Murderer"=>8,
       "Lords"=>3,
       "HECATE"=>39,
       "Lord"=>21,
       "First Apparition"=>2,
       "Second Apparition"=>4,
       "Third Apparition"=>5,
       "LADY MACDUFF"=>41,
       "Son"=>20,
       "Doctor"=>45,
       "Gentlewoman"=>23,
       "MENTEITH"=>12,
       "CAITHNESS"=>11,
       "SEYTON"=>5,
       "SIWARD"=>30,
       "Soldiers"=>1,
       "YOUNG SIWARD"=>7}
    )
  end
end
