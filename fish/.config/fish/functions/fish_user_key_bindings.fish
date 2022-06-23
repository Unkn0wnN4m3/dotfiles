function fish_user_key_bindings
  # Then execute the vi-bindings so they take precedence when there's a conflict.
  # Without --no-erase fish_vi_key_bindings will default to
  # resetting all bindings.
  # The argument specifies the initial mode (insert, "default" or visual).
  fish_vi_key_bindings --no-erase insert

  bind -M insert \cf forward-char
end
