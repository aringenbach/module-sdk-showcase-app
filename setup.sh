#!/usr/bin/env bash

ELEMENTX_DIR=element-x-ios
# The tag/branch the version should be build with.
ELEMENTX_TAG=remotes/origin/aringenbach/module-sdk-wip

MODULES_DIR=Modules

# Remove ElementX directory if it exists.
rm -rf $ELEMENTX_DIR

# Clone and checkout the expected ElementX version.
git clone git@github.com:vector-im/element-x-ios.git $ELEMENTX_DIR
cd $ELEMENTX_DIR
git fetch --all --tags
git checkout $ELEMENTX_TAG

# Setup ElementX tools.
swift run tools setup-project

cd ..

rm -rf $MODULES_DIR

git clone git@github.com:aringenbach/OnboardingTitleProvider.git $MODULES_DIR/OnboardingTitleProvider
cd $MODULES_DIR/OnboardingTitleProvider
git fetch --all --tags
git checkout local-dep

cd ../..

git clone git@github.com:aringenbach/RustSDKModule.git $MODULES_DIR/RustSDKModule
cd $MODULES_DIR/RustSDKModule
git fetch --all --tags
git checkout local-dep

# Run Fastlane for ModuleSDK configuration.
cd ../..
fastlane config_custom
