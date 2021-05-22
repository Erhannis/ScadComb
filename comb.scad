/**
A cord lock, like on your blinds, the thing where
you pull it to raise the blinds, and depending on the
angle you let go it either lets the blinds down,
or catches.

Save each of the three pieces (gear, lid, body)
to their own STL; I don't think they're quite
z-aligned, and I had a print fail because
I didn't notice.

Careful!  Make sure the lip is present on the body (if not DUMMY mode).
Flush caches and rerender if it's not present.
*/

use <deps.link/BOSL/nema_steppers.scad>
use <deps.link/BOSL/joiners.scad>
use <deps.link/erhannisScad/misc.scad>
use <deps.link/erhannisScad/auto_lid.scad>
use <deps.link/scadFluidics/common.scad>
use <deps.link/quickfitPlate/blank_plate.scad>
use <deps.link/getriebe/Getriebe.scad>
use <deps.link/gearbox/gearbox.scad>

$FOREVER = 1000;
$fn = 60;

BODY_L = 131;
BODY_H = 2.5;
TINE_L = 30;
TINE_W = 1.5;
TINE_GAP = 2+TINE_W;
SPINE_W = 10;

linear_extrude(height=BODY_H) {
    ty(-SPINE_W/2) channel([SPINE_W/2,0],[BODY_L-SPINE_W/2,0],d=SPINE_W,cap="circle");
    ty(-SPINE_W/4) channel([0,0],[BODY_L,0],d=SPINE_W/2,cap="none");

    tx(TINE_W/2) {
        for (i=[0:37]) {
            tx(TINE_GAP*i) channel([0,0],[0,TINE_L],d=TINE_W,cap="circle");
        }
    }

    BRACE_W = TINE_W*3;
    ctranslate([BODY_L-BRACE_W,0,0]) tx(BRACE_W/2) channel([0,0],[0,TINE_L],d=BRACE_W,cap="circle");
}