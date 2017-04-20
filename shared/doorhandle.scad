size=100;
door_thickness=40;


module doorhandle(s=size, dt=door_thickness){
    
    pl=s;//plate_length
    pw=0.3*s;//plate_width
    pt=s/40;//plate_thickness 
    kr=s/32; //keyhole_radius
    hr=s/16; //handle_radius
    hl=0.6*s; //handle_length
    
    module keyhole_punch() {
        translate([0,0,-pt/2])
        union() {
            linear_extrude(2*pt)
                polygon([[-kr,-kr*3],[kr,-kr*3],[0.5*kr,0],[-0.5*kr,0]]);
            cylinder(2*pt,kr,kr);
        }
    }
    module plate() {
        translate([-pw/2,-0.7*pl,-pt/2])
        difference() {
            union(){
                translate([pw/2,pl-pw/2,0])
                    cylinder(pt,pw/2,pw/2);
                translate([pw/2,pw/2,0])
                    cylinder(pt,pw/2,pw/2);
                translate([0,pw/2,0])
                    cube([pw,pl-pw,pt]);
            }
        translate([pw/2,pw*1.2,0])
            keyhole_punch();
        }
    }
    
   module handle() {
       union() {
           rotate([0,90,0])
           cylinder(hr+dt/2,hr,hr);
               translate([hr+dt/2,-3*hr,0])
           union() {
               translate([3*hr,-hl,0])
                   rotate([270,0,0])
                   union() {
                       cylinder(hl,hr,hr);
                       sphere(hr);
                   }
               intersection() {
                   translate([0,0,-3*hr])
                       cube([6*hr,6*hr,6*hr]);
                   rotate_extrude()
                       translate([3*hr, 0]) circle(hr);
               }
           }
       }
   }
   union() {
       handle();
           rotate([0,180,0])
                handle();
           rotate([90,0,90])
           union(){ 
                translate([0,0,dt/2])    
                plate();
                translate([0,0,-dt/2])     
                plate();
           }
   }

   
}


doorhandle();