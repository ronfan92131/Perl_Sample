
# Object interface
use Text::CSV;
 
my @rows;
# a new CSV object to Read/parse CSV
my $csv = Text::CSV->new ({ binary => 1, auto_diag => 1 });

# file handler to read file "test.csv"
open my $fh, "<:encoding(utf8)", "test.csv" or die "test.csv: $!";
while (my $row = $csv->getline ($fh)) {
    $row->[2] =~ m/nv_item/ or next; # 3rd field should match "nv_item"
    push @rows, $row;  #save the matched lines in array @rows
    }
close $fh;
 
# file handler to write file "new.csv"
open $fh, ">:encoding(utf8)", "new.csv" or die "new.csv: $!";
foreach ( @rows ) {
  $csv->say ($fh, $_);
}
close $fh or die "new.csv: $!";
