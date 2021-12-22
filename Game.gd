extends Control

const CardBase = preload("res://CardBase.tscn")
const CardType = preload("res://CardType.gd")

var velocity = Vector2()
var move_speed = 600
var card_move_target = Vector2()
var selected_card_index = -1
var card_is_moving = false

var current_cards = []

func init_types(cards: Array):
    cards[0].init_type(CardType.Suit.HEART, CardType.Rank.TEN)
    cards[1].init_type(CardType.Suit.SPADE, CardType.Rank.SIX)
    cards[2].init_type(CardType.Suit.HEART, CardType.Rank.FOUR)
    cards[3].init_type(CardType.Suit.SPADE, CardType.Rank.FIVE)
    cards[4].init_type(CardType.Suit.SPADE, CardType.Rank.FIVE)
    cards[5].init_type(CardType.Suit.HEART, CardType.Rank.EIGHT)
    cards[6].init_type(CardType.Suit.HEART, CardType.Rank.TWO)
    cards[7].init_type(CardType.Suit.HEART, CardType.Rank.NINE)
    cards[8].init_type(CardType.Suit.SPADE, CardType.Rank.SIX)
    cards[9].init_type(CardType.Suit.HEART, CardType.Rank.ACE)

func get_higher_rank_card(card):
    for i in current_cards.size():
        var current_card = current_cards[i]
        # TODO: Prioritize card suits
        if current_card.is_rank_higher_by_one_point(card):
            return current_card
    return null

func _on_CardBase_input_event(_viewport, event, _shape_idx, card_idx):
    if not (event is InputEventMouseButton and event.pressed):
        return
    var higher_rank_card = get_higher_rank_card(current_cards[card_idx])
    if higher_rank_card == null:
        return
    print()
    self.card_move_target = Vector2(
        higher_rank_card.position.x,
        higher_rank_card.get_height() / 4 
    )
    self.selected_card_index = card_idx
    self.card_is_moving = true
    self.current_cards[self.selected_card_index].z_index += 1
        
func init_cards():
    for i in 10:
        current_cards.append(CardBase.instance())
    init_types(current_cards)
    for i in current_cards.size():
        var width_offset: int = current_cards[i].get_width() * i
        current_cards[i].position += Vector2(width_offset, 0)
        add_child(current_cards[i])
        current_cards[i].connect(
            "input_event",
            self,
            "_on_CardBase_input_event",
            [i]
        )
        
func _ready():
    init_cards() 
    current_cards[0].z_index += 1

func _physics_process(delta):
    if not self.card_is_moving:
        return
    # TODO: Move the card moving functionality to the card base
    var selected_card = current_cards[self.selected_card_index]
    var card_move_direction = selected_card.position.direction_to(self.card_move_target)
    self.velocity = card_move_direction * self.move_speed
    if selected_card.position.distance_to(self.card_move_target) > 4:
        self.velocity = selected_card.move_and_slide(self.velocity)
    else:
        # TODO: Move the reset functionality to the separate function        
        self.card_is_moving = false
        self.selected_card_index = -1
        self.card_move_target = Vector2()
