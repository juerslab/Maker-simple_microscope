// Adaptor to hold camera over objective lens
$fa=5;
$fs=0.1;
width=40;// 
length=40;// 
depth=14.5;//
cwidth=33;//camera board width
objdia=20.25;//nominal diameter of objective threads
include <BOSL2-master/std.scad>
include <BOSL2-master/threading.scad>
//for makerbot this is too small
difference(){
    translate([length/2,width/2,(depth+2)/2]) cuboid([length,width,depth+2],rounding=1);
    translate([(width-cwidth)/2,(width-cwidth)/2,depth-5])cube([cwidth,cwidth+10,1.78]);//board slot
    translate([(width-cwidth)/2+1.5,(width-cwidth)/2+1,depth-9])cube([cwidth-3,cwidth-2+10,4]);//opening below
    translate([(width-cwidth)/2+1.5,(width-cwidth)/2+1,depth-3.22])cube([cwidth-3,cwidth-2+10,2.25]);//opening for electronics on top of board 
    translate([width/2-5,width/2,depth-10])cube([10,width/2,2]);//opening for camera   
    translate([width/2,width/2,7/2]) threaded_rod(d=1.2*25.4,l=7,pitch=2);//Threaded opening to receive objective ring
//    translate([width/2,width/2,0])cylinder(depth-7,d=objdia+1);//Original unthreaded opening

 
    translate([width/2,width/2,0])cylinder(5+2,d=20.25+1);

}