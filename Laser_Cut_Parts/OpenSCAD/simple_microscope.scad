include <simple_microscope_params.scad>;
include <BOSL2-master/std.scad>
include <BOSL2-master/rounding.scad>
// Code for creating 2D objects for laser cutting the microscope framework. Doug Juers. Oct 2024.
// The basic procedure is to:
// 1. Measure the thickness of the stock in mm (acrylic or plywood) using a caliper. This has been developed with nominal 3/16" stock in mind. 
// 2. Adjust slot height parameters according to this table. 
// These are the main parameters; see the simple_microscope_params to adjust the others. The main thing that needs to be adjusted are the slot_heights. Rule of thumb for nominal 3/16" stock. d is the thickness in mm measured with a caliper:
//| Material | Design         | Main Slot Height | Sample Platform Slot Height |
//|----------|----------------|------------------|----------------------|
//| Acrylic  | Slot           | d + 0.36 mm      | d + 0.37 mm  (?)     |
//| Acrylic  | Interlocking   | d + 0.42 mm      | d + 0.37 mm          |
//| Plywood  | Slot           | d + 0.27 mm      | d + 0.42 mm          |
//| Plywood  | Interlocking   | d + 0.47 mm      | d + 0.42 mm          |
//
// These values may need adjustment if assembly is difficult
//
// Other parameters that may need tweaking include:
// hex_nut_radius and fine_thread_cylinder_radius, depending on hex nut size and laser kerf

// Main parameters
interlocking_joinery=true;// The default. The slot geometry, which was the original design, is not as stable, but can be a bit easier to assemble.
fine_translation=false; //false = use M3x0.5 hex nut with bolt for translation; true = use Thorlabs M3x0.2 mm translator
draw_labels=false;//false = no labels (use coreldraw template); true = draw labels in openscad - this works but the labels aren't as crisp
main_slot_height=5.42;// See above
sample_platform_slot_height=5.37;// See above
sample_platform_central_hole=true;// false = no central hole in sample platform (ok with acrylic)

// Here we lay out all five pieces at once.

translate([-overall_width-2,-side_height/2])rotate([0,0,90])draw_sample_platform();
rotate([0,0,180]) draw_left_side();
translate([overall_width+2,0,0])draw_right_side();
translate([2*overall_width+4,0,0])draw_top();
translate([3*overall_width+6,0,0])draw_bottom();

/////////////////////////////
// Modules for each piece //
///////////////////////////
module draw_left_side(){
difference(){
square([overall_width,side_height],center=true);
if (interlocking_joinery){
for (i = [0:num_slots-1]) {startx=-overall_width/2+w+i*3*w;starty=side_height/2-outer_height-main_slot_height;
    shape=[[startx,starty],[startx+2*w,starty],[startx+2*w,starty+outer_height+main_slot_height],[startx+w,starty+outer_height+main_slot_height],
    [startx+w,starty+main_slot_height],[startx,starty+main_slot_height]];radii=[0,0,0,0,2.5,0];polygon(round_corners(shape, radius=radii));
}
for (i = [0:num_slots-1]) {startx=-overall_width/2+w+i*3*w;starty=-side_height/2+outer_height+main_slot_height;
    shape=[[startx,starty],[startx+2*w,starty],[startx+2*w,starty-outer_height-main_slot_height],[startx+w,starty-outer_height-main_slot_height],
    [startx+w,starty-main_slot_height],[startx,starty-main_slot_height]];radii=[0,0,0,0,2.5,0];polygon(round_corners(shape, radius=radii));
}}
else{
translate([0,side_height/2-outer_height-main_slot_height/2])square([main_slot_width,main_slot_height],center=true);
translate([0,-(side_height/2-outer_height-main_slot_height/2)])square([main_slot_width,main_slot_height],center=true);}
translate([0,1.6+sample_platform_slot_height/2])square([sample_platform_slot_width,sample_platform_slot_height],center=true);
translate([0,10+sample_platform_slot_height/2])square([sample_platform_slot_width,sample_platform_slot_height],center=true);
if (draw_labels){
translate([9,0])rotate([0,0,180])text("For microscope slides",size=1.5,direction="lrt");
translate([9,18])rotate([0,0,180])text("For thicker samples",size=1.5,direction="lrt");
translate([-(overall_width/2-4.5),side_height/2-13])rotate([0,0,180])text("1",size=1.5,direction="lrt");
translate([-(overall_width/2-4.5),-(side_height/2-3)])rotate([0,0,180])text("3",size=1.5,direction="lrt");
translate([-(overall_width/2-5),8.5])rotate([0,0,180])text("p",size=2,direction="lrt");}
}}

module draw_right_side(){
    difference(){
square([overall_width,side_height],center=true);
if (interlocking_joinery){
for (i = [0:num_slots-1]) {startx=-overall_width/2+w+i*3*w;starty=side_height/2-outer_height-main_slot_height;
    shape=[[startx,starty],[startx+2*w,starty],[startx+2*w,starty+outer_height+main_slot_height],[startx+w,starty+outer_height+main_slot_height],
    [startx+w,starty+main_slot_height],[startx,starty+main_slot_height]];radii=[0,0,0,0,2.5,0];polygon(round_corners(shape, radius=radii));
}
for (i = [0:num_slots-1]) {startx=-overall_width/2+w+i*3*w;starty=-side_height/2+outer_height+main_slot_height;
    shape=[[startx,starty],[startx+2*w,starty],[startx+2*w,starty-outer_height-main_slot_height],[startx+w,starty-outer_height-main_slot_height],
    [startx+w,starty-main_slot_height],[startx,starty-main_slot_height]];radii=[0,0,0,0,2.5,0];polygon(round_corners(shape, radius=radii));
}}
else{
translate([0,side_height/2-5-main_slot_height/2])square([main_slot_width,main_slot_height],center=true);
translate([0,-(side_height/2-5-main_slot_height/2)])square([main_slot_width,main_slot_height],center=true);
}
square([center_slot_width,center_slot_height],center=true); 
if (draw_labels){
translate([-9,21])text("Biophysics",size=3,direction="lrt");
translate([-13,-24])text("k T =4.1 pN\u2022nm",size=3,direction="lrt");
translate([-12.8,-24.5])text("  B  r         ",size=2,direction="lrt");
translate([-(overall_width/2-3.5),side_height/2-3])text("4",size=1.5,direction="lrt");
translate([-(overall_width/2-3.5),-(side_height/2-12.5)])text("2",size=1.5,direction="lrt");}


}
}
module draw_top(){
difference(){
square([overall_width,top_length],center=true);
if (interlocking_joinery){
for (i = [0:num_slots-1]) {startx=-overall_width/2+w+i*3*w;starty=top_length/2-outer_height-main_slot_height;
    shape=[[startx,starty],[startx+2*w,starty],[startx+2*w,starty+outer_height+main_slot_height],[startx+w,starty+outer_height+main_slot_height],
    [startx+w,starty+main_slot_height],[startx,starty+main_slot_height]];radii=[0,0,0,0,2.5,0];polygon(round_corners(shape, radius=radii));
}
for (i = [0:num_slots-1]) {startx=-overall_width/2+w+i*3*w;starty=-top_length/2+outer_height+main_slot_height;
    shape=[[startx,starty],[startx+2*w,starty],[startx+2*w,starty-outer_height-main_slot_height],[startx+w,starty-outer_height-main_slot_height],
    [startx+w,starty-main_slot_height],[startx,starty-main_slot_height]];radii=[0,0,0,0,2.5,0];polygon(round_corners(shape, radius=radii));
}}else{
translate([overall_width/2-5,top_length/2-5])square([10,10],center=true);
translate([-(overall_width/2-5),-(top_length/2-5)])square([10,10],center=true);
translate([overall_width/2-5,-(top_length/2-5)])square([10,10],center=true);
translate([-(overall_width/2-5),top_length/2-5])square([10,10],center=true);}
circle(d=obj_circle_d,$fn=60);
if(draw_labels){
rotate([0,0,180])translate([-(overall_width/2-3.5),-(side_height/2-1.5)])text("4",size=1.5,direction="lrt");
translate([overall_width/2-4.5,-(side_height/2-2)])text("3",size=1.5,direction="lrt");}

}}
    
module draw_bottom(){
difference(){
square([overall_width,bottom_length],center=true);
if (interlocking_joinery){
for (i = [0:num_slots-1]) {startx=-overall_width/2+w+i*3*w;starty=bottom_length/2-outer_height-main_slot_height;
    shape=[[startx,starty],[startx+2*w,starty],[startx+2*w,starty+outer_height+main_slot_height],[startx+w,starty+outer_height+main_slot_height],
    [startx+w,starty+main_slot_height],[startx,starty+main_slot_height]];radii=[0,0,0,0,2.5,0];polygon(round_corners(shape, radius=radii));
}
for (i = [0:num_slots-1]) {startx=-overall_width/2+w+i*3*w;starty=-bottom_length/2+outer_height+main_slot_height;
    shape=[[startx,starty],[startx+2*w,starty],[startx+2*w,starty-outer_height-main_slot_height],[startx+w,starty-outer_height-main_slot_height],
    [startx+w,starty-main_slot_height],[startx,starty-main_slot_height]];radii=[0,0,0,0,2.5,0];polygon(round_corners(shape, radius=radii));
}}
else{

translate([overall_width/2-outer_height,bottom_length/2-outer_height])square([10,10],center=true);
translate([-(overall_width/2-outer_height),-(bottom_length/2-outer_height)])square([10,10],center=true);
translate([overall_width/2-outer_height,-(bottom_length/2-outer_height)])square([10,10],center=true);
translate([-(overall_width/2-outer_height),bottom_length/2-outer_height])square([10,10],center=true);}
circle(d=light_circle_d,$fn=60);
if(draw_labels){
rotate([0,0,180])translate([-(overall_width/2-3),-bottom_length/2+2])text("2",size=1.5,direction="rtl");
translate([overall_width/2-4.5,-(bottom_length/2-2)])text("1",size=1.5,direction="lrt");}

}}

module draw_sample_platform(){
difference(){
polygon(points=[[-6,main_slot_width/2],
        [0,main_slot_width/2],
        [0,overall_width/2],
        [55,overall_width/2],
        [60,center_slot_width/2],
        [82,center_slot_width/2],
        [82,-center_slot_width/2],
        [60,-center_slot_width/2],
        [55,-overall_width/2],
        [0,-overall_width/2],
        [0,-main_slot_width/2],
        [-6,-main_slot_width/2],
        [-6,main_slot_width/2]]);    
if (fine_translation){
translate([nut_center_distance,0])circle(r=fine_thread_cylinder_radius,$fn=60);  
}else{
translate([nut_center_distance,0])circle(r=hex_nut_radius,$fn=6);  
}

// Use this section with acrylic to reduce fracture likelihood when pressing in the nut
if (!fine_translation){
nut_radius=hex_nut_radius;
translate([nut_center_distance-nut_radius,0])circle(r=stress_relief_r,$fn=60);
translate([nut_center_distance+nut_radius,0])circle(r=stress_relief_r,$fn=60);
translate([nut_center_distance+nut_radius/2,nut_radius*sqrt(3)/2])circle(r=stress_relief_r,$fn=60);
translate([nut_center_distance+nut_radius/2,-nut_radius*sqrt(3)/2])circle(r=stress_relief_r,$fn=60);
translate([nut_center_distance-nut_radius/2,nut_radius*sqrt(3)/2])circle(r=stress_relief_r,$fn=60);
translate([nut_center_distance-nut_radius/2,-nut_radius*sqrt(3)/2])circle(r=stress_relief_r,$fn=60);}

//Use this for opaque materials. May need to tweak size and position of the opening.
if (sample_platform_central_hole){translate([36,0])circle(d=sample_circle_d,$fn=60);}
if(draw_labels){
rotate([0,0,-90])translate([16,-3.5])text("p",size=2,direction="lrt");}


}}
