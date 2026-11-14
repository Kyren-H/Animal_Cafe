draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(500, 450,
    "Total Money Earned: $" + string(strategic_layer_manager.money));
draw_text(500, 350,
	"Press ESC to end")