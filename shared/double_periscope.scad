width=200;
height=120;
gap=100;
diameter=20;
wall_thickness=1;

use <periscope.scad>

module double_periscope(
    w=width,
    h=height,
    g=gap,
    d=diameter,
    t=wall_thickness
){
    module half(r) {
        rotate([0,0,r])
        translate([0,(w-d)/2,0])
            periscope(d,w/2-d+t,0,(w-g)/2-d,0,h,t,0);
    }
    
    union() {
        half(90);
        half(270); 
    }
}

double_periscope();
