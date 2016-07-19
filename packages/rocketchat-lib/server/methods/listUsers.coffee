Meteor.methods
	listUsers:	(pattern) ->
		if not Meteor.userId()
			throw new Meteor.Error 'error-invalid-user', 'Invalid user', { method: 'listUsers' }
			
		return { users: RocketChat.models.Users.findUsersByUsernamesRegex(pattern).fetch() }