#!/usr/bin/env zsh

# Required for shunit2 to run correctly
CWD="${${(%):-%x}:A:h}"
setopt shwordsplit
SHUNIT_PARENT=$0

# Use system Spaceship or fallback to Spaceship Docker on CI
typeset -g SPACESHIP_ROOT="${SPACESHIP_ROOT:=/spaceship}"

# Setup ember test environment
setupEmber() {
  local package="$1"

  # Prepare ember's package.json
  mkdir -p $SHUNIT_TMPDIR/node_modules/ember-cli
  cp $package $SHUNIT_TMPDIR/node_modules/ember-cli/package.json

  # Prepare ember's ember-cli-build.js
  touch $SHUNIT_TMPDIR/ember-cli-build.js

  # Enter the test directory
  cd $SHUNIT_TMPDIR
}

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

oneTimeSetUp() {
  export TERM="xterm-256color"

  source "$SPACESHIP_ROOT/spaceship.zsh"
  source "$(dirname $CWD)/spaceship-ember.plugin.zsh"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(ember)

  echo "Spaceship version: $(spaceship --version)"
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_ASYNC
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_system_version() {
  setupEmber "$CWD/package.system.json"

  local expected=""
  local actual="$(spaceship::testkit::render_prompt)"

  assertEquals "do not render system version" "$actual" "$expected"
}

test_ember_version() {
  setupEmber "$CWD/package.ember.json"

  local expected=""
  local actual="$(spaceship::testkit::render_prompt)"

  assertEquals "do not render ember version" "$actual" "$expected"
}

test_mocked_version() {
  setupEmber "$CWD/package.version.json"
  local version="1.0.0-mocked"

  local prefix="%{%B%}$SPACESHIP_EMBER_PREFIX%{%b%}"
  local content="%{%B%F{$SPACESHIP_EMBER_COLOR}%}$SPACESHIP_EMBER_SYMBOL$version%{%b%f%}"
  local suffix="%{%B%}$SPACESHIP_EMBER_SUFFIX%{%b%}"

  local expected="$prefix$content$suffix"
  local actual="$(spaceship::testkit::render_prompt)"

  assertEquals "render mocked version" "$actual" "$expected"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source "$SPACESHIP_ROOT/tests/shunit2/shunit2"
