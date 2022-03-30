pro mksrf_cesm 
; This is my own code for manipulating the surface data types
;-------------------------------------------------------

fname = '/gpfsm/dnb53/etwolf/models/ExoCAM/cesm1.2.1/initial_files/cam_land_fv/surfdata_4x5_sand_fmax0.5_sc5.nc'
ncid = ncdf_open(fname,/nowrite)
ncdf_varget,ncid,'PCT_GLACIER',PCT_GLACIER   ;percent glacier [lat, lon]
ncdf_varget,ncid,'PCT_GLC_MEC',PCT_GLC_MEC   ;"percent for each glacier elevation class";
ncdf_varget,ncid,'TOPO_GLC_MEC',TOPO_GLC_MEC ;"mean elevation on glacier elevation classes"  
ncdf_varget,ncid,'THCK_GLC_MEC',THCK_GLC_MEC ;"mean ice sheet thickness on glacier elevation classes  
ncdf_varget,ncid,'PCT_PFT',PCT_PFT           ;"percent plant functional type of gridcell
ncdf_varget,ncid,'PCT_WETLAND',PCT_WETLAND
ncdf_varget,ncid,'PCT_LAKE',PCT_LAKE
ncdf_varget,ncid,'PCT_URBAN',PCT_URBAN
ncdf_varget,ncid,'PCT_SAND',PCT_SAND
ncdf_varget,ncid,'PCT_CLAY',PCT_CLAY
ncdf_varget,ncid,'PFTDATA_MASK',PFTDATA_MASK
ncdf_varget,ncid,'mxsoil_color', mxsoil_color    
ncdf_varget,ncid,'SOIL_COLOR',SOIL_COLOR
ncdf_varget,ncid,'LANDFRAC_PFT',LANDFRAC_PFT
ncdf_varget,ncid,'PFTDATA_MASK',PFTDATA_MASK ;land mask from pft dataset, indicative of real/fake points (lat,lon)
;; other inessential variables

ncdf_varget,ncid,'EF1_BTR',EF1_BTR    & EF1_BTR(*,*) = 0.0
ncdf_varget,ncid,'EF1_FET',EF1_FET    & EF1_FET(*,*) = 0.0
ncdf_varget, ncid,'EF1_FDT',EF1_FDT    & EF1_FDT(*,*) = 0.0 
ncdf_varget,ncid,'EF1_SHR',EF1_SHR    & EF1_SHR(*,*) = 0.0
ncdf_varget,ncid,'EF1_GRS', EF1_GRS   & EF1_GRS(*,*) = 0.0
ncdf_varget,ncid,'EF1_CRP', EF1_CRP   & EF1_CRP(*,*) = 0.0
ncdf_varget,ncid,'ORGANIC', ORGANIC   & ORGANIC(*,*,*) = 0.0 ;"organic matter density at soil levels" 
ncdf_varget,ncid,'CANYON_HWR',CANYON_HWR & CANYON_HWR(*,*) = 0.0  ;"canyon height to width ratio"
ncdf_varget,ncid,'EM_IMPROAD', EM_IMPROAD & EM_IMPROAD(*,*) = 0.0  ;"emissivity of impervious road" 
ncdf_varget,ncid,'EM_PERROAD', EM_PERROAD & EM_PERROAD(*,*) = 0.0  ;"emissivity of pervious road"
ncdf_varget,ncid,'EM_ROOF', EM_ROOF & EM_ROOF(*,*) = 0.0     ;"emissivity of roof"
ncdf_varget,ncid,'EM_WALL', EM_WALL & EM_WALL(*,*) = 0.0    ;"emissivity of  wall"
ncdf_varget,ncid,'HT_ROOF', HT_ROOF & HT_ROOF(*,*) = 0.0    ; "height of roof"
ncdf_varget,ncid,'THICK_ROOF',THICK_ROOF  & THICK_ROOF(*,*) = 0.0   ;"thickness of roof"
ncdf_varget,ncid,'THICK_WALL',THICK_WALL  & THICK_WALL(*,*) = 0.0   ;"thickness of wall"
ncdf_varget,ncid,'T_BUILDING_MAX',T_BUILDING_MAX  & T_BUILDING_MAX(*,*) = 0.0    ;"maximum interior building temperature"
ncdf_varget,ncid,'T_BUILDING_MIN',T_BUILDING_MIN  & T_BUILDING_MIN(*,*) = 0.0    ;"minimum interior building temperature"
ncdf_varget,ncid,'WIND_HGT_CANYON', WIND_HGT_CANYON & WIND_HGT_CANYON(*,*) = 0.0 ;"height of wind in canyon"
ncdf_varget,ncid,'WTLUNIT_ROOF', WTLUNIT_ROOF & WTLUNIT_ROOF(*,*) = 0.0    ;"fraction of roof"
ncdf_varget,ncid,'WTROAD_PERV',WTROAD_PERV  & WTROAD_PERV(*,*) = 0.0  ;"fraction of pervious road"
ncdf_varget,ncid,'ALB_IMPROAD',ALB_IMPROAD  & ALB_IMPROAD(*,*,*,*) = 0.0 ;"albedo of impervious road"
ncdf_varget,ncid,'ALB_PERROAD',ALB_PERROAD  & ALB_PERROAD(*,*,*,*) = 0.0;"albedo of pervious road" 
ncdf_varget,ncid,'ALB_ROOF',ALB_ROOF    & ALB_ROOF(*,*,*,*) = 0.0  ;"albedo of roof"
ncdf_varget,ncid,'ALB_WALL',ALB_WALL    & ALB_WALL(*,*,*,*) = 0.0  ;"albedo of wall" are we serious with this?
ncdf_varget,ncid,'TK_ROOF',TK_ROOF      & TK_ROOF(*,*,*) = 0.0 ;"thermal conductivity of roof"
ncdf_varget,ncid,'TK_WALL', TK_WALL     & TK_WALL(*,*,*) = 0.0  ;"thermal conductivity of wall"
ncdf_varget,ncid,'TK_IMPROAD',TK_IMPROAD  & TK_IMPROAD(*,*,*) = 0.0   ;"thermal conductivity of impervious road"
ncdf_varget,ncid,'CV_ROOF', CV_ROOF     & CV_ROOF(*,*,*) = 0.0  ;"volumetric heat capacity of roof"
ncdf_varget,ncid,'CV_WALL', CV_WALL     & CV_WALL(*,*,*) = 0.0 ;"volumetric heat capacity of wall"
ncdf_varget,ncid,'CV_IMPROAD',CV_IMPROAD & CV_IMPROAD(*,*,*) = 0.0   ;"volumetric heat capacity of impervious road"
ncdf_varget,ncid,'NLEV_IMPROAD',NLEV_IMPROAD & NLEV_IMPROAD(*,*) = 0 ;"number of impervious road layers"
ncdf_varget,ncid,'FMAX',FMAX  & FMAX(*,*) = 0.5       ;"maximum fractional saturated area";
ncdf_varget,ncid,'MONTHLY_LAI',MONTHLY_LAI & MONTHLY_LAI(*,*,*,*) = 0.0
ncdf_varget,ncid,'MONTHLY_SAI',MONTHLY_SAI & MONTHLY_SAI(*,*,*,*) = 0.0
ncdf_varget,ncid,'MONTHLY_HEIGHT_TOP',MONTHLY_HEIGHT_TOP & MONTHLY_HEIGHT_TOP(*,*,*,*) = 0.0
ncdf_varget,ncid,'MONTHLY_HEIGHT_BOT',MONTHLY_HEIGHT_BOT & MONTHLY_HEIGHT_BOT(*,*,*,*) = 0.0
ncdf_close, ncid


; set number soil colors to 21.  This includes the 20 standard colors already
; in CLM4, plus a 21st color that is globally constant and set in exoplanet_mod.F90
mxsoil_color = 21

;clear PCT_PFT
PCT_PFT(*,*,*) = 0.0

i=0
for x=0,71 do begin
  for y=0,45 do begin
    i=i+1
    ;print,i, PCT_GLACIER(x,y), Total(PCT_PFT(x,y,*)), PCT_SAND(x,y,0), PCT_CLAY(x,y,0), PCT_WETLAND(x,y)
    ;PCT_PFT(x,y,0) = total(PCT_PFT(x,y,0))+PCT_GLACIER(x,y)
    PCT_PFT(x,y,0) = 100.
    PFTDATA_MASK(x,y) = 1
    PCT_SAND(x,y,*) = 100.0
    PCT_CLAY(x,y,*) = 0.0
    PCT_GLACIER(x,y) = 0.0
    PCT_WETLAND(x,y) = 0.0
    PCT_LAKE(x,y) = 0.0
    PCT_URBAN(x,y) = 0.0 
    SOIL_COLOR(x,y) = 21
    print,i, PCT_GLACIER(x,y), Total(PCT_PFT(x,y,*)), PCT_URBAN(x,y), PCT_WETLAND(x,y), PCT_LAKE(x,y), SOIL_COLOR(x,y)
  endfor
endfor


; set by latitute bands
;for y=3,43 do begin
;   PCT_PFT(*,y,0) = 0.
;   PFTDATA_MASK(*,y) = 0.
;   PCT_SAND(*,y,*) = 0.0
;   PCT_CLAY(*,y,*) = 0.0
;   PCT_GLACIER(*,y) = 0.0
;   PCT_WETLAND(*,y) = 0.0
;   PCT_LAKE(*,y) = 0.0
;   PCT_URBAN(*,y) = 0.0
;   SOIL_COLOR(*,y) = 0
;endfor


PCT_GLC_MEC(*,*,*) = 0.0
TOPO_GLC_MEC(*,*,*) = 0.0
THCK_GLC_MEC(*,*,*) = 0.0
LANDFRAC_PFT(*,*) = 1.0

file_out = 'surfdata_4x5_test.nc'
spawn, 'cp /gpfsm/dnb53/etwolf/models/ExoCAM/cesm1.2.1/initial_files/cam_land_fv/surfdata_4x5_sand_fmax0.5_sc5.nc surfdata_4x5_test.nc'
ncid = ncdf_open(file_out, /write)
ncdf_varput, ncid, 'LANDFRAC_PFT',LANDFRAC_PFT
ncdf_varput, ncid, 'PCT_CLAY',PCT_CLAY
ncdf_varput, ncid, 'PCT_SAND',PCT_SAND
ncdf_varput, ncid, 'PCT_GLACIER',PCT_GLACIER
ncdf_varput, ncid, 'PCT_LAKE',PCT_LAKE
ncdf_varput, ncid, 'PCT_URBAN',PCT_URBAN
ncdf_varput, ncid, 'PCT_WETLAND',PCT_WETLAND
ncdf_varput, ncid, 'PCT_PFT',PCT_PFT
ncdf_varput, ncid, 'PFTDATA_MASK',PFTDATA_MASK 
ncdf_varput, ncid, 'PCT_GLC_MEC',PCT_GLC_MEC
ncdf_varput, ncid, 'TOPO_GLC_MEC',TOPO_GLC_MEC
ncdf_varput, ncid, 'THCK_GLC_MEC',THCK_GLC_MEC
ncdf_varput, ncid, 'mxsoil_color',mxsoil_color
ncdf_varput, ncid, 'SOIL_COLOR',SOIL_COLOR
ncdf_varput, ncid, 'ORGANIC', ORGANIC  

ncdf_varput, ncid,'EF1_BTR',EF1_BTR 
ncdf_varput, ncid,'EF1_FET',EF1_FET 
ncdf_varput, ncid,'EF1_FDT',EF1_FDT
ncdf_varput, ncid,'EF1_SHR',EF1_SHR 
ncdf_varput, ncid,'EF1_GRS', EF1_GRS
ncdf_varput, ncid,'EF1_CRP', EF1_CRP
ncdf_varput, ncid,'ORGANIC', ORGANIC
ncdf_varput, ncid,'CANYON_HWR',CANYON_HWR 
ncdf_varput, ncid,'EM_IMPROAD', EM_IMPROAD
ncdf_varput, ncid,'EM_PERROAD', EM_PERROAD 
ncdf_varput, ncid,'EM_ROOF', EM_ROOF
ncdf_varput, ncid,'EM_WALL', EM_WALL 
ncdf_varput, ncid,'HT_ROOF', HT_ROOF 
ncdf_varput, ncid,'THICK_ROOF',THICK_ROOF
ncdf_varput, ncid,'THICK_WALL',THICK_WALL  
ncdf_varput, ncid,'T_BUILDING_MAX',T_BUILDING_MAX  
ncdf_varput, ncid,'T_BUILDING_MIN',T_BUILDING_MIN  
ncdf_varput, ncid,'WIND_HGT_CANYON', WIND_HGT_CANYON 
ncdf_varput, ncid,'WTLUNIT_ROOF', WTLUNIT_ROOF 
ncdf_varput, ncid,'WTROAD_PERV',WTROAD_PERV  
ncdf_varput, ncid,'ALB_IMPROAD',ALB_IMPROAD  
ncdf_varput, ncid,'ALB_PERROAD',ALB_PERROAD  
ncdf_varput, ncid,'ALB_ROOF',ALB_ROOF    
ncdf_varput, ncid,'ALB_WALL',ALB_WALL    
ncdf_varput, ncid,'TK_ROOF',TK_ROOF      
ncdf_varput, ncid,'TK_WALL', TK_WALL     
ncdf_varput, ncid,'TK_IMPROAD',TK_IMPROAD  
ncdf_varput, ncid,'CV_ROOF', CV_ROOF     
ncdf_varput, ncid,'CV_WALL', CV_WALL     
ncdf_varput, ncid,'CV_IMPROAD',CV_IMPROAD 
ncdf_varput, ncid,'NLEV_IMPROAD',NLEV_IMPROAD 
ncdf_varput, ncid,'FMAX',FMAX  
ncdf_varput, ncid,'MONTHLY_LAI',MONTHLY_LAI 
ncdf_varput, ncid,'MONTHLY_SAI',MONTHLY_SAI 
ncdf_varput, ncid,'MONTHLY_HEIGHT_TOP',MONTHLY_HEIGHT_TOP 
ncdf_varput, ncid,'MONTHLY_HEIGHT_BOT',MONTHLY_HEIGHT_BOT 


ncdf_close, ncid

end
