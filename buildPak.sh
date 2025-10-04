#!/bin/sh

src_path=$(dirname -- $(readlink -fn -- "$0"))

cd "$src_path"

rm -rf build
mkdir -p build/source/Localization/Russian/Fonts

cp -r Gender build/source/Localization/Russian
cp Fonts/* build/source/Localization/Russian/Fonts
cp language.lsx build/source/Localization/Russian
cp russian.xml build/source/Localization/Russian

dotnet ./Tools/Divine.dll -g dos2de -a create-package -c lz4hc -s "$src_path/build/source/" -d "$src_path/build/Russian.pak"
