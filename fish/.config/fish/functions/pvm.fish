# python3-venv handler
# With this tool you can create or activate a python virtual environment

function pvm
  argparse 'h/help' 'a/activate' 'c/create' 'd/deactivate' 'r/remove' -- $argv
  or return

  # help start

  if set -ql _flag_help
    if test "$argv" = "activate"
      echo -e "If a directory '.venv' exists at the current position, then the respective virtual environment is activated\n"
      echo "Usage:"
      echo "pevn [-a|--activate]"
    else if test "$argv" = "create"
      echo -e "Create a directory which contains the virtual environment using the 'venv' tool.\n"
      echo "Usage:"
      echo "pevn [-c|--create]"
    else if test "$argv" = "deactivate"
      echo -e "Disables the virtual environment, if active\n"
      echo "Usage:"
      echo "penv [-d|--deactivate]"
    else if test "$argv" = "remove"
      echo -e "Remove the '.venv' directory containing the virtual environment\n"
      echo "Usage:"
      echo "penv [-r|--remove]"
    else
      echo -e "Manages Python virtual environments using the venv package\n"
      echo "Usage:"
      echo "penv [-h|--help] [-a|--activate] [-c|--create] [-d|--deactivate] [-r|--remove]"
    end
  end

  # help end

  # activate start

  if set -ql _flag_activate
    if not test -z $argv
      echo "Unnecessary Args: $argv"
      return 1
    end

    if not test -d "./.venv"
      echo "No python venv. Try 'pvm --create'"
      return 1
    end

    if not test -z "$VIRTUAL_ENV"
      echo "There is currently a virtual environment:"
      echo "$VIRTUAL_ENV"
      return 1
    end

    source ./.venv/bin/activate.fish
    echo "$VIRTUAL_ENV"
  end

  # activate end

  # create start

  if set -ql _flag_create
    if not test -z $argv
      echo "Unnecessary Args: $argv"
      return 1
    end

    if test -d "./.venv"
      echo "Python venv already exists:"
      echo "$VIRTUAL_ENV"
      return 1
    end

    if not test -z "$VIRTUAL_ENV"
      echo "There is currently a virtual environment:"
      echo "$VIRTUAL_ENV"
      return 1
    end

    python3 -m venv .venv
    echo "virtual environment has been created at:"
    echo (pwd)
  end

  # create end

  # deactivate start

  if set -ql _flag_deactivate
    if not test -z $argv
      echo "Unnecessary Args: $argv"
      return 1
    end

    if not test -d "./.venv"
      echo "No python venv. Try 'pvm --create'"
      return 1
    end

    if test -z "$VIRTUAL_ENV"
      echo "No virtual environment has been activated"
      echo "$VIRTUAL_ENV"
      return 1
    end

    deactivate
    echo "The virtual environment has been deactivated"
  end

  # deactivate end

  # remove start

  if set -ql _flag_remove
    if not test -z $argv
      echo "Unnecessary Args: $argv"
      return 1
    end

    if not test -d "./.venv"
      echo "No python venv. Try 'pvm --create'"
      return 1
    end

    if not test -z "$VIRTUAL_ENV"
      echo "There is currently a virtual environment:"
      echo "$VIRTUAL_ENV"
      return 1
    end

    rm -rf ./.venv
    echo "The virtual environment has been removed"
  end

  # remove end
end
