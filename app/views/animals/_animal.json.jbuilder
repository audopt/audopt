json.extract! animal, :id, :name, :type, :breed, :vaccined, :castrated, :sex, :size, :created_at, :updated_at
json.url animal_url(animal, format: :json)