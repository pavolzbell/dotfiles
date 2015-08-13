function fish_prompt
  set_color $fish_color_param
  printf '%s' (whoami)
	set_color $fish_color_error
  printf '@'

  set_color $fish_color_param
  printf '%s' (hostname | cut -d . -f 1)
  set_color $fish_color_error
  printf ':'

  set_color $fish_color_command
  printf '%s' (prompt_pwd)
  set_color $fish_color_error
  printf '$ '

  set_color $fish_color_normal
end

function fish_right_prompt
  set -l s $status

  if not test $s -eq 0
    set_color $fish_color_error
    printf '%d' $s
  end

	set_color $fish_color_command
	printf '%s ' (__fish_git_prompt)

	set_color $fish_color_param
	printf (date +'%H:%M:%S')

	set_color $fish_color_normal
end
