require_relative '../lib/scrapper.rb'
#https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers

describe "the cryptos method" do
    it "should return an array" do
      expect(cryptos.class).to eq(Array)
    end
    it "should return an array that is not null" do
        expect(cryptos.length).not_to be_nil
    end
    it "should return an array that is at least 10" do
        expect(cryptos.length).to be > 10
    end
    #it "should return an array with at least Bitcoin" do
        #expect(cryptos[{:BTC=>Float}]).to exist
        #expect(cryptos.key("BTC").to exist
    #end
end