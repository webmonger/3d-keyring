use <fontmetrics.scad>;

// begin MIT licensed code (c) 2021 Jon Carlos

// Key ring settings
// You will possibly run in to trouble if you set
// this to the same value as textDepth
depth = 4;
minLength = 60;
minWidth = 15;

//text = "⠁⠂⠃⠄⠅⠆⠇⠈⠉⠝⠞⠲⠳⠴⠾⠽⠳⠴⢢⢗⢪⣈⣆⣌⡾⡫⢠";
text = "Text Here";
// 
textDepth = 1;
// If you want more space around your text change this
textPadding = 1;
// If you want to embos rather than impress change this to true
emboss = false;
embossDepth = 0.5;

// The text position and padding should update
// when you change this but bext to check
ringHoleDiameter = 4;
ringHolePosition = 4;

// FONT Setting
font = "Impact:style=Regular";
//font = "Trebuchet MS:style=Bold";
//font = "Arial Black:style=Regular";
//font = "Andale Mono:style=Regular";
//font = "Apple Braille:style=Regular";
fontSize = 12.;
fontSpacing = 1.;
fontVAlign = "top";
fontHAlign = "left";
// END

dimensions = measureTextBounds(text,font=font,size=fontSize, spacing=fontSpacing);
echo(dimensions[1][1]);
textWidth = dimensions[1][0];
textHeight = dimensions[1][1];

height = textHeight + (textPadding*2);

length = textWidth + (textPadding*2);

module drawfont() {
    rotate([0,0,90]) {
        linear_extrude((textDepth+1)+embossDepth) {
            translate([ringHoleDiameter + ringHolePosition , 0, 0]) 
            text(text, font=font, size=fontSize, spacing=fontSpacing, valign=fontVAlign);
        }
    }
}

difference(){
    cube([height , (length + ringHoleDiameter + ringHolePosition), depth]);
    translate([height/2, ringHolePosition, -1]) 
        cylinder(depth + 2, d=ringHoleDiameter, true, $fn=50);
    
    if(!emboss){
        translate([textPadding, 0, depth-textDepth]) {
            drawfont();
        }
    }
}

if(emboss){
    translate([textPadding, 0, depth-textDepth]) {
        drawfont();
    }
}