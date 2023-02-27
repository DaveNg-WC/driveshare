# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Listing.destroy_all if Rails.env.development?
# Offer.destroy_all if Rails.env.development?
# Review.destroy_all if Rails.env.development?
# User.destroy_all if Rails.env.development?

User.create(email: "l.yixuane@gmail.com", password: "abcdefghi", first_name: "yixuan", last_name: "lee", username: "lyx", contact_number: "12345678", host: true)
User.create(email: "dave@gmail.com", password: "aabbccdd", first_name: "dave", last_name: "ng", username: "daveng", contact_number: "87654321", host: true)

Listing.create(name: "Audi", description: "Best Audi in town", price: 90, address: "dover", user_id: 1)
Listing.create(name: "Tesla", description: "Best Tesla in town", price: 110, address: "orchard", user_id: 2)

Offer.create(price: 55, start_date: "2023-02-15", end_date: "2023-02-20", status: "PROPOSAL", listing_id: 1, user_id: 2)
Offer.create(price: 38, start_date: "2023-02-21", end_date: "2023-02-26", status: "PROPOSAL", listing_id: 2, user_id: 1)

Review.create(description: "good car!", rating: 4.8, listing_id: 1, user_id: 2, for_host: true)
Review.create(description: "bad car!", rating: 1.5, listing_id: 1, user_id: 2, for_host: false)
