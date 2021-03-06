box_width=700;
box_height=1600;
box_depth=1000;
box_wall_thickness=18;

chair_width=500;
chair_height=800;
chair_depth=550;
chair_back_top=100;
chair_top_angle=80;
chair_seat_elevation=400;
chair_seat_height=100;
chair_seat_overhang=30;
chair_bottom_angle=80;
chair_wall_thickness=18;

periscope_diameter=500;
periscope_top_horizontal_tube_length=80;
periscope_top_flange=100;
periscope_bottom_horizontal_tube_length=80;
periscope_bottom_flange=0;
periscope_height=1550;
periscope_wall_thickness=18;
periscope_twist=0;
periscope_elevation=650;

door_width=600;
door_height=1400;
door_elevation=50;
door_offset_left=200;
door_angle=60;

leg_diameter=60;
leg_height=40;
leg_offset=30;

// initial camera distance, rotation and translation
$vpd=10000;
$vpr=[73,0,226];
$vpt=[0,0,1000];

use <../shared/box.scad>
use <../shared/hollow_chair.scad>
use <../shared/periscope.scad>

module spiegelkijker(    
    bw=box_width,
    bh=box_height,
    bd=box_depth,
    bwt=box_wall_thickness,
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
    dw=door_width,
    dh=door_height,
    de=door_elevation,
    dol=door_offset_left,
    da=door_angle,
    pd=periscope_diameter,
    pth=periscope_top_horizontal_tube_length,
    ptf=periscope_top_flange,
    pbh=periscope_bottom_horizontal_tube_length,
    pbf=periscope_bottom_flange,
    ph=periscope_height,
    pwt=periscope_wall_thickness,
    pt=periscope_twist,
    pe=periscope_elevation,
    ld=leg_diameter,
    lh=leg_height,
    lo=leg_offset,
    ){
    mirror([0,1,0])
    translate([0,0,lh])
        union() {
            // chair
            translate([-cw/2,-bd/2,0])
                hollow_chair(cw,ch,cd,cbt,cta,cse,csh,cso,cba,cwt,false);
            // cabin
            difference(){
                box(bw,bd,bh,bwt);
                // chair punch:
                translate([(cwt-cw)/2,(bd+cwt)/-2,cwt/-2])
                    cube([cw-cwt,cd-cso-tan(90-cba)*(cse-csh),ch]);
                // door punch
                translate([0,bd/2-dol+bwt/8,de-bwt/8])
                    rotate([0,0,180])
                        cube([bh,dw+bwt/4,dh+bwt/4]);
                // periscope_punch
                translate([pwt/2-pd/2,(cd+pwt)/2-0.1*pd,pe+0.55*pd])
                cube([pd-pwt,cd,ph]);
            }
            // periscope
            translate([0,cd/2+0.4*pd,pe])
                periscope(pd,pth,ptf,pbh,pbf,ph,pwt,pt);
            // door    
            translate([-bw/2+bwt,bd/2-dol,de])
                rotate([0,0,180-da])
                    cube([bwt,dw,dh]);
            //legs
            lx = bw/2-ld/2-lo; // leg y
            ly = bd/2-ld/2-lo; // leg y
            translate([lx,ly,lh/-2])
                cube([ld,ld,lh],true);
            translate([-lx,ly,lh/-2])
                cube([ld,ld,lh],true);
            translate([lx,-ly,lh/-2])
                cube([ld,ld,lh],true);  
            translate([-lx,-ly,lh/-2])
                cube([ld,ld,lh],true);
        }
}

spiegelkijker();