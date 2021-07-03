extends Node
class_name AbstractState


var running_since : float = 0.0
var active = false
var parent setget set_parent
var params = {}
var previous_state : String
var default_state : String
var state_machine


func process(delta:float):
	running_since += delta


func integrate_forces(_state:Physics2DDirectBodyState):
	pass


func physics_process(_delta:float):
	pass


func input(_event:InputEvent):
	pass


func unhandled_input(_event:InputEvent):
	pass


func stop(_new_state):
	active = false
	pass


func allow_start() -> bool:
	return true


func init(new_state_machine, parent_node):
	state_machine = new_state_machine
	parent = parent_node


func start(_old_state, new_params = {}):
	active = true
	previous_state = _old_state.get_name() if _old_state != null else "<unknown>"
	running_since = 0.0
	if params != null:
		params = new_params
	pass


func get_next_state():
	return null


func set_parent(new_parent):
	#TODO - remove this method if not needed
	assert(false)
	parent = new_parent
	if parent != null and parent.has_method("init_state"):
		parent.init_state(self)
		_on_parent_changed(parent)


func _on_parent_changed(_parent):
	pass


static func build_return_state(next_state_name : String, state_params : Dictionary = {}):
	var sc = StateChange.new()
	sc.next_state = next_state_name
	sc.params = state_params
	return sc


