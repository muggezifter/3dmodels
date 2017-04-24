length=800;
diameter=200;

module pipe(l=length,d=diameter) {
 //diameter
    r=d/2;
    wt=1;
    linear_extrude(l)
    difference() {
        circle(r);
        circle(r-wt/2);
    }
}

pipe();