pyenv_install() {
  # FIX: ar is shadowed by binutils.
  # The libpythonX.Ym.a produced by binutils' ar cannot be used for linking.
  # See: https://github.com/pyenv/pyenv/issues/1245
  AR=/usr/bin/ar pyenv install "$1"
}

poetry_start() {
  pyenv shell "$(pyenv local)"
  poetry env remove --all
  poetry env use "$(which python)"
  jq \
    --null-input \
    --arg venv "$(basename "$(poetry env info -p)")" \
    --arg venvPath "$(dirname "$(poetry env info -p)")" \
    '{ "venv": $venv, "venvPath": $venvPath }' \
    >pyrightconfig.json
  poetry install
  poetry shell
}
