stand_width=100;
stand_height=80;
stand_leg_diameter=4;

module stand(
    sw=stand_width,
    sh=stand_height,
    sld=stand_leg_diameter
){
    module leg(x,y) {
        union() {
        translate([x,y,sld/20])
            cube([2*sld,2*sld,sld/10],true);
        translate([x,y,sh/2])
            cube([sld,sld,sh],true);
        }
    }
  
    module square(e,d,offset) {
            translate([0,0,e])
                difference() {
                    cube([sw-offset,sw-offset,d], true);
                    cube([sw-2*d-offset,sw-2*d-offset,2*d], true);
                }
    }
    union() {
        square(sh-sld/2,sld,0);
        square(0.8*sh,sld/4,sld/2);
        leg((sw-sld)/2,(sw-sld)/2);
        leg((sw-sld)/2,(sw-sld)/-2);
        leg((sw-sld)/-2,(sw-sld)/2);
        leg((sw-sld)/-2,(sw-sld)/-2);
    }
}

stand();