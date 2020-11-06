/* CM4 IO board, Rev 5b
 * Author: Ray Depew
 * Date: 4 Nov 2020
 */

// All dimensions are in mm, NOT inches.

// Variables

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

include <dimensions.scad>

/**********************************************************
 * Component modules
 **********************************************************
 */

// FIRST: The Raspberry Pi Zero W
module board() {
  // IO board blank
  color("green", alpha = 1.0) {
    difference() {
      translate([bd_corner_r, bd_corner_r, -bd_h])
      linear_extrude(height = bd_h)
      minkowski() {
        square([bd_w - 2 * bd_corner_r,
                bd_l - 2 * bd_corner_r]);
        circle(bd_corner_r);
      }
      // Mounting holes 
      translate([mh1_x, mh1_y, -5]) cylinder(r=mh_r, h=10);
      translate([mh2_x, mh2_y, -5]) cylinder(r=mh_r, h=10);
      translate([mh3_x, mh3_y, -5]) cylinder(r=mh_r, h=10);
      translate([mh4_x, mh4_y, -5]) cylinder(r=mh_r, h=10);
      translate([mh5_x, mh5_y, -5]) cylinder(r=mh_r, h=10);
      translate([mh6_x, mh6_y, -5]) cylinder(r=mh_r, h=10);
      translate([mh7_x, mh7_y, -5]) cylinder(r=mh_r, h=10);
      translate([mh8_x, mh8_y, -5]) cylinder(r=mh_r, h=10);
      translate([mh9_x, mh9_y, -5]) cylinder(r=mh_r, h=10);
      translate([mh10_x, mh10_y, -5]) cylinder(r=mh_r, h=10);
      translate([mh11_x, mh11_y, -5]) cylinder(r=mh_r, h=10);
      translate([mh12_x, mh12_y, -5]) cylinder(r=mh_r, h=10);
      translate([mh13_x, mh13_y, -5]) cylinder(r=mh_r, h=10);
      translate([mh14_x, mh14_y, -5]) cylinder(r=mh_r, h=10);
    }
  }
}

module connectors() {
  hdmi(hdmi0_x, hdmi0_y, hdmi0_a);
  hdmi(hdmi1_x, hdmi1_y, hdmi1_a);
  eth(eth_x, eth_y, eth_a);
  usb(usb_x, usb_y, usb_a);
  usbslave(usbslv_x, usbslv_y, usbslv_a);
  sdcard(sdcard_x, sdcard_y, sdcard_a);
  p12v(p12v_x, p12v_y, p12v_a);
  fan(fan_x, fan_y, fan_a);
  p5v(p5v_x, p5v_y, p5v_a);
  j2(j2_x, j2_y, j2_a);
  disp(disp0_x, disp0_y, disp0_a);
  disp(disp1_x, disp1_y, disp1_a);
  cam(cam0_x, cam0_y, cam0_a);
  cam(cam1_x, cam1_y, cam1_a);
  battery(batt_x, batt_y, batt_a);
  hat(hat_x, hat_y, hat_a);
  pcie(pcie_x, pcie_y, pcie_a);
  cm4(cm4_x, cm4_y, cm4_a);
}

// hdmi datum is center of bottom outside edge
module hdmi(x, y, a) {
  translate([x, y, 0]) rotate([0, 0, a])
    translate([-hdmi_w/2, 0, 0]) difference() {
      cube([hdmi_w, hdmi_l, hdmi_h]);
      translate([2,-1, 2]) 
        cube([hdmi_w-4, hdmi_l-4, hdmi_h-4]);
    }
}

// eth datum is center of bottom outside edge
module eth(x, y, a) {
  translate([x, y, 0]) rotate([0, 0, a])
    translate([-eth_w/2,0,0]) difference() {
      cube([eth_w, eth_l, eth_h]);
      translate([2,-1,2]) 
        cube([eth_w-4, eth_l-4, eth_h-4]);
  }
}

// usb datum is center of bottom outside edge
module usb(x, y, a) {
  translate([x, y, 0]) rotate([0, 0, a])
    translate([-usb_w/2,0,0]) difference() {
      cube([usb_w, usb_l, usb_h]);
      translate([2,-1,2])
        cube([usb_w-4, usb_l-4, usb_h-4]);
  }
}

// usbslave datum is center of bottom outside edge
module usbslave(x, y, a) {
  translate([x, y, 0]) rotate([0, 0, a])
    translate([-usbslv_w/2,0,0]) difference() {
      cube([usbslv_w, usbslv_l, usbslv_h]);
      translate([1,-1,1]) 
        cube([usbslv_w-2, usbslv_l-2, usbslv_h-2]);
  }
}

// sdcard datum is center of bottom outside edge
module sdcard(x, y, a) {
  translate([x, y, 0]) rotate([0, 0, a])
    translate([-sdcard_w/2,0,0]) difference() {
      cube([sdcard_w, sdcard_l, sdcard_h]);
      translate([0.03,-1,0.03])
        cube([sdcard_w-0.06, sdcard_l-2, sdcard_h-0.06]);
  }
}

// p12v datum is center of bottom outside edge
module p12v(x, y, a) {
  color("darkslategrey")
  translate([x, y, 0]) rotate([0, 0, a])
    translate([-p12v_w/2,0,0]) difference() {
      cube([p12v_w, p12v_l, p12v_h]);
      translate([p12v_w/2, p12v_l - 1, p12v_w/2])
        rotate([90, 0, 0])
          cylinder(r=p12v_w/2-1, h=p12v_l);
  }
}

// p5v datum is center of bottom outside edge
module p5v(x, y, a) {
  translate([x, y, 0]) rotate([0, 0, a])
    translate([-p5v_w/2, 0, 0]) difference() {
      cube([p5v_w, p5v_l, p5v_h]);
      translate([0.5,-1,0.5])
        cube([p5v_w-1, p5v_l-2, p5v_h-1]);
  }
}

// fan datum is center of bottom outside edge
module fan(x, y, a) {
  color("white")
  translate([x, y, 0]) rotate([0, 0, a])
    translate([-fan_w/2, 0, 0]) difference() {
      cube([fan_w, fan_l, fan_h]);
      translate([0.5,-1,0.5])
        cube([fan_w-1, fan_l-2, fan_h-1]);
  }
}

// j2 datum is center of bottom outside edge
module j2(x, y, a) {
  color("darkslategrey")
  translate([x, y, 0]) rotate([0, 0, a])
    translate([-j2_w/2, 0, 0]) difference() {
      cube([j2_w, j2_l, j2_h]);
      translate([0.5,-1,0.5])
        cube([j2_w-1, j2_l-2, j2_h-1]);
  }
}

// disp datum is center of bottom outside edge
module disp(x, y, a) {
  translate([x, y, 0]) rotate([0, 0, a])
    translate([-disp_w/2,0,0]) difference() {
      cube([disp_w, disp_l, disp_h]);
      translate([0.5,-1,0.5])
        cube([disp_w-1, disp_l-2, disp_h-1]);
  }
}

// cam datum is center of bottom outside edge
module cam(x, y, a) {
  translate([x, y, 0]) rotate([0, 0, a])
    translate([-cam_w/2,0,0]) difference() {
      cube([cam_w, cam_l, cam_h]);
      translate([0.5,-1, 0.5])
        cube([cam_w-1, cam_l-2, cam_h-1]);
  }
}

// battery datum is bottom center of battery
module battery(x, y, a) {
  color("silver")
  translate([x, y, 0])
    cylinder(r=batt_r, h=batt_h);
}

// hat datum is lower left corner
module hat(x, y, a) {
  color("darkslategrey")
  translate([x, y, 0]) rotate([0, 0, a])
    cube([hat_w, hat_l, hat_h]);
}

// pcie datum is lower left corner
module pcie(x, y, a) {
  color("darkslategrey")
  translate([x, y, 0]) rotate([0, 0, a])
    cube([pcie_w, pcie_l, pcie_h]);
}

// cm4 datum is lower left corner
module cm4(x, y, a) {
  translate([x + 3.5,
             y + 3.5,
             25.4/8]) {
    color("green")
      difference() {
        union() {
          linear_extrude(height = bd_h)
             minkowski() {
               square([cm4_w - 2 * bd_corner_r,
                       cm4_l - 2 * bd_corner_r]);
               circle(bd_corner_r);
             }
        }
        union() {
          translate([0, 0, -5]) cylinder(r=mh_r, h=10);
          translate([33, 0, -5]) cylinder(r=mh_r, h=10);
          translate([0, 48, -5]) cylinder(r=mh_r, h=10);
          translate([33, 48, -5]) cylinder(r=mh_r, h=10);
        }
      }
    chip_w = 12.5;
    chip_l = 12.5;
    chip_h = 1.5;
    color("silver")
      translate([(cm4_w-chip_w)/2 - bd_corner_r,
                 (cm4_l-chip_l)/2 - bd_corner_r,
                 bd_h])
        cube([chip_w, chip_l, chip_h]);
  }
}

/**********************************************************
 * Final assembly
 **********************************************************
 */

// Bare board
module cm4iov5() {
  board();
  connectors();
}

