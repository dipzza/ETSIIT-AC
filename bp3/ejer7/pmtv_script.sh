#!/bin/bash
export OMP_NUM_THREADS=12

export OMP_SCHEDULE="static"
./pmtv 15360

export OMP_SCHEDULE="static,1"
./pmtv 15360


export OMP_SCHEDULE="static,64"
./pmtv 15360


export OMP_SCHEDULE="dynamic"
./pmtv 15360


export OMP_SCHEDULE="dynamic,1"
./pmtv 15360


export OMP_SCHEDULE="dynamic,64"
./pmtv 15360


export OMP_SCHEDULE="guided"
./pmtv 15360

export OMP_SCHEDULE="guided,1"
./pmtv 15360

export OMP_SCHEDULE="guided,64"
./pmtv 15360
