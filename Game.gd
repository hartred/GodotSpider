extends Control

const CardBase = preload("res://CardBase.tscn")
const CardType = preload("res://CardType.gd")

var current_cards = []

func init_types(cards: Array):
    current_cards[0].init_type(CardType.Suit.HEART, CardType.Rank.TEN)
    current_cards[1].init_type(CardType.Suit.SPADE, CardType.Rank.SIX)
    current_cards[2].init_type(CardType.Suit.HEART, CardType.Rank.FOUR)
    current_cards[3].init_type(CardType.Suit.SPADE, CardType.Rank.FIVE)
    current_cards[4].init_type(CardType.Suit.SPADE, CardType.Rank.FIVE)
    current_cards[5].init_type(CardType.Suit.HEART, CardType.Rank.EIGHT)
    current_cards[6].init_type(CardType.Suit.HEART, CardType.Rank.TWO)
    current_cards[7].init_type(CardType.Suit.HEART, CardType.Rank.NINE)
    current_cards[8].init_type(CardType.Suit.SPADE, CardType.Rank.SIX)
    current_cards[9].init_type(CardType.Suit.HEART, CardType.Rank.ACE)
    

func init_cards():
    for i in 10:
        current_cards.append(CardBase.instance())
    init_types(current_cards)
    for i in current_cards.size():
        var width_offset: int = current_cards[i].get_width() * i
        current_cards[i].position += Vector2(width_offset, 0)
        add_child(current_cards[i])

func _ready():
    init_cards() 
