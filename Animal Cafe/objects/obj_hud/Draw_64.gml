draw_set_font(font_ui)
// ----------------------------
//         MONEY BOX
// ----------------------------
draw_set_alpha(box_alpha);
draw_set_colour(col_box);
draw_roundrect(money_x, money_y, money_x + money_w, money_y + money_h, false);
draw_set_alpha(1);

var money_scale = 1.5 + money_pop * 0.05;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(col_money);
draw_text_transformed(money_x + money_w / 2, money_y + money_h / 2, "$" + string(shown_money), money_scale, money_scale, 0);

// ----------------------------
//        CONTROL BOX
// ----------------------------
var control_w = string_width(control_text) + 20;
var control_h = string_height(control_text) + 12;

draw_set_alpha(0.6);
draw_set_colour(col_box)
draw_roundrect(control_x, control_y - control_h, control_x + control_w, control_y, false);
draw_set_alpha(1);

draw_set_halign(fa_left);
draw_set_colour(col_controls);
draw_text(control_x + 10, control_y - control_h / 2, control_text);

// ----------------------------
//	   RESET DRAW SETTINGS
// ----------------------------
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);
draw_set_alpha(1);
