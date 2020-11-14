/* 40x40x10mm fan
 * Author: Ray Depew
 * Date: 13 Nov 2020
 */

// All dimensions are in mm, NOT inches.

// Variables

/* Notation:
 * _x, _x1, _x2 are location values from datum 0.
 * _y, _y1, _y2 are location values from datum 0.
 * _z, _z1, _z2 are location values from datum 0.
 *
 * Datum 0 is the bottom lower-left vertex of the fan, 
 * with the fan laying flat, and airflow up or down..
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
fr = 2.5; // fillet radius in mm

lw = 40;
fan_body_h = 10.4;
fan_corner_r = 4;
hole_offset = 4;
hole_d = 3.5;
hole_r = hole_d / 2;
end_thk = 1.2;
hub_r = 8;
fan_r = 16;

module cool_webbing() {
  x = 2;
  translate([hub_r - x, lw/2, fan_body_h - end_thk])
    rotate_extrude(angle = 70)
      translate([20, 0, 0])
        square([x, end_thk]);
}

module body() {
  difference() {
    union() {
      // end caps
      translate([fan_corner_r, fan_corner_r, fan_body_h - end_thk])
      linear_extrude(height = end_thk)
        minkowski() {
          square(lw - 2 * fan_corner_r);
          circle(fan_corner_r);
        }
      translate([fan_corner_r, fan_corner_r, 0])
      linear_extrude(height = end_thk)
        minkowski() {
          square(lw - 2 * fan_corner_r);
          circle(fan_corner_r);
        }
      // body
      translate([lw/2, lw/2, 0]) cylinder(r = lw/2, h = fan_body_h);
      // mounts
      translate([hole_offset, hole_offset, 0]) cylinder(r = hole_r, h = fan_body_h);
      translate([hole_offset, lw - hole_offset, 0]) cylinder(r = hole_d, h = fan_body_h);
      translate([lw - hole_offset, hole_offset, 0]) cylinder(r = hole_d, h = fan_body_h);
      translate([lw - hole_offset, lw - hole_offset, 0]) cylinder(r = hole_d, h = fan_body_h);
    } // body additive union
    // Main cavity
    translate([lw/2, lw/2, -1]) cylinder(r = lw/2 - 1, h = fan_body_h + 2);
    // mounting holes
    translate([hole_offset, hole_offset, -1]) cylinder(r = hole_d/2, h = fan_body_h + 2);
    translate([hole_offset, lw - hole_offset, -1]) cylinder(r = hole_d/2, h = fan_body_h + 2);
    translate([lw - hole_offset, hole_offset, -1]) cylinder(r = hole_d/2, h = fan_body_h + 2);
    translate([lw - hole_offset, lw - hole_offset, -1]) cylinder(r = hole_d/2, h = fan_body_h + 2);
  }
  // nameplate
  translate([lw/2, lw/2, fan_body_h - end_thk]) cylinder(r= hub_r, h=end_thk);
  // the cool webbing
  intersection() {
    union() {
      cool_webbing();
      translate([lw, 0, 0]) rotate([0, 0, 90]) cool_webbing();
      translate([lw, lw, 0]) rotate([0, 0, 180]) cool_webbing();
      translate([0, lw, 0]) rotate([0, 0, 270]) cool_webbing();
    }
    cube([lw, lw, fan_body_h]);
  }
}

module blade(theta) {
  translate([lw/2, lw/2, (fan_body_h - end_thk)/2]) rotate([0, 0, theta])
    linear_extrude(height = fan_body_h - 4* end_thk, center = true, convexity = 10,
              twist = 51.42, slices = 40, scale = 1.0)
      translate([hub_r - 2, 0, 0])
        /* square([fan_r - hub_r, 0.5]); */
        hull() {
          square([0.2, 0.2]);
          translate([fan_r - 5, 0, 0]) circle(r=0.2);
        }
}

module hub() {
  translate([lw/2, lw/2, end_thk])
    minkowski() {
      cylinder(r = hub_r - end_thk, h = fan_body_h - 3 * end_thk);
      /* cylinder(r = hub_r - 2 * hole_d, h = fan_body_h - end_thk - 2 * hole_d); */
      sphere(r = end_thk);
    }
}

module fan() {
  hub();
  for( i = [ 0 : 6 ] ) 
      blade(i * 51.42);
}

/* Main */

module 40mmfan() {
  color("tan") body();
  color("brown") fan();
  /* color("white", alpha=0.3) cube([lw, lw, fan_body_h]); */
}
