User.create!(
  name: "Truong Nguyen",
  email: "truongnv15@gmail.com",
  password: "11111111",
  password_confirmation: "11111111",
  phone_number: "1234567890",
  address: "11111111111111111111111111111111111111111111111111111111",
  is_admin: true,
  activated: true,
  activated_at: Time.zone.now
)
User.create!(
  name: "Mai Huynh",
  email: "maimit1798@gmail.com",
  password: "11111111",
  password_confirmation: "11111111",
  phone_number: "1234567890",
  address: "11111111111111111111111111111111111111111111111111111111",
  is_admin: true,
  activated: true,
  activated_at: Time.zone.now
)
30.times do |n|
  name  = "Laptop-#{n+1}"
  describe = "description laptop #{n+1}"
  price = 1000000
  picture = Faker::Avatar.image
  discount = 20
  feature  = true
  ram = "4G"
  screen = "32inch"
  hard_disk = "SAMSUNG"
  status = "1"
  Product.create!(name:  name,
    describe: describe,
    price: price,
    picture: picture,
    discount: discount,
    feature: feature,
    RAM: ram,
    screen: screen,
    hard_disk: hard_disk,
    status: status)
end
