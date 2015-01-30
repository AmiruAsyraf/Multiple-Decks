user_one = User.create(name: "Amiru", password: "12345")
round_one = user_one.rounds.create()
deck_one = round_one.decks.create(name: "World Capitals")
card_one = deck_one.cards.create(question: "Angola", answer: "Luanda")
card_two = deck_one.cards.create(question: "Brazil", answer: "Brasilia")
card_three = deck_one.cards.create(question: "Brunei Darussalam", answer: "Bander Seri Begawan")
card_one.gues.create();
card_two.gues.create();
card_three.gues.create();


round_two = user_one.rounds.create()
deck_two = round_two.decks.create(name: "US State Capitals")
card_four = deck_two.cards.create(question: "Texas", answer: "Austin")
card_five = deck_two.cards.create(question: "Ohio", answer: "Columbus")
card_six = deck_two.cards.create(question: "Hawaii", answer: "Honolulu")
card_four.gues.create();
card_five.gues.create();
card_six.gues.create();
