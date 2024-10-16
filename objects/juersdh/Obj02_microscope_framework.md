# Notes for development of the microscope framework
9/24/2024
The framework is made of 4 pieces of laser cut 1/8" acrylic sheet, with a fifth piece used as a platform to hold the sample. The platform height can be adjusted finely on one side, and has two positions possible for the other side.   

Because the acrylic can be slippery, the rubber band used to hold the camera/objective adapter on the objective was also used to hold the framework together. Since I am obviating the need to hold the camera/objective adapter on the objective by threading the adapter, it would be nice if the framework held together in a different way.

If the framework is built out of plywood, it stays together pretty well without the rubber band. So I will be switching to plywood.


### Build aspects 
- plywood
- added numerical guides to aid in assembling framework
- added some other text on the framework
- increased height of window for adjusting hex bolt to make it easier for fingers to fit
- need to move out the hex nut hole just a bit 

9/25/2024

I did these things, and made a couple frameworks out of 1/8" plywood. However, a new(ish) problem appears, which is that the field of view oscillates. So I investigate these oscillations

### Oscillations

The amplitude appears to be perpendicular to the ~mirror plane of the framework. It's larger with the newer camera. When I tap the table, the oscillations are in this direction. The seemy to be worse with the wooden framework than the acrylic framework. If I add a rubber band around the framework they are a bit smaller. So it could be:
- the framework is less stiff in this direction
- the objective/camera combo swings in this direction


The wooden frame appears to be less stiff than the acrylic frame, when flexing in my hand.

#### Attempts to reduce the oscillations
- Putting the wooden frame on a piece of open cell foam improved things a lot.
- The amplitude also depends on the surface. On one table the oscillations are larger than on another table.

Tried using thicker stock - 3/16" acrylic. This worked quite well. So will switch to thicker. 
- Tried with 1/4" acrylic. But this seems less forgiving to bending, and will probably fracture after fewer cycles of assembly/disassembly.
- So 3/16" seems to be the way to go. The stuff I used was sourceone 0.18" thick by spec and 0.17" thick by caliper. I ordered more of this - will be here on monday. Will also try 3/16" plywood.

Would also be good to switch to fine thread bolts. For M3 coarse, the pitch is 0.5

#### Further work.
9/26/2024
Made adjustments to build the whole thing out of 3/16" acrylic. This seems to be ok. Possibly is more stable, but will need a bigger knob to turn than just the screw... (maybe a screwdriver, or one of these: https://www.thorlabs.com/thorproduct.cfm?partnumber=MAS20)
Probably should make the slot a little wider so there's less stress on the acrylic. 

9/29/2024
Working in 3/16" acrylic...
Increased the width of the slot to receive the 3/16" sample platform. 
- .45 cm was too small
- .5 was too large
- .46 seems ok - not much stress when in focus, but enough to keep things stable
** The problem could be that if the material is a different thickness it might not work very well.

Cutting some new frames.
for 3/16" acrylic:
-raster s90p25 is ok
-vector s40p100 leaves a ragged edge on a few
-vector s35p100 is better

for 3/16" plywood:
- raster s90p25 was a little dim
- raster s90p30 was a little better
- vector s70p50 didn't quite cut all the way through; maybe two passes?
- vector s70p60 did ok. Still need to punch things out, but not too much fire :)
- vector s80p60/raster s90p20 with two passes did ok for the engraving but too burnt for vector
- vector s90p40/raster s90p20 with two passes did ok for the engraving but too burnt for vector
- vector s70p65 seems good
- vector s70p70 seems too ragged on top surface



Note the new acrylic and plywood are a little thicker. So try wider slots.
for plywood:
- 5 mm wide slots were too narrow;
- 5.1 mm side slots were good

For the 0.187" acrylic
- 5.1 mm slots were a bit wide (ok, but not a tight fit)MiM
- 5.05 mm slots are good

There are thus several file sets, with varying slot heights




10/2/2024
Modified approach to use OpenSCAD, rather than manual building in QCAD. This will allow for simpler varying of the two key parameters. In Openscad, these parameters seem pretty good



10/3/2024
4.88 mm plywood
5.1/5.2 is a little tight
5.15/5.25 is a little better
platform:
main hole needs to move over
nut hole could be a little smaller

"Final" parameters

|Stock type	Thickness	Main Slot Height	Platform Slot Height		Nut radius	
Acrylic- 3/16" SourceOne.org X000CYOJ25 (newer)	4.69 mm/0.185"	5.05 mm		5.17 mm	3.00 mm
Acrylic- 3/16" SourceOne.org X000CYOJ25 (older)	4.25 mm/0.168"	
Plywood- 3/16" 									4.88 mm/		5.15 mm		5.30 mm	2.95 mm


10/7/2024
Trying a new design for the joinery - interlocking. This will hopefully fix the problem that the 
framework can just fall apart if it gets loose. This can be a problem especially with the 
acrylic framework. 
With plywood: 
Slot_height = 5.15. Too hard to assemble.
Slot height = 5.4. Too wobbly
Slot height = 5.25. Still very hard to assemble.
Slot height = 5.33. Still very snug (?)

10/8/2024
Getting the slots to initially slide is difficult. So I try to round the corners...
Slot height = 5.3 with rounded corners on tabs. Pretty hard to assemble...
Slot height = 5.35 with rounded corners on tabs. Still very hard to assemble?

Measuring slot heights with caliper.
Designed	Measured
5.15		5.15
5.25		5.25
5.3			5.26
5.33		5.4
5.35		5.41
5.4			5.44

Not sure if this design is good for plywood. Try with acrylic.

New sourceone 3/16. Thickness is 4.27 mm with caliper (not 4.69).

Try 5.3 - very wobbly
Try 4.9 - still wobbly
Try 4.5 - too tight! It broke when I disassembled it.

Not sure if this design is good for acrylic :)

Next sheet of sourceone 3/16" (4.33 mm with caliper)
Try 4.7 - this isn't terrible, but it actually not easy to get completely assembled. 

A couple possible solutions:
1. Use only two teeth for the top piece.
2. Make the teeth opening wider on the top piece, so only the teeth on the tops of the sides are engaging. 

Also need more reliable acrylic thicknesses. So I try a new source: 
https://www.canalplastic.com/
I ordered 3/16" cast acrylic. It's about $6/square foot + shipping (from NYC), which turns out to be cheaper than sourceone from Amazon.

10/10/2024
There are a couple problems here:
1. There appears to be about 10% variability in the thickness of the acrylic. For instance, from canalplastic: "Pre-cut sizes are nominal and subject to a +/- 1/8" cutting tolerance." I'm guessing that the thickness variation for 3/16" plywood is less.
2. The acrylic has pretty high friction with itself.

Current parameters/procedure for nominal thickness of 3/16. Measure the thickness of the stock (d in mm). Then create files according to the following:
| Material | Design         | Main Slot Height | Platform Slot Height |
|----------|----------------|------------------|----------------------|
| Acrylic  | Slot           | d + 0.36 mm      | d + 0.37 mm  (?)     |
| Acrylic  | Interlocking   | d + 0.42 mm      | d + 0.37 mm          |
| Plywood  | Slot           | d + 0.27 mm      | d + 0.42 mm          |
| Plywood  | Interlocking   | d + 0.47 mm      | d + 0.42 mm          |

- Redo code to output all 5 pieces at once. I had to reduce the overall width to 57 mm from 60 mm to get the whole shebang to 
be less than 12" wide.
- Try interlocking with d=4.32 mm; main slot height = platform slot height = 4.80 mm; this was pretty good for assembly, but the platform slot height was a little too big.
- Try again with 4.8, 4.75. This is pretty good. But the lower platform slot is tight. Need to drop down the lower limit of the right side about 1-2 mm. 

10/11/2024
- Increased the window height on the right side.
- Added the option to print text within openscad. I'm not sure the most efficient approach. Printing the text in openscad requires selecting and editing the linewidth of all the text in coreldraw once imported. It might be easier just to type the text in coreldraw. Two workflows:
1.
    - Export pieces from openscad as dxf without labels
    - Import into coreldraw. Add labels in coreldraw.
2.
    - Export pieces from openscad as dxf with labels.
    - Import into coreldraw. Select labels and increase linewidth so the labels are engraved.

I think workflow 1 is the way to go. It's a lot of work to select the labels each time when tweaking things. I have a labels template in coreldraw that can be used to import labeless pieces into, and then position in place by hand. 
It would be interesting to see if one can specify the linethickness in the dxf file. 
Now producing a few in acrylic that's 4.32 mm thick.
4.8 for main slot height is a bit too large - the framework is a bit wobbly
4.75 is also a bit too large for the platform slot height - the sample platform barely flexes at parallel to the top plate
But 4.7 is to small - it broke when I was disassembling it. 

In the end, I went with main height = 4.75, platform height = 4.70 (for d=4.33 mm). So we have constants of 0.42 mm and 0.37 mm.

10/15/2024
Producing a few in plywood (assume 4.55 mm thick.)
I will first try as above:
4.55 + 0.47 = 5.02 for main slot height
4.55 + 0.42 = 4.97 for platform slot height

The parameters above for speed & power didn't really work for this one. So I do two passes.
This was too much - ended up too burnt.
Also too narrow. So try: 5.12/5.07 and 90/35 70/70 for speed/power for raster & vector.
This seems pretty good. But still doesn't cut all the way through. So I try moving focus further down.


The next two pieces of plywood were 5.00 mm. So I use 5.47/5.42 mm, and this is pretty good. So the constants above seem ok.

One problem, though, is that the plywood thickness appears to vary even up to 0.2 mm within a single board...


    




