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

User.create(email: "l.yixuane@gmail.com", password: "abcdefghi", first_name: "Yixuan", last_name: "Lee", username: "lyx", contact_number: "12345678", host: true)
User.create(email: "dave@gmail.com", password: "aabbccdd", first_name: "Dave", last_name: "Ng", username: "daveng", contact_number: "87654321", host: true)

# Extra 6 Users
User.create(email: "test3@gmail.com", password: "abcdefghi", first_name: "John", last_name: "Tan", username: "johntan", contact_number: "12345678", host: true)
User.create(email: "test4@gmail.com", password: "aabbccdd", first_name: "Jack", last_name: "Ding", username: "jackding", contact_number: "87654321", host: true)
User.create(email: "test5@gmail.com", password: "abcdefghi", first_name: "Sam", last_name: "Lee", username: "samlee", contact_number: "12345678", host: true)
User.create(email: "test6@gmail.com", password: "aabbccdd", first_name: "Mason", last_name: "Mok", username: "masonmok", contact_number: "87654321", host: true)
User.create(email: "test7@gmail.com", password: "abcdefghi", first_name: "Ian", last_name: "Tan", username: "iantan", contact_number: "12345678", host: true)
User.create(email: "test8@gmail.com", password: "aabbccdd", first_name: "Patsy", last_name: "Koh", username: "patsykoh", contact_number: "87654321", host: true)

Listing.create(brand: "Audi", category: "Sedan", transmission: "Auto", description: "Best Audi in town", price: 90, address: "dover", user_id: 1)
Listing.create(brand: "Tesla", category: "Sedan", transmission: "Auto", description: "Best Tesla in town", price: 110, address: "orchard", user_id: 2)

# Extra 6 Listings
Listing.create(brand: "BMW", category: "Sedan", transmission: "Auto", description: "Best BMW in town", price: 90, address: "pasir ris", user_id: 3)
Listing.create(brand: "Ford", category: "Sedan", transmission: "Auto", description: "Best Ford in town", price: 110, address: "bedok", user_id: 4)
Listing.create(brand: "Toyota", category: "Sedan", transmission: "Auto", description: "Best Toyota in town", price: 65, address: "bishan", user_id: 5)
Listing.create(brand: "Proton", category: "Sedan", transmission: "Auto", description: "Best Proton in town", price: 45, address: "toa payoh", user_id: 6)
Listing.create(brand: "Mazda", category: "Sedan", transmission: "Auto", description: "Best Mazda in town", price: 75, address: "dover", user_id: 7)
Listing.create(brand: "Hyundai", category: "Sedan", transmission: "Auto", description: "Best Hyundai in town", price: 39, address: "jurong", user_id: 8)

Offer.create(price: 55, start_date: "2023-02-15", end_date: "2023-02-20", status: "PROPOSAL", listing_id: 1, user_id: 2)
Offer.create(price: 38, start_date: "2023-02-21", end_date: "2023-02-26", status: "PROPOSAL", listing_id: 2, user_id: 1)

# Extra 6 Offers
Offer.create(price: 90, start_date: "2023-02-21", end_date: "2023-02-26", status: "PROPOSAL", listing_id: 3, user_id: 4)
Offer.create(price: 110, start_date: "2023-02-21", end_date: "2023-02-26", status: "PROPOSAL", listing_id: 4, user_id: 3)
Offer.create(price: 60, start_date: "2023-02-21", end_date: "2023-02-26", status: "PROPOSAL", listing_id: 5, user_id: 6)
Offer.create(price: 75, start_date: "2023-02-21", end_date: "2023-02-26", status: "PROPOSAL", listing_id: 6, user_id: 5)
Offer.create(price: 150, start_date: "2023-02-21", end_date: "2023-02-26", status: "PROPOSAL", listing_id: 7, user_id: 8)
Offer.create(price: 70, start_date: "2023-02-21", end_date: "2023-02-26", status: "PROPOSAL", listing_id: 8, user_id: 7)

Review.create(description: "good car!", rating: 4.8, listing_id: 1, user_id: 1, for_host: true)
Review.create(description: "bad car!", rating: 1.5, listing_id: 1, user_id: 2, for_host: false)

# Extra 6 Reviews
Review.create(description: "great car!", rating: 4.8, listing_id: 2, user_id: 3, for_host: true)
Review.create(description: "ok car!", rating: 1.5, listing_id: 2, user_id: 4, for_host: false)
Review.create(description: "awesome car!", rating: 4.8, listing_id: 3, user_id: 5, for_host: true)
Review.create(description: "disappointing car!", rating: 1.5, listing_id: 3, user_id: 6, for_host: false)
Review.create(description: "best car!", rating: 4.9, listing_id: 4, user_id: 7 , for_host: true)
Review.create(description: "terrible car!", rating: 1.5, listing_id: 4, user_id: 8, for_host: false)
