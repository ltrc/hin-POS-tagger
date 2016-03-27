#! /usr/bin/perl
sub tnt2ssf
{
	my $line = "";
	my $wno = 1;
	my $sno = 1;

	#scan each line from standard input
	while($line = <>)
	{
		if($line =~ /^\s*$/)
		{
                    print "</Sentence>\n";
                    $sno ++;
                    $wno = 1;
                    next;
		}

                if ($wno == 1) {
                    print "<Sentence id=\"$sno\">\n";
                }

		chomp($line);

		my @cols = split(/[ ]+/,$line);
		$cols[2]=~s/___/ /g;
		print $wno,"\t",$cols[0],"\t",$cols[1],"\t",$cols[2],"\n";
		$wno ++;
	}
}
&tnt2ssf;
