namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts "Cadastrando os tipos de contatos..."

    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts "Contatos cadastrados com sucesso!"

    puts "Cadastrando os contatos:"
    100.times do |i|
      contact = Contact.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.birthday()
      )
      
      # Escolha aleatoriamente um tipo de contato
      contact.kind = Kind.all.sample
      contact.save!
    end

    puts "Contatos cadastrados com sucesso!"
  end
end
