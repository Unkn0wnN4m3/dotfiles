function fish_vi_cursor
  # Emulates vim's cursor shape behavior
  set fish_cursor_default block blink
  set fish_cursor_insert line blink
  set fish_cursor_replace_one underscore
  set fish_cursor_visual block
end
