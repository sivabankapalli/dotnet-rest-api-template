#!/bin/bash
set -e

# Step 1: Inputs
if [ -z "$1" ]; then
  read -p "Enter the new service name (e.g., PaymentService): " SERVICE_NAME
else
  SERVICE_NAME="$1"
fi

if [ -z "$2" ]; then
  read -p "Enter the root namespace (e.g., MyCompany.PaymentService): " ROOT_NAMESPACE
else
  ROOT_NAMESPACE="$2"
fi

OLD_ROOT_FOLDER="dotnet-api-template"
OLD_NAMESPACE="DotNetRestApiTemplate"

echo "Starting rename process..."
echo "Service Name:       $SERVICE_NAME"
echo "Root Namespace:     $ROOT_NAMESPACE"
echo ""

# Step 2: Rename solution file
if [ -f "$OLD_ROOT_FOLDER.sln" ]; then
  mv "$OLD_ROOT_FOLDER.sln" "$SERVICE_NAME.sln"
  echo "Solution renamed: $OLD_ROOT_FOLDER.sln → $SERVICE_NAME.sln"
fi

# Step 3: Rename project folders under src/ and test/
for BASE in "src" "test"; do
  find "$BASE" -depth -type d -name "$OLD_NAMESPACE*" | while read -r DIR; do
    NEW_DIR=$(echo "$DIR" | sed "s/$OLD_NAMESPACE/$SERVICE_NAME/g")
    mv "$DIR" "$NEW_DIR"
    echo "Renamed folder: $DIR → $NEW_DIR"
  done
done

# Step 4: Rename all .csproj files
find . -type f -name "$OLD_NAMESPACE*.csproj" | while read -r FILE; do
  NEW_FILE=$(echo "$FILE" | sed "s/$OLD_NAMESPACE/$SERVICE_NAME/g")
  mv "$FILE" "$NEW_FILE"
  echo "Renamed project file: $FILE → $NEW_FILE"
done

# Step 5: Update content (namespace, assembly names, references)
find . -type f \( -name "*.cs" -o -name "*.csproj" -o -name "*.sln" \) | while read -r FILE; do
  sed -i.bak "s/$OLD_NAMESPACE/$SERVICE_NAME/g" "$FILE"
  sed -i.bak "s/DotNetRestApiTemplate/$ROOT_NAMESPACE/g" "$FILE"
  rm "$FILE.bak"
done
