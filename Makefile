V=1

all:

install:
	install -d -m 755 $(DESTDIR)/usr/share/archiso/
	cp -a --no-preserve=ownership configs $(DESTDIR)/usr/share/archiso/

dist:
	git archive --format=tar --prefix=archiso-openrc-$(V)/ v$(V) | gzip -9 > archiso-openrc-$(V).tar.gz
	gpg --detach-sign --use-agent archiso-openrc-$(V).tar.gz

.PHONY: install dist
