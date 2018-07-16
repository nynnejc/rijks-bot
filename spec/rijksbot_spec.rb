require 'rijksbot'

RSpec.describe Rijksbot do
  it 'initializes' do
    twitter = double
    bot = Rijksbot.new(twitter)
    expect(bot).to be_a(Rijksbot)
  end
end
