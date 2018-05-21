(1..30).each do |number|
  Book.create(title: 'test title ' + number.to_s, content: 'test content ' + number.to_s)
end