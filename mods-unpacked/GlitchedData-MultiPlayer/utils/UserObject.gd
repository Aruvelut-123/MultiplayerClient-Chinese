extends Panel

@export var usernameLabel : Label
@export var inviteButton : Button
@export var animationPlayer : AnimationPlayer

var username : String
var userID : int
var multiplayerManager

func _ready():
	inviteButton.button_down.connect(inviteUser)

func setup(user, id, manager, isInvited):
	username = user
	userID = id
	multiplayerManager = manager
	usernameLabel.text = username
	if isInvited :
		inviteButton.text = "等待回应"
		inviteButton.disabled = true

func inviteUser():
	print("邀请 %s" % username)
	inviteButton.text = "等待回应"
	inviteButton.disabled = true
	multiplayerManager.createInvite.rpc(userID)
