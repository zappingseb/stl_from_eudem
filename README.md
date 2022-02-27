# STLfromEUDEM

Create an STL file from EUDEM data

# Prequisites

Get R https://cran.r-project.org/bin/windows/base/

```
install.packages(c("raster", "devtools"))
devtools::install_github("cran/r2stl")
devtools::install_deps()
```

# Download EUDEM Data

Elevation data can be downloaded from
an [EUDEM v1.1](https://land.copernicus.eu/imagery-in-situ/eu-dem/eu-dem-v1.1?tab=downloada) file.

You need to create an account + download the data

For central europe, please download E40N20. You need to extract the download
until you have a .tif file.

Please also create a bbox by using [BBOX Finder](http://bboxfinder.com/).

You can draw a rectangle there and then copy the string inside box.

```r
devtools::load_all()

bbox <- parse_bbox_finder("11.297150,47.362512,11.419373,47.418281")

el_mat_eudem <- get_elevdata_from_bbox(
  bbox = bbox,
  type ="EUDEM",
  file = "eudem/eu_dem_v11_E40N20.TIF"
)

```

Then you can export the stl file via

* `input_matrix` see before
* `filename` where you want to store the STL file
* `scaling` a factor between 0 and infinty to scale z orientation data with, 2x
  means a difference of 20m of height, will be displayed as 40m.

```
export_stl(input_matrix =el_mat_eudem, filename = "bbox_export.stl", scaling = 2)
```

