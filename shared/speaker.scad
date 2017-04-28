diameter=350;
$fa=4;

module speaker(d=diameter){
    
    module halfshell() {
        hull() {
            cylinder(d/4.5,0.95*r,0.2*r);
            translate([0,0,d/4.5-5*t]) rotate_extrude() translate([0.3*r,0,0]) circle(5*t);
        }
    }
    r=d/2;
    t=r/100;    r=d/2;
    t=r/100;
    
    module driver() {
        translate([0,0,d/4.5])
        union() {
            cylinder(d/10,0.12*d,0.12*d);
            translate([0,0,0.01*d]) cylinder(0.08*d,0.14*d,0.14*d);
        }
    }
    
    module conus() {
        translate([0,0,0.45*d]) {
            difference() {
           
            sphere(r/2);
            translate([0,0,0.020*d]) cube([r,r,r],true);
            }
           
        }
        difference() {
            cylinder(d/4.5,0.95*r,0.15*r);
            translate([0,0,-t]) cylinder(d/4.5,0.95*r,0.15*r);
        }
    }
    
    
    module shell() {
        difference() {
            union() {
                difference() {
                    cylinder(t,r,r);
                    translate([0,0,-t]) cylinder(t*3,0.95*r,0.95*r);
                    for(x=[0:11]) rotate([0,0,x*360/12]) translate([0.97*r,0,0]) cylinder(100,t,t);
                }  
                difference() {
                    halfshell();
                    translate([0,0,-t]) halfshell();
                }
            }
            for (x=[0:7]) {
                rotate([0,0,x*360/8]) translate([0,d/-3,0]) hull() {
                    translate([7*t,-6*t,-t]) cylinder(d,10*t,10*t);
                    translate([-7*t,-6*t,-t]) cylinder(d,10*t,10*t);
                    translate([d/35,0.10*d,-t]) cylinder(d,d/50,d/50);
                    translate([d/-35,d/10,-t]) cylinder(d,d/50,d/50);
                }
            }
        }
    }
    
    union()
    {
        conus();
        shell();
        driver();
    }

}

speaker();
