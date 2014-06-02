class FakeDataMaker
  def self.make_fake_data
    User.destroy_all
    Client.destroy_all
    ShoppingListItem.destroy_all
    SaleItem.destroy_all
    puts 'fake data deleted'

    client = Client.create({name: Faker::Name.first_name})
    ClientScope.client_id = client.id 

    user = User.create({first_name: Faker::Name.first_name,
                 last_name: Faker::Name.last_name,
                 email: 'ejanderson4@gmail.com',
                 is_admin: true,
                 password: '12345678',
                 client_id: client.id})

    3.times do 
      ShoppingListItem.create({user_id: user.id,
                               name: Faker::Name.first_name})
    end

    3.times do 
      SaleItem.create({client_id: client.id,
                       name: Faker::Name.first_name,
                       description: Faker::Name.last_name,
                       price: 23})
    end

    puts 'fake data made'

  end

end