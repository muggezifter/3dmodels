width=45;
height=75;
depth=60;
back_top=10;
top_angle=80;
seat_elevation=40;
seat_height=10;
seat_overhang=3;
bottom_angle=80;
wall_thickness=1.5;
armrest_bool=true;
armrest_height=55;
armrest_width=12;
armrest_overlap=5;

module solid_chair(
    w=width,
    h=height,
    d=depth,
    bt=back_top,
    ta=top_angle,
    se=seat_elevation,
    sh=seat_height,
    so=seat_overhang,
    ba=bottom_angle,
    wt=wall_thickness,
    ab=armrest_bool,
    ah=armrest_height,
    aw=armrest_width,
    ao=armrest_overlap
){
    module armrest() {
        linear_extrude(aw)
            polygon([
                [0,0],
                [d-tan(90-ba)*(se-sh/2),0],
                [d+tan(90-ba)*(ah-(se-sh/2)),ah],
                [0,ah]]);
    }

    module body() {
        linear_extrude(w)
                polygon([
                    [0,0],
                    [d-so-tan(90-ba)*(se-sh),0],
                    [d-so,se-sh],
                    [d,se-sh],
                    [d,se],
                    [bt+tan(90-ta)*(h-se),se],
                    [bt,h],
                    [0,h]
                ]);
    }

    translation=ab?aw-ao:0;

    translate([translation, 0,0])
    rotate([90,0,90])
        union(){
            body();
            if (ab) {
                translate([0,0,ao-aw])
                    armrest();
                translate([0,0,w-ao])
                    armrest();
            }
        }
}



solid_chair();






