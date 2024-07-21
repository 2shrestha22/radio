#!/bin/bash

# Download yq
echo "Downloading yq..."
wget -q https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64.tar.gz -O - | tar xz
mv yq_linux_amd64 yq
chmod +x yq

# Extract flutter version
echo "Reading flutter version from pubspec.yaml..."
FLUTTER_VERSION=$(./yq '.environment.flutter' pubspec.yaml)
echo "Flutter Version: $FLUTTER_VERSION"

echo "Downloading flutter..."
# Download flutter and extract
wget -q https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_$FLUTTER_VERSION-stable.tar.xz -O flutter.tar.xz;

echo "Extracting flutter..."
tar -xf flutter.tar.xz

flutter/bin/flutter doctor;
flutter/bin/flutter build web;
