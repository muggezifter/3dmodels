height=200;
rotation=0;

module pivoting_caster(h=height, r=rotation) {
    
    translate([-0.4*h,-0.4*h,49/50*h])
        cube([0.8*h,0.8*h,h/50]);
    translate([0,0,0.9*h])
        cylinder(h/10,0.3*h,0.3*h);
    translate([0,0,0.4*h])
    rotate([0,0,r])
        translate([0,-55,0])
            rotate([0,90,0])
                union(){
                cylinder(0.25*h,0.4*h,0.4*h,true);
            translate([0,0,-0.20*h])
                difference() {
                    linear_extrude(0.40*h)
                        polygon([[h/-2,h/2],[h/-2,h/20],[h/10,h/-6],[h/10,h/10]]);
                    translate([-0.45*h,h/-2,h/20])
                        cube([h,h,0.3*h]);
                }
                cylinder(0.45*h,0.05*h,0.05*h,true);
                }       
}
    
    /*
        difference() {
                linear_extrude(0.4*h)
                    polygon([[h/-2,h/2],[h/-2,h/20],[h/10,h/-6],[h/10,h/10]]);
                translate([-0.45*h,h/-2,h/20])
                    cube([h,h,0.3*h]);
        }
}*/
pivoting_caster();