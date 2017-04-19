height=200;

module caster(h=height) {
    
    translate([-0.4*h,-0.4*h,49/50*h])
        cube([0.8*h,0.8*h,h/50]);

    translate([0,0,0.4*h])
        rotate([0,90,0])
            union(){
            cylinder(0.25*h,0.4*h,0.4*h,true);
            translate([0,0,-0.20*h])
                difference() {
                    linear_extrude(0.40*h)
                        polygon([[-0.6*h,0.375*h],[-0.6*h,-0.375*h],[h/10,h/-8],[h/10,h/8]]);
                    translate([-0.53*h,h/-2,h/20])
                        cube([h,h,0.3*h]);
                }
            cylinder(0.45*h,0.05*h,0.05*h,true);
            }
    
        
}
caster();