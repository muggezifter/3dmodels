door_width=65;
door_height=180;
door_thickness=4;
doorpost_width=5;
doorpost_inner_width=62;
doorpost_depth=7;
doorpost_protrude=1;
treshold_height=1;
door_open_angle=60;
doorhandle_size=12;

$vpt=([0,0,door_height/2]);

use <../../shared/doorhandle.scad>

module door(dw=door_width,
    dh=door_height,
    dt=door_thickness,
    dpw=doorpost_width,
    dpiw=doorpost_inner_width,
    dpd=doorpost_depth,
    dpp=doorpost_protrude,
    th=treshold_height,
    doa=door_open_angle,
    dhs=doorhandle_size) {
    
        
    module panel(extra,rotation) {
        translate([-dw/2,-extra,th]) 
            rotate([0,0,rotation])
                union() {
                difference() {
                    cube([dw,dt+extra,dh]);
                    translate([dw-0.45*dhs,-dhs/2,dh/2-0.5*dhs] )
                        cube([0.125*dhs,dhs,0.25*dhs]);
                }    
                translate([dw-(0.4*dhs),(dt+extra)/2,dh/2])
                    rotate([0,0,270])  
                    doorhandle(dhs,dt);
        }
    }  
    module punch()
    {
        translate([-dpiw/2,-dw/2,th])
            cube([dpiw,dpiw,dh-(dw-dpiw)/2]);
    }
    union(){
    difference(){
              translate([(dpiw+2*dpw)/-2,0,0])
                  cube([dpiw+2*dpw,dpd,dh+dpw+th-(dw-dpiw)/2]); 
              panel(dpp);
              punch(); 
         }
         
         translate([0,dpp,0])
            panel(0,0-doa);
    }
    
}

door();