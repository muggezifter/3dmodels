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

module roof(cw=cabin_width,ro=roof_overhang,rt=roof_thickness){
    cube([cw+(2*ro),cw+(2*ro),rt], true);
}

module cabin(cw=cabin_width,ch=cabin_height,ct=cabin_wall_thickness,cf=cabin_floor_thickness,dw=door_width,dh=door_height) {
    difference(){
            // cabin outer dimensions
            cube([cw,cw,ch],true);
            // cabin inner dimensions
            translate([0,0,cf])
                    cube([cw-(2*ct),cw-(2*ct),ch],true); 
            // doorway punch  
            translate([(ct-cabin_width)/2,0,cf-((ch-dh)/2)])
                cube([2*ct,dw,dh],true);
   }
}

module pedestal(pw=pedestal_width,ph=pedestal_height,pt=pedestal_thickness) {
           difference() {
            cube([pw,pw,0.5+ph],true);
            translate([0,0,-1])
                cube([pw-pt,pw-pt,ph+2],true);
        }
}

//translate([0,0,100])
union(){
    // roof:
    translate([0,0,(cabin_height+roof_thickness)/2])
        roof();
    // cabin:
    cabin();
    // pedestal:
    translate([0,0,0.5-(cabin_height+pedestal_height)/2])
        pedestal();
}
        
    
