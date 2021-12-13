// Source code found at: https://www.thingiverse.com/thing:9347
// Round corners for Openscad - Tutorial by WilliamAAdamsis licensed under the Creative Commons - Attribution - Share Alike license.
// LICENCE - https://creativecommons.org/licenses/by-sa/3.0/

module roundedRect(size, radius)
{
    x = size[0];
    y = size[1];
    z = size[2];

    linear_extrude(height=z)
    hull()
    {
        // place 4 circles in the corners, with the given radius
        translate([(0)+(radius), (0)+(radius), 0])
        circle(r=radius);

        translate([(x)-(radius), (0)+(radius), 0])
        circle(r=radius);

        translate([(0)+(radius), (y)-(radius), 0])
        circle(r=radius);

        translate([(x)-(radius), (y)-(radius), 0])
        circle(r=radius);
    }
}