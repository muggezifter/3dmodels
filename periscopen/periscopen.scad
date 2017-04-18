// dimensions
cabin_width=1500;
cabin_height=2000;
cabin_wall_thickness=20;
cabin_floor_thickness=20;
roof_thickness=40;
roof_overhang=70;
door_width=650;
door_height=1800;
stand_width=1300;
stand_height=80;
stand_thickness=20;
leg_width=80;
leg_height=150;
leg_offset=10;
lower_periscope_diameter=250;
lower_periscope_vertical_tube=600;
lower_periscope_horizontal_tube=50;
lower_periscope_wall_thickness=10;
upper_periscope_diameter=400;
upper_periscope_vertical_tube_low=100;
upper_periscope_vertical_tube_medium=300;
upper_periscope_vertical_tube_high=500;
upper_periscope_horizontal_tube=50;
upper_periscope_wall_thickness=15;
periscope_distance_from_center=600;

use <modules/roof.scad>
use <modules/cabin.scad>
use <modules/stand.scad>

// initial camera distance and rotation
$vpd=7000;
$vpr=[55, 0, 290];

module periscopen(
    // cabin:
    cw=cabin_width,
    ch=cabin_height,
    cwt=cabin_wall_thickness,
    cft=cabin_floor_thickness,
    rt=roof_thickness,
    ro=roof_overhang,
    dw=door_width,
    dh=door_height,
    // stand:
    sw=stand_width,
    sh=stand_height,
    st=stand_thickness,
    lw=leg_width,
    lh=leg_height,
    lo=leg_offset,
    // periscopes:
    lpd=lower_periscope_diameter,
    lpv=lower_periscope_vertical_tube,
    lph=lower_periscope_horizontal_tube,
    lpw=lower_periscope_wall_thickness,
    upd=upper_periscope_diameter,
    upvl=upper_periscope_vertical_tube_low,
    upvm=upper_periscope_vertical_tube_medium,
    upvh=upper_periscope_vertical_tube_high,
    uph=upper_periscope_horizontal_tube,
    upvw=upper_periscope_wall_thickness,
    pdc=periscope_distance_from_center
) {
    union(){
        // roof:
        translate([0,0,(ch+rt)/2])
            roof(cw,ro,rt,lpd,lpv,lph,lpw,upd,upvl,upvm,upvh,uph,upvw,pdc);
        // cabin:
        cabin(cw,ch,cwt,cft,dw,dh);
        // stand:
        translate([0,0,0.5-(ch+sh)/2])
            stand(sw,sh,st,lw,lh,lo);
    }
}

periscopen();
        
    
