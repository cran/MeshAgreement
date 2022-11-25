## ----setup, include=FALSE-------------------------------------------
# set global chunk options
knitr::opts_chunk$set(fig.align='center',
                      fig.show='hold',
                      tidy=FALSE,
                      message=FALSE,
                      warning=FALSE)

options(replace.assign=TRUE,
        useFancyQuotes=FALSE,
        show.signif.stars=FALSE,
        digits=4,
        width=70)

## ----cESAPI---------------------------------------------------------
esapi_location <- system.file("extdata", package="MeshAgreement")
list.files(esapi_location, full.names=TRUE)

## ----cCmdlineA------------------------------------------------------
## load MeshAgreement package - required for all following tasks
library(MeshAgreement, verbose=FALSE)

## get agreement measures for all pairs from list of meshes
## data_heart_obsL: list of sample meshes included in MeshAgreement
heartL <- mesh3dL_to_cgalMeshL(data_heart_obsL)

## omit JSC/DSC to reduce run-time
agreeW <- get_mesh_agree(heartL, do_ui=FALSE, silent=TRUE)
agreeW

## ----cStartShiny----------------------------------------------------
## install required packages
# install.packages(c("shiny", "bs4Dash", "DT", "sortable", "rgl"))

## load MeshAgreement package
# library(MeshAgreement, verbose=FALSE)

## start Shiny app
# run_gui()

## ----cReadMesh1-----------------------------------------------------
# ff1 <- list.files("c:/meshes/obs1", pattern="PLY$", full.names=TRUE)
# ff2 <- list.files("c:/meshes/obs2", pattern="PLY$", full.names=TRUE)
# ff3 <- list.files("c:/meshes/obs3", pattern="PLY$", full.names=TRUE)
# obsL <- read_mesh(list(Obs01=ff1, Obs02=ff2, Obs03=ff3),
#                   reconstruct="AFS")

## ----cReadMesh2-----------------------------------------------------
# ff    <- list.files("c:/meshes/", pattern="PLY$", full.names=TRUE)
# meshL <- read_mesh_obs(ff)

## assign each mesh to a different observer to enable all
## pairwise comparisons
# obsL <- meshL_to_observerL(meshL)

## ----cPrintMesh-----------------------------------------------------
## data_heart_obsL: list of sample meshes included in MeshAgreement
heartL <- mesh3dL_to_cgalMeshL(data_heart_obsL)
get_mesh_info(heartL)

## ----cMeshAgreementA------------------------------------------------
## already called above
# heartL <- mesh3dL_to_cgalMeshL(data_heart_obsL)
# agreeW <- get_mesh_agree(heartL, silent=TRUE)
agreeW

## ----cMeshAgreeLong-------------------------------------------------
agreeL <- get_mesh_agree_long(agreeW)
agreeL

## ----cMeshAgreeAggr-------------------------------------------------
agree_aggrW <- get_mesh_agree_aggr(agreeW)
agree_aggrW

## ----cMeshAgreeAggrLong---------------------------------------------
agree_aggrL <- get_mesh_agree_aggr_long(agree_aggrW)
agree_aggrL

