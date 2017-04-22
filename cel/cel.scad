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

use <../shared/hollow_chair.scad>
use <../shared/solid_chair.scad>

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
    cao=chair_armrest_overlap
){
    
    
    module chair_punch(){
        d=cwt/4;
        translate([d,-d,-d])    
        solid_chair(cw-2*d,ch,cd,cbt,cta,cse,csh-2*d,cso,cba,cwt,cab,cah,caw-2*d,cao-2*d);   
    } 
   
    hab= h-(d/2)/tan(90-rs);// height at back
    vrt=rt/cos(rs);
    fwh=hab+wt-tan(rs)*wt-vrt; // front wall height
    ibh=hab+tan(rs)*wt-vrt; // inner back height
    
    ctw= cw+2*(caw-cao);
    echo(ctw);
 
   module box() { 
    translate([w/2,d/2,0])
    rotate([90,0,-90])
    union(){
    linear_extrude(w)
    union() {
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
    
   translate([0,0,(w-wt)/2])
       linear_extrude(wt) {
           union(){
               polygon([
                   [d/2-wt,fwh-rt/8],
                   [d/2,fwh-rt/8],
                   [d/2,h-wt+rt/8],
                   [d/2-wt, h-wt+rt/8]
               ]);
               polygon([
                   [d-wt,fwh-rt/8],
                   [d,fwh-rt/8],
                   [d,h-wt+rt/8],
                   [d-wt, h-wt+rt/8]
               ]);
           }
       }     
   linear_extrude(wt)
        polygon([[0,0],[d,0],[d,h],[d/2,hab],[d/2,h],[0,hab]]);
   translate([0,0,w-wt])
        linear_extrude(wt)
        polygon([[0,0],[d,0],[d,h],[d/2,hab],[d/2,h],[0,hab]]);
    }
}
 union() {
difference(){
        box();
    translate([-w/2,ctw/2,0])
    rotate([0,0,-90])
    chair_punch();
}
    translate([-w/2,ctw/2,0])
    rotate([0,0,-90])
hollow_chair(cw,ch,cd,cbt,cta,cse,csh,cso,cba,cwt,cab,cah,caw,cao);
}
}
cel();