# Only set this if we haven't set $EDITOR up somewhere else previously.
if [[ "$EDITOR" == "" ]] ; then
  export EDITOR='atom'
  export USE_EDITOR=$EDITOR
  export VISUAL=$EDITOR
fi
