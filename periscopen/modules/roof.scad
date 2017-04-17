cabin_width=125;
roof_thickness=4;
roof_overhang=5;
lower_periscope_diameter=20;
lower_periscope_h=5;
lower_periscope_v=40;
lower_periscope_wall_thickness=1;
periscope_distance_from_center=50;

use<../../shared/periscope_knee.scad>

module roof(
    cw=cabin_width,
    ro=roof_overhang,
    rt=roof_thickness,
    lpd=lower_periscope_diameter,
    lpv=lower_periscope_v,
    lph=lower_periscope_h,
    lpw=lower_periscope_wall_thickness,
    pdc=periscope_distance_from_center
){
    module lower_periscope(r)
    {
       rotate(r)
          translate ([pdc,0,0.5-(rt/2)])
            rotate(270)
                periscope_knee(lpd,lph+0.5,lpv,lpw);
    }
    module punch(r) {
        rotate(r)
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
    }
    

}

roof();