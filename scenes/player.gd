extends CharacterBody2D
class_name Player

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var health_bar: TextureProgressBar = $CanvasLayer/HealthBar
@export var ghost_node: PackedScene
@onready var ghost_timer: Timer = $GhostTimer




var rock := preload("res://player/player_projectile_rock.tscn")

var is_immortal = false
var player_can_attack = true
var dash_on_cd = false

@export var player_speed = 30


func _ready() -> void:
    health_bar.max_value = PlayerGlobals.player_max_health
    health_bar.value = PlayerGlobals.player_max_health
    PlayerGlobals.player_get_dmg.connect(_on_dmg_taken)
    PlayerGlobals.player_dead.connect(_player_death)
    animation_player.play("Idle")

func _physics_process(delta: float) -> void:
    var position_mouse_x = get_global_mouse_position().x

    $WeaponMarker.look_at(get_global_mouse_position())
    #$WeaponMarker.rotate(get_angle_to(get_global_mouse_position()))

    #print($WeaponMarker.position)
    if position_mouse_x < global_position.x:
        sprite_2d.flip_h = true
        $CollisionShape2D.position.x = -0.5
    else:
        $CollisionShape2D.position.x = 0.5
        sprite_2d.flip_h = false
        
    move_and_slide()
    


func add_ghost():
    var ghost = ghost_node.instantiate()
    ghost.set_property(global_position,$Sprite2D.scale * 1.5)
    get_tree().current_scene.add_child(ghost)


func dash(direction):
    $DashCd.start()
    dash_on_cd = true
    set_collision_layer_value(3,false)
    velocity = direction * 600
    #set_collision_layer_value(3,true)

    #var isDashing = true
    #print('go')
    #var tween = get_tree().create_tween()
    #tween.tween_property(self, "position", position + velocity * 0.9, 0.45)
    #await tween.finished
    #$DashCd.start()
    #ghost_timer.stop()
    
func _input(event: InputEvent) -> void:
    var input_direction = Input.get_vector("move_left","move_right","move_up", "move_down")
    
    if Input.is_action_just_pressed("attack") && player_can_attack:
        attack_spawn()
        #shoot(rock)
        #Spawning.spawn({"position": Vector2(0,0), "rotation" : 0,"spawn_pos": Vector2(0,0)}, "player", "two")
        $PlayerAttack.start()
        player_can_attack = false
        

    if input_direction:
        animation_player.play("Run")
        velocity = input_direction * player_speed
    else:
        animation_player.play("Idle")
        velocity = input_direction * 0
        
        
    if Input.is_action_just_pressed("dash") && !dash_on_cd:
        ghost_timer.start()
        dash(input_direction)
        

func shoot(projectile):
    var bullet = projectile.instantiate()
    bullet.position = $".".global_position
    bullet.direction = global_position.direction_to(get_global_mouse_position())
    add_child(bullet)


func _on_player_attack_timeout() -> void:
    $PlayerAttack.stop()
    player_can_attack = true

    
func update_player_healthbar(value):
    health_bar.value = value

func _on_dmg_taken(value):
    update_player_healthbar(value)
    
func _player_death():
    queue_free()
    


func _on_ghost_timer_timeout() -> void:
    set_collision_layer_value(3,true)
    #add_ghost()
    


func _on_dash_cd_timeout() -> void:
    dash_on_cd = false
    
    
#var new_pattern: PatternLine = PatternLine.new()


func attack_spawn():
    #new_pattern.offset = Vector2i(40,40)
    #new_pattern.bullet = "2"
    #new_pattern.nbr = 1
    #new_pattern.forced_lookat_mouse = true
    #new_pattern.forced_target = NodePath("$WeaponMarker/Target:position")
    #print($SpawnPattern.nbr)
    #look_at(get_global_mouse_position())
    #Spawning.new_pattern("kopytk", new_pattern)
    
    Spawning.spawn({"position": $WeaponMarker.global_position, "rotation": 0}, "kopytk", "kopytko")
