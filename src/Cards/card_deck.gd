extends Node

var cards: Array = []  
var card_data = CardData.new()  
var card_back_image_path = "res://assets/cardback.png"
var offset = Vector2(0.2, 0.1)  

func _ready() -> void:
	var card_back_texture = load(card_back_image_path)
	
	for m_suit in card_data.CARDTYPE:
		for m_card in card_data.CARDS:
			var m_sprite_back = Sprite.new()
			m_sprite_back.texture = card_back_texture
			m_sprite_back.position = Vector2.ZERO  
	
			var card_index = cards.size()
			m_sprite_back.position += offset * card_index  
			self.add_child(m_sprite_back)
			
			var m_card_data = {
				"suit": m_suit,
				"card": m_card,
				"card_detail": m_sprite_back  
			}
			cards.append(m_card_data)

	cards.shuffle()

func get_cards() -> Array:
	return cards
