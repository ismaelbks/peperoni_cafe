class AddPseudoToUsers < ActiveRecord::Migration[5.1]
    def self.up
    	change_table :users do |t|
    		t.string :pseudo 
    		t.string :phone_number 
    		t.string :last_name 
    	end
    end

    def self.down
    	change_table :users do |t|
    		t.remove :pseudo
    		t.remove :phone_number
    		t.remove :last_name
    	end
    end 
end
