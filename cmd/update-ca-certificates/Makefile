DESTDIR=
prefix=/usr
sbindir=$(prefix)/sbin

TARGET=update-ca-certificates

all: $(TARGET)

$(TARGET): *.go
	pwd && \
	go build -v -o $@ ./

tidy:
	go mod tidy

install: $(TARGET)
	install -Dm755 $(TARGET) -t $(DESTDIR)$(sbindir)

clean:
	rm -f $(TARGET)

.PHONY: all install clean tidy
