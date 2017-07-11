
CFLAGS_DBUS = $(shell pkg-config --cflags --libs dbus-1)
CFLAGS_DBUS_GLIB = $(shell pkg-config --cflags --libs dbus-glib-1)
CFLAGS_GIO  = $(shell pkg-config --cflags --libs gio-2.0)

CFLAGS = -g -Wall -Werror


all: dbus-server dbus-client send listen

dbus-server: dbus-server.c
	gcc $< -o $@ $(CFLAGS) $(CFLAGS_DBUS) $(CFLAGS_DBUS_GLIB)
send: send.c
	gcc $< -o $@ $(CFLAGS) $(CFLAGS_DBUS) $(CFLAGS_DBUS_GLIB)
listen: listen.c
	gcc $< -o $@ $(CFLAGS) $(CFLAGS_DBUS) $(CFLAGS_DBUS_GLIB)
dbus-client: dbus-client.c
	gcc $< -o $@ $(CFLAGS) $(CFLAGS_GIO)

clean:
	rm -f dbus-server
	rm -f dbus-client
	rm -f send
	rm -f listen


.PHONY: all clean
