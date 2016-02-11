// An external SATA to USB 3 Disk enclosure
// Copyright (c) R. Linder
// This work is licensed under a Creative Commons Attribution 4.0 International License.

// Another example of how trivial it is to use OpenScad, and using slic3r
// or something similar to split the stl into two printable halves.
// NB !! This is for a 7mm disk, adjust if needed.

include <MCAD/shapes.scad>

module housing ()
{
    difference ()
    {
        roundedBox (11, 76, 115, 1);
        union ()
        {
            translate ([0,0,0]) roundedBox (8, 72, 112, 1);
            rotate ([90,0,0]) translate([0,-115/2+26.5,0])cylinder (r=2, h=78, center = true);
            rotate ([90,0,0]) translate([0,-115/2+26+77,0])cylinder (r=2, h=78, center = true);
            // usb3 7 up + 2
            translate ([1.2,-7.75,-115/2]) roundedBox (4,14,5,1);
            
            // Slice box in 2 parts
            translate([5,0,0]) rotate ([0,30,0]) cube ([11.5, 100, 0.1], center=true);
            translate([-5,0,0]) rotate ([0,-30,0]) cube ([11.5, 100, 0.1], center=true);
        }
    }
}


housing();