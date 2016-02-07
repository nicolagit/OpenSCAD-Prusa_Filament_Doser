$fn = 60;

//engravepercente is from 0 to 100
//close to 0 you get a full bow
//close to 100 you get a thin bow 
module bow(height, filamentthickness, bowthickness, engravepercent) {
        bowdiameter = filamentthickness + bowthickness;
        difference() {
                cylinder(d=bowdiameter, h = height, center = true);
                cylinder(d=filamentthickness, h = height, center = true);
                translate([ (bowdiameter - (bowdiameter * engravepercent/100)) /2, 0, 0]) {
                        cube([ bowdiameter * engravepercent/100, bowdiameter,height - (bowthickness * 2)], center = true
                        );
                }
        }
}

bow(125, 1.5, 1, 90);

