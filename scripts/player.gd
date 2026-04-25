extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -600.0  #-1000 wuxu u kacaya kor aad

# @onready waxay hubisaa in node-ka la helay ka hor intaan script-ku bilaaban
@onready var anime: AnimatedSprite2D = $CollisionShape2D/AnimatedSprite2D

func _ready():
	# Xasuuso: Had iyo jeer isticmaal "_" ka hor ready
	anime.play("idle")
	
#run  60 per sec
func _physics_process(delta: float) -> void:
	#animationska 
	if(velocity.x > 1 || velocity.x < -1):
		anime.play("run")
	else:
		anime.play("default")
	
	
	#marku hawada ku jiro
	if not is_on_floor():
		velocity += get_gravity() * delta
		anime.play("jumpp")

	# Jump ui_accept waa space,enter dhulkana taaganyahay
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# 3.Direction  Waxay eegaysaa haddii badhan la riixay
	var direction := Input.get_axis("ui_left", "ui_right")
	
	# Halkan waxaan ku geyneynaa inuu ciyaaryahanku dhinac u weecdo (Flip)
	#if direction > 0:
		#anime.flip_h = false # Midig u jeedi
	#elif direction < 0:
		#anime.flip_h = true  # Bidix u jeedi

	# Socodka (Horizontal Movement)
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 10)  #speed wacaadi, 10 ka dhigi

	# 4. Maamulka Animation-ka (Animation Logic)
	# Waxaan isticmaaleynaa "if/elif" si aan u kala saarno animations-ka
	
	#if not is_on_floor():
		## Haddii uu hawada ku jiro, daar boodidda
		#anime.play("jump")
	#elif direction != 0:
		## Haddii uu dhulka joogo oo uu socdo, daar orodka
		#anime.play("run")
		##elif direction != 0:
	#else:
		## Haddii kale, idle (taagnaan) ha ahaado
		#anime.play("idle")

	move_and_slide()
	
	#geesaha in uu u weecdo 
	var isLeft = velocity.x < 0
	anime.flip_h = isLeft
