class Category < ApplicationRecord
    has_many :items

    def self.find_category(name, id)
        if name == ""
            self.find_by(id: id)
        else
            self.find_or_create_by(name: name)
        end
    end
end
