function fish_prompt
  set_color $fish_color_user
  printf '%s' (whoami)
	set_color $fish_color_separator
  printf '@'

  set_color $fish_color_host
  printf '%s' (hostname | cut -d . -f 1)
  set_color $fish_color_separator
  printf ':'

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color $fish_color_separator
  printf '$ '

  set_color $fish_color_normal
end

function fish_right_prompt
  set -l s $status

  if not test $s -eq 0
    set_color $fish_color_status
    printf '%d' $s
  end

  set_color $fish_color_clock
  printf (date +'%H:%M:%S')

  set_color $fish_color_normal
end
