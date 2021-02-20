// Wick Holder.scad - Wick holder for up to six wicks in a candle mold

IN_TO_MM = 25.4;

CONTAINER_DIA = 3.25 * IN_TO_MM;
OVERHANG_WIDTH = 0.125 * IN_TO_MM;
OVERHANG_THICKNESS = 0.125 * IN_TO_MM;
INNER_DIA = 1.50 * IN_TO_MM;

WICK_HOLE_DISTANCE = 1.25  * IN_TO_MM;
WICK_HOLE_DIA = 0.375 / 2 * IN_TO_MM;
WICK_SLOT_WIDTH = 0.0625 * IN_TO_MM;
WICK_SLOT_LENGTH = 0.4 * IN_TO_MM;

VIEW_HOLE_DIA = 0.670 / 2 * IN_TO_MM;

POLY_N = 80;

difference() {
    cylinder(0.375  * IN_TO_MM, (CONTAINER_DIA / 2) + OVERHANG_WIDTH, (CONTAINER_DIA / 2) + OVERHANG_WIDTH, $fn=POLY_N);
    translate([0, 0, OVERHANG_THICKNESS]) {
        cylinder((2  * IN_TO_MM) + OVERHANG_THICKNESS, CONTAINER_DIA / 2, CONTAINER_DIA / 2, $fn=POLY_N);
    }

    translate([0, 0, -0.1]) {
        cylinder(3 * IN_TO_MM, INNER_DIA / 2, INNER_DIA / 2, $fn=POLY_N);
    }

    for (dy=[0:60:360]) {
        rotate([0, 0, dy]) {
            translate([0, WICK_HOLE_DISTANCE, -1]) {
                cylinder(4 * IN_TO_MM, WICK_HOLE_DIA, WICK_HOLE_DIA, $fn=POLY_N);
                
                translate([-(WICK_SLOT_WIDTH / 2), -WICK_SLOT_LENGTH, 0]) {
                    cube([WICK_SLOT_WIDTH, WICK_SLOT_LENGTH, 4 * IN_TO_MM]);
                }
            }
        }
    }
    
    for (dy=[30:60:360]) {
        rotate([0, 0, dy]) {
            translate([0, WICK_HOLE_DISTANCE, -1]) {
                cylinder(4 * IN_TO_MM, VIEW_HOLE_DIA, VIEW_HOLE_DIA, $fn=POLY_N);
            }
        }
    }
}