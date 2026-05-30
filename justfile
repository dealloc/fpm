# https://just.systems

# Check if code is formatted correctly
format:
    cargo fmt --check
    taplo check

lint:
    cargo check
    cargo clippy --all-targets --all-features -- -D warnings

# Check dependencies and licensing
dependencies:
    cargo machete
    cargo deny check
    cargo audit

# Check commit messages
commits:
    committed origin/master..HEAD

fix:
    cargo clippy --fix --allow-dirty
    cargo fmt
    taplo format

changelog:
    git-cliff -o CHANGELOG.md --latest --strip all

test:
    cargo nextest run --no-fail-fast

# Install all tools used for this repo's CI and other tools
setup:
    cargo install cargo-deny
    cargo install committed
    cargo install git-cliff
    cargo install --locked cargo-nextest
    cargo install cargo-machete
    cargo install taplo-cli --locked
    cargo install cargo-audit --locked
    cargo fetch --locked
