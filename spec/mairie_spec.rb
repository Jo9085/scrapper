require_relative '../lib/mairie.rb'
townhall_URL='https://www.annuaire-des-mairies.com/95/avernes.html'
region_URL="https://www.annuaire-des-mairies.com/val-d-oise.html"

describe "the get_townhall_email method" do
    it "should return the townhall email" do
      expect(get_townhall_email(townhall_URL)).to eq("mairie.avernes@orange.fr")
    end
end


describe "the get_cities method" do
    it "should return something" do
      expect(get_cities(region_URL)).to_not be_nil
    end
    it "should return an array" do
        expect(get_cities(region_URL).class).to eq(Array)
    end
    it "should return at least a given city" do
        expect(get_cities(region_URL)).to include("VEMARS")
    end
end

describe "the get_townhall_urls method" do
    it "should return something" do
      expect(get_townhall_urls(region_URL)).to_not be_nil
    end
    it "should return an array" do
        expect(get_townhall_urls(region_URL).class).to eq(Array)
    end
    it "should return at least a given city" do
        expect(get_townhall_urls(region_URL)).to include("VEMARS")
    end
end