
module highchair() {
difference(){
rotate([-14.5,0,0]){    
    union(){
        translate([225,0,0])
        cube([45,45,1700]);                     // ladder right beam
        translate([-270,0,0]){
            cube([45,45,1700]);                 // ladder left beam
            for(h=[220:250:720]) 
                translate([0,0,h]) 
                    cube([540,45,45]);          // steps
        }
}
}
translate([-300,-10,-100]) cube([600,100,100]); // cut ladder bottom excess
}

translate([225,400,0]) {
    cube([45,45,1400]);                         // right vertical beam
    translate([0,0,1355]) cube([45,420,45]);    // right higher horizontal beam
}


translate([-270,400,0]) {
    cube([45,45,1400]);                         // left vertical beam
    translate([0,0,1355]) cube([45,420,45]);    // left higher horizontal beam
}

// back
translate([0,950,0])
difference(){
rotate([3.6,0,0]){
        difference(){     
        translate([0,0,700])
            rotate([0,-28,0])
                translate([-30,-15,-535])
                    cube ([60,15,1070]);        // back crossbeam
        translate([240,-100,0])
            cube([200,200,1500]);               // cut crossbeam excess left
        translate([-440,-100,0])
            cube([200,200,1500]);               // cut crossbeam excess right
        };
        translate([225,-45,0]) {
            cube([45,45,1650]);                 // back right beam
        }
        translate([-270,-45,0]) {
            cube([45,45,1650]);                 // back right beam
        }

}
translate([-300,-80,-100]) cube([600,100,100]); // cut back bottom excess
}

translate([-240,244,955]) cube([480,210,18]);   // footrest
translate([225,40,100]) cube([45,900,45]);      // right lower horizontal
translate([-270,40,100]) cube([45,900,45]);     // left lower horizontal
translate([-270,750,100]) cube([540,45,45]);    // lower connecting 
translate([-270,375,1400]) cube([540,470,18]);  // seat

rot = -15;
translate([-225,790,1418])
rotate([rot,0,0]) {
    cube([450,18,420]);                         // backrest
    translate([0,18,210]) cube([450,45,45]);    // beam behind backrest
}

translate([-270,390,1605])
difference() {
  cube([45,530,45]);
    translate([0,530,50]) 
    rotate([rot,0,0])  
    translate([-25,0,-100])
  cube([100,100,100]);
}

translate([225,390,1605])
difference() {
  cube([45,530,45]);
    translate([0,530,50]) 
    rotate([rot,0,0])  
    translate([-25,0,-100])
  cube([100,100,100]);
}
}
highchair();

