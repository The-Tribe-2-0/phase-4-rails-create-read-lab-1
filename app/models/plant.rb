class Plant < ApplicationRecord
    def as_json(options = {})
      super(only: [:id, :name, :image, :price])
    end
  end
  