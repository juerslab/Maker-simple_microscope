// Variables that determine the geometry of the microscope;
// 
$fn=36;
overall_width = 57;
side_height = 80;
top_length = 80;
bottom_length = 100;
obj_circle_d = 22.4;//Nominal diameter of objective
light_circle_d = 35.0;//Just needs to be wide enough for the light source
sample_circle_d = 30.0;
hex_nut_radius=3.0;//For hex nut
fine_thread_cylinder_radius=2.425;//For thorlabs fine thread cylinder (F3ESK1)
num_sides = 60;//6 for hex nut; 60 for thorlabs fine thread cylinder
nut_center_distance = 75.8;
stress_relief_r = 0.2;
main_slot_width=40;
main_slot_height=4.8;//Needs to be slightly larger than the thickness of the material (accounding for the kerf on the laser cutter)
// Rough values are 5.05 
sample_platform_slot_width=40;
sample_platform_slot_height=4.75;//Needs to be slightly larger than the main_slot_height
center_slot_width=34;//For "right" side, and for tab on sample platform
center_slot_height=34;// For "right" side
// Parameters for interlocking joinery
interlocking_joinery=true;
outer_height=5;
num_slots=3;
w=overall_width/(2+(num_slots-1)*3);


 