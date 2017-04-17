cabin_width=125;
cabin_height=200;
cabin_wall_thickness=2;
cabin_floor_thickness=2;
door_width=65;
door_height=180;

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
