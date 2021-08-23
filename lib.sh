#!/bin/bash

set -e

# =======================================
# Common
# =======================================

function lib_logmod_colored {
  if [[ "$DOTFILES_MOD" != "" ]]; then
    printf "\e[0m▸ %s\e[0m " "$DOTFILES_MOD" 1>&2;
  fi
  printf "\e[%sm[%s]\e[0m %s\n" "$1" "$2" "${@:3}" 1>&2;
}
function lib_logmod { lib_logmod_colored 92 "${1:-log}" "${@:2}"; }
function lib_logmod_warn { lib_logmod_colored 93 "${1:-log}" "${@:2}"; }
function lib_logmod_error { lib_logmod_colored 91 "${1:-log}" "${@:2}"; exit 1; }

function lib_is_linux {
  if [[ "$OSTYPE" == "linux"* ]]; then
    return 0
  else
    return 1
  fi
}

function lib_is_macos {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    return 0
  else
    return 1
  fi
}

function lib_cmd {
  echo "+ $@" 1>&2;
  $@
}

# =======================================
# Packages
# =======================================

function lib_pkg_install_homebrew {
  if ! lib_is_macos; then
    return
  fi

  lib_logmod "pkg" "Testing if homebrew is installed..."

  if ! command -v brew &> /dev/null; then
    lib_logmod "pkg" "Installing homebrew..."
    lib_cmd /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
}

function lib_pkg_install_if_missing {
  command_to_test="$1"
  apt_package="$2"
  brew_package="$3"

  lib_logmod "pkg" "Testing if $command_to_test is present..."
  if ! command -v $command_to_test &> /dev/null; then
    if lib_is_linux; then
      if [[ "$apt_package" == "" ]]; then
        lib_logmod_error "pkg" "No package exist on Linux, install required package manually"
      fi

      if [[ "$USE_SNAP" == "" ]]; then
        lib_logmod "pkg" "Installing package $apt_package using apt-get..."
        lib_cmd sudo apt-get install -y --no-install-recommends $apt_package
      else
        lib_logmod "pkg" "Installing package $apt_package using snap..."
        lib_cmd sudo snap install $apt_package
      fi
    elif lib_is_macos; then
      if [[ "$brew_package" == "" ]]; then
        lib_logmod_error "pkg" "No package exist on Linux, install required package manually"
      fi

      lib_logmod "pkg" "Installing package $brew_package using brew..."
      lib_pkg_install_homebrew
      lib_cmd brew install $brew_package
    else
      lib_logmod_error "pkg" "Not running on Linux nor macOS, install required package manually"
    fi
  fi
}
