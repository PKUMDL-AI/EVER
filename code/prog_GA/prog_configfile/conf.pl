#!perl
use strict;
use warnings;
use List::Util qw/sum/;

open (IN1, "< $ARGV[0]") or die $!;
my @temp = <>;
my ($Atom_Coordinate) = @temp;

sub Atom_Coordinate{
	open (OUT1, "> AtomCoordinate");
	for (my $i=0; $i<@temp; $i++){
		unless ($temp[$i] !~/ATOM/){
			print OUT1 $temp[$i]
		}
	}
	close IN1;
	close OUT1;
	return 0;
}

my $rows=&rowsNum('AtomCoordinate');
my %center=&centerCoordinate('AtomCoordinate');

sub rowsNum{
    my ($a)=@_;
    my $num;
    open (IN, $a) or die $!;
    for ($num=0; <IN>; $num++){}
    close IN;
    return $num;
}

sub centerCoordinate{
    my ($a)=@_;
    my %hash;
    my (@arrayx, @arrayy, @arrayz);
    open (IN, $a) or die $!;
    while (<IN>){
        s/[\r\n]//g;
        my @temp = split /\s+/, $_;
        push @arrayx, $temp[6];
        #print "@arrayx";
        push @arrayy, $temp[7];
        push @arrayz, $temp[8];
    }
    close IN;
    my $sumx= sum @arrayx;
    #print "$sumx\n";
    my $sumy= sum @arrayy;
    my $sumz= sum @arrayz;
    %hash = (
        'x' => $sumx, 
        'y' => $sumy, 
        'z' => $sumz,
    );
    return %hash;
}

#print "$rows\n";
#my @any = %center;
#print "@any\n";

open OUT, '>>', 'conf.txt' or die $!;
my ($averageX, $averageY, $averageZ);
$averageX=$center{'x'}/$rows;
$averageY=$center{'y'}/$rows;
$averageZ=$center{'z'}/$rows;
print OUT "receptor = " . "\n" . "ligand = " . "\n\n\n";
printf OUT "center_x = %.3f\n", $averageX;
printf OUT "center_y = %.3f\n", $averageY;
printf OUT "center_z = %.3f\n", $averageZ;
print OUT "\n\n\n" . "size_x = 22" . "\n" . "size_y = 22" . "\n" . "size_z = 22" . "\n\n\n" . "cpu = 1\n" . "energy_range = 3\n" . "exhaustiveness = 8\n" . "num_modes = 8";
