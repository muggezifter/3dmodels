diameter=10;
horizontal_leg=3;
vertical_leg=7;
wall_thickness=0.5;
flange=3;

module half_periscope(
    d=diameter,
    h=horizontal_leg,
    v=vertical_leg,
    w=wall_thickness,
    f=flange   
) {

  translate([-d/2,-(h+d/2),-d-v])
    rotate([90,0,90])
        difference(){
            union() {
            linear_extrude(d)
                polygon([[0,0], [h,0], [d+h,d], [d+h,d+v],[h,d+v],[h,d],[0,d]]);
             translate([0,-f/2,-f/2])
                cube([w,d+f,d+f]);
            }
            translate([0,0,w])
                linear_extrude(d-w-w)
                    polygon([[-w,w], [h,w], [d+h-w,d], [d+h-w,d+v+w],[h+w,d+v+w],[h+w,d-w],[-w,d-w]]);
    }  
    
  
        
   
}

half_periscope();