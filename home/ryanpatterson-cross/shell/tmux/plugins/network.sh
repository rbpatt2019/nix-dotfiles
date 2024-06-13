show_network() {
	local index icon color text module

	network_name=$(awk '{$1=$1};1' <<<"$(networksetup -getairportnetwork en0 | cut -d':' -f2)")

	index=$1
	icon="$(get_tmux_option "@catppuccin_network_icon" "󰖟")"
	color="$(get_tmux_option "@catppuccin_network_color" "$thm_orange")"
	text="$(get_tmux_option "@catppuccin_network_text" "$network_name")"

	module=$(build_status_module "$index" "$icon" "$color" "$text")

	echo "$module"
}
