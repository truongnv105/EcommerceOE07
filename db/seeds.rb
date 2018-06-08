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

Category.create!(
  name: "pc"
)

60.times do |n|
  name  = "PC-Computer-#{n+1}"
  describe = "description laptop #{n+1}"
  price = 1000000 * n
  discount = 20
  category_id = 1
  ram = 4+n
  picture = File.open(File.join(Rails.root, "/app/assets/images/new-icon.png"))
  Product.create!(name:  name,
    describe: describe,
    price: price,
    RAM: ram,
    discount: discount,
    category_id: category_id,
      images_attributes:[
        product_id: n+1,
        picture: picture
      ])
end

5.times do |n|
  name  = "Quang-Ngoc-Test-#{n+1}"
  email = "ngoc#{n+1}@gmail.com"
  password = "12345678"
  password_confirmation = "12345678"
  phone_number = "01234567891"
  address  = "zxcvbnmlkjhgfdsapoiuytrewqpoiuytrewqlkjhgfdsamnbvcxzaqwsa#{n+1}"
  is_admin = false
  activated = true
  activated_at = Time.zone.now
  User.create!(name:  name,
    email: email,
    password: password,
    password_confirmation: password_confirmation,
    phone_number: phone_number,
    address: address,
    is_admin: is_admin,
    activated: activated,
    activated_at: activated_at)
end
