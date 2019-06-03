# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times{
  User.find_or_create_by(email: Faker::Internet.email) do |u|  
    #find_or_create_by 找有沒有存在一樣的，沒有的話就新增一個
    #假email查faker文件，關鍵字：email
    u.password = '123456'
  end
}