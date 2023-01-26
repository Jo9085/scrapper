require_relative '../lib/mairie.rb'
townhall_URL='https://www.annuaire-des-mairies.com/95/avernes.html'

describe "the get_townhall_email method" do
    it "should return the townhall email" do
      expect(get_townhall_email(townhall_URL)).to eq("mairie.avernes@orange.fr")
    end
end