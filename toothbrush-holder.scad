// Toothbrush Holder.scad - Bathroom Toothbrush holder

IN_TO_MM = 25.4;

POLY_N = 80;

module support_post(height, back_width) {
    translate([0, 0, -height]) {
        difference() {
            cube([0.5  * IN_TO_MM, 1 * IN_TO_MM, height]);
            
            translate([-0.05  * IN_TO_MM, (0.375 * IN_TO_MM)/2 + back_width, -0.01]) {
                cube([0.6  * IN_TO_MM, (0.625 * IN_TO_MM) - back_width, 0.3 * IN_TO_MM]);
            }
        }
    }
}

module side() {
    support_post(2.00 * IN_TO_MM, 0 * IN_TO_MM);
    translate([0 * IN_TO_MM, 1 * IN_TO_MM, 0 * IN_TO_MM]) support_post(1.50 * IN_TO_MM, -0.25 * IN_TO_MM);
    translate([0 * IN_TO_MM, 2 * IN_TO_MM, 0 * IN_TO_MM]) support_post(1.00 * IN_TO_MM, -0.25 * IN_TO_MM);
}

rotate([180, 0, 0 ]) {
    translate([-2 * IN_TO_MM, -1.5 * IN_TO_MM, 0 * IN_TO_MM]) {
        cube([3.25 * IN_TO_MM, 3 * IN_TO_MM, 0.25 * IN_TO_MM]);
    
        side();
        translate([2.75 * IN_TO_MM, 0 * IN_TO_MM, 0 * IN_TO_MM]) side();
    }
}
