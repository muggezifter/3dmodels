cabin_width=125;
cabin_height=200;
cabin_wall_thickness=2;
cabin_floor_thickness=2;
roof_thickness=4;
roof_overhang=5;
door_width=65;
door_height=180;
pedestal_width=115;
pedestal_height=8;
pedestal_thickness=2;
leg_width=5;
leg_height=15;
leg_offset=1;

use <modules/roof.scad>
use <modules/cabin.scad>
use <modules/pedestal.scad>

//translate([0,0,100])
union(){
    // roof:
    translate([0,0,(cabin_height+roof_thickness)/2])
        roof(cabin_width,roof_overhang,rt=roof_thickness);
    // cabin:
    cabin(cabin_width,cabin_height,cabin_wall_thickness,cabin_floor_thickness,door_width,door_height);
    // pedestal:
    translate([0,0,0.5-(cabin_height+pedestal_height)/2])
        pedestal(pedestal_width,pedestal_height,pedestal_thickness,leg_width,leg_height,leg_offset);
}
        
    
