cabin_width=125;
roof_thickness=4;
roof_overhang=5;
lower_periscope_diameter=20;
lower_periscope_h=5;
lower_periscope_v=40;
lower_periscope_wall_thickness=1;
lower_periscope_flange=3;
upper_periscope_diameter=27;
upper_periscope_h=3;
upper_periscope_v_low=10;
upper_periscope_v_medium=25;
upper_periscope_v_high=40;
upper_periscope_wall_thickness=1.5;
upper_periscope_flange=10;
periscope_distance_from_center=50;

use<../../shared/half_periscope.scad>

module roof(
    cw=cabin_width,
    ro=roof_overhang,
    rt=roof_thickness,
    lpd=lower_periscope_diameter,
    lpv=lower_periscope_v,
    lph=lower_periscope_h,
    lpw=lower_periscope_wall_thickness,
    lpf=lower_periscope_flange,
    upd=upper_periscope_diameter,
    upvl=upper_periscope_v_low,
    upvm=upper_periscope_v_medium,
    upvh=upper_periscope_v_high,
    uph=upper_periscope_h,
    upw=upper_periscope_wall_thickness,
    upf=upper_periscope_flange,
    pdc=periscope_distance_from_center
){
    module lower_periscope(rotation)
    {
       rotate(rotation)
          translate ([pdc,0,0.5-(rt/2)])
            rotate(270)
                half_periscope(lpd,lph+0.5,lpv,lpw,lpf);
    }
    
    module upper_periscope(rotation,v,local_rotation)
    {
       rotate(rotation)
          translate ([pdc,0,0.5-(rt/2)])
            rotate([180,0,local_rotation])
                half_periscope(upd,uph+0.5,v,upw,upf);
    }
    
    module punch(rotation) {
        rotate(rotation)
            translate ([pdc,0,0])
                cube(lpd-(2*lpw), true);
    }
   
    union(){
        difference(){
            cube([cw+(2*ro),cw+(2*ro),rt], true);
            punch(45);
            punch(135);
            punch(225);
            punch(315);
        }
        lower_periscope(45);
        lower_periscope(135);
        lower_periscope(225);
        lower_periscope(315);
        upper_periscope(45,upvm,0);
        upper_periscope(135,upvl,270);
        upper_periscope(225,upvm,180);
        upper_periscope(315,upvh,90);
    }
    

}

roof();