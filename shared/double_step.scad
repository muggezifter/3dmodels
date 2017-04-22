ladder_width=400;
ladder_height=1400;
ladder_depth=400;
ladder_rod_diameter=40;
ladder_elevation=200;
ladder_inside_steps=[230,430,630,830]; // top
ladder_outside_steps=[500,700,900]; // top
ladder_supports=[600,1000]; // top


// initial camera distance, rotation and translation

//
module double_step(
    lw=ladder_width,
    lh=ladder_height,
    ld=ladder_depth,
    lrd=ladder_rod_diameter,
    loe=ladder_elevation,
    lis=ladder_inside_steps,
    los=ladder_outside_steps,
    ls=ladder_supports
){
    module post() {
        linear_extrude(lrd)
            difference(){
                union() {
                polygon([[0,0],[ld/2,0],[ld/2,loe+ld/2],[ld,loe+ld/2],[ld,lh-ld/2],[0,lh-ld/2]]);
                translate([ld/2,lh-ld/2])
                    circle(ld/2);
                translate([ld/2,loe+ld/2])
                    circle(ld/2);
                }
                union() {
                polygon([[lrd,0],[lrd+ld/2,0],[lrd+ld/2,loe+ld/2],[ld-lrd,loe+ld/2],[ld-lrd,lh-ld/2],[lrd,lh-ld/2]]);
                translate([ld/2,lh-ld/2])
                    circle(ld/2-lrd);
                translate([ld/2,loe+ld/2])
                    circle(ld/2-lrd);
                }
            }
        }
    
    translate([-lw/2,-ld/2])
    rotate([90,0,90])
    union(){   
        for (i=lis) {
            translate([0,i-lrd,0])
            cube([lrd,lrd,lw]);
        }
        for (i=los) {
            translate([ld-lrd,i-lrd,0])
            cube([lrd,lrd,lw]);
        }   
        for (i=ls) {
            translate([0,i-1.5*lrd,0])
                cube([ld,1.5*lrd,lrd]);
            translate([0,i-1.5*lrd,lw-lrd])
                cube([ld,1.5*lrd,lrd]);
        }
        post();
        translate([0,0,lw-lrd])
            post();
    }

}

double_step();
