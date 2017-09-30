DESTDIR =
PREFIX = /usr/local
DOC_DIR = $(PREFIX)/share/doc/neomutt

INSTALL = install
RM = rm -fr

CONTRIB_DIRS = colorschemes hcache-bench keybase lua vim-keys

all:

clean:

distclean: clean

install-colorschemes:
	@d=colorschemes; \
	echo "Installing $$d"; \
	$(INSTALL) -d -m 755 $(DESTDIR)$(DOC_DIR)/$$d; \
	for f in $$d/*; do \
		$(INSTALL) -m 644 $$f $(DESTDIR)$(DOC_DIR)/$$d; \
	done

install-hcache-bench:
	@d=hcache-bench; \
	echo "Installing $$d"; \
	$(INSTALL) -d -m 755 $(DESTDIR)$(DOC_DIR)/$$d; \
	$(INSTALL) -m 755 $$d/neomutt-hcache-bench.sh $(DESTDIR)$(DOC_DIR)/$$d; \
	for f in neomuttrc README.md; do \
		$(INSTALL) -m 644 $$d/$$f $(DESTDIR)$(DOC_DIR)/$$d; \
	done

install-keybase:
	@d=keybase; \
	echo "Installing $$d"; \
	$(INSTALL) -d -m 755 $(DESTDIR)$(DOC_DIR)/$$d; \
	for f in attachmentView.png keybase.py LICENSE neomuttrc pagerMode.png README.md; do \
		$(INSTALL) -m 644 $$d/$$f $(DESTDIR)$(DOC_DIR)/$$d; \
	done; \
	for f in decrypt.sh install.sh pgpdecrypt.sh pgpverify.sh verify.sh; do \
		$(INSTALL) -m 755 $$d/$$f $(DESTDIR)$(DOC_DIR)/$$d; \
	done

install-lua:
	@d=lua; \
	echo "Installing $$d"; \
	$(INSTALL) -d -m 755 $(DESTDIR)$(DOC_DIR)/$$d; \
	for f in $$d/*; do \
		$(INSTALL) -m 644 $$f $(DESTDIR)$(DOC_DIR)/$$d; \
	done

install-vim-keys:
	@d=vim-keys; \
	echo "Installing $$d"; \
	$(INSTALL) -d -m 755 $(DESTDIR)$(DOC_DIR)/$$d; \
	for f in $$d/*; do \
		$(INSTALL) -m 644 $$f $(DESTDIR)$(DOC_DIR)/$$d; \
	done

install-misc:
	@d=misc; \
	echo "Installing $$d"; \
	for f in colors.default colors.linux gpg.rc language.txt language50.txt Mush.rc patch.slang-1.2.2.keypad.1 pgp2.rc pgp5.rc pgp6.rc Pine.rc sample.mailcap sample.neomuttrc sample.neomuttrc-tlr smime.rc Tin.rc; do \
		$(INSTALL) -m 644 $$f $(DESTDIR)$(DOC_DIR); \
	done; \
	$(INSTALL) -m 755 smime_keys_test.pl $(DESTDIR)$(DOC_DIR)


install: install-colorschemes install-hcache-bench install-keybase install-lua install-vim-keys install-misc

uninstall:
	for d in $(CONTRIB_DIRS); do \
		$(RM) $(DESTDIR)$(DOC_DIR)/$$d; \
	done
	for f in colors.default colors.linux gpg.rc guix-neomutt.scm language.txt language50.txt Mush.rc patch.slang-1.2.2.keypad.1 pgp2.rc pgp5.rc pgp6.rc Pine.rc sample.mailcap sample.neomuttrc sample.neomuttrc-tlr smime.rc Tin.rc smime_keys smime_keys_test.pl; do \
		$(RM) $(DESTDIR)$(DOC_DIR)/$$f; \
	done

