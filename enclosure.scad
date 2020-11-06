/* Enclosure CM4 IO board, Rev 5b
 * Author: Ray Depew
 * Date: 5 Nov 2020
 */

// All dimensions are in mm, NOT inches.

// Variables

/* Notation:
 * _x, _x1, _x2 are location values from datum 0.
 * _y, _y1, _y2 are location values from datum 0.
 * _z, _z1, _z2 are location values from datum 0.
 *
 * Datum 0 is the bottom lower-left vertex of the box.
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

$fn=50;
include <dimensions.scad>
use <cm4iov5.scad>
use <fillets.scad>
fr = 2.5; // fillet radius in mm

/**********************************************************
 * Pieces and features
 **********************************************************
 */
module mounting_stud() {
  difference() {
    cylinder(r=stud_r, h=stud_h);
    cylinder(r=3, h=stud_h+1);
  }
  round_fillet(fr, stud_r);
}

/**********************************************************
 * Enclosure bottom
 **********************************************************
 */
module bottom() {
  color("red")
  difference () {
    // The box body
    union() {
      // Hollowed-out part of the box
      difference() {
        minkowski() {
          cube([bd_w, bd_l, box_h]);
          sphere(r=box_edge_r);
        }
        // Chop off top of box
        translate([-5,-5,box_h])
          cube([box_w, box_l, box_h]);
        // Hollow out the inside
        translate([bd_corner_r/2, bd_corner_r/2, bd_corner_r/2])
        minkowski() {
          cube([bd_w-bd_corner_r, bd_l-bd_corner_r, box_h+2]);
          sphere(bd_corner_r/2);
        }
        // TODO: Channel for lid
      }
      // Mounting studs go here
      // Use mounting holes 2, 3, 4, 5, 6.
      translate([mh2_x, mh2_y, 0])
        mounting_stud();
      translate([mh3_x, mh3_y, 0])
        mounting_stud();
      translate([mh4_x, mh4_y, 0])
        mounting_stud();
      translate([mh5_x, mh5_y, 0])
        mounting_stud();
      translate([mh6_x, mh6_y, 0])
        mounting_stud();
      // test blocks go here
    } // box-body union
    // Cutouts
    union() { 
      translate([hdmi0_x - hdmi_w/2, hdmi0_y-6, bd_top])
        cube([hdmi_w, 12, box_h]);
      translate([hdmi1_x - hdmi_w/2, hdmi1_y-6, bd_top])
        cube([hdmi_w, 12, box_h]);
      translate([eth_x-eth_w/2, eth_y-6, bd_top])
        cube([eth_w, 12, box_h]);
      translate([usb_x-usb_w/2, usb_y-6, bd_top])
        cube([usb_w, 12, box_h]);
      translate([usbslv_x-usbslv_w/2, usbslv_y-6, bd_top])
        cube([usbslv_w, 12, box_h]);
      translate([sdcard_x-sdcard_w/2, sdcard_y-6, bd_top])
        cube([sdcard_w, 12, box_h]);
      translate([p12v_x-p12v_w/2, p12v_y-6, bd_top])
        cube([p12v_w, 12, box_h]);
      translate([p5v_x-p5v_w/2, p5v_y-6, bd_top])
        cube([p5v_w, 12, box_h]);
      translate([j2_x-j2_w/2, j2_y-6, bd_top])
        cube([j2_w, 12, box_h]);
      translate([j2_x-j2_w/2, j2_y-6, bd_top])
        cube([j2_w, 12, box_h]);
      translate([disp0_x-disp_w/2, disp0_y-6, bd_top])
        cube([disp_w, 12, box_h]);
      translate([disp1_x-disp_w/2, disp1_y-6, bd_top])
        cube([disp_w, 12, box_h]);
      translate([cam1_x-cam_w/2, cam1_y-6, bd_top])
        cube([cam_w, 12, box_h]);
      translate([cam0_x-6, cam0_y-cam_w/2, bd_top])
        cube([12, cam_w, box_h]);
      translate([batt_x-batt_r-8, batt_y-batt_r, bd_top-0.5])
        cube([12, batt_w, box_h]);
    } // cutouts union
    translate([box_w/2, box_l/2, -10])
      cylinder(r=20, h=20);
  } // difference
}

/**********************************************************
 * Enclosure top
 **********************************************************
 */

module top() {
  color("yellow", alpha=0.5)
  difference () {
    // The lid body
    union() {
      // Hollowed-out part of the lid
      difference() {
        minkowski() {
          cube([bd_w, bd_l, lid_h]);
          sphere(r=lid_edge_r);
        }
        // Chop off bottom of lid
        translate([-5,-5,-lid_h])
          cube([lid_w, lid_l, lid_h]);
        // Hollow out the inside
        translate([bd_corner_r/2, bd_corner_r/2, -bd_corner_r/2])
        minkowski() {
          cube([bd_w-bd_corner_r, bd_l-bd_corner_r, lid_h+2]);
          sphere(bd_corner_r/2);
        }
        // TODO: Channel for lid
      }
      // Mounting studs go here
      // Use mounting holes 2, 3, 4, 5, 6.
      translate([mh2_x, mh2_y, 0])
        mounting_stud();
      translate([mh3_x, mh3_y, 0])
        mounting_stud();
      translate([mh4_x, mh4_y, 0])
        mounting_stud();
      translate([mh5_x, mh5_y, 0])
        mounting_stud();
      translate([mh6_x, mh6_y, 0])
        mounting_stud();
      // test blocks go here
    } // lid-body union
    // Cutouts
    union() { 
      translate([hdmi0_x - hdmi_w/2, hdmi0_y-6, bd_top])
        cube([hdmi_w, 12, lid_h]);
      translate([hdmi1_x - hdmi_w/2, hdmi1_y-6, bd_top])
        cube([hdmi_w, 12, lid_h]);
      translate([eth_x-eth_w/2, eth_y-6, bd_top])
        cube([eth_w, 12, lid_h]);
      translate([usb_x-usb_w/2, usb_y-6, bd_top])
        cube([usb_w, 12, lid_h]);
      translate([usbslv_x-usbslv_w/2, usbslv_y-6, bd_top])
        cube([usbslv_w, 12, lid_h]);
      translate([sdcard_x-sdcard_w/2, sdcard_y-6, bd_top])
        cube([sdcard_w, 12, lid_h]);
      translate([p12v_x-p12v_w/2, p12v_y-6, bd_top])
        cube([p12v_w, 12, lid_h]);
      translate([p5v_x-p5v_w/2, p5v_y-6, bd_top])
        cube([p5v_w, 12, lid_h]);
      translate([j2_x-j2_w/2, j2_y-6, bd_top])
        cube([j2_w, 12, lid_h]);
      translate([j2_x-j2_w/2, j2_y-6, bd_top])
        cube([j2_w, 12, lid_h]);
      translate([disp0_x-disp_w/2, disp0_y-6, bd_top])
        cube([disp_w, 12, lid_h]);
      translate([disp1_x-disp_w/2, disp1_y-6, bd_top])
        cube([disp_w, 12, lid_h]);
      translate([cam1_x-cam_w/2, cam1_y-6, bd_top])
        cube([cam_w, 12, lid_h]);
      translate([cam0_x-6, cam0_y-cam_w/2, bd_top])
        cube([12, cam_w, lid_h]);
      translate([batt_x-batt_r-8, batt_y-batt_r, bd_top-0.5])
        cube([12, batt_w, lid_h]);
    } // cutouts union
    translate([lid_w/2, lid_l/2, -10])
      cylinder(r=20, h=40);
  } // difference
}

/**********************************************************
 * Final assembly
 **********************************************************
 */

// Exploded view
// translate([0, 0, 80]) cm4iov5();
translate([0, 0, bd_top]) cm4iov5();
translate([0, 0, 0]) bottom();
translate([0, 0, box_h]) top();



