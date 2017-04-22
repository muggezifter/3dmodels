ro=100;
ri=20;


module segment() {
    difference() {
        polygon([[0,0],[tan(36)*ro,ro],[tan(36)*-ro,ro]]);
        square(2*ri,true);
    }
}

for (i = [0:4]){
    rotate([0,0,i*72]) segment();
}
