# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

JSON.parse(File.read('import_data/merchants.json'))["RECORDS"].each do |m|
  Merchant.create(id: m["id"].to_i, name: m["name"], email: m["email"], cif: m["cif"])
end

JSON.parse(File.read('import_data/shoppers.json'))["RECORDS"].each do |m|
  Shopper.create(id: m["id"].to_i, name: m["name"], email: m["email"], cif: m["cif"])
end

JSON.parse(File.read('import_data/orders.json'))["RECORDS"].each do |m|
  Order.create(id: m["id"].to_i, merchant_id: m["merchant_id"].to_i, shopper_id: m["shopper_id"].to_i, amount: m["amount"].to_f, created_at: m["created_at"].to_datetime, completed_at: m["completed_at"].to_datetime)
end
