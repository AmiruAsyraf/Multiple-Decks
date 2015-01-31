User.create(name: "Amiru", email: "amiruasyraf@gmail.com", password: "12345")
User.create(name: "Asyraf", email: "amiruasyraf@yahoo.com", password: "qwert")

deck_one = Deck.create(name: "World Capitals")
deck_two = Deck.create(name: "US State Capitals")

deck_one.cards.create(question: "Angola", answer: "Luanda")
deck_one.cards.create(question: "Brazil", answer: "Brasilia")
deck_one.cards.create(question: "Brunei Darussalam", answer: "Bander Seri Begawan")

deck_two.cards.create(question: "Texas", answer: "Austin")
deck_two.cards.create(question: "Ohio", answer: "Columbus")
deck_two.cards.create(question: "Hawaii", answer: "Honolulu")

