// Adaptor to hold tubing to be directed at windows of CD250
$fa=5;
$fs=0.1;// 
spacer_thickness=4;// 
difference(){
union(){
    cylinder(h=spacer_thickness,d=30);
    translate([0,0,spacer_thickness])cylinder(h=5,d=22.5);
}
cylinder(h=5+spacer_thickness,d=20.5);
}