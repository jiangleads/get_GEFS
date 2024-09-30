#!/usr/bin/bash
#
# example of calculating GFS APCP for custom periods
#  want 06-09, 09-12, 12-15, 15-24, 24-48 hours
#  need the 06, 09, 12, 15, 24 and 48 hour forecasts
#
# the output iis in apcp.grb
# the calculated APCP fields may have a small negative because of
# finite precision is used

dir=$1
echo $dir
cat   $dir/gfs.t00z.pgrb2.0p25.f001 $dir/gfs.t00z.pgrb2.0p25.f002 \
      $dir/gfs.t00z.pgrb2.0p25.f003 $dir/gfs.t00z.pgrb2.0p25.f004 \
      $dir/gfs.t00z.pgrb2.0p25.f005 $dir/gfs.t00z.pgrb2.0p25.f006 \
      $dir/gfs.t06z.pgrb2.0p25.f001 $dir/gfs.t06z.pgrb2.0p25.f002 \
      $dir/gfs.t06z.pgrb2.0p25.f003 $dir/gfs.t06z.pgrb2.0p25.f004 \
      $dir/gfs.t06z.pgrb2.0p25.f005 $dir/gfs.t06z.pgrb2.0p25.f006 \
      $dir/gfs.t12z.pgrb2.0p25.f001 $dir/gfs.t12z.pgrb2.0p25.f002 \
      $dir/gfs.t12z.pgrb2.0p25.f003 $dir/gfs.t12z.pgrb2.0p25.f004 \
      $dir/gfs.t12z.pgrb2.0p25.f005 $dir/gfs.t12z.pgrb2.0p25.f006 \
      $dir/gfs.t18z.pgrb2.0p25.f001 $dir/gfs.t18z.pgrb2.0p25.f002 \
      $dir/gfs.t18z.pgrb2.0p25.f003 $dir/gfs.t18z.pgrb2.0p25.f004 \
      $dir/gfs.t18z.pgrb2.0p25.f005 $dir/gfs.t18z.pgrb2.0p25.f006 \
      |  \wgrib2 - -match ":UGRD:" -match ":10 m above ground:" -match " hour fcst:" -set_grib_type c1 -grib u10m_$1.grb
#PRMSL:mean sea level:2 hour fcst
#1:0:d=2023072700:PRMSL:mean sea level:1 hour fcst:
