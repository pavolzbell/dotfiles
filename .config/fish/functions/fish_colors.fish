function fish_colors
  for color in (set | grep "^fish_\(pager_\)\?color_" | cut -f 1 -d " ");
    set_color $$color; echo -n "$color $$color"
    set_color normal; echo
  end
end
