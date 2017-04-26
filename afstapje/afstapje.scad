width=600;
depth=800;
wall_thickness=20;
flange=300;


module afstapje(
    w=width,
    d=depth,
    wt=wall_thickness,
    f=flange,
){
    module box() {
        difference() {
            union() {
                    translate([0,0,d/-2]) cube([w,w,d],true); 
                    translate([0,0,(wt)/2]) cube([w+2*f,w+2*f,wt],true); 
                }
                translate([0,0,1.5*wt-d/2]) cube([w-2*wt,w-2*wt,d+wt],true); 
            }
     }
        difference() {
   
        box();
        translate([0,-(w+d)/2,0])  cube([2.1*d,2.1*d,2.1*d],true);
    
}
   } 
afstapje();
