use <C__fakepath_Vesa.scad>
// ********************     Parametrics!      ********************

// Set test_piece variable to false for adaptor, true for calibration piece

test_piece=false;				// if true, a calibration piece will be created instead of the adaptor

// I designed this adaptor to mount a M350 ITX case to a VESA75 monitor, for this I used trapped nuts on the VESA100 mounts
// If you are using the adaptor for other purposes this may not suit you, adjust the variables below for different combinations

vesa_75_nut=false;  			// if true, vesa 75 mounts will include a trapped m4 nut, round hole if false
vesa_100_nut=false;			// if true, vesa 100 mounts will include a trapped m4 nut, round hole if false

// Depending on how strong you wish your adaptor to be, you can adjust here the style of adaptors

outer_ring_option=true;			// if true, outer ring will be included
center_piece_option=true;		// if true, center strengthening bars will be included
outer_ring_cutouts_option=true;	// if true, oval cutouts will be added to lighten the outer ring

// Variables, play around with these to calibrate and tweak the dimensions of the adaptor

plate_height=9;				// How high do you wish the plate to be

m4_thread_diameter=5.2;			// Adjust this to suit your printer
m4_nut_diameter=9.5;				// If you are using trapped nuts in the adaptor you can adjust this to suit your printer
m4_washer_diameter=10.2;			// Even if you are using trapped nuts throughout the adaptor, this also adjusts the mount diameters!
m4_head_depth=4;			// Adjust to the max height of either your bolt head or nut (whichever is the larger)

mount_chunkiness=2;			// how thick are the walls of the mount around the screw_head

cutout_width=10;				// If using an outer strengthening ring, this adjusts the width of the oval cutout
cutout_length=24;			// If using an outer strengthening ring, this adjusts the length of the oval cutout
cutout_gap=5;				// If using an outer strengthening ring, this adjusts the gap between the oval cutouts

// ********************     Here comes the code!     ********************

// Main bit of code
module quickmount() {
  difference() {
    union() {
    translate([-50,-50,0])
    {
      vesa75();
      outer_ring();
      }
      translate([0,0,2.5])cube([200,200,5],center=true);
    }
    translate([-50,-50,0])
    vesa_holes();
    quickmount_shadow();
  }
}
module quickmount_shadow() {
  difference() {
    translate([0,0,2.5])cube([100,100,5],center=true);
    translate([-50,-50,0])
    {
      vesa75();
      outer_ring();
    }
  }
}
difference() {
  union() {
    translate([0,10,0])cube([50,40,50]);
    translate([-150,10,0])cube([50,40,50]);
    translate([-50,-50,0]) quickmount();
  }
  translate([0,0,7])cube([50,40,32]);
  translate([-150,0,0])translate([0,0,7])cube([50,40,32]);
}
