docker run $1 \
    bash -c "rustc --version && cd /root && cargo new test_1 && cd test_1 && echo 'rand = \"0.8.5\"' >> Cargo.toml && cargo run"