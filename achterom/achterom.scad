cabin_width=1200;
cabin_height=1800;
cabin_wall_thickness=2.5;
cabin_skylight_width=800;
periscope_elevation=800;
pipe_width=2000;
pipe_height=1500;
pipe_diameter=250;
pipe_wall_thickness=10;
door_width=600;
door_height=1000;
door_elevation=100;
inside_door_post_width=60;
stand_width=1000;
stand_height=800;
stand_leg_diameter=40;

use <../shared/box.scad>
use<../shared/double_periscope.scad>
use<../shared/stand.scad>

// initial camera distance, rotation and translation
$vpd=10000;
$vpr=[75,0,315];
$vpt=[0,0,1000];

module achterom(
    cw=cabin_width,
    ch=cabin_height,
    cwt=cabin_wall_thickness,
    csw=cabin_skylight_width,
    pe=periscope_elevation,
    pw=pipe_width,
    ph=pipe_height,
    pd=pipe_diameter,
    pwt=pipe_wall_thickness,
    dw=door_width,
    dh=door_height,
    de=door_elevation,
    idw=inside_door_post_width,
    sw=stand_width,
    sh=stand_height,
    sld=stand_leg_diameter,
){
    module skylight_punch() {
        translate([csw/-2,csw/-2, ch/2])
            cube([csw,csw,ch]);
    }
    
    module periscope_punch() {
        translate([-cw,(pd-2*pwt)/-2,pe+pwt])
            cube([2*cw,pd-2*pwt,pd-2*pwt]);
    }
    
    module door_punch() {
        translate([-dw/2,-cw,de])
        cube([dw,dh,cw]);
    }
    
    module cabin() {
        union() {
            difference(){
                box(cw,cw,ch,cwt);
                skylight_punch();
                periscope_punch();
                door_punch();
            }
            translate([(dw+idw)/-2,cw/-2,100])
                cube([dw+idw,cwt,dh+idw]);
        }
    }
    
    module pipe() {
        translate([0,0,pe+pd])
            rotate([180,0,0])
                double_periscope(pw,ph,cw-cwt,pd,pwt);
    }
    translate([0,0,sh])
        union() {
            cabin();
            pipe();
        }
    stand(sw,sh,sld);
}

achterom();
