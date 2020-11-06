/* fillets.scad
 * Contains modules for a variety of fillets.
 *   round_fillet()
 *   straight_fillet()
 *   corner_fillet()
 *   inside_corner_fillet()
 *   
 * Created: 16 Aug 2019
 * Edited: 16 Aug 2019
 * Author: Ray Depew
 */

// $fn = 50;

// Creates a circular fillet, whose base is centered at (0,0).
// r1 is the radius of the fillet.
// r2 is the radius of the cylinder.
// r2 is usually smaller than r1.
// If r2 is negative, draws an inside fillet.
// Optional theta draws only a pie-slice of the fillet.
module round_fillet(r1, r2, theta=360) {
  rotate_extrude(angle=theta, convexity = 10)
  translate([r2, 0, 0])
  intersection() {
    square(2*r1);
    difference() {
      square(2*r1, center=true);
      translate([r1, r1]) circle(r1);
    }
  }
}

// Draws a straight fillet.
// r is the fillet radius.
// l is the fillet length.
// The x-axis is the edge of the fillet,
// and the fillet opens to +x, +y.
// (0,0) is the center of the fillet.
module straight_fillet(r, l) {
  translate([l/2, 0, 0]) rotate([0,-90,0])
  linear_extrude(l) {
    intersection() {
      square(2*r);
      difference() {
        square(2*r, center=true);
        translate([r, r]) circle(r);
      }
    }
  }
}

// Draws a 90-degree segment of a fillet,
// for example on the corner of a cube.
// Fillet is drawn on the x-y plane.
// (0,0) is the the corner's edge.
module corner_fillet(r) {
  round_fillet(r, 0, 90);
}

// Draws a 90x90x90 degree fillet
// for the inside corner of a cube.
// (0,0,0) is the vertex of the corner.
// Fillet opens out to +x, +y, +z.
module inside_corner_fillet(r) {
  difference() {
    cube(r);
    translate([r,r,r]) sphere(r); }
}

// HINT: If you only want an inside corner fillet 
// on 2 edges, then use straight_fillet() on the two
// edges instead of using inside_corner_fillet().


/******** DEMO **********/

// This is for demo purposes only. If you use 'use' instead of
// 'include' to import fillet into your program, this part will be 
// discarded. It's like Python's 'if __name__ == __main__' thing.
translate([0,40,0]) {
  difference() {
    cylinder(r=5, h=10);
    translate([0,0,-1]) cylinder(r=2.5, h=12);
  }
  round_fillet(2.5, 5);
}

translate([20,40,0]) round_fillet(2.5, -5);
translate([0,20,0]) corner_fillet(5);
translate([20,20,0]) inside_corner_fillet(5);
translate([10,0,0]) straight_fillet(5,20);
