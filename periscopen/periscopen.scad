cabin_width=1250;
cabin_height=2000;
cabin_wall_thickness=20;
cabin_floor_thickness=20;
roof_thickness=40;
roof_overhang=50;
door_width=650;
door_height=1800;
pedestal_width=1150;
pedestal_height=80;
pedestal_thickness=20;
leg_width=80;
leg_height=150;
leg_offset=10;
lower_periscope_diameter=250;
lower_periscope_h=50;
lower_periscope_v=600;
lower_periscope_wall_thickness=10;
periscope_distance_from_center=500;

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
    cabin(
        cabin_width,cabin_height,cabin_wall_thickness,cabin_floor_thickness,door_width,door_height);
    // pedestal:
    translate([0,0,0.5-(cabin_height+pedestal_height)/2])
        pedestal(pedestal_width,pedestal_height,pedestal_thickness,leg_width,leg_height,leg_offset);
}
        
    
