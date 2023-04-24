load "/global/common/cori/software/ncl/6.5.0/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "/global/common/cori/software/ncl/6.5.0/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "/global/common/cori/software/ncl/6.5.0/lib/ncarg/nclscripts/csm/contributed.ncl"
load "/global/common/cori/software/ncl/6.5.0/lib/ncarg/nclscripts/csm/shea_util.ncl"
load "/global/common/cori/software/ncl/6.5.0/lib/ncarg/nclscripts/esmf/ESMF_regridding.ncl"
load "/global/common/cori/software/ncl/6.5.0/lib/ncarg/nclscripts/contrib/cd_string.ncl"
load "/global/common/cori/software/ncl/6.5.0/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"
load "/global/common/cori/software/ncl/6.5.0/lib/ncarg/nclscripts/wrf/WRF_contributed.ncl"

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

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221001_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221001.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221001.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221001")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221002_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221002.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221002.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221002")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221003_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221003.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221003.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221003")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221004_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221004.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221004.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221004")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221005_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221005.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221005.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221005")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221006_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221006.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221006.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221006")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221007_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221007.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221007.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221007")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221008_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221008.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221008.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221008")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221009_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221009.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221009.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221009")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221010_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221010.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221010.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221010")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221011_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221011.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221011.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221011")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221012_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221012.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221012.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221012")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221013_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221013.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221013.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221013")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221014_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221014.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221014.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221014")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221015_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221015.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221015.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221015")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221016_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221016.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221016.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221016")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221017_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221017.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221017.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221017")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221018_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221018.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221018.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221018")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221019_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221019.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221019.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221019")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221020_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221020.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221020.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221020")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221021_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221021.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221021.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221021")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221022_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221022.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221022.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221022")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221023_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221023.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221023.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221023")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221024_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221024.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221024.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221024")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221025_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221025.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221025.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221025")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221026_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221026.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221026.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221026")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221027_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221027.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221027.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221027")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221028_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221028.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221028.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221028")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221029_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221029.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221029.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221029")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221030_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221030.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221030.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221030")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_provisional;_4kmD2_20221031_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221031.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221031.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221031")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220301_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220301.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220301.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220301")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220302_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220302.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220302.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220302")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220303_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220303.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220303.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220303")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220304_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220304.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220304.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220304")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220305_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220305.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220305.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220305")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220306_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220306.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220306.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220306")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220307_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220307.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220307.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220307")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220308_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220308.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220308.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220308")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220309_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220309.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220309.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220309")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220310_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220310.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220310.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220310")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220311_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220311.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220311.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220311")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220312_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220312.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220312.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220312")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220313_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220313.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220313.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220313")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220314_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220314.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220314.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220314")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220315_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220315.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220315.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220315")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220316_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220316.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220316.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220316")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220317_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220317.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220317.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220317")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220318_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220318.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220318.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220318")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220319_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220319.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220319.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220319")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220320_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220320.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220320.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220320")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220321_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220321.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220321.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220321")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220322_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220322.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220322.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220322")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220323_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220323.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220323.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220323")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220324_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220324.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220324.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220324")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220325_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220325.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220325.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220325")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220326_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220326.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220326.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220326")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220327_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220327.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220327.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220327")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220328_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220328.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220328.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220328")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220329_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220329.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220329.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220329")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220330_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220330.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220330.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220330")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220501_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220501.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220501.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220501")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220502_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220502.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220502.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220502")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220503_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220503.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220503.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220503")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220504_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220504.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220504.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220504")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220505_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220505.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220505.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220505")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220506_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220506.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220506.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220506")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220507_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220507.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220507.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220507")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220508_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220508.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220508.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220508")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220509_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220509.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220509.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220509")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220510_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220510.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220510.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220510")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220511_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220511.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220511.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220511")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220512_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220512.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220512.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220512")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220513_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220513.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220513.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220513")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220514_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220514.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220514.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220514")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220515_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220515.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220515.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220515")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220516_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220516.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220516.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220516")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220517_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220517.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220517.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220517")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220518_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220518.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220518.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220518")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220519_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220519.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220519.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220519")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220520_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220520.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220520.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220520")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220521_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220521.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220521.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220521")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220522_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220522.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220522.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220522")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220523_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220523.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220523.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220523")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220524_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220524.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220524.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220524")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220525_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220525.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220525.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220525")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220526_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220526.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220526.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220526")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220527_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220527.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220527.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220527")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220528_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220528.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220528.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220528")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220529_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220529.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220529.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220529")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220530_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220530.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220530.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220530")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220701_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220701.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220701.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220701")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220702_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220702.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220702.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220702")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220703_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220703.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220703.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220703")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220704_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220704.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220704.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220704")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220705_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220705.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220705.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220705")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220706_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220706.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220706.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220706")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220707_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220707.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220707.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220707")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220708_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220708.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220708.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220708")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220709_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220709.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220709.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220709")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220710_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220710.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220710.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220710")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220711_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220711.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220711.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220711")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220712_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220712.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220712.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220712")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220713_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220713.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220713.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220713")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220714_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220714.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220714.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220714")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220715_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220715.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220715.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220715")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220716_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220716.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220716.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220716")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220717_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220717.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220717.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220717")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220718_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220718.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220718.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220718")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220719_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220719.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220719.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220719")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220720_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220720.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220720.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220720")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220721_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220721.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220721.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220721")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220722_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220722.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220722.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220722")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220723_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220723.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220723.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220723")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220724_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220724.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220724.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220724")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220725_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220725.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220725.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220725")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220726_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220726.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220726.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220726")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220727_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220727.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220727.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220727")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220728_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220728.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220728.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220728")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220729_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220729.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220729.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220729")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin/PRISM_tmin_stable_4kmD2_20220730_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220730.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220730.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220730")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220401_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220401.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220401.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220401")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220402_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220402.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220402.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220402")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220403_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220403.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220403.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220403")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220404_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220404.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220404.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220404")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220405_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220405.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220405.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220405")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220406_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220406.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220406.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220406")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220407_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220407.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220407.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220407")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220408_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220408.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220408.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220408")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220409_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220409.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220409.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220409")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220410_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220410.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220410.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220410")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220411_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220411.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220411.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220411")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220412_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220412.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220412.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220412")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220413_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220413.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220413.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220413")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220414_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220414.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220414.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220414")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220415_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220415.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220415.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220415")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220416_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220416.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220416.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220416")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220417_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220417.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220417.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220417")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220418_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220418.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220418.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220418")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220419_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220419.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220419.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220419")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220420_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220420.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220420.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220420")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220421_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220421.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220421.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220421")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220422_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220422.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220422.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220422")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220423_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220423.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220423.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220423")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220424_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220424.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220424.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220424")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220425_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220425.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220425.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220425")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220426_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220426.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220426.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220426")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220427_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220427.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220427.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220427")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220428_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220428.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220428.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220428")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220429_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220429.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220429.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220429")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220430_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220430.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220430.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220430")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220601_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220601.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220601.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220601")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220602_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220602.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220602.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220602")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220603_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220603.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220603.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220603")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220604_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220604.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220604.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220604")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220605_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220605.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220605.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220605")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220606_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220606.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220606.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220606")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220607_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220607.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220607.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220607")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220608_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220608.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220608.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220608")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220609_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220609.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220609.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220609")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220610_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220610.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220610.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220610")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220611_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220611.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220611.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220611")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220612_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220612.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220612.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220612")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220613_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220613.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220613.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220613")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220614_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220614.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220614.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220614")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220615_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220615.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220615.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220615")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220616_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220616.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220616.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220616")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220617_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220617.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220617.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220617")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220618_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220618.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220618.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220618")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220619_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220619.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220619.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220619")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220620_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220620.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220620.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220620")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220621_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220621.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220621.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220621")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220622_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220622.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220622.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220622")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220623_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220623.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220623.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220623")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220624_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220624.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220624.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220624")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220625_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220625.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220625.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220625")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220626_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220626.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220626.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220626")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220627_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220627.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220627.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220627")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220628_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220628.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220628.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220628")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220629_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220629.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220629.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220629")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220630_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220630.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220630.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220630")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220901_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220901.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220901.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220901")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220902_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220902.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220902.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220902")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220903_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220903.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220903.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220903")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220904_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220904.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220904.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220904")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220905_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220905.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220905.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220905")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220906_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220906.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220906.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220906")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220907_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220907.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220907.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220907")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220908_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220908.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220908.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220908")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220909_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220909.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220909.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220909")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220910_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220910.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220910.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220910")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220911_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220911.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220911.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220911")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220912_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220912.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220912.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220912")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220913_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220913.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220913.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220913")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220914_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220914.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220914.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220914")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220915_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220915.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220915.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220915")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220916_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220916.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220916.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220916")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220917_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220917.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220917.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220917")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220918_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220918.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220918.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220918")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220919_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220919.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220919.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220919")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220920_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220920.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220920.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220920")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220921_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220921.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220921.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220921")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220922_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220922.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220922.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220922")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220923_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220923.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220923.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220923")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220924_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220924.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220924.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220924")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220925_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220925.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220925.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220925")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220926_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220926.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220926.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220926")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220927_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220927.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220927.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220927")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220928_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220928.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220928.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220928")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220929_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220929.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220929.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220929")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20220930_bil.bil")

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
      nc_filename = "PRISM_TMIN_20220930.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20220930.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20220930")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221101_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221101.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221101.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221101")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221102_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221102.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221102.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221102")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221103_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221103.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221103.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221103")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221104_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221104.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221104.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221104")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221105_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221105.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221105.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221105")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221106_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221106.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221106.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221106")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221107_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221107.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221107.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221107")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221108_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221108.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221108.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221108")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221109_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221109.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221109.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221109")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221110_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221110.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221110.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221110")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221111_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221111.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221111.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221111")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221112_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221112.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221112.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221112")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221113_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221113.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221113.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221113")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221114_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221114.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221114.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221114")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221115_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221115.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221115.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221115")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221116_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221116.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221116.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221116")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221117_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221117.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221117.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221117")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221118_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221118.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221118.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221118")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221119_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221119.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221119.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221119")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221120_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221120.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221120.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221120")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221121_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221121.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221121.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221121")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221122_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221122.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221122.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221122")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221123_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221123.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221123.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221123")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221124_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221124.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221124.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221124")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221125_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221125.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221125.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221125")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221126_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221126.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221126.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221126")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221127_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221127.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221127.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221127")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221128_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221128.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221128.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221128")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221129_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221129.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221129.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221129")

     nlon = 1405
     nlat = 621

     fils = systemfunc("ls /global/cscratch1/sd/laart/getdata_daily_tmin:/PRISM_tmin_provisional_4kmD2_20221130_bil.bil")

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
      nc_filename = "PRISM_TMIN_20221130.nc"
      system("rm -f " + nc_filename)

     ;---Open file and write global attributes
      a = addfile("PRISM_TMIN_20221130.nc","c")
      a@title = "PRISM daily data"
      a@source = "http://prism.oregonstate.edu/"

     ;---Make time an UNLIMITED dimension, always recommended
      filedimdef(a,"time",-1,True)

     ;---Write "TMIN" data to file
      a->TMIN = finarr
     
     print("Done With File = 20221130")

     end
