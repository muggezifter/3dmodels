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
leg_width=8;
leg_height=15;
leg_offset=1;
lower_periscope_diameter=25;
lower_periscope_h=5;
lower_periscope_v=60;
lower_periscope_wall_thickness=1;
periscope_distance_from_center=50;

use <modules/roof.scad>
use <modules/cabin.scad>
use <modules/pedestal.scad>

//translate([0,0,100])
union(){
    // roof:
    translate([0,0,(cabin_height+roof_thickness)/2])
        roof(
            cabin_width,
            roof_overhang,
            roof_thickness,
            lower_periscope_diameter,
            lower_periscope_v,
            lower_periscope_h,
            lower_periscope_wall_thickness,
            periscope_distance_from_center
            
            );
    // cabin:
    cabin(cabin_width,cabin_height,cabin_wall_thickness,cabin_floor_thickness,door_width,door_height);
    // pedestal:
    translate([0,0,0.5-(cabin_height+pedestal_height)/2])
        pedestal(pedestal_width,pedestal_height,pedestal_thickness,leg_width,leg_height,leg_offset);
}
        
    
