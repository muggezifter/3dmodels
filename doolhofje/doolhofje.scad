width=3000;
wall_thickness=70;

module doolhofje(tw=width,w=wall_thickness){
    c=(tw-7*w)/6;
    
    linear_extrude(tw/6)
    translate([-tw/2,-tw/2]) polygon([
        //0-10:
        [0,0],
        [3*c+4*w,0],
        [3*c+4*w,c+2*w],
        [2*c+2*w,c+2*w],
        [2*c+2*w,c+w],
        [3*c+3*w,c+w],
        [3*c+3*w,w],
        [w,w],
        [w,2*c+2*w],
        [c+w,2*c+2*w],
        //11-20:
        [c+w,c+w],
        [c+2*w,c+w],
        [c+2*w,3*c+4*w],
        [c+w,3*c+4*w],
        [c+w,2*c+3*w],
        [w,2*c+3*w],
        [w,6*c+6*w],
        [2*c+2*w,6*c+6*w],
        [2*c+2*w,5*c+6*w],
        [c+w,5*c+6*w],
        //21-30:
        [c+w,5*c+5*w],
        [2*c+3*w,5*c+5*w],
        [2*c+3*w,6*c+6*w],
        [3*c+3*w,6*c+6*w],
        [3*c+3*w,4*c+5*w],
        [c+w,4*c+5*w],
        [c+w,4*c+4*w],
        [2*c+2*w,4*c+4*w],
        [2*c+2*w,2*c+2*w],
        [5*c+6*w,2*c+2*w],
        //31-40:
        [5*c+6*w,2*c+3*w],
        [4*c+5*w,2*c+3*w],
        [4*c+5*w,5*c+6*w],
        [4*c+4*w,5*c+6*w],
        [4*c+4*w,2*c+3*w],
        [2*c+3*w,2*c+3*w],
        [2*c+3*w,4*c+4*w],
        [3*c+3*w,4*c+4*w],
        [3*c+3*w,6*c+6*w],
        [6*c+6*w,6*c+6*w],
        //41-50:
        [6*c+6*w,4*c+5*w],
        [5*c+6*w,4*c+5*w],
        [5*c+6*w,5*c+5*w],
        [5*c+5*w,5*c+5*w],
        [5*c+5*w,4*c+4*w],
        [6*c+6*w,4*c+4*w],
        [6*c+6*w,w],
        [4*c+5*w,w],
        [4*c+5*w,c+w],
        [5*c+6*w,c+w],
        //50-56:
        [5*c+6*w,c+2*w],
        [4*c+4*w,c+2*w],
        [4*c+4*w,0],
        [6*c+7*w,0],
        [6*c+7*w,6*c+7*w],
        [0,6*c+7*w]
    ]);
}
doolhofje();