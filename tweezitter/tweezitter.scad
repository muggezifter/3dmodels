cabin_width=1800;
cabin_depth=800;
cabin_height=1800;
cabin_wall_thickness=20;
cabin_bottom_thickness=30;
cabin_roof_slope=30;
seat_width=400;
seat_depth=400;
seat_thickness=30;
seat_elevation=600;
periscopes_width=2800;
periscopes_height=1300;
periscopes_diameter=350;
periscopes_wall_thickness=15;
periscopes_elevation=800;


// initial camera distance, rotation and translation
$vpd=10000;
$vpr=[75,0,315];
$vpt=[0,0,1000];

use <../shared/double_periscope.scad>

module tweezitter(
    cw=cabin_width,
    cd=cabin_depth,
    ch=cabin_height,
    cwt=cabin_wall_thickness,
    cbt=cabin_bottom_thickness,
    crf=cabin_roof_slope,
    sw=seat_width,
    sd=seat_depth,
    st=seat_thickness,
    se=seat_elevation,
    pw=periscopes_width,
    ph=periscopes_height,
    pd=periscopes_diameter,
    pwt=periscopes_wall_thickness,
    pe=periscopes_elevation,
){
    module halfcabin() {
        module roof() {
            rotate([0,0,-crf])
            translate([-cwt,0,0])
            cube([2*cwt,1.6*cd,(cw+cwt)/2-cwt/4]);
        }
        
        module box() {      
            difference(){
                cube([ch,cd,(cw+cwt)/2-cwt/4]);
                translate([-cbt,-cwt,cwt-cwt/4])
                    cube([ch,cd,(cw+cwt)/2-2*cwt]);
            }
        }
        
        module slicers() {
            union() {
                // front slicer
                translate([-cw/2,-0.999*cw,-cwt])
                    cube([2*cw,cw,cw]);
                // top slicer
                rotate([0,0,-crf])
                    translate([-cw,-cwt,-cwt])
                        cube([cw,cw,cw]);
                // back slicer
                translate([-cw/8,cd-0.001*cw,-cwt])
                cube([cw*2,cw,cw]);
            }
        } 
   
        rotate([0,90,0])
            translate([-cw,-cd/2,cwt/-4])
                difference() {
                    union() {
                        roof();
                        box();
                    }
                    slicers();
                }
    }

    module periscopes() {
        translate([0,0,pe])
        double_periscope(pw,ph,cw,pd,pwt);
    }
    module seat() {
        translate([0,0,se+st/2])
        cube([2*sd+cwt,sw,st],true);
    }
    
    module punch() {
        translate([cw/4,pd/-2+pwt,pe+pwt])
        cube([cw/2,pd-2*pwt,pd-2*pwt]);
    }
    
    difference() {
        union() {
            difference() {
                halfcabin();
                punch();
            }
            rotate([0,0,180])
                difference() {
                    halfcabin();
                    punch();
                }
            seat();
            periscopes();
            }
        }
}

tweezitter();