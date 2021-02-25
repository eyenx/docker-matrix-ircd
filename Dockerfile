	
FROM	ekidd/rust-musl-builder:latest
LABEL	org.opencontainers.image.source="Toni Tauro <eye@eyenx.ch>"
RUN	git clone https://github.com/matrix-org/matrix-ircd \
	&& cd matrix-ircd \
	&& cargo build
FROM	scratch
COPY --from=0	/home/rust/src/matrix-ircd/target/x86_64-unknown-linux-musl/debug/matrix-ircd	/matrix-ircd
ENTRYPOINT	["/matrix-ircd"]
