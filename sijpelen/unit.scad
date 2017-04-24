use <../shared/bucket.scad>
use <modules/pipe.scad>

pipe_length=800;


module unit(l=pipe_length) {
    
    translate([0,0,220]) pipe(l);
    bucket(350,300);
}

unit();