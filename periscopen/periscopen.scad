// dimensions
cabin_width=1500;
cabin_height=2000;
cabin_wall_thickness=20;
cabin_floor_thickness=20;

roof_thickness=40;
roof_overhang=70;

door_width=650;
door_height=1800;
door_thickness=35;
door_open_angle=40;
doorpost_width=50;
doorpost_inner_width=630;
doorpost_depth=60;
doorpost_protrude=10;
treshold_height=10;

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
lower_periscope_flange=0;

upper_periscope_diameter=400;
upper_periscope_vertical_tube_low=150;
upper_periscope_vertical_tube_medium=350;
upper_periscope_vertical_tube_high=550;
upper_periscope_flange=50;
upper_periscope_horizontal_tube=50;
upper_periscope_wall_thickness=15;

periscope_distance_from_center=600;

use <modules/roof.scad>
use <modules/cabin.scad>
use <modules/stand.scad>
use <modules/door.scad>

// initial camera distance and rotation
$vpd=7000;
$vpr=[55, 0, 290];

module periscopen(
    // cabin:
    cw=cabin_width,
    ch=cabin_height,
    cwt=cabin_wall_thickness,
    cft=cabin_floor_thickness,
    // roof
    rt=roof_thickness,
    ro=roof_overhang,
    // door
    dw=door_width,
    dh=door_height,
    dt=door_thickness,
    doa=door_open_angle,
    dpw=doorpost_width,
    dpiw=doorpost_inner_width,
    dpd=doorpost_depth,
    dpp=doorpost_protrude,
    dth=treshold_height,
    // stand:obhunting.
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
    lpf=lower_periscope_flange,
    upd=upper_periscope_diameter,
    upvl=upper_periscope_vertical_tube_low,
    upvm=upper_periscope_vertical_tube_medium,
    upvh=upper_periscope_vertical_tube_high,
    uph=upper_periscope_horizontal_tube,
    upw=upper_periscope_wall_thickness,
    upf=upper_periscope_flange,
    pdc=periscope_distance_from_center
) {
    union(){
        // roof:
        translate([0,0,(ch+rt)/2])
            roof(cw,ro,rt,lpd,lpv,lph,lpw,lpf,upd,upvl,upvm,upvh,uph,upw,upf,pdc);
        // cabin:
        cabin(cw,ch,cwt,cft,dw,dh);
        // door:
        translate([-(dpp+cw/2),0,(cft-ch/2)])
        rotate([0,0,-90])
            door(dw,dh,dt,dpw,dpiw,dpd,dpp,dth,doa);
        // stand:
        translate([0,0,0.5-(ch+sh)/2])
            stand(sw,sh,st,lw,lh,lo);
    }    
}

periscopen();
        
    
