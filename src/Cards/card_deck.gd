extends Node

var cards: Array = []
var card_data = CardData.new()

func _ready()->void:
	for m_suit in card_data.CARDTYPE:
		for m_card in card_data.CARDS:
			var card = { "suit":m_suit, "card":m_card}
			cards.append(card)
	print(cards)


