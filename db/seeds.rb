# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class Seeder
  def self.run
    new.build_ideas
  end

  def build_ideas
    puts "Building ideas..."
    20.times do
      idea = Idea.create!(title: Faker::Hipster.sentence(3), body: Faker::Hipster.sentences
      puts "Idea #{idea.id} created."
    end
  end
end

Seeder.run