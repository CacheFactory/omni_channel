class FakeDataMaker
  def self.make_fake_data
    User.destroy_all
    Client.destroy_all
    ShoppingListItem.destroy_all

    client = Client.create({name: Faker::Name.first_name})

    user = User.create({first_name: Faker::Name.first_name,
                 last_name: Faker::Name.last_name,
                 email: 'ejanderson4@gmail.com',
                 password: '12345678',
                 client_id: client.id})

    3.times do 
      ShoppingListItem.create({user_id: user.id,
                               name: Faker::Name.first_name})
    end

  end

end