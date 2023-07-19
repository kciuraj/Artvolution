#!/usr/bin/perl

use strict;
use warnings;

# Begin Artvolution

# Declare artvolution variables
my $width = 256;
my $height = 256;
my $iterations = 1000;
my $init_type = 'random';

# Create canvas
my @canvas = ();
for (my $i = 0; $i < $height; $i++) {
    for (my $j = 0; $j < $width; $j++) {
        my %pixel = (
            'x' => $j,
            'y' => $i,
            'r' => 0,
            'g' => 0,
            'b' => 0
        );
        push(@canvas, \%pixel);
    }
}

# Initialize canvas
if ($init_type eq 'random') {
    foreach my $pixel (@canvas) {
        $pixel->{'r'} = int(rand(256));
        $pixel->{'g'} = int(rand(256));
        $pixel->{'b'} = int(rand(256));
    }
}

# Evolution cycle
for (my $i = 0; $i < $iterations; $i++) {
    foreach my $pixel (@canvas) {
        my $x1 = $pixel->{'x'};
        my $y1 = $pixel->{'y'};
        my $r = $pixel->{'r'};
        my $g = $pixel->{'g'};
        my $b = $pixel->{'b'};
        
        my $best_distance = 256;
        my $best_x = 0;
        my $best_y = 0;
        
        # Search for closest similar neighbor
        foreach my $other (@canvas) {
            my $x2 = $other->{'x'};
            my $y2 = $other->{'y'};
            my $r2 = $other->{'r'};
            my $g2 = $other->{'g'};
            my $b2 = $other->{'b'};
            
            my $distance = sqrt( ($x2-$x1)**2 + ($y2-$y1)**2 );
            if ($distance < $best_distance) {
                # Calculate average color
                $r = ($r + $r2) / 2;
                $g = ($g + $g2) / 2;
                $b = ($b + $b2) / 2;
            }
        } 
        
        # Update color
        $pixel->{'r'} = $r;
        $pixel->{'g'} = $g;
        $pixel->{'b'} = $b;
    }
}

# Print canvas
for (my $i = 0; $i < $height; $i++) {
    for (my $j = 0; $j < $width; $j++) {
        my $pixel = $canvas[$i*$width + $j];
        my $r = $pixel->{'r'};
        my $g = $pixel->{'g'};
        my $b = $pixel->{'b'};
        print "rgb($r,$g,$b)  ";
    }
    print "\n";
}

# End Artvolution