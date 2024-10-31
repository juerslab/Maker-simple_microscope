// Adaptor to hold camera over objective lens
// Camera is the Arducam X002BU078X
// There is an old version and new version.
include <BOSL2-master/std.scad>
include <BOSL2-master/threading.scad>
$fa=5;
$fs=0.1;
width=46;// Old:40/ New: 40
length=46;// 
depth=14.5;//13.5 was the original.14.5 is the default...
cwidth=38.3;//camera board width: Old: 32.2 / New: 38.5
objdia=19.75;//nominal diameter of objective threads (20.25 first; then decrease...)
//for makerbot this is too small
rotate([90,0,0]){
difference(){
    translate([length/2,width/2,(depth+2)/2]) cuboid([length,width,depth+2],rounding=1);
//    cube([length,width,depth+2]);
    translate([(width-cwidth)/2-0.5,(width-cwidth)/2-2.0,depth-5])cube([cwidth+1,cwidth+1+10,1.75]);//board slot - new
//    translate([(width-cwidth)/2-0.5,(width-cwidth)/2-0.5,depth-5])cube([cwidth+1,cwidth+1+10,2]);//board slot - old
    translate([(width-cwidth)/2+2.0,(width-cwidth)/2,depth-9])cube([cwidth-4,cwidth+10,4]);//opening below
    translate([(width-cwidth)/2+2.0,(width-cwidth)/2,depth-3.3])cube([cwidth-4,cwidth+10,2]);//opening for electronics on top of board
    translate([width/2-5,width/2,depth-10])cube([10,width/2,2]);//opening for camera   
    translate([width/2,width/2,(depth-7)/2]) threaded_rod(d=1.2*25.4,l=depth-7,pitch=2);//Threaded opening to receive objective camera housing adapter
//    translate([width/2,width/2,0])cylinder(depth-7,d=objdia+1);//Original unthreaded opening

    translate([width/2-10.65,30.5+1.0,8])cube([8.0,20,100],center=false);//opening for usb cable connector - new only
    

}}