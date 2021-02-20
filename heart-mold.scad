radius = 17.0;

module heart_sub_component(radius) {
    rotated_angle = 45;
    diameter = radius * 2;
    $fn = 48;

    translate([-radius * cos(rotated_angle), 0, 0]) 
        rotate(-rotated_angle) union() {
            circle(radius);
            translate([0, -radius, 0]) 
                square(diameter);
        }
}

module heart(radius) {
    center_offset_y = 1.5 * radius * sin(45) - 0.5 * radius;

    translate([0, center_offset_y, 0]) union() {
        heart_sub_component(radius);
        mirror([1, 0, 0]) heart_sub_component(radius);
    }
}

difference() {
    linear_extrude(height=60) {
        heart(radius);
    }

    translate([0, 0, 2.54]) {
        linear_extrude(height=80) {
            heart(radius - 1.5);
        }
    }
}