dodecahedron_height=1800;
wall_thickness=5;
hole_diameter=350;

use <../shared/highchair.scad>

module draagbaar_nergens(
    dh=dodecahedron_height,
    wt=wall_thickness,
    hd=hole_diameter,
){
    //create a dodecahedron by intersecting 6 boxes
    module dodecahedron(height) 
    {
            scale([height,height,height]) //scale by height parameter
            {
                    intersection(){
                            //make a cube
                            cube([2,2,1], center = true); 
                            intersection_for(i=[0:4]) //loop i from 0 to 4, and intersect results
                            { 
                                    //make a cube, rotate it 116.565 degrees around the X axis,
                                    //then 72*i around the Z axis
                                    rotate([0,0,72*i])
                                            rotate([116.565,0,0])
                                            cube([2,2,1], center = true); 
                            }
                    }
            }
    }

translate([0,0,2800])
difference() {
    dodecahedron(dh);
    dodecahedron(dh-2*wt);
    translate([0,0,dh/-1.1]) cylinder(dh,hd,hd);
}

translate([0,-600,0])
highchair();
}

draagbaar_nergens();