require_relative '../lib/Mairie_Christmas'

describe "mairie_christmas" do
    it "nbr" do
        #vérifie le nbr exact de villes mais peut varier s'il change sur le site
        expect(rspec1).to eq (185)
    end

    it "array" do 
        #vérifie la valeur pour l'array N°10
        expect(rspec2(10)).to eq ({"ATTAINVILLE"=>"mairie@attainville.fr"})
    end
end