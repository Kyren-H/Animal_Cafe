// ----------------------------
//		  HUD  CONFIG
// ----------------------------
gui_w = display_get_gui_width();
gui_h = display_get_gui_height();
hud_pad = 15;

// ----------------------------
//         HUD COLORS
// ----------------------------
col_ui = c_white;
col_box = make_colour_rgb(25, 25, 30);
col_money = make_colour_rgb(0, 128, 0);
col_controls = make_colour_rgb(200, 200, 200)
box_alpha = 0.85;

// ----------------------------
//       MONEY [TOP-LEFT]
// ----------------------------
money_x = hud_pad
money_y = hud_pad
money_w = 150;
money_h = 44;

var money = instance_exists(strategic_layer_manager) ? strategic_layer_manager.money: 0;
shown_money = money;
last_money = money;
money_pop = 0;

// ----------------------------
//   CONTROLS (BOTTOM-LEFT)
// ----------------------------
control_text = "Arrow Keys: Move    | Space: Interact";
control_x = hud_pad;
control_y = gui_h - hud_pad;