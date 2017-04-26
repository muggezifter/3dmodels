width=800;
height=2000;
depth=1800;
wall_thickness=50;
floor_thickness=70;
doorpost_width=80;
doorpost_depth=20;
door_thickness=40;
door_inset=5;
doorhandle_size=140;

// initial camera distance, rotation and translation
$vpd=10000;
$vpr=[75,0,30];
$vpt=[0,0,1000];

use <../shared/doorhandle.scad>

module sluisje(
    w=width,
    h=height,
    d=depth,
    wt=wall_thickness,
    ft=floor_thickness,
    dpw=doorpost_width,
    dpd=doorpost_depth,
    dt=door_thickness,
    di=door_inset,
    dhs=doorhandle_size,
    ){
        module door(rotation=20) {
            // doorpost
            union() {
                translate([w/-2,d/-2+dt+di,0]) difference() {
                    cube([w,dpw,h]);
                    translate([wt+dpd,dpw/-2,ft]) cube([w-2*wt-2*dpd,2*dpw,h-dpd-wt-ft]);
                }
            
            // doorpanel
            translate([wt-w/2,di-d/2,ft])
            rotate([0,0,-rotation]) 
                union() {
                    cube([w-wt*2,dt,h-wt-ft]); 
                    translate([w-2*wt-(0.4*dhs),(dt)/2,h/2-wt]) rotate([0,0,270]) doorhandle(dhs,dt);  
                }                   
            }
       }
        
        module tunnel(){
            translate([0,0,h/2]) difference() {
                cube([w,d,h],true);
                translate([0,0,(ft-wt)/2]) cube([w-wt*2,d+wt*2,h-wt-ft],true);
            }
        }
        union() {
            rotate([0,0,180]) door(0);    
            door(30);
            tunnel();
        }

 }
        
sluisje();