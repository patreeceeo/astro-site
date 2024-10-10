. ./wootmux.sh

SESSION_NAME=astro-site
if [ "$(wm_session_exists $SESSION_NAME)" ]; then
  echo "attaching to existing session"
  wm_session_attach $SESSION_NAME
  exit 0
fi

wm_session_new $SESSION_NAME

wm_use_clipboard

wm_pane_do "$(wm_pane_current)" "nvim"
wm_pane_new_left "$(wm_pane_current)" "pnpm run dev"
wm_pane_new_below "$(wm_pane_current)"

wm_session_attach $SESSION_NAME
