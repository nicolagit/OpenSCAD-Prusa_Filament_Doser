$fn = 60;

//engravepercente is from 0 to 100, close to 0 you get a full bow, close to 100 you get a thin bow 
//add some tolerance for filamentthickness
module bow(height, filamentthickness, bowthickness, engravepercent) {
        bowdiameter = filamentthickness + bowthickness;
        translate([-bowdiameter/2, 0, height/2]) {
                rotate([0, 0, 180]) {
                        difference() {
                                cylinder(d=bowdiameter, h = height, center = true);
                                cylinder(d=filamentthickness, h = height, center = true);
                                translate([ (bowdiameter - (bowdiameter * engravepercent/100)) /2, 0, 0]) {
                                        cube([ bowdiameter * engravepercent/100, bowdiameter,height - (bowthickness * 2)], center = true
                                        );
                                }
                        }
                }
        }
}

module clip(frameheight, framethickness, clipthickness) {
       translate([0, -10,0]) { 
                difference() {
                       cube([framethickness + (2 * clipthickness), 20, frameheight + clipthickness]);
                        translate([clipthickness, 0, 0]) {
                                cube([framethickness, 20, frameheight]);
                        }
                }
        }
}


bow(150, 2, 1, 90);
clip(50, 5, 2);
