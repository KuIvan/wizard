# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

current_time = Time.now
INTERESTS_COLLECTION = %w[TV Sport Science Games Books Travel Dance]

def insert_dictionary(model, array, time)
  return if model.any?
  model.insert_all(array.map { |name| { name: name, created_at: time, updated_at: time } })
end

insert_dictionary(Language, LanguageList::COMMON_LANGUAGES.map(&:name), current_time)
insert_dictionary(Country, ISO3166::Country.all.map(&:name), current_time)
insert_dictionary(Interest, INTERESTS_COLLECTION, current_time)