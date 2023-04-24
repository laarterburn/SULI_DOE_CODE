#! /bin/bash -l

# Name of the job - You'll probably want to customize this.
#SBATCH -J PRISM_NetCDF_DATASET

# Standard out and Standard Error output files with the job number in the name.
#SBATCH -o PRISM_NetCDF.output
#SBATCH -e PRISM_NetCDF.error

#SBATCH --exclusive
#SBATCH -n 16
#SBATCH -N 1

hostname

var=TMIN
var_small=tmin

#mkdir -p /project/projectdirs/m2398/PRISM_data/RAW/${var}_nc
for year in {2023..2023}; do
  
# mkdir -p /project/projectdirs/m2398/PRISM_data/RAW/${var}_nc/${year}
# cd /project/projectdirs/m2398/PRISM_data/RAW/${var}_nc/${year}

c=("CREATE_PRISM_netCDF")
cat > $c.ncl <<EOF
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/esmf/ESMF_regridding.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/contrib/cd_string.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRF_contributed.ncl"

begin

  setvalues NhlGetWorkspaceObjectId()
    "wsMaximumSize" : 300000000
  end setvalues

;----------------------------------------------------------------------
; read_bin_2.ncl
;
; Concepts illustrated:
;   - Using fbindirread to read data from record 0 off several binary files
;   - Writing data to a NetCDF file using the easy but inefficient method
;   - Adding meta data (attributes and coordinates) to a variable
;----------------------------------------------------------------------
; INFORMATION ON PRISM FILES
; http://prism.oregonstate.edu/
; PRODUCT CODES
;----------------------------------------------------------------------
; PWD to Files
; /group/paullricgrp/Obs/PRISM/PRISM_tmean_stable_4kmD1_*.zip
;----------------------------------------------------------------------
; UNMASKED PRISM DATASET OVER THE CONUS
; LAT = 24.0625 N to 49.9375 N
; LON = -125.0208 W to -66.4792 W
; 4km resolution

EOF

 for month in 01; do
   for day in {01..31}; do
     cat >> $c.ncl <<EOF
     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_${var_small}/PRISM_${var_small}_provisional_4kmD2_${year}${month}${day}_bil.bil")

     ;---Predefine array for one year of daily data
       finarr = new((/dimsizes(fils),nlat,nlon/),"float")

     ;---Loop through each file and read
       rec_num = 0     ; record number
      
      print("Started File Generation")

      do gg = 0,dimsizes(fils)-1
       finarr(gg,:,:) = fbindirread(fils(gg),0,(/nlat,nlon/),"float")
      end do

      finarr = finarr(:,::-1,:)

      print("Assigning coordinate variable information")
      finarr@_FillValue = -9999
      finarr!0 = "time"
      finarr!1 = "lat"
      finarr!2 = "lon"
      finarr&time = ispan(1,dimsizes(fils),1)
      finarr&lat  = fspan(24.0625,49.9375,nlat)
      finarr&lon  = fspan(-125.0208,-66.4792,nlon)
      finarr&lat@units = "degrees_north"
      finarr&lon@units = "degrees_east"

      finarr = finarr(time|:,lat|:,lon|:)

     ;----------------------------------------------------------------------
     ; Section to write data to netCDF file
     ;----------------------------------------------------------------------

     ;---Make sure file doesn't exist.
      nc_filename = "PRISM_${var}_${year}${month}${day}.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_${var}_${year}${month}${day}.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "${var}" data to file
      a->${var} = finarr
     
     print("Done With File = ${year}${month}${day}")

EOF
     echo "DONE CREATING PRISM_${var}_${year}${month}${day}.nc"
   done
 done
 
 for month in 02; do
   for day in {01..28}; do
     cat >> $c.ncl <<EOF
     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_${var_small}/PRISM_${var_small}_provisional_4kmD2_${year}${month}${day}_bil.bil")

     ;---Predefine array for one year of daily data
       finarr = new((/dimsizes(fils),nlat,nlon/),"float")

     ;---Loop through each file and read
       rec_num = 0     ; record number
      
      print("Started File Generation")

      do gg = 0,dimsizes(fils)-1
       finarr(gg,:,:) = fbindirread(fils(gg),0,(/nlat,nlon/),"float")
      end do

      finarr = finarr(:,::-1,:)

      print("Assigning coordinate variable information")
      finarr@_FillValue = -9999
      finarr!0 = "time"
      finarr!1 = "lat"
      finarr!2 = "lon"
      finarr&time = ispan(1,dimsizes(fils),1)
      finarr&lat  = fspan(24.0625,49.9375,nlat)
      finarr&lon  = fspan(-125.0208,-66.4792,nlon)
      finarr&lat@units = "degrees_north"
      finarr&lon@units = "degrees_east"

      finarr = finarr(time|:,lat|:,lon|:)

     ;----------------------------------------------------------------------
     ; Section to write data to netCDF file
     ;----------------------------------------------------------------------

     ;---Make sure file doesn't exist.
      nc_filename = "PRISM_${var}_${year}${month}${day}.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_${var}_${year}${month}${day}.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "${var}" data to file
      a->${var} = finarr
     
     print("Done With File = ${year}${month}${day}")

EOF
     echo "DONE CREATING PRISM_${var}_${year}${month}${day}.nc"
   done
 done

 for month in 02; do
   for day in {01..28}; do
     cat >> $c.ncl <<EOF
     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_${var_small}:/PRISM_${var_small}_provisional_4kmD2_${year}${month}${day}_bil.bil")

     ;---Predefine array for one year of daily data
       finarr = new((/dimsizes(fils),nlat,nlon/),"float")

     ;---Loop through each file and read
       rec_num = 0     ; record number
      
      print("Started File Generation")

      do gg = 0,dimsizes(fils)-1
       finarr(gg,:,:) = fbindirread(fils(gg),0,(/nlat,nlon/),"float")
      end do

      finarr = finarr(:,::-1,:)

      print("Assigning coordinate variable information")
      finarr@_FillValue = -9999
      finarr!0 = "time"
      finarr!1 = "lat"
      finarr!2 = "lon"
      finarr&time = ispan(1,dimsizes(fils),1)
      finarr&lat  = fspan(24.0625,49.9375,nlat)
      finarr&lon  = fspan(-125.0208,-66.4792,nlon)
      finarr&lat@units = "degrees_north"
      finarr&lon@units = "degrees_east"

      finarr = finarr(time|:,lat|:,lon|:)

     ;----------------------------------------------------------------------
     ; Section to write data to netCDF file
     ;----------------------------------------------------------------------

     ;---Make sure file doesn't exist.
      nc_filename = "PRISM_${var}_${year}${month}${day}.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_${var}_${year}${month}${day}.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "${var}" data to file
      a->${var} = finarr
     
     print("Done With File = ${year}${month}${day}")

EOF
     echo "DONE CREATING PRISM_${var}_${year}${month}${day}.nc"
   done
 done

cat >> $c.ncl <<EOF
     end
EOF

ncl $c.ncl

done

echo "DONE CREATING PRISM NetCDF FILES"

###########################
###### RUN NCL SCRIPT #####
###########################


