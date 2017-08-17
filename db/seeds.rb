require "faker"
include Faker
=begin
10.times do
    User.create!(
        username: Faker::Internet.unique.user_name,
        email: Faker::Internet.unique.email,
        avatar_url: Faker::Avatar.image,
        password: "password"
    )
    
    users=User.all
    Wallet.create!(
        user_id: Faker::Number.between(users.first.id, users.last.id),
        balance: Faker::Number.decimal(2),
        public_key: Faker::Bitcoin.unique.address
    )
    
end
=end
20.times do
    users = User.all
    participants = users.sample(2).id
    sender = User.find(participants.first).username
    receiver = User.find(participants.last).username
    Conversation.create!(
        title: sender + ", " + receiver    
    )
    
end

100.times do
    users = User.all
    Message.create!(
        user_id: users.sample.id,
        body: Faker::Simpsons.quote,
        amount: 0,
        conversation_id: Conversation.where("title LIKE ?", User.find(user_id).username).sample.id
    )

end
