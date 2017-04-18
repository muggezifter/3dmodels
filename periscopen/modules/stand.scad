stand_width=115;
stand_height=8;
stand_thickness=2;
leg_width=5;
leg_height=15;
leg_offset=1;



module stand(sw=stand_width,sh=stand_height,st=stand_thickness,lw=leg_width,lh=leg_height,lo=leg_offset) {
    
    module leg() {
        cube([lw,lw,0.5+lh],true);
    }
    
    union() {
        difference() {
            cube([sw,sw,0.5+sh],true);
            cube([sw-st,sw-st,sh+5],true);
        }
        translate([lo+(sw-lw)/2,lo+(sw-lw)/2,(lh-sh)/-2])
            leg();
        translate([-(lo+(sw-lw)/2),lo+(sw-lw)/2,(lh-sh)/-2])
            leg();
        translate([-(lo+(sw-lw)/2),-(lo+(sw-lw)/2),(lh-sh)/-2])
            leg();
        translate([lo+(sw-lw)/2,-(lo+(sw-lw)/2),(lh-sh)/-2])
            leg();
    }
}

stand();