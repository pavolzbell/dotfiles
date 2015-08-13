function fish_colors
  for color in (set | grep "^fish_color_" | cut -f 1 -d " ");
    set_color "$$color"; echo -n "$color $$color"
    set_color -b normal; echo
  end
end
