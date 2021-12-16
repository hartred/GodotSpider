extends KinematicBody2D

const CardType = preload("res://CardType.gd") 

var suit: int
var rank: int

const SUIT_RESOURCE_NAMES: Dictionary = {
    CardType.Suit.CLUB: "C",
    CardType.Suit.DIAMOND: "D",
    CardType.Suit.HEART: "H",
    CardType.Suit.SPADE: "S",
}

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
