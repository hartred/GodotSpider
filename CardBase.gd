extends KinematicBody2D

const CardType = preload("res://CardType.gd") 

var suit: int
var rank: int
var width: int = 0 setget ,get_width
var height: int = 0 setget ,get_height

const SUIT_RESOURCE_NAMES: Dictionary = {
    CardType.Suit.CLUB: "C",
    CardType.Suit.DIAMOND: "D",
    CardType.Suit.HEART: "H",
    CardType.Suit.SPADE: "S",
}

func get_width():
    return $Sprite.texture.get_width()

func get_height():
    return $Sprite.texture.get_height()

func _ready():
    pass

func init_type(init_suit: int, init_rank: int) -> void:
    self.suit = init_suit
    self.rank = init_rank
    var resource_string: String = "res://assets/cards/%d%s.png" % [
        self.rank,
        self.SUIT_RESOURCE_NAMES[self.suit]
    ]
    $Sprite.texture = load(resource_string)
