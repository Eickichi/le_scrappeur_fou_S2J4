require_relative '../lib/Cher_Depute'

describe "cher_depute" do
    it "nbr" do
        #vérifie le nbr exact de députés mais peut varier s'il change sur le site
        expect(rspec1).to eq (576)
    end

    it "array" do 
        #vérifie la valeur pour l'array N°20
        expect(rspec2(20)).to eq ({"first_name"=>"Clémentine", "last_name"=>"Autain", "email"=>"clementine.autain@assemblee-nationale.fr"})
    end
end