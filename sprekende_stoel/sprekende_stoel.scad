speaker_diameter=300;
chair_height=900;
chair_width=450;
chair_depth=530;
chair_thickness=100;
wall_thickness=18;
seat_elevation=500;
seat_depth=460;

use <../shared/speaker.scad>

module sprekende_stoel(
    ch=chair_height,
    cw=chair_width,
    cd=chair_depth,
    ct=chair_thickness,
    wt=wall_thickness,
    se=seat_elevation,
    sd=seat_depth,
    spd=speaker_diameter
){
    
    
    ta=atan2(cd-sd,ch-se); //top_angle
    ba=atan2(cd-sd,se); //bottom_angle
    
    
    points=[[[0,0],
            [ct,0],
            [ct,se-ct],
            [cd-((se-ct)/se)*(cd-sd)-ct/cos(ba),se-ct],
            [cd-ct/cos(ba),0],
            [cd,0],
            [sd,se],
            [cd,ch],
            [cd-ct/cos(ta),ch],
            [sd-ct/cos(ta),se],
            [0,se]
        ],[
            [0,se-wt],
            [sd-(ct-wt)/cos(ta),se-wt],
            [cd-(ct-wt)/cos(ta)-(wt*tan(ta)),ch-wt],
            [cd-(wt*tan(ta)),ch-wt],
            [cd,ch],
            [cd-ct/cos(ta),ch],
            [sd-ct/cos(ta),se],
            [0,se]
        ],[
            [ct,0],
            [ct,se-ct],
            [cd-((se-ct)/se)*(cd-sd)-ct/cos(ba),se-ct],
            [cd-ct/cos(ba),0],
            [cd+(wt-ct)/cos(ba),0],
            [cd-((se-ct)/se)*(cd-sd)+((wt*cos(ba))-ct)/cos(ba),se-ct+wt],
            [ct-wt,se-ct+wt],
            [ct-wt,0]]];  
        
    module side() {
        linear_extrude(wt) polygon(points[0]);
    }

    
    module chair() {
        union() {
            linear_extrude(height=cw,convexity=10) {
                    union() {
                        polygon(points[1]);
                        polygon(points[2]);
                    }
                } 
            side();
            translate([0,0,cw-wt]) side();
        }
    }
    
    
    translate([-cw/2,-cd/2,0]) rotate([90,0,90]) union() {
        difference() {
            chair();
            translate([
                (points[1][2][0]+points[1][1][0])/2,
                (points[1][2][1]+points[1][1][1])/2,
                sd/2
            ]) rotate([90,0,90-ba]) translate([0,0,-spd]/2) cylinder(spd,spd/2,spd/2);
        }
        translate([
            (points[1][2][0]+points[1][1][0])/2,
            (points[1][2][1]+points[1][1][1])/2,
            cw/2
        ]) rotate([0,90,-ba]) speaker();
    }
}


sprekende_stoel();