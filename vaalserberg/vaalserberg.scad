use <../shared/highchair.scad>

difference() {
    
    union(){
        difference() {
        linear_extrude(30)  polygon([
            [-2250,-5000],
            [-2250,4000],
            [2250,4000],
            [2250,-5000]
            ]);
        for(w = [-2350:85:2350])
            translate([w,-5000,20])cube([5,10000,50]);
        }
        translate([-2250,-2000]) cube([2000,6000,2800]);
        translate([-2250,-5000]) cube([100,10000,2800]);
        
        difference(){
        union(){
        for (n=[-4840:1400:4500])
            translate([-2249,n,2000])cube([4499,40,60]);  
        for (n=[-4120:1400:4000])  
            translate([-2249,n,2430]) 
            scale([1,1360/2000,1])
            cloth(4499);
        }
        translate([1100,3040,1400]) cylinder(1000,200,200);
        translate([1360,-4200,1400]) cylinder(1000,200,200);
        translate([-1500,-2700,1400]) cylinder(1000,200,200);
    }
   
    }
    translate([-2350,-1900,-100]) cube([2000,7000,3000]);
}

 



translate([-900,-2700,28]) 
rotate([0,0,89.99])
highchair();
translate([1100,2400,28]) highchair();
translate([1000,-3700,28]) rotate([0,0,215]) highchair();

module cloth(width) {
rotate([90,0,90])
intersection(){
translate([-1000,-1000,-5])cube([2000,1000,width+10]);
linear_extrude(width) {
    difference(){
        resize([3000,1000])circle(d=2000,$fn=100);
        resize([2995,995])circle(d=2000, $fn=100);
    }
}
}
}

