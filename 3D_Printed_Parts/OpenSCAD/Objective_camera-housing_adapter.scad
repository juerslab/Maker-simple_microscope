// Adaptor to attach objective to the camera housing. 
// internal threads are RMS to match the objective. External threads match the threads on the camera housing.
include <BOSL2-master/std.scad>
include <BOSL2-master/threading.scad>
$fa=5;
$fs=0.1;
width=46;// Old:40/ New: 40
length=46;// 
depth=14.5;//13.5 was the original.14.5 is the default...
hole_depth=6;
cwidth=38.3;//camera board width: Old: 32.2 / New: 38.5
objdia=19.75;//nominal diameter of objective threads (20.25 first; then decrease...)
//for makerbot this is too small
rotate([180,0,0]){
difference(){
union(){
difference(){
    translate([0, 0, 0]) threaded_rod(d=1.2*25.4-1.5,l=hole_depth,pitch=2);
    translate([0,0,0]) threaded_rod(d=0.8*25.4+0.46,l=hole_depth,pitch=0.7055,
        bevel=false,$slop=0.05,$fa=1,$fs=1);}
difference(){    
translate([0,0,hole_depth/2-1])cylinder(h=1,d=1.2*25.4);//This part is a stop to prevent the ring from going too far.
translate([0,0,hole_depth/2-1])cylinder(h=1,d=1.2*25.4-5);}
translate([(1.2*25.4-5)/2+2,-3.5,hole_depth/2-1])cube([4,7,1]);//Tabs to make it easier to remove
translate([-(1.2*25.4-5)/2-6,-3.5,hole_depth/2-1])cube([4,7,1]);

}
translate([0,0,hole_depth/2-1])cylinder(h=1,d1=0.8*25.4+0.46,d2=0.8*25.4+2);//Bevel to match the part of the objective lacking threads.
}}