length=800;

module tl_armature(l=length) {
    rotate([-90,0,0]) translate([0,0,-l/2]) union() {
        translate([0,56,2.5]) cylinder(l-5,17,17);
        translate([0,0,50]) rotate([-90,0,0]) cylinder(36,10,10);
        translate([-22.5,0,0]) union() {
            translate([0,0,2]) hull() {
                translate([0,0,2]) cube([45,33,l-8]);
                translate([-5,0,-2]) cube([55,5,l]);
            }
            translate([4.5,10,l-14]) union() {
                cube([36,46,12]);
                translate([18,46,0]) cylinder(12,18,18);
            }
            translate([4.5,10,2]) union() {
                cube([36,46,12]);
                translate([18,46,0]) cylinder(12,18,18);
            }
        }
    }
}

tl_armature();
