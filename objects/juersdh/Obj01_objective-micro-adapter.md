# Parts for simple_microscope (3D printed)
## Objective - camera housing
### Version 1
For the initial camera board.
9/25/2024
Am updating this to include threads (see below in Version 3)

### Version 2
For the next generation camera board, which has a somewhat different formfactor.

### Version 3. (Sept 2024). 
Wanting to update the design to include threads for the objective. In V1 & V2, the objective is held onto the adapter with a rubber band. Using threads may make this more stable.

For the threads, I'm using the BOSL2 library. The RMS threads on the objective are pretty fine, and it seems that using the Raise3D printer yields decent RMS threads only when the thread axis is perpendicular to the build plate. This in turn then requires supports. So I will be trying two different variants of Version 3.

#### Version 3a
The adapter will include rather than a cylindrical hole for the object, a threaded cylindrical hole to receive a threaded ring that the objective will be attached to. The code is something like this:

##### Main body
For the main body:
difference(){
    cube([length,width,depth+2]);
    translate([(width-cwidth)/2-0.5,(width-cwidth)/2-2.0,depth-5])cube([cwidth+1,cwidth+1+10,2]);//board slot - new
//    translate([(width-cwidth)/2-0.5,(width-cwidth)/2-0.5,depth-5])cube([cwidth+1,cwidth+1+10,2]);//board slot - old
    translate([(width-cwidth)/2+2.0,(width-cwidth)/2,depth-9])cube([cwidth-4,cwidth+10,4]);//opening below
    translate([(width-cwidth)/2+2.0,(width-cwidth)/2,depth-3])cube([cwidth-4,cwidth+10,2]);//opening for electronics on top of board
    translate([width/2-5,width/2,depth-10])cube([10,width/2,2]);//opening for camera   
    **translate([width/2,width/2,(depth-7)/2]) threaded_rod(d=1.2*25.4,l=depth-7,pitch=2); // threaded opening to receive objective ring**
    translate([width/2-10.65,30.5+1.0,8])cube([8.0,20,100],center=false);//opening for usb cable connector - new only}

Next, camera board slides in easily, but also slides out easily. Need either a tighter fit or some kind of latching mechanism. First try tighter fit by reducing slot size.
- 2.0 mm - too large (in & out easily)
- 1.6 mm - too thin (can't get in)
- 1.8 mm - too large by a smidge
- 1.7 mm - this is pretty good. It goes in relatively smoothly and then stays put. (Sometimes - other times too tight.)
- 1.75 mm - seems better(?) 

9/23/2024
Next, it would be nice to have rounded corners. This can be done with the BOSL2 library.
Also move the opening for the USB connector over to try to center camera better:
- 0.2 mm - this actually looks off center; so I go back to zero.

Rounded corners with radius 1 are ok. radius 2 looks better, except on the surface contacting the build plate. The brim seems stuck. So I go back to 1.

## Objective - camera housing adapter
And the objective ring:
difference(){
    translate([0, 0, 0]) threaded_rod(d=1.2\*25.4-0.5,l=hole_depth,pitch=2);
    translate([0,0,0]) threaded_rod(d=0.8*25.4+0.5,l=hole_depth,pitch=0.7055,
        ibevel=false,bevel=false,$slop=0.05,$fa=1,$fs=1);}

Note: RMS threads are 36 threads per inch, which translates to a pitch of 0.7055 (25.4 mm/36). For the other side I picked a pitch of 2 randomly - just something larger than 0.7. 
One tricky part is getting the diameters correct. The female and male parts can't have the same diameter or the male part gets stuck. I try a few fudge factors. 

For the RMS threads:
- 0.7 mm is too large. The objective slides off and on easily.
- 0.6 mm is pretty good. The objective slide on a ways, and then screws on completely.
- 0.5 mm is too small. The threads engage immediately but the objective doesn't screw on completely.

Possibly I need to go to the next decimal place to optimize the fit. I also wonder if beveling would help limit the cross threading which seems to be hard to avoid.

For the outside threads:
- 1.0 mm is too small. The threads engage immediately, but the ring doesn't screw on completely.
- 1.5 mm is pretty good. The threads engage immediately and the ring can be screwed completely through the hole.

Added a stop to prevent the ring from going to far into the main body.

Settled on 1.5 mm and 0.6 mm.

Now trying intermediate values.
- 0.58 - 0.50. Actually 0.50 appears to work, except theres a hard spot to screw past. Once past that, though, the threads are then loose. I try to eliminate this hard spot by adding a bevel. This worked. So now try smaller values:
- 0.48 - pretty good. Goes on smoothly, but a little lose 
- 0.45 - Goes on a little hard.
- 0.46 - This is good. Goes on smoothly without much play.

9/24/2024
Add tabs to make it easier to remove.

## Objective vertical spacer
There are two (at least) different objectives from Amscope, with slightly different shapes. The skeleton is made for one of the
shapes, and this adapter is needed for the other shape.

## Camera lens remover
No changes were made to this file.
