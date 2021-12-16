extends Control

const CardBase = preload("res://CardBase.tscn")
const CardType = preload("res://CardType.gd")

func _ready():
    var card = CardBase.instance()
    card.init_type(CardType.Suit.HEART, CardType.Rank.KING)
    add_child(card)
