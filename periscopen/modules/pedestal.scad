pedestal_width=115;
pedestal_height=8;
pedestal_thickness=2;
leg_width=5;
leg_height=15;
leg_offset=1;



module pedestal(pw=pedestal_width,ph=pedestal_height,pt=pedestal_thickness,lw=leg_width,lh=leg_height,lo=leg_offset) {
    union() {
        difference() {
            cube([pw,pw,0.5+ph],true);
            cube([pw-pt,pw-pt,ph+5],true);
        }
        translate([lo+(pw-lw)/2,lo+(pw-lw)/2,(lh-ph)/-2])
            cube([lw,lw,0.5+lh],true);
        translate([-(lo+(pw-lw)/2),lo+(pw-lw)/2,(lh-ph)/-2])
            cube([lw,lw,0.5+lh],true);
        translate([-(lo+(pw-lw)/2),-(lo+(pw-lw)/2),(lh-ph)/-2])
            cube([lw,lw,0.5+lh],true);
        translate([lo+(pw-lw)/2,-(lo+(pw-lw)/2),(lh-ph)/-2])
            cube([lw,lw,0.5+lh],true);
    }
}

pedestal();