cabin_width=1400;
cabin_depth=800;
cabin_height=2000;
cabin_wall_thickness=20;
cabin_bottom_thickness=30;
cabin_roof_slope=30;

// initial camera distance, rotation and translation
$vpd=10000;
$vpr=[75,0,315];
$vpt=[0,0,1000];

module halfcabin(
    cw=cabin_width,
    cd=cabin_depth,
    ch=cabin_height,
    cwt=cabin_wall_thickness,
    cbt=cabin_bottom_thickness,
    crf=cabin_roof_slope,

){
     module roof() {
            rotate([0,0,-crf])
            translate([-cwt,0,0])
            cube([2*cwt,1.6*cd,(cw+cwt)/2-cwt/4]);
        }
        
        module openbox() {      
            difference(){
                cube([ch,cd,(cw+cwt)/2-cwt/4]);
                translate([-cbt,-cwt,cwt-cwt/4])
                    cube([ch,cd,(cw+cwt)/2-2*cwt]);
            }
        }
        module slicers() {
            union() {
                // front slicer
                translate([-cw/2,-0.999*cw,-cwt])
                    cube([2*cw,cw,cw]);
                // top slicer
                rotate([0,0,-crf])
                    translate([-cw,-cwt,-cwt])
                        cube([cw,cw,cw]);
                // back slicer
                translate([-cw/8,cd-0.001*cw,-cwt])
                cube([cw*2,cw,cw]);
            }
        } 
   
        rotate([0,90,0])
            translate([-ch,-cd/2,cwt/-4])

                difference() {
                    union() {
                        roof();
                        openbox();
                    }
                    slicers();
                }
      
}

halfcabin();