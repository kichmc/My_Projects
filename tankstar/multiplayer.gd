extends Node
var ips
var my_ip
const Port = 42096
signal joined(id)
signal disconnected(id)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  ips =  IP.get_local_addresses()
  my_ip = get_ip(ips)
  

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  pass


func join():
  var peer = ENetMultiplayerPeer.new()
  if my_ip == null:
    my_ip = "127.0.0.1"
  peer.create_client(str(my_ip),Port)
  multiplayer.multiplayer_peer = peer
  print("join")
  multiplayer.peer_connected.connect(func(id: int):
    joined.emit(id)
    print("Host_connected"))
func host():
  var peer = ENetMultiplayerPeer.new()
  peer.create_server(Port)
  multiplayer.multiplayer_peer = peer
  print("host")
  multiplayer.peer_connected.connect(func(id: int):
    joined.emit(id)
    print("client_connected"))
func get_ip(ip):
  for i in ip:
    if i.count(".") == 3 and not i.begins_with("127."):
      print(i)
      return i
