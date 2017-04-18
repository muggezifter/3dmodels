cabin_width=1250;
cabin_height=2000;
cabin_wall_thickness=20;
cabin_floor_thickness=20;
door_width=650;
door_height=1800;

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

cabin();
