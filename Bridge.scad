// The width and height of each basswood piece (in mm)
basswood_dimentions = 1;
// The diameter of the lower arch of the bridge
lower_arc_diameter = 250;

// The lower arc of the bridge
arc(basswood_dimentions * 10, basswood_dimentions * 5, /*lower_arc_diameter/2*/20, 180);


// This measures an arc of (10,5,125,180) to have a height of 105 
// An arc of (10,5,40,180) has a height of ~30
cube_height = 10;
rotate([0,0,180]) {
    translate([0,-5,0])
        cube(cube_height,cube_height,cube_height);
    translate([cube_height,-5,0])
        cube(cube_height,cube_height,cube_height);
    translate([cube_height*2,-5,0])
        cube(cube_height,cube_height,cube_height);
    //translate([cube_height*3,-5,0])
      //  cube(cube_height,cube_height,cube_height);
    //translate([cube_height*4,-5,0])
      //  cube(cube_height,cube_height,cube_height);
    //translate([cube_height*5,-5,0])
      //  cube(cube_height,cube_height,cube_height);
    //translate([cube_height*6,-5,0])
      //  cube(cube_height,cube_height,cube_height);
    //translate([cube_height*7,-5,0])
      //  cube(cube_height,cube_height,cube_height);
    //translate([cube_height*8,-5,0])
        //cube(cube_height,cube_height,cube_height);
    //translate([cube_height*9,-5,0])
        //cube(cube_height,cube_height,cube_height);
    //translate([cube_height*10,-5,0])
      //  cube(cube_height,cube_height,cube_height);
    //translate([cube_height*11,-5,0])
        //cube(cube_height,cube_height,cube_height);
}
/* 
 * Excerpt from... 
 * 
 * Parametric Encoder Wheel 
 *
 * by Alex Franke (codecreations), March 2012
 * http://www.theFrankes.com
 * 
 * Licenced under Creative Commons Attribution - Non-Commercial - Share Alike 3.0 
 * Height = X-Axis width of arc
 * Depth = The Z-Axis value of the arc
 * Radius = Half of the Y-Axis value for the length of this arch
 * Degrees = How many degrees of the arch to make (180 = full arch, 90 = half an arch)
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