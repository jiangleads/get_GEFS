#!/usr/bin/bash

# Define the outer layer array
outer_array=("2023072718" "2023072800" "2023072806" "2023072812" "2023072818" "2023072900" "2023072906")

# Define the inner layer array
inner_array=("c00" "p01" "p02" "p03" "p04" "p05" "p06" "p07" "p08" "p09" "p10" "p11" "p12" "p13" "p14" "p15" "p16" "p17" "p18" "p19" "p20" "p21" "p22" "p23" "p24" "p25" "p26" "p27" "p28" "p29" "p30")

# Outer loop over the outer array
for outer in "${outer_array[@]}"; do
  # Inner loop over the inner array
  for inner in "${inner_array[@]}"; do
    echo "Processing outer: $outer, inner: $inner"
    mkdir -p ${outer}
    #perl get_gefs_amazon_curl.pl data ${outer} 0 3 3 all all $outer $inner pgrb2a
    #perl get_gefs_amazon_curl.pl data ${outer} 0 3 3 all all $outer $inner pgrb2b
    
    perl get_gefs_aws_cli.pl data ${outer} 0 3 3 all all $outer $inner pgrb2a
    perl get_gefs_aws_cli.pl data ${outer} 0 3 3 all all $outer $inner pgrb2b

    # Here you can add the commands you want to run for each combination of outer and inner elements
  done
done
