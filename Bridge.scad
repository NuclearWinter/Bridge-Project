// The width and height of each basswood piece (in mm)
basswood_dimentions = 1;
// The diameter of the lower arch of the bridge
lower_arc_diameter = 250;

// The lower arc of the bridge
arc(basswood_dimentions * 10, basswood_dimentions * 5, /*lower_arc_diameter/2*/70, 180);

/* 
 * Excerpt from... 
 * 
 * Parametric Encoder Wheel 
 *
 * by Alex Franke (codecreations), March 2012
 * http://www.theFrankes.com
 * 
 * Licenced under Creative Commons Attribution - Non-Commercial - Share Alike 3.0 
 * Height = X-Axis width (thickness) of arc
 * Depth = The Z-Axis value of the arc
 * Radius = Half of the Y-Axis value for the length of this arch
 * Degrees = How many degrees of the arch to make (180 = full arch, 90 = half an arch)
 * The height (distance from [0,0,0] to the bottom of the arches center) = radius-10
 */
module arc( height, depth, radius, degrees ) {
    // This dies a horible death if it's not rendered here 
    // -- sucks up all memory and spins out of control 
    render() {
        difference() {
            // Outer ring
            rotate_extrude($fn = 100)
                translate([radius - height, 0, 0])
                    square([height,depth]);
         
            // Cut half off
            translate([0,-(radius+1),-.5]) 
                cube ([radius+1,(radius+1)*2,depth+1]);
         
            // Cover the other half as necessary
            rotate([0,0,180-degrees])
            translate([0,-(radius+1),-.5]) 
                cube ([radius+1,(radius+1)*2,depth+1]);
         
        }
    }
}

/*
 * Module to measure the distance between two points 
 * 
 * by nophead, Febuary 11 2013, on the OpenSCAD forum
 * http://forum.openscad.org/Measurement-tool-td3821.html
 */
module cylinder_ep(p1, p2) {
	vector = [p2[0] - p1[0],p2[1] - p1[1],p2[2] - p1[2]];
	distance = sqrt(pow(vector[0], 2) +	pow(vector[1], 2) +	pow(vector[2], 2));
	echo(distance);
	translate(vector/2 + p1)
	//rotation of XoY plane by the Z axis with the angle of the [p1 p2] line projection with the X axis on the XoY plane
	rotate([0, 0, atan2(vector[1], vector[0])]) //rotation
	//rotation of ZoX plane by the y axis with the angle given by the z coordinate and the sqrt(x^2 + y^2)) point in the XoY plane
	rotate([0, atan2(sqrt(pow(vector[0], 2)+pow(vector[1], 2)),vector[2]), 0])
	cylinder(h = distance, r = 0.1, center = true);
}