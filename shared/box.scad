width =100;
depth =50;
height=200;
wall_thickness=1;

module box(w=width,d=depth,h=height,t=wall_thickness) {
    translate([0,0,h/2])
        difference() {
            cube([w,d,h],true);
            cube([w-2*t,d-2*t,h-2*t],true);
        }
}

box();