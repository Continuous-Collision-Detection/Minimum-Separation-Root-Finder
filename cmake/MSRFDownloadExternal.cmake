include(DownloadProject)

# With CMake 3.8 and above, we can hide warnings about git being in a
# detached head by passing an extra GIT_CONFIG option
if(NOT (${CMAKE_VERSION} VERSION_LESS "3.8.0"))
    set(MSRF_CCD_EXTRA_OPTIONS "GIT_CONFIG advice.detachedHead=false")
else()
    set(MSRF_CCD_EXTRA_OPTIONS "")
endif()

function(msrf_ccd_download_project name)
    download_project(
        PROJ         ${name}
        SOURCE_DIR   ${MSRF_CCD_EXTERNAL}/${name}
        DOWNLOAD_DIR ${MSRF_CCD_EXTERNAL}/.cache/${name}
        QUIET
        ${MSRF_CCD_EXTRA_OPTIONS}
        ${ARGN}
    )
endfunction()

################################################################################

# Eigen
function(msrf_ccd_download_eigen)
  msrf_ccd_download_project(eigen
    URL https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.zip
  )
endfunction()
