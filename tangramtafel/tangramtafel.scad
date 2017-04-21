width=1000;
height=800;
thickness=30;
leg_diameter=40;
skirt=80;
skirt_thickness=15;
overhang=100;

module tangramtafel(
    w=width,
    h=height,
    t=thickness,
    d=leg_diameter,
    s=skirt,
    st=skirt_thickness,
    o=overhang
) {
    module table(){
        union(){
            translate([0,0,h-t])
                cube([w,w,t]);
            translate([0,0,h-t-s])
                difference(){
                    translate([o,o,0])
                        cube([w-2*o,w-2*o,s+st/16]);
                    translate([o+st,o+st,st/-2])
                        cube([w-2*o-2*st,w-2*o-2*st,s+st]);
            }
            translate([o-(d-st)/2,o-(d-st)/2,0])
                cube([d,d,h-t/2]);
            translate([o-(d-st)/2,w-d/2-o-st/2,0])
                cube([d,d,h-t/2]);
            translate([w-d/2-o-st/2,o-(d-st)/2,0])
                cube([d,d,h-t/2]);
            translate([w-d/2-o-st/2,w-d/2-o-st/2,0])
                cube([d,d,h-t/2]);
        
        } 
        
    }
    
    dia = sin(45)*w/2;
    sc=0.99;
    sc2=0.999;
    module triangle1() {
        translate([dia/2,w/2,0])
            scale([sc2,sc2,1])
                translate([-dia/2,-w/2,0])
                    polygon([[0,0],[0,w],[w/2,w/2]]); 
    }
    
    module triangle2() {
        translate([w/2,w-dia/2,0])
            scale([sc2,sc2,1])
                translate([-w/2,dia/2-w,0])
                    polygon([[w,w],[0,w],[w/2,w/2]]);
    }
      
    module triangle3() {
        translate([w/4,dia/4,0])
            scale([sc,sc,1])
                translate([-w/4,-dia/4,0])
                    polygon([[0,0],[w/2,0],[w/4,w/4]]);
    }
    
    module triangle4() {
        translate([(w+dia)/2,w/2,0])
            scale([sc,sc,1])
                translate([-(w+dia)/2,-w/2,0])
                    polygon([[w/2,w/2],[3*w/4,w/4],[3*w/4,3*w/4]]);
    }
    
    module triangle5() {
        translate([w,0,0])
            rotate(-135)
                translate([0,-w/4,0])
                    scale([sc,sc,1])
                        translate([0,w/4,0])
                            rotate(135)
                                translate([-w,0,0])
                                    polygon([[w/2,0],[w,0],[w,w/2]]);
    }

   module square() {
        translate([w/2,w/4,0])
            scale([sc,sc,1])
                translate([-w/2,-w/4,0])
                    polygon([[w/2,0],[w/4,w/4],[w/2,w/2],[3*w/4,w/4]]);
    }
   
   module lozenge() {
       translate([7*w/8,5*w/8,0])
            scale([sc,sc,1])
                translate([-7*w/8,-5*w/8,0])
                    polygon([[3*w/4,w/4],[3*w/4,3*w/4],[w,w],[w,w/2]]);
    }
   
    translate([-w/2,-w/2,0])
    union() {
    translate([0,3*dia-w,0])
        intersection() {
            table();
            linear_extrude(h+1)
                triangle1();   
        }
        
    translate([3*dia,0,0])
        rotate(180)
            translate([0,-w,0])
                intersection() {
                    table();
                    linear_extrude(h+1)
                        triangle2();
                }
   
    translate([2*dia,2*dia,0])
        rotate(-45)
            intersection() {
                    table();
                    linear_extrude(h+1)
                        triangle3();
            }
    
    translate([3*dia,3*dia,0])
        rotate(135)
            translate([-w/2,0,0])
            intersection() {
                table();
                linear_extrude(h+1)
                    square();
            }
        
    translate([2*dia,2*dia,0])
        rotate(135)
            translate([-w/2,-w/2,0])
                intersection() {
                    table();
                    linear_extrude(h+1)
                        triangle4();
                }
    
    translate([3*dia,0,0])
        rotate(45)
            translate([-3*w/4,-w/4,0])
                intersection() {
                    table();
                    linear_extrude(h+1)
                        lozenge();
                }
                
    translate([0,3*dia,0])
        rotate(-45)
            translate([-w/2,0,0])
               intersection() {
                    table();
                    linear_extrude(h+1)
                        triangle5();
               }
    }
}

tangramtafel();