width=1800;
depth=1800;
height=2200;
roof_slope=30;
wall_thickness=50;
roof_thickness=20;
floor_thickness=30;

chair_width=500;
chair_height=750;
chair_depth=600;
chair_back_top=100;
chair_top_angle=80;
chair_seat_elevation=400;
chair_seat_height=100;
chair_seat_overhang=30;
chair_bottom_angle=80;
chair_wall_thickness=15;
chair_armrest_bool=true;
chair_armrest_height=550;
chair_armrest_width=120;
chair_armrest_overlap=50;

table_width=1000;
table_depth=600;
table_height=50;
table_top_elevation=800;
table_top_wall_thickness=15;
table_leg_wall_thickness=8;
table_leg_diameter=50;
table_overhang=100;

ladder_width=400;
ladder_height=1800;
ladder_depth=300;
ladder_rod_diameter=40;
ladder_elevation=200;
ladder_inside_steps=[750,1000,1250]; // top
ladder_outside_steps=[500,750,1000,1250]; // top
ladder_supports=[700,1300]; // top
ladder_out_of_center=240;

use <../shared/hollow_chair.scad>
use <../shared/solid_chair.scad>
use <../shared/double_step.scad>

// initial camera distance, rotation and translation
$vpd=10000;
$vpr=[73,0,-45];
$vpt=[0,0,1000];
//
module cel(
    w=width,
    d=depth,
    h=height,
    rs=roof_slope,
    wt=wall_thickness,
    rt=roof_thickness,
    ft=floor_thickness,
    
    cw=chair_width,
    ch=chair_height,
    cd=chair_depth,
    cbt=chair_back_top,
    cta=chair_top_angle,
    cse=chair_seat_elevation,
    csh=chair_seat_height,
    cso=chair_seat_overhang,
    cba=chair_bottom_angle,
    cwt=chair_wall_thickness,
    cab=chair_armrest_bool,
    cah=chair_armrest_height,
    caw=chair_armrest_width,
    cao=chair_armrest_overlap,
    
    tw=table_width,
    td=table_depth,
    th=table_height,
    te=table_top_elevation,
    twt=table_top_wall_thickness,
    tlwt=table_leg_wall_thickness,
    tld=table_leg_diameter,
    to=table_overhang,
    
    lw=ladder_width,
    lh=ladder_height,
    ld=ladder_depth,
    lrd=ladder_rod_diameter,
    loe=ladder_elevation,
    lis=ladder_inside_steps,
    los=ladder_outside_steps,
    ls=ladder_supports,
    loc=ladder_out_of_center,
){
    hab=h-(d/2)/tan(90-rs); // height at back
    vrt=rt/cos(rs); // vertical roof thickness
    fwh=hab+wt-tan(rs)*wt-vrt; // front wall height
    ibh=hab+tan(rs)*wt-vrt; // inner back height
    ctw= cw+2*(caw-cao); // chair total width
    
    module chair() {
        translate([-w/2,ctw/2,0])
            rotate([0,0,-90])
                hollow_chair(cw,ch,cd,cbt,cta,cse,csh,cso,cba,cwt,cab,cah,caw,cao);
    }
    
    module chair_punch(){
        d=cwt/4;
        translate([-w/2,ctw/2,0])
            rotate([0,0,-90])
                translate([d,-d,-d])    
                    solid_chair(cw-2*d,ch,cd,cbt,cta,cse,csh-2*d,cso,cba,cwt,cab,cah,caw-2*d,cao-2*d);   
    } 

    module box() { 
        translate([w/2,d/2,0])
            rotate([90,0,-90])
                union(){
                    linear_extrude(height=w,convexity=10)
                        union() {
                            // front wall, bottom, back wall, back roof
                            polygon([
                                [0,0],
                                [d,0],
                                [d,fwh],
                                [d-wt,fwh],
                                [d-wt,ft],
                                [wt,ft],
                                [wt,ibh],
                                [d/2-wt,h-tan(rs)*wt-vrt],
                                [d/2-wt,h-wt],
                                [d/2,h-wt],
                                [d/2,h],
                                [0,hab]
                            ]);
                            // front roof
                            polygon([
                                [d/2-wt,hab-tan(rs)*wt-vrt],
                                [d-wt,h-tan(rs)*wt],
                                [d-wt,h-wt],
                                [d,h-wt],
                                [d,h],
                                [d/2,hab],
                                [d/2,fwh],
                                [d/2-wt,fwh]
                            ]);
                       }
    
        // mullions             
        translate([0,0,(w-wt)/2])
            linear_extrude(height=wt) {
                union(){
                    // back
                    polygon([
                        [d/2-wt,fwh-rt/8],
                        [d/2,fwh-rt/8],
                        [d/2,h-wt+rt/8],
                        [d/2-wt, h-wt+rt/8]
                    ]);
                    // front
                    polygon([
                        [d-wt,fwh-rt/8],
                        [d,fwh-rt/8],
                        [d,h-wt+rt/8],
                        [d-wt, h-wt+rt/8]
                    ]);
                }
            }   
        // right wall   
        linear_extrude(height=wt)
            polygon([[0,0],[d,0],[d,h],[d/2,hab],[d/2,h],[0,hab]]);
        // left wall
        translate([0,0,w-wt])   
            linear_extrude(height=wt)
                polygon([[0,0],[d,0],[d,h],[d/2,hab],[d/2,h],[0,hab]]);
        }
    }

    module table() {
        union(){
            // table top
            translate([w/2-tw,d/2-td,te-th])               
                cube([tw,td,th]);
            // table leg
            translate([w/2-tw+to,d/2-td+to,0])
                cube([tld,tld,te-th+tlwt/2]);
        }
    }
    
    module table_punch() {
        union(){
            // table top
            translate([twt+w/2-tw,twt+d/2-td,twt+te-th])
                cube([tw,td,th-2*twt]);
            // table leg
            translate([w/2-tw+to+tlwt,d/2-td+to+tlwt,-tlwt/4])
                cube([tld-2*tlwt,tld-2*tlwt,te-th+tlwt/2]);
        }
    }  
    
    module ladder() {
        translate([loc+lw/2,wt-d/2,0])
        rotate([0,0,180])
        double_step(lw,lh,ld,lrd,loe,lis,los,ls);
    }
    
    union() {
        difference(){
            union() {
                box();
                table();
                ladder();
            }

            chair_punch();
            table_punch();
        }
        chair();
    }
}

//difference() {
    cel();
    //translate([0,0,height])
    //cube([height,height,height],true);
//}
