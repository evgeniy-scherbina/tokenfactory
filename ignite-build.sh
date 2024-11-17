ignite chain build \
    --release.targets linux:amd64 \
    --release.targets linux:arm64 \
    --release.targets darwin:amd64 \
    --release.targets darwin:arm64 \
    --output ./release \
    --release

# you can unzip it with
# tar xzf myproject_linux_amd64.tar.gz

# If you want to confirm a match between the written checksum values and their calculated values, run:
# cd release && shasum --check release_checksum
