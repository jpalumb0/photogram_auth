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
    participants = users.sample(2)
    sender = participants.first.id
    receiver = participants.last.id
    sender_name = User.find(sender).username
    receiver_name = User.find(receiver).username
    c = Conversation.create!(
        title: sender_name + ", " + receiver_name    
    )
    5.times do
        Message.create!(
            user_id: participants.sample.id,
            body: Faker::Simpsons.quote,
            amount: 0,
            conversation_id: c.id
        )

    end
end


