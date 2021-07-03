extends Node
class_name StateMachine


const NONE_STRING = "n/a"


signal state_changed(old_state, new_state)
signal started()

var states = {}
var previous_state = null
var current_state : AbstractState = null
var started = false


export(String) var initial_state_name = null
export(String) var default_state_name = null


func start():
	var parent = get_parent()
	for child in get_children():
		if child is AbstractState:
			if initial_state_name == null:
				initial_state_name = child.get_name()
			if default_state_name == null:
				default_state_name = initial_state_name
			child.init(self, parent)
			_register_state(child)
	start_by_name(initial_state_name)
	started = true
	emit_signal("started")


func _register_state(state):
	states[state.get_name()] = state
	if initial_state_name == null:
		initial_state_name = state.get_name()


func _process(delta):
	if current_state != null:
		current_state.process(delta)
		self.call_deferred("start_state", current_state.get_next_state())


func _input(event : InputEvent):
	if not current_state == null:
		current_state.input(event)


func _unhandled_input(event : InputEvent):
	if not current_state == null:
		current_state.unhandled_input(event)


func start_by_name(next_state_name: String, params = {}) -> void:
	var state_change : StateChange = StateChange.new()
	state_change.next_state = next_state_name
	state_change.params = params
	start_state(state_change)


func start_default_state():
	start_by_name(default_state_name)


func start_state(next: StateChange) -> void:	
	if next == null or next.next_state == null:
		return
		
	var next_state_name = next.next_state if next is StateChange else next
	var next_state = states[next_state_name] if states.keys().has(next_state_name) else null
	
	assert(next_state != null)
	if next_state == null:
		return
	
	if not next_state.allow_start():
		return
	#print("%s - %s > %s" % [get_parent().get_path(), get_current_state_name(), next_state.name])
	if not current_state == null:
		if  next_state.get_name() == current_state.get_name():
			return
		current_state.stop(next_state)
		
	previous_state = current_state
	current_state = next_state
	current_state.start(previous_state, next.params)
	emit_signal("state_changed", get_previous_state_name(), get_current_state_name())


func get_current_state_name():
	return current_state.get_name() if current_state != null else NONE_STRING


func get_previous_state_name():
	return previous_state.get_name() if previous_state != null else NONE_STRING


func set_state_params(param_name, value):
	assert(current_state != null)
	assert(current_state.params != null)
	current_state.params[param_name] = value


func get_default_state(state_params:Dictionary={}):
	var sc = StateChange.new()
	sc.next_state = default_state_name
	sc.params = state_params
	return sc
	
