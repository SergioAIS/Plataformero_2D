// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function keyboard_key_to_string(_k) {
    var k = _k;

    if (k == vk_left)    return "Left";
    if (k == vk_right)   return "Right";
    if (k == vk_up)      return "Up";
    if (k == vk_down)    return "Down";
    if (k == vk_space)   return "Space";
    if (k == vk_control) return "Ctrl";

    if (k >= ord("A") && k <= ord("Z")) return chr(k);
    if (k >= ord("0") && k <= ord("9")) return chr(k);

    return string(k);
}
