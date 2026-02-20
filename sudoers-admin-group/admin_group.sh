#!/bin/bash
set -euo pipefail

# Task 6: User Accounts & Groups - Manage admin group on macOS
# This script ADDS a user to the macOS "admin" group, then verifies membership.
# It does NOT modify /etc/sudoers directly (safer than visudo automation).

usage() {
  echo "Usage:"
  echo "  $0 add <username>     # add user to admin group (requires admin + sudo)"
  echo "  $0 check <username>   # verify if user is in admin group"
  echo
  echo "Examples:"
  echo "  sudo $0 add JuniorAdmin"
  echo "  $0 check JuniorAdmin"
}

require_macos() {
  if [[ "$(uname -s)" != "Darwin" ]]; then
    echo "Error: This script is for macOS (Darwin) only."
    exit 1
  fi
}

require_root_for_add() {
  if [[ "${EUID}" -ne 0 ]]; then
    echo "Error: 'add' requires sudo. Run: sudo $0 add <username>"
    exit 1
  fi
}

user_exists() {
  local user="$1"
  dscl . -read "/Users/${user}" >/dev/null 2>&1
}

add_to_admin_group() {
  local user="$1"

  if ! user_exists "$user"; then
    echo "Error: User '$user' does not exist on this Mac."
    exit 1
  fi

  echo "Adding '$user' to the admin group..."
  dseditgroup -o edit -a "$user" -t user admin

  echo "Done."
  echo
  check_admin_group "$user"
}

check_admin_group() {
  local user="$1"

  if ! user_exists "$user"; then
    echo "Error: User '$user' does not exist on this Mac."
    exit 1
  fi

  echo "Checking admin group membership for '$user'..."
  if dseditgroup -o checkmember -m "$user" admin | grep -q "yes"; then
    echo "✅ '$user' IS a member of the admin group."
    echo "They should be able to run sudo commands (after logging out/in)."
  else
    echo "❌ '$user' is NOT a member of the admin group."
  fi
}

main() {
  require_macos

  if [[ $# -ne 2 ]]; then
    usage
    exit 1
  fi

  local cmd="$1"
  local user="$2"

  case "$cmd" in
    add)
      require_root_for_add
      add_to_admin_group "$user"
      ;;
    check)
      check_admin_group "$user"
      ;;
    *)
      usage
      exit 1
      ;;
  esac
}

main "$@"
