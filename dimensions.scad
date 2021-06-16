/* Dimensions for CM4 IO board, Rev 5b
 * Author: Ray Depew
 * Date: 4 Nov 2020
 */

// All dimensions are in mm, NOT inches.

/* Notation:
 * _x, _x1, _x2 are location values from datum 0.
 * _y, _y1, _y2 are location values from datum 0.
 * _z, _z1, _z2 are location values from datum 0.
 *
 * Datum 0 is lower-left corner of the board.
 *
 * _w, _l, _h are x, y, z dimensions of an object.
 * _d, _r are diameter, radius.
 * _thk is thickness.
 * _alpha is transparency (1.0 = opaque)
 * 
 * Rotation in xy plane:
 * 0 is down (-y)
 * 90 is right (+x)
 * 180 is up (+y)
 * 270 is left (-x)
*/ 

// Board outline
bd_w = 160;
bd_l = 90;
bd_h = 25.4/16; // standard 1/16" PCB
bd_corner_r = 3.5;

// Mounting holes
mh_r = 1;
mh1_x = 3.5;
mh1_y = 3.5;
mh2_x = 11;
mh2_y = 8;
mh3_x = 61.5;
mh3_y = 3.5;
mh4_x = 145;
mh4_y = 8;
mh5_x = 145;
mh5_y = 77;
mh6_x = 11;
mh6_y = 77;

// HAT
mh7_x = 11;
mh7_y = 77;
mh8_x = 11;
mh8_y = 77;

// CM4
mh9_x = 3.5;
mh9_y = 52.5;
mh10_x = 61.5;
mh10_y = 52.5;
mh11_x = 83.5;
mh11_y = 38.5;
mh12_x = 116.5;
mh12_y = 38.5;
mh13_x = 83.5;
mh13_y = 86.5;
mh14_x = 116.5;
mh14_y = 86.5;

/* Component dimensions, counterclockwise from datum
 * _w, _l, _h are x, y, z dimensions of an object.
 * x, y are the location of the component datum.
 * a is angle of rotation around the component datum.
 */
led_w = 2;
led_l = 1;
led_h = 1;
d1_x = 33.7;
d1_y = 0.2;
d1_a = 0;
d1_color = [0.5, 0.5, 1];
d2_x = 37.35;
d2_y = 0.2;
d2_a = 0;
d2_color = [0.5, 1, 0.5];
hdmi_w = 16.2;
hdmi_l = 11.55;
hdmi_h = 7;
hdmi0_x = 23;
hdmi0_y = 0;
hdmi0_a = 0;
hdmi1_x = 48;
hdmi1_y = 0;
hdmi1_a = 0;
eth_w = 16.02;
eth_l = 21.52;
eth_h = 15;
eth_x = 75;
eth_y = -1.65;
eth_a = 0;
usb_w = 13.9;
usb_l = 17.29;
usb_h = 17.5;
usb_x = 94;
usb_y = -0.99;
usb_a = 0;
usbslv_w = 8.015;
usbslv_l = 5.615;
usbslv_h = 3.5;
usbslv_x = 109;
usbslv_y = -0.765;
usbslv_a = 0;
sdcard_w = 12.375;
sdcard_l = 14.275;
sdcard_h = 2;
sdcard_x = 122.25;
sdcard_y = 0;
sdcard_a = 0;
p12v_w = 9.5;
p12v_l = 14.7;
p12v_h = 11.2;
p12v_x = 153.25;
p12v_y = -1.7;
p12v_a = 0;
fan_w = 10.7;
fan_l = 6.6;
fan_h = 10;
fan_x = 151;
fan_y = 90;
fan_a = 180;
p5v_w = 10;
p5v_l = 13.5;
p5v_h = 7.5;
p5v_x = 136.5;
p5v_y = 89.7;
p5v_a = 180;
disp_w = 17.1;
disp_l = 7.9;
disp_h = 2.5;
disp0_x = 29.5;
disp0_y = 90;
disp0_a = 180;
disp1_x = 47.5;
disp1_y = 90;
disp1_a = 180;
cam_w = 17.1;
cam_l = 7.9;
cam_h = 2.5;
cam0_x = 0;
cam0_y = 66.5;
cam0_a = 270;
cam1_x = 11.5;
cam1_y = 90;
cam1_a = 180;
batt_r = 10.25;
batt_w = 2 * batt_r;
batt_l = 2 * batt_r;
batt_h = 5;
batt_x = 11;
batt_y = 37.5;
batt_a = 270;
hat_w = 51.86;
hat_l = 6.1;
hat_h = 10;
hat_x = 6.57;
hat_y = 49.38;
hat_a = 0;
pcie_w = 9;
pcie_l = 25;
pcie_h = 10;
pcie_x = 126.5;
pcie_y = 43;
pcie_a = 0;
cm4_w = 40;
cm4_l = 55;
cm4_h = 25.4/16;
cm4_x = 80;
cm4_y = 35.0;
cm4_a = 0;
j2_w = 18.375;
j2_l = 5.670;
j2_h = hat_h;
j2_x = 61;
j2_y = 83.9;
j2_a = 0;
j6_w = 6.1;
j6_l = 6.1;
j6_h = hat_h;
j6_x = 40;
j6_y = 55.5;
j6_a = 0;
j9_w = 6.1;
j9_l = 6.1;
j9_h = hat_h;
j9_x = 58.48;
j9_y = 43.3;
j9_a = 0;
j14_w = 6.1;
j14_l = 15.25;
j14_h = hat_h;
j14_x = 107.1;
j14_y = 6.5;
j14_a = 0;

// Enclosure dimensions
box_thk = 5;
box_edge_r = 5;
box_w = bd_w + 2 * box_thk;
box_l = bd_l + 2 * box_thk;
box_h = 10 + bd_h -0.1;
stud_r = 4;
stud_hole_r = 2;
stud_h = 10; // if z=0 is the floor of the box, 
             // then z=stud_h is the height of the bottom of the IO board
             // and z=stud_h + bd_h is the height of the top of the board.
             // Let's call that bd_top.
bd_top = stud_h + bd_h;

// Lid
lid_thk = box_thk;
lid_edge_r = box_edge_r;
lid_w = box_w;
lid_l = box_l;
lid_h = 20;

