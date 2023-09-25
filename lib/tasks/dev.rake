namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    %x(rails db:drop_unsafe db:create db:migrate)
    
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

    puts "Cadastrando os telefones:"
  Contact.all.each do |contact|
    Random.rand(5).times do |i|
      phone = Phone.create(
      number: Faker::PhoneNumber.cell_phone,
      contact: contact # Associe o telefone ao contato correto
    )
  end
end

    puts "Cadastrando os endereços:"
    Contact.all.each do |contact|
      adress = Adress.create(
        street: Faker::Address.street_name,
        city: Faker::Address.city,
        contact: contact
      )
    end
  end
end
