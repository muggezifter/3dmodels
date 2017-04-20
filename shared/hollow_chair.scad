width=40;
height=80;
depth=55;
back_top=10;
top_angle=80;
seat_elevation=40;
seat_height=10;
seat_overhang=3;
bottom_angle=80;
wall_thickness=1.5;

module hollow_chair(
    w=width,
    h=height,
    d=depth,
    bt=back_top,
    ta=top_angle,
    se=seat_elevation,
    sh=seat_height,
    so=seat_overhang,
    ba=bottom_angle,
    wt=wall_thickness
){
    rotate([90,0,90])
    difference(){
    linear_extrude(w)
    polygon([
        [0,0],
        [d-so-tan(90-ba)*(se-sh),0],
        [d-so,se-sh],
        [d,se-sh],
        [d,se],
        [bt+tan(90-ta)*(h-se),se],
        [bt,h],
        [0,h]
    ]);
        translate([0,0,wt])
    linear_extrude(w-(2*wt))
    polygon([
        [-wt,-wt],[d-so-tan(90-ba)*(se-sh)-(wt/cos(90-ba)),-wt],
        [d-so-tan(90-ba)*(se-sh)-(wt/cos(90-ba)),0],
        [d-so-(wt/cos(90-ba)),se-sh+wt],
        [d-wt,se-sh+wt],
        [d-wt,se-wt],
        [bt+tan(90-ta)*(h-se)-(wt/cos(90-ta)),se-wt],
        [bt-(wt/cos(90-ta)),h-wt],
        [-wt,h-wt]
    ]);
}
    
 

}



hollow_chair();






