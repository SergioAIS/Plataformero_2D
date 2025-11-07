// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_slider10(_x, _y, _level, _selected) {
    var bx = _x, by = _y, w = 14, h = 12, pad = 4;

    if (_selected) {
        draw_set_color(c_yellow);
        var total_w = 10*(w+pad)-pad;
        draw_rectangle(bx-6, by-4, bx-6+total_w+12, by+h+8, false);
    }

    for (var i=0; i<10; i++) {
        var xx1 = bx + i*(w+pad);
        var yy1 = by;
        var xx2 = xx1 + w;
        var yy2 = yy1 + h;

        if (i < _level) {
            draw_set_color(c_white);
            draw_rectangle(xx1, yy1, xx2, yy2, false);
        } else {
            draw_set_color(make_color_rgb(160,160,160));
            draw_rectangle(xx1, yy1, xx2, yy2, true);
        }
    }
}