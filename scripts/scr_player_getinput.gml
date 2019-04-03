//Get Inputs
//global.Left = virtual_key_add(0, 0, 128, 328, vk_left);
//global.Right = virtual_key_add(432, 0, 128, 328, vk_right);

key_left = (keyboard_check(vk_left)
            || (gamepad_axis_value(0, gp_axislh) < 0)
            || (gamepad_button_check(0, gp_padl)));          
if(os_browser == browser_not_a_browser){key_left = -key_left;}
else key_left = key_left;

key_right = keyboard_check(vk_right)
            || (gamepad_axis_value(0, gp_axislh) > 0)
            || (gamepad_button_check(0, gp_padr));
key_up = (keyboard_check(vk_up)
            || (gamepad_axis_value(0, gp_axislv) < 0)
            || (gamepad_button_check(0, gp_padu)));
if(os_browser == browser_not_a_browser){key_up = -key_up;}
else key_up = key_up;

key_down = keyboard_check(vk_down)
            || (gamepad_axis_value(0, gp_axislv) > 0)
            || (gamepad_button_check(0, gp_padd));
key_jump = keyboard_check_pressed(vk_space)
            || (gamepad_button_check_pressed(0, gp_face1));
key_jump_released = keyboard_check_released(vk_space)
            || (gamepad_button_check_released(0, gp_face1));
key_sprint = keyboard_check(vk_lshift)
            || (gamepad_button_check(0, gp_face3))
            || (gamepad_button_check(0, gp_shoulderrb))
            || (gamepad_button_check(0, gp_shoulderlb));
key_shoot = keyboard_check(ord("A"))
            || (gamepad_button_check(0, gp_face2));
key_quit = keyboard_check_pressed(vk_escape)
            || (gamepad_button_check_pressed(0, gp_start));
