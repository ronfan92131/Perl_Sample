# this code demonstrate read data from a txt file and create a csv file
# input:  input.txt		(each line has multiple fields are separated by ;)
# output: output.csv    (each row: each field has only own column 

# Object interface
use Text::CSV;

#read from input.txt,  
my $inputFile = "input.txt";  
open(my $inputData, '<', $inputFile) or die "Could not open '$inputFile' $!\n";   

#write data to output.csv, 
my $outputFile = "output.csv";  
#file handler for writing file to $outputFile
open $fh, ">:encoding(utf8)", $outputFile or die "$outputFile: $!"; 
#create a new CSV object to Read/parse CSV
my $csv = Text::CSV->new({});

#header row:
$csv->say ($fh, ["Carrier", "NV", "Description", "Requirement", "matches"]); 

#loop through each inputLine
while (my $inputLine = <$inputData>) {
	chomp $inputLine;

	my @tokens = split(/;/, $inputLine);
	my $tokens_ref = \@tokens;
	$csv->say ($fh, $tokens_ref);  # array ref works, even a bit convoluted
}

close $fh or die "$outputFile: $!";
