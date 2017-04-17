diameter=20;
top_hl=5;
bottom_hl=2;
height=60;
wall_thickness=1;
twist=180;

use <periscope_knee.scad>

module periscope(d=diameter,th=top_hl,bh=bottom_hl,h=height,w=wall_thickness,t=twist) {
    translate([0,0,h/2])
    union() {
        periscope_knee(d,bh,(h/2)-d,w);
        translate([0,0,-w])
            rotate([0,180,t])
                periscope_knee(d,th,((h/2)-d)+w,w);
    }
}

periscope();