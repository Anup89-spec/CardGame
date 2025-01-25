extends Control

onready var deck_scene: Node = $Deck

var deck_array: Array = []
var player_card: Array = []

onready var card_tween = $Tween
var tween_delay: float = 0.1

var clover_cards_images = { 
		"Ace": "res://assets/cards/Clover/card_1_clover.png",
		"TWO":"res://assets/cards/Clover/card_2_clover.png",
		"THREE": "res://assets/cards/Clover/card_3_clover.png",
		"FOUR":"res://assets/cards/Clover/card_4_clover.png" ,
		"FIVE":"res://assets/cards/Clover/card_5_clover.png" ,
		"SIX":"res://assets/cards/Clover/card_6_clover.png" ,
		"SEVEN": "res://assets/cards/Clover/card_7_clover.png",
		"EIGHT":"res://assets/cards/Clover/card_8_clover.png" ,
		"NINE":"res://assets/cards/Clover/card_9_clover.png" ,
		"TEN":"res://assets/cards/Clover/card_10_clover.png" ,
		"JACK":"res://assets/cards/Clover/card_11_clover.png" ,
		"QUEEN":"res://assets/cards/Clover/card_12_clover.png" ,
		"KING":"res://assets/cards/Clover/card_13_clover.png"
	}
	
var heart_cards_images = { 
	"ACE":"res://assets/cards/Heart/card_1_heart.png" ,
	"TWO":"res://assets/cards/Heart/card_2_heart.png" ,
	"THREE":"res://assets/cards/Heart/card_3_heart.png" ,
	"FOUR": "res://assets/cards/Heart/card_4_heart.png",
	"FIVE":"res://assets/cards/Heart/card_5_heart.png" ,
	"SIX":"res://assets/cards/Heart/card_6_heart.png" ,
	"SEVEN":"res://assets/cards/Heart/card_7_heart.png" ,
	"EIGHT":"res://assets/cards/Heart/card_8_heart.png" ,
	"NINE":"res://assets/cards/Heart/card_9_heart.png" ,
	"TEN": "res://assets/cards/Heart/card_10_heart.png",
	"JACK": "res://assets/cards/Heart/card_11_heart.png",
	"QUEEN":"res://assets/cards/Heart/card_12_heart.png" ,
	"KING": "res://assets/cards/Heart/card_13_heart.png"
	}

var diamond_cards_images = { 
	"ACE":"res://assets/cards/Diamond/card_1_diamond.png" ,
	"TWO": "res://assets/cards/Diamond/card_2_diamond.png",
	"THREE":"res://assets/cards/Diamond/card_3_diamond.png" ,
	"FOUR": "res://assets/cards/Diamond/card_4_diamond.png",
	"FIVE": "res://assets/cards/Diamond/card_5_diamond.png",
	"SIX": "res://assets/cards/Diamond/card_6_diamond.png",
	"SEVEN": "res://assets/cards/Diamond/card_7_diamond.png",
	"EIGHT": "res://assets/cards/Diamond/card_8_diamond.png",
	"NINE": "res://assets/cards/Diamond/card_9_diamond.png",
	"TEN":"res://assets/cards/Diamond/card_10_diamond.png" ,
	"JACK":"res://assets/cards/Diamond/card_11_diamond.png" ,
	"QUEEN": "res://assets/cards/Diamond/card_12_diamond.png",
	"KING": "res://assets/cards/Diamond/card_13_diamond.png"
	}
	
var spade_cards_images = { 
	"ACE": "res://assets/cards/Spade/card_1_spade.png",
	"TWO": "res://assets/cards/Spade/card_2_spade.png",
	"THREE": "res://assets/cards/Spade/card_3_spade.png",
	"FOUR":"res://assets/cards/Spade/card_4_spade.png" ,
	"FIVE": "res://assets/cards/Spade/card_5_spade.png",
	"SIX": "res://assets/cards/Spade/card_6_spade.png",
	"SEVEN": "res://assets/cards/Spade/card_7_spade.png",
	"EIGHT": "res://assets/cards/Spade/card_8_spade.png",
	"NINE": "res://assets/cards/Spade/card_9_spade.png",
	"TEN": "res://assets/cards/Spade/card_10_spade.png",
	"JACK": "res://assets/cards/Spade/card_11_spade.png",
	"QUEEN":"res://assets/cards/Spade/card_12_spade.png" ,
	"KING": "res://assets/cards/Spade/card_13_spade.png"
	}



func _ready():
	deck_array = deck_scene.get_cards()
	spread_cards()


func spread_cards():
	var current_player = 1
	var delay_counter = 0
	card_tween.start()
	for i in range(0, deck_array.size() -1 , 1):
		var card_sprite: Sprite = deck_array[i]["card_detail"]
		if card_sprite :
			var player_node = get_node("player" + str(current_player))
			card_tween.interpolate_property(
				card_sprite, 
				"position",  
				card_sprite.position, 
				player_node.get_child(0).global_position,  
				1.0, 
				Tween.TRANS_LINEAR, 
				Tween.EASE_IN_OUT,  
				delay_counter  
			)
			delay_counter += tween_delay
			if current_player == 4:
				current_player = 1
			else:
				if current_player == 3:
					player_card.append(deck_array[i])
				current_player += 1
	
	check_player_cards()


func check_player_cards():
	for card in player_card:
		var sprite = TextureRect.new()
		if card["suit"] == "CLOVER":
			sprite.texture = load(clover_cards_images[card["card"]])
			$HBoxContainer.add_child(sprite)
		
		elif card["suit"] == "HEART":
			sprite.texture = load(heart_cards_images[card["card"]])
			$HBoxContainer.add_child(sprite)
			
		elif card["suit"] == "DIAMOND":
			sprite.texture = load(diamond_cards_images[card["card"]])
			$HBoxContainer.add_child(sprite)
			
		elif card["suit"] == "SPADE":
			sprite.texture = load(spade_cards_images[card["card"]])
			$HBoxContainer.add_child(sprite)


