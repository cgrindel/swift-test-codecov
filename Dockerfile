FROM swift:latest as builder

WORKDIR /build
RUN git clone https://github.com/mattpolzin/swift-test-codecov.git

WORKDIR swift-test-codecov
RUN git checkout master \
 && swift build

FROM swift:slim

COPY --from=builder /build/swift-test-codecov/.build/debug/swift-test-codecov /usr/bin/swift-test-codecov

ENTRYPOINT ['swift-test-codecov']
