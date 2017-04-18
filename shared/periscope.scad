diameter=20;
top_horizontal_tube_length=5;
top_flange=6;
bottom_horizontal_tube_length=2;
bottom_flange=3;
height=60;
wall_thickness=1;
twist=180;

use <half_periscope.scad>

module periscope(
    d=diameter,
    th=top_horizontal_tube_length,
    tf=top_flange,
    bh=bottom_horizontal_tube_length,
    bf=bottom_flange,
    h=height,
    w=wall_thickness,
    t=twist
) {
    translate([0,0,h/2])
    union() {
        half_periscope(d,bh,(h/2)-d,w,bf);
        translate([0,0,-w])
            rotate([0,180,t])
                half_periscope(d,th,((h/2)-d)+w,w,tf);
    }
}

periscope();