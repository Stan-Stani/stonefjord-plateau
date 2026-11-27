extends CharacterBody2D


const SPEED = 150.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Handle jump.
	# if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var horizontal_direction := Input.get_axis("left", "right")
	var vertical_direction := Input.get_axis("up", "down")
	if horizontal_direction:
		velocity.x = horizontal_direction * SPEED
		if velocity.x > 0:
			%AnimatedSprite2D.play("walk_east")
			%AnimatedSprite2D.flip_h = false
		elif velocity.x < 0:
			%AnimatedSprite2D.play("walk_east")
			%AnimatedSprite2D.flip_h = true
	else:
		%AnimatedSprite2D.flip_h = false
		
		if velocity.x > 0:
			%AnimatedSprite2D.play("east")
			print('meow')
		elif velocity.x < 0:
			%AnimatedSprite2D.play("west")
			
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		
		
	if vertical_direction:
		velocity.y = vertical_direction * SPEED
		if velocity.y > 0:
			%AnimatedSprite2D.play("walk_south")
			%AnimatedSprite2D.flip_h = false
		elif velocity.y < 0:
			%AnimatedSprite2D.play("walk_north")
			%AnimatedSprite2D.flip_h = false
	else:
		if velocity.y > 0:
			%AnimatedSprite2D.play("south")
		elif velocity.y < 0:
			%AnimatedSprite2D.play("north")
		velocity.y = move_toward(velocity.y, 0, SPEED)
		

	move_and_slide()
