require 'rspec'

describe ContactParser do
  it 'can parse emails by first and last name and email when in the format: Jon Snow <jon@snow.com>' do
    contacts = "Darth Vader <darth@vader.com>, Oops Sanderson <oops@gmail>, Han Solo <han@solo.com>, Mace X Windu <mace@windu.com>, Yoda <yoda@lightsaber.com>, Leia Organa leia@organa.com"
    expect(ContactParser.new(contacts).bulk_parse).to eq(
      {
        accepted: [
          {
            first_name: 'Darth',
            last_name: 'Vader',
            email: 'darth@vader.com'
          },
          {
            first_name: 'Han',
            last_name: 'Solo',
            email: 'han@solo.com'
          },
          {
            first_name: 'Mace',
            last_name: 'Windu',
            email: 'mace@windu.com'
          },
          {
            first_name: 'Leia',
            last_name: 'Organa',
            email: 'leia@organa.com'
          }
        ],
        rejected: [
          'Oops Sanderson oops@gmail',
          'Yoda yoda@lightsaber.com'
        ]
      }
    )
  end
end

