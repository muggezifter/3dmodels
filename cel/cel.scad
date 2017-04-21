chair_width=50;
chair_height=75;
chair_depth=60;
chair_back_top=10;
chair_top_angle=80;
chair_seat_elevation=40;
chair_seat_height=10;
chair_seat_overhang=3;
chair_bottom_angle=80;
chair_wall_thickness=1.5;
chair_armrest_bool=true;
chair_armrest_height=55;
chair_armrest_width=12;
chair_armrest_overlap=5;

use <../shared/hollow_chair.scad>
use <../shared/solid_chair.scad>
module cel(
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
    cab=chair_armrest_bool,
    cah=chair_armrest_height,
    caw=chair_armrest_width,
    cao=chair_armrest_overlap
){
   
hollow_chair(cw,ch,cd,cbt,cta,cse,csh,cso,cba,cwt,cab,cah,caw,cao);
    
}
cel();