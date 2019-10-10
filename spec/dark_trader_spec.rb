require_relative '../lib/Dark_Trader'

describe "Dark_Trader" do
    it "nbr" do
        #vérifie le nbr exact de cryptomonnaie mais peut varier s'il change sur le site
        expect(rspec1).to eq (2399)
    end

    it "array" do 
        #vérifie la valeur pour l'array N°5
        expect(rspec2(5)).to eq ({"LTC"=>"$57.73"})
    end
end