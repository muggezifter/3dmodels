length=500;

module tl_armature(l=length) {
    //cylinder(length,17,17);
    cube([45,30,10]);
    union() {
    cube([36,36,12]);
    translate([18,36,0]) cylinder(12,18,18);
    }
}

tl_armature();
