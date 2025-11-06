#!/bin/sh

SHADER_URL="https://download.unity3d.com/download_unity/f99f05b3e950/builtin_shaders-6000.0.62f1.zip"
EDITOR_BASE="/Applications/Unity/Hub/Editor"
CSREF_URL="git@github.com:Unity-Technologies/UnityCsReference.git"

if [ ! -d BuiltinShaders ]; then
  wget $SHADER_URL
  unzip builtin_shaders-*.zip

  mkdir BuiltinShaders
  unzip build/BuiltinShaders/builtin_shaders.zip -d BuiltinShaders

  rm builtin_shaders-*.zip
  rm -r build
fi

if [ ! -d Documentation ]; then
  LATEST_EDITOR=`ls $EDITOR_BASE | sort -V | tail -n 1`
  cp -r $EDITOR_BASE/$LATEST_EDITOR/Documentation .
fi

if [ ! -d UnityCsReference ]; then
  git clone $CSREF_URL
fi




