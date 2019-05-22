#!/usr/bin/perl

use warnings;
use strict;



my $StepVerdict = "FAIL";
my $ATCResponse = " 
 
+USORF: 0,\"185.215.193.10\",8443,1,\"11\"
 
 
OK
";
	#1. original
	#if ($ATCResponse =~ /\+USORF: (\d+),\"(.+)\",(\d+),(\d+),\"(.+)\"\r\n\r\nOK/)
	
	#2. break as two compare works as above, but not elegant
	#better way is the accept arbitrary numger of empty line
	
	if ($ATCResponse =~ /\+USORF: (\d+),\"(.+)\",(\d+),(\d+),\"(.+)\"([\r\n]+)OK/)
	{
		print ("Correct response  \n");
	}

	print "wrong response  \n";




