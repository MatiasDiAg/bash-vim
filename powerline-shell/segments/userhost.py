def add_userhost_segment(powerline):
    import os
    if powerline.args.shell == 'bash':
        userhost_prompt = ' \\u'
    elif powerline.args.shell == 'zsh':
        userhost_prompt = ' %n'
    else:
        userhost_prompt = ' %s' % os.getenv('USER')

    userhost_prompt += '@'

    if os.getenv('USER') == 'root':
        bgcolor = Color.USERNAME_ROOT_BG
    else:
        bgcolor = Color.USERNAME_BG

	if powerline.args.shell == 'bash':
		userhost_prompt += '\\h '
	elif powerline.args.shell == 'zsh':
		userhost_prompt += '%m '
	else:
		import socket
		userhost_prompt += '%s ' % socket.gethostname().split('.')[0]
    powerline.append(userhost_prompt, Color.USERNAME_FG, bgcolor)
