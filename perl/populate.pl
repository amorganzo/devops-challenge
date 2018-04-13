#!/bin/perl

use warnings;
use strict;

my @command = `cd /devops-challenge/terraform/ && terraform output  | egrep  "[0-9]" | cut -d "," -f 1`;

foreach my $ip (@command){


sed -i s/server1 ansible_ssh_host=(*.?)/server1 ansible_ssh_host=
server2 ansible_ssh_host=52.26.105.68
server3 ansible_ssh_host=52.26.105.68

print "$ip\n";

}
