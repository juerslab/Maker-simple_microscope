// Adaptor to hold tubing to be directed at windows of CD250
$fa=5;
$fs=0.1;// 
thick=5;// 
dia=15;//
sw=1.5;//spanner_width
st=0.8;//spanner_thickness
sd=5.5;//spanner_diameter
difference(){
union(){
cylinder(h=thick,d=dia);
translate([-dia/2,-sw/2,thick])cube([dia,sw,st]);
rotate(a=90,v=[0,0,1])translate([-dia/2,-sw/2,thick])cube([dia,sw,st]);
}
translate([0,0,thick])cylinder(h=5,d=sd);
}