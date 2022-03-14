#!/usr/bin/perl

use warnings;
use strict;

use constant SVG_DIR => 'input';
use constant OUTPUT_FILE => 'output/compiled.css';

# Don't include extension
my @file_names = qw(
	ac ca fi lk pl tf ad cc fj im mg pm tg ae cd fk
	in mh pn th af cf fm io mk pr tj ag cg fo iq ml
);

# Two variables will go into this template:
#
# [% id %]	the name of the SVG file being written as a string
# [% svg %]	url() with the SVG as a data: URI

use constant CSS_TEMPLATE => <<TEMPLATE_END;
	.flag-[% id %] {
		background-image: [% svg %]
		background-repeat: no-repeat;
		width: 320px;
		height: 240px;
	}

TEMPLATE_END

sub css_class {
	my ($id, $svg_lines) = @_;

	my $template = CSS_TEMPLATE;
	$template =~ s/\[% id %\]/$id/;
	$template =~ s{\[% svg %\]} {
		'url("data:image/svg+xml,' .
		join('', @{$svg_lines}) .
		'");'
	}em;

	return $template;
}

sub uri_encode {
	my $line = shift;

	my %encoded = (
		'<' => '%3C',
		'>' => '%3E',
		'#' => '%23',
		'"' => '\''
	);

	$line =~ s/\s{2,}//g;

	foreach my $char (keys %encoded) {
		$line =~ s/$char/$encoded{$char}/g;
	}

	return $line;
}

open (my $OUT, '>', OUTPUT_FILE) or die $!;

for my $file (@file_names) {
	open (my $SVG_FILE, '<', SVG_DIR . "/$file.svg") or die $!;

	my $svg_lines;

	while (<$SVG_FILE>) {
		chomp;
		next if $_ eq '\n';
		push $svg_lines->@*, uri_encode($_);
	}

	print $OUT css_class($file, $svg_lines);
}
