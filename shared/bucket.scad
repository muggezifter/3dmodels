height=200;
diameter=350;
$fa=4;

module bucket(d=diameter,h=height) {
    re=d/25; // radius edge
    wt=d/50; // wall thickness
   
    rotate_extrude(convexity=10)


    difference() {


    union()
    {
        translate([d/2-re,h-re]) circle(re);
        hull() {
        translate([0.37*d,re, 0]) circle(re);
        polygon([[0,0],[d/2-re,h-re],[0,h-re]]);
        translate([0,h-re]) square([d/2-re,re]);
    
        }
    }  
     translate([-wt,wt]) 
       hull() {
    translate([0.37*d,d/20, 0]) circle(d/20);
    polygon([[0,0],[(d-re)/2,h],[0,h]]);
    }
  

    }
    
    
}

bucket();