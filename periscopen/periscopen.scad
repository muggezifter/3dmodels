// dimensions
cabin_width=1250;
cabin_height=2000;
cabin_wall_thickness=20;
cabin_floor_thickness=20;
roof_thickness=40;
roof_overhang=50;
door_width=650;
door_height=1800;
stand_width=1150;
stand_height=80;
stand_thickness=20;
leg_width=80;
leg_height=150;
leg_offset=10;
lower_periscope_diameter=250;
lower_periscope_horizontal_tube=50;
lower_periscope_vertical_tube=600;
lower_periscope_wall_thickness=10;
periscope_distance_from_center=500;

use <modules/roof.scad>
use <modules/cabin.scad>
use <modules/stand.scad>

// initial camera distance and rotation
$vpd=7000;
$vpr=[55, 0, 290];

module periscopen(
    cw=cabin_width,
    ch=cabin_height,
    cwt=cabin_wall_thickness,
    cft=cabin_floor_thickness,
    rt=roof_thickness,
    ro=roof_overhang,
    dw=door_width,
    dh=door_height,
    sw=stand_width,
    ph=stand_height,
    pt=stand_thickness,
    lw=leg_width,
    lh=leg_height,
    lo=leg_offset,
    lpd=lower_periscope_diameter,
    lph=lower_periscope_horizontal_tube,
    lpv=lower_periscope_vertical_tube,
    lsw=lower_periscope_wall_thickness,
    pdc=periscope_distance_from_center
) {
    union(){
        // roof:
        translate([0,0,(ch+rt)/2])
            roof(cw,ro,rt,lpd,lpv,lph,lsw,pdc);
        // cabin:
        cabin(cw,ch,cwt,cft,dw,dh);
        // pedestal:
        translate([0,0,0.5-(ch+ph)/2])
            stand(sw,ph,pt,lw,lh,lo);
    }
}

periscopen();
        
    
