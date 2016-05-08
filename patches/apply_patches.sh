#!/bin/bash
# Shell script to apply patches necessary to build for Falcon devices

pushd $(dirname "${0}") > /dev/null
SCRIPTPATH=$(pwd -L)
# Use "pwd -P" for the path without links. man bash for more info.
popd > /dev/null

SCRIPTPATH=$SCRIPTPATH"/"

# Location of ANDROID_ROOT compared with $SCRIPTPATH
ROOT_LOCATION=../../../../

# PATCHFILE=name of patch to apply
# DIRECTORY=directory to apply patch to relative to ANDROID_ROOT

PATCHFILE[0]="android_hardware_qcom_audio-caf-msm8974.patch"
DIRECTORY[0]="hardware/qcom/audio-caf-msm8974"

PATCHFILE[1]="android_build.patch"
DIRECTORY[1]="build"

PATCHFILE[2]="android_system_core.patch"
DIRECTORY[2]="system/core"

PATCHFILE[3]="android_packages_apps_FMRadio.patch"
DIRECTORY[3]="packages/apps/FMRadio"


ARRAY_LENGTH=${#PATCHFILE[@]}
COUNTER=0
while [  $COUNTER -lt $ARRAY_LENGTH ]; do
        cd $SCRIPTPATH$ROOT_LOCATION${DIRECTORY[$COUNTER]} || exit
	ABS_PATCHFILE=$SCRIPTPATH${PATCHFILE[$COUNTER]}

	CMD_OUTPUT=$(git am $ABS_PATCHFILE)

        echo $CMD_OUTPUT

	if [[ $CMD_OUTPUT =~ error.|fail. ]]; then
		git am --abort
		echo Ran git am --abort
	fi

	let COUNTER=COUNTER+1
done
