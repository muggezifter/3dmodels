cabin_width=125;
roof_thickness=4;
roof_overhang=5;

module roof(cw=cabin_width,ro=roof_overhang,rt=roof_thickness){
    cube([cw+(2*ro),cw+(2*ro),rt], true);
}

roof();