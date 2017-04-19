cabin_width=1700;
cabin_depth=800;
cabin_height=1900;
cabin_wall_thickness=20;
cabin_bottom_thickness=30;
cabin_roof_slope=30;
seat_width=400;
seat_depth=350;
seat_thickness=30;
seat_elevation=600;
periscopes_width=2700;
periscopes_height=1300;
periscopes_diameter=350;
periscopes_wall_thickness=15;
periscopes_elevation=900;
undercarriage_width=1680;
undercarriage_depth=640;
undercarriage_height=30;
undercarriage_beam_width=100;
castor_height=120;


// initial camera distance, rotation and translation
$vpd=10000;
$vpr=[75,0,315];
$vpt=[0,0,1000];

use <../shared/double_periscope.scad>
use <../shared/pivoting_caster.scad>
use <../shared/caster.scad>
use <modules/halfcabin.scad>
module tweezitter(
    cw=cabin_width,
    cd=cabin_depth,
    ch=cabin_height,
    cwt=cabin_wall_thickness,
    cbt=cabin_bottom_thickness,
    crf=cabin_roof_slope,
    
    sw=seat_width,
    sd=seat_depth,
    st=seat_thickness,
    se=seat_elevation,
    
    pw=periscopes_width,
    ph=periscopes_height,
    pd=periscopes_diameter,
    pwt=periscopes_wall_thickness,
    pe=periscopes_elevation,
    
    uw=undercarriage_width,
    ud=undercarriage_depth,
    uh=undercarriage_height,
    ubw=undercarriage_beam_width,
    uch=castor_height,
){
    module periscopes() {
        translate([0,0,pe])
        double_periscope(pw,ph,cw,pd,pwt);
    }
    module seat() {
        translate([0,0,se+st/2])
        cube([2*sd+cwt,sw,st],true);
    }
    
    module punch() {
        translate([cw/4,pd/-2+pwt,pe+pwt])
        cube([cw/2,pd-2*pwt,pd-2*pwt]);
    }
    
    module undercarriage() {
       translate([0,0,uh/-2])
            union() {
                difference() {
                    cube([uw,ud,uh],true);
                    translate([0,(ud+ubw)/2,-0.45*uh])
                        cube([uw-2*ubw,ud,2*uh],true);
                    translate([0,(ud+ubw)/-2,-0.45*uh])
                        cube([uw-2*ubw,ud,2*uh],true);
                }
                translate([(uw-ubw)/2,(ud-ubw)/2,-uch-uh/2])
                    rotate([0,0,90])
                        caster(uch);
                translate([(uw-ubw)/2,(ud-ubw)/-2,-uch-uh/2])
                    rotate([0,0,90])
                        caster(uch);
                translate([(uw-ubw)/-2,(ud-ubw)/2,-uch-uh/2])
                        pivoting_caster(uch,70);
                translate([(uw-ubw)/-2,(ud-ubw)/-2,-uch-uh/2])
                        pivoting_caster(uch,70);
            }
    }
    


    translate([0,0,uh+uch]){
        difference() {
            union() {
                //half cabin 1
                difference() {
                    halfcabin(cw,cd,ch,cwt,cbt,crf);
                    punch();
                   }
                 // half cabin 2
                rotate([0,0,180])
                    difference() {
                        halfcabin(cw,cd,ch,cwt,cbt,crf);
                        punch();
                    }
                seat();
                periscopes();
                undercarriage();
            }
        }
    }
}

    tweezitter();