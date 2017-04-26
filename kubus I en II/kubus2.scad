width=2400;
court_width=1100;
height=2400;
door_width=700;
door_height=2000;
loophole_height=80;
loophole_elevation=1700;
wall_thickness=80;


module kubus_ii(
    w=width,
    cw=court_width,
    h=height,
    dw=door_width,
    dh=door_height,
    lh=loophole_height,
    le=loophole_elevation,
    wt=wall_thickness,
){
    translate([-w/2,-w/2,0]) difference(){
        union(){
            difference(){
                translate([(w-cw)/2-wt,(w-cw)/2-wt,0]) cube([cw+2*wt,cw+2*wt,h]);
                translate([wt/-2,wt/-2,le]) cube([w+wt,w+wt,lh]);

            }
            difference() {
                cube([w,w,h]);
                translate([wt,wt,-wt]) cube([w-2*wt,w-2*wt,h]);
                translate([(w-dw)/2,-wt,-wt]) cube([dw,w+2*wt,dh+wt]);
                translate([-wt,(w-dw)/2,-wt]) cube([w+2*wt,dw,dh+wt]);
            }
        }
        translate([(w-cw)/2,(w-cw)/2,wt/-2]) cube([cw,cw,h+wt]);
    }
};

kubus_ii();