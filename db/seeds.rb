# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.customers.delete_all
Cart.delete_all
CartItem.delete_all
Item.delete_all
Color.delete_all
Model.delete_all
Category.delete_all
Address.delete_all

users = [
    {name: "toni",email: "toni@example.com", password:"toni"},
    {name: "test",email: "test@example.com", password:"test"},
    {name: "user",email: "user@example.com", password:"user"}
]
users.each do |u|
    User.create(u)
end

phone_case = Category.create(name: "Phone Cases")

phone_cases = [
    {image: "huawei.jpg", title: "Case for Huawei", description: "Our cases are designed for all-round protection, unfortunately no case is indestructible.", price: "6.99", category_id: phone_case.id },
    {image: "iphone.jpg", title: "Case for Iphone", description: "Our cases are designed for all-round protection, unfortunately no case is indestructible.", price: "6.99", category_id: phone_case.id },
    {image: "samsung.jpg", title: "Case for Samsung", description: "Our cases are designed for all-round protection, unfortunately no case is indestructible.", price: "6.99", category_id: phone_case.id },
    {image: "oneplus.jpg", title: "Case for One Plus", description: "Our cases are designed for all-round protection, unfortunately no case is indestructible.", price: "6.99", category_id: phone_case.id }
]

phone_cases.each do |pc|
    item = Item.create(pc)
    item.colors.create(name: "Red")
    item.colors.create(name: "White")
    item.colors.create(name: "Black")
    item.colors.create(name: "Blue")
    item.models.create(name: "7")
    item.models.create(name: "8")
    item.models.create(name: "11")
    item.models.create(name: "XS")
end

charger = Category.create(name: "Chargers")

chargers = [
    {image: "car_charger.jpg", title: "Wireless Car Charger", description: "Includes: Wireless Charging Pad & Micro-USB Charging Cable.  ", price: "12.99", category_id: charger.id },
    {image: "magnetic_charger.jpg", title: "Magnetic Phone Charger", description: "Connection: 1 x USB A-plug to 1 x Micro B-plug", price: "12.99", category_id: charger.id },
    {image: "wireless_charger.jpg", title: "Wireless Phone Charger", description: "Includes: Wireless Charging Pad & Micro-USB Charging Cable.  ", price: "12.99", category_id: charger.id },
    {image: "charger.jpg", title: "Phone Charger - Fast Charger", description: "Connection: 1 x USB A-plug to 1 x Micro B-plug", price: "12.99", category_id: charger.id }
]
chargers.each do |c|
    item = Item.create(c)
    item.colors.create(name: "Red")
    item.colors.create(name: "White")
    item.colors.create(name: "Black")
    item.colors.create(name: "Blue")
    item.models.create(name: "1 meter")
    item.models.create(name: "2 meters")
    item.models.create(name: "3 meters")
    item.models.create(name: "5 meters")
end