Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4A628634F
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Oct 2020 18:12:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F98EC32EA6;
	Wed,  7 Oct 2020 16:12:27 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F262FC32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 16:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1602087120;
 bh=6a4ugHS1nuxZ6yRkFMlNJbWnSuaGbrmY0YV7lzzVKbc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=az2cn9leZtAqRIFr0LKHFqqeVGSnqmhK+dKfEtxS+GH4lniZxJBGHQPhn556GWwYZ
 kGlDiMEXnahUKcbyOHURP8Q08GLxw4bT+aJWiUGLWqslWlV02EO5rm2adTcIzqdF0z
 zYDLF+qyuR7no4a46mmT+XlY97QfOke+S2xnAdUc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from workstation4.fritz.box ([178.202.41.107]) by mail.gmx.com
 (mrgmx105 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1N6bjy-1kRcJK1tHC-017z1l; Wed, 07 Oct 2020 18:12:00 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Tom Rini <trini@konsulko.com>
Date: Wed,  7 Oct 2020 18:11:48 +0200
Message-Id: <20201007161148.59389-1-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:upsSWvSDZDZwS3Rn+EqHeSkwRfxTf+bmgjb5DQzNPkavUZDxdrl
 gPOydtgDoYFs0ziWLrPTY0hD7x/qHNehZ7uImd+g/vcSBuen5HJJMAhrmCwDg+FErS9579d
 omMNyDjjjAZLyMLKWWWeDZoXdAvgQk/OHV3DVz5PoaVPB0Mwl0wAv9EnjbGTOHdqptUancO
 s1m2tQW1E0+TIiaVLPx/g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LHdlZKsHN6Q=:Jw/xUTR7gMqVDhzRDmOEAn
 fGNO86PS0jjm6FcNhLZvVoTTQLjICaAIjVwyvGf/m6+zp8CotBtuh/XoWvBDdmdulLm8+u1Um
 oq7VjlOavxShaoQ1wzeg3Dqo1SVr5ImQxooYDezMIhff71nZ4gije8aiRBTnLC3DxYBsKVdbz
 YOU8WnHGKdwl7IO2bCxthVsRice/TB2Dq74LEpvzZsNtkFomiaqdTh4SVyJYgbZp39+ulgvx1
 QBNvlBk6en+xaq00QKHzRjMPIrmnaSgHU2Fa+M2+3pGZ+lYFmBMyNgxA6Dx+Y4DRgr1DH4iNV
 ik/yDQmCmL1NwoL6/gtnfES/tyvGAKUeAfxEM7pZRv3T+cNs8Wu8g2SHDlUn0LWM2IQH28kma
 491QzyVWbLOjnKAlC96ff2tpAi8ugA+6SFtwIWsAeIAM1ciK75ViUo7Ym2hbuf7GSCVHEvVD8
 50f4/khgB7hbxVb4Dhof0HvWXV0N6OGE2woa0IEZgPFhj+ur/JHBOZk5SEkaEcgehgZjE31yu
 Wh2VTP6SKJnZQ4+r7FIckplnd97rIrQ/EHwoCBVwHv4liunDCKexdAJuLvxKAvvqmBDwLvuY3
 QMecgq/o7CrES3ZsBqTK2MMoS9KQ2xamQicPhGwF75yeko65mPdGqasiWI78MJPTZkmTCP3y+
 ryG4fl3dF8Sg5CvsuFQUPjaDptTY5vBJg4yCtbXar/V+LViR2dy85nKgg+joVO4qcyLhmOn1D
 In31xCdvAnzpbOacKczhiaZBkJrzsg1zvfgk/oTCAfR1Fq/zbnE2mbczV/8+VrQrvE50xKi5w
 N5uzFpLjw1clUl9gD7EVgrgX2F4C/HJbbN54SJXi+OXiKIhfXm81FxWbhOfc82YntLFQ4zz89
 eVsmdXHjFkWkbMzUEmNTf6Cw8FRUD/28qI7iGf11htzWpCoh9BDlpwtQfCza6SiQczfvVFiyT
 IjU17j9svZAJ4NRTMko1m7NMHqWjcJv9BBj+hahg3+PGK9BbAzHu443vZCarB0van19ac5EVJ
 JC+8TGiu/CHy5yiwguaVO8ggrUX6PQBn1wPwyvO7RY6Cr3e+vVzi9y0VqNsBqnqCOcZqNnI5a
 +zb/j9+1Mj7PMkbO+32Ty1ED58PfaiioVSZZZZc1TofEHP9iqrKhS6gd49sSkgV+GVawPtXNv
 V4PLbRFBM1LkMV/8Bqr8L8QBd7+O4gfuqGLSAr/Cg4qLx850t3TVCkTVjVfZxFheM0RvdfM6R
 cA9mPEKn46/UHtsnZI+3eM8QNH4lUZb5e+gwJvQ==
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Anatolij Gustschin <agust@denx.de>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Weijie Gao <weijie.gao@mediatek.com>,
 Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>, u-boot@lists.denx.de,
 Alexander Graf <agraf@csgraf.de>,
 Thirupathaiah Annapureddy <thiruan@linux.microsoft.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Andreas Dannenberg <dannenberg@ti.com>
Subject: [Uboot-stm32] [PATCH 1/1] common: rename getc() to getchar()
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

The sandbox is built with the SDL2 library with invokes the X11 library
which in turn calls getc(). But getc() in glibc is defined as

    int getc(FILE *)

This does not match our definition.

    int getc(void)

The sandbox crashes when called with parameter -l.

Rename our library symbol getc() to getchar().

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 api/api.c                                   |  2 +-
 cmd/bootmenu.c                              |  4 +-
 cmd/load.c                                  | 44 ++++++++++-----------
 common/autoboot.c                           | 10 ++---
 common/cli_readline.c                       |  4 +-
 common/console.c                            | 12 +++---
 common/spl/spl_ymodem.c                     |  2 +-
 common/xyzModem.c                           |  2 +-
 drivers/ddr/fsl/main.c                      |  2 +-
 drivers/ram/stm32mp1/stm32mp1_interactive.c |  2 +-
 drivers/serial/serial-uclass.c              |  2 +-
 drivers/serial/serial.c                     |  2 +-
 include/_exports.h                          |  2 +-
 include/stdio.h                             |  2 +-
 lib/charset.c                               |  2 +-
 lib/efi_loader/efi_console.c                | 20 +++++-----
 test/dm/usb.c                               |  2 +-
 17 files changed, 58 insertions(+), 58 deletions(-)

diff --git a/api/api.c b/api/api.c
index c7f5db776a..493b77f809 100644
--- a/api/api.c
+++ b/api/api.c
@@ -57,7 +57,7 @@ static int API_getc(va_list ap)
 	if ((c = (int *)va_arg(ap, uintptr_t)) == NULL)
 		return API_EINVAL;

-	*c = getc();
+	*c = getchar();
 	return 0;
 }

diff --git a/cmd/bootmenu.c b/cmd/bootmenu.c
index 18efe25751..1ba7b622e5 100644
--- a/cmd/bootmenu.c
+++ b/cmd/bootmenu.c
@@ -99,7 +99,7 @@ static void bootmenu_autoboot_loop(struct bootmenu_data *menu,
 			}

 			menu->delay = -1;
-			c = getc();
+			c = getchar();

 			switch (c) {
 			case '\e':
@@ -141,7 +141,7 @@ static void bootmenu_loop(struct bootmenu_data *menu,
 		mdelay(10);
 	}

-	c = getc();
+	c = getchar();

 	switch (*esc) {
 	case 0:
diff --git a/cmd/load.c b/cmd/load.c
index 63a9414543..9a3a16979c 100644
--- a/cmd/load.c
+++ b/cmd/load.c
@@ -81,7 +81,7 @@ static int do_load_serial(struct cmd_tbl *cmdtp, int flag, int argc,
 		serial_setbrg();
 		udelay(50000);
 		for (;;) {
-			if (getc() == '\r')
+			if (getchar() == '\r')
 				break;
 		}
 	}
@@ -102,7 +102,7 @@ static int do_load_serial(struct cmd_tbl *cmdtp, int flag, int argc,
 	 */
 	for (i=0; i<100; ++i) {
 		if (tstc()) {
-			(void) getc();
+			getchar();
 		}
 		udelay(1000);
 	}
@@ -124,7 +124,7 @@ static int do_load_serial(struct cmd_tbl *cmdtp, int flag, int argc,
 		serial_setbrg();
 		udelay(50000);
 		for (;;) {
-			if (getc() == 0x1B) /* ESC */
+			if (getchar() == 0x1B) /* ESC */
 				break;
 		}
 	}
@@ -212,7 +212,7 @@ static int read_record(char *buf, ulong len)
 	--len;	/* always leave room for terminating '\0' byte */

 	for (p=buf; p < buf+len; ++p) {
-		c = getc();		/* read character		*/
+		c = getchar();		/* read character		*/
 		if (do_echo)
 			putc(c);	/* ... and echo it		*/

@@ -229,7 +229,7 @@ static int read_record(char *buf, ulong len)
 		}

 	    /* Check for the console hangup (if any different from serial) */
-	    if (gd->jt->getc != getc) {
+	    if (gd->jt->getc != getchar) {
 		if (ctrlc()) {
 		    return (-1);
 		}
@@ -276,7 +276,7 @@ int do_save_serial(struct cmd_tbl *cmdtp, int flag, int argc,
 		serial_setbrg();
 		udelay(50000);
 		for (;;) {
-			if (getc() == '\r')
+			if (getchar() == '\r')
 				break;
 		}
 	}
@@ -288,7 +288,7 @@ int do_save_serial(struct cmd_tbl *cmdtp, int flag, int argc,

 	printf("## Ready for S-Record upload, press ENTER to proceed ...\n");
 	for (;;) {
-		if (getc() == '\r')
+		if (getchar() == '\r')
 			break;
 	}
 	if (save_serial(offset, size)) {
@@ -305,7 +305,7 @@ int do_save_serial(struct cmd_tbl *cmdtp, int flag, int argc,
 		serial_setbrg();
 		udelay(50000);
 		for (;;) {
-			if (getc() == 0x1B) /* ESC */
+			if (getchar() == 0x1B) /* ESC */
 				break;
 		}
 	}
@@ -459,7 +459,7 @@ static int do_load_serial_bin(struct cmd_tbl *cmdtp, int flag, int argc,
 		serial_setbrg();
 		udelay(50000);
 		for (;;) {
-			if (getc() == '\r')
+			if (getchar() == '\r')
 				break;
 		}
 	}
@@ -505,7 +505,7 @@ static int do_load_serial_bin(struct cmd_tbl *cmdtp, int flag, int argc,
 		serial_setbrg();
 		udelay(50000);
 		for (;;) {
-			if (getc() == 0x1B) /* ESC */
+			if (getchar() == 0x1B) /* ESC */
 				break;
 		}
 	}
@@ -528,7 +528,7 @@ static ulong load_serial_bin(ulong offset)
 	 */
 	for (i=0; i<100; ++i) {
 		if (tstc()) {
-			(void) getc();
+			getchar();
 		}
 		udelay(1000);
 	}
@@ -831,7 +831,7 @@ static int k_recv(void)
 		/* get a packet */
 		/* wait for the starting character or ^C */
 		for (;;) {
-			switch (getc ()) {
+			switch (getchar()) {
 			case START_CHAR:	/* start packet */
 				goto START;
 			case ETX_CHAR:		/* ^C waiting for packet */
@@ -843,13 +843,13 @@ static int k_recv(void)
 START:
 		/* get length of packet */
 		sum = 0;
-		new_char = getc();
+		new_char = getchar();
 		if ((new_char & 0xE0) == 0)
 			goto packet_error;
 		sum += new_char & 0xff;
 		length = untochar(new_char);
 		/* get sequence number */
-		new_char = getc();
+		new_char = getchar();
 		if ((new_char & 0xE0) == 0)
 			goto packet_error;
 		sum += new_char & 0xff;
@@ -876,7 +876,7 @@ START:
 		/* END NEW CODE */

 		/* get packet type */
-		new_char = getc();
+		new_char = getchar();
 		if ((new_char & 0xE0) == 0)
 			goto packet_error;
 		sum += new_char & 0xff;
@@ -886,19 +886,19 @@ START:
 		if (length == -2) {
 			/* (length byte was 0, decremented twice) */
 			/* get the two length bytes */
-			new_char = getc();
+			new_char = getchar();
 			if ((new_char & 0xE0) == 0)
 				goto packet_error;
 			sum += new_char & 0xff;
 			len_hi = untochar(new_char);
-			new_char = getc();
+			new_char = getchar();
 			if ((new_char & 0xE0) == 0)
 				goto packet_error;
 			sum += new_char & 0xff;
 			len_lo = untochar(new_char);
 			length = len_hi * 95 + len_lo;
 			/* check header checksum */
-			new_char = getc();
+			new_char = getchar();
 			if ((new_char & 0xE0) == 0)
 				goto packet_error;
 			if (new_char != tochar((sum + ((sum >> 6) & 0x03)) & 0x3f))
@@ -908,7 +908,7 @@ START:
 		}
 		/* bring in rest of packet */
 		while (length > 1) {
-			new_char = getc();
+			new_char = getchar();
 			if ((new_char & 0xE0) == 0)
 				goto packet_error;
 			sum += new_char & 0xff;
@@ -925,13 +925,13 @@ START:
 			}
 		}
 		/* get and validate checksum character */
-		new_char = getc();
+		new_char = getchar();
 		if ((new_char & 0xE0) == 0)
 			goto packet_error;
 		if (new_char != tochar((sum + ((sum >> 6) & 0x03)) & 0x3f))
 			goto packet_error;
 		/* get END_CHAR */
-		new_char = getc();
+		new_char = getchar();
 		if (new_char != END_CHAR) {
 		  packet_error:
 			/* restore state machines */
@@ -955,7 +955,7 @@ START:

 static int getcxmodem(void) {
 	if (tstc())
-		return (getc());
+		return (getchar());
 	return -1;
 }
 static ulong load_serial_ymodem(ulong offset, int mode)
diff --git a/common/autoboot.c b/common/autoboot.c
index 6d78716a26..28a398a08a 100644
--- a/common/autoboot.c
+++ b/common/autoboot.c
@@ -117,7 +117,7 @@ static int passwd_abort_sha256(uint64_t etime)
 				return 0;
 			}

-			presskey[presskey_len++] = getc();
+			presskey[presskey_len++] = getchar();

 			/* Calculate sha256 upon each new char */
 			hash_block(algo_name, (const void *)presskey,
@@ -189,12 +189,12 @@ static int passwd_abort_key(uint64_t etime)
 	do {
 		if (tstc()) {
 			if (presskey_len < presskey_max) {
-				presskey[presskey_len++] = getc();
+				presskey[presskey_len++] = getchar();
 			} else {
 				for (i = 0; i < presskey_max - 1; i++)
 					presskey[i] = presskey[i + 1];

-				presskey[i] = getc();
+				presskey[i] = getchar();
 			}
 		}

@@ -257,7 +257,7 @@ static int abortboot_single_key(int bootdelay)
 	 * Check if key already pressed
 	 */
 	if (tstc()) {	/* we got a key press	*/
-		(void) getc();  /* consume input	*/
+		getchar();	/* consume input	*/
 		puts("\b\b\b 0");
 		abort = 1;	/* don't auto boot	*/
 	}
@@ -272,7 +272,7 @@ static int abortboot_single_key(int bootdelay)

 				abort  = 1;	/* don't auto boot	*/
 				bootdelay = 0;	/* no more delay	*/
-				key = getc(); /* consume input	*/
+				key = getchar();/* consume input	*/
 				if (IS_ENABLED(CONFIG_USE_AUTOBOOT_MENUKEY))
 					menukey = key;
 				break;
diff --git a/common/cli_readline.c b/common/cli_readline.c
index 1f1e28c6d8..47b876285c 100644
--- a/common/cli_readline.c
+++ b/common/cli_readline.c
@@ -68,7 +68,7 @@ static char *delete_char (char *buffer, char *p, int *colp, int *np, int plen)
 #define CREAD_HIST_CHAR		('!')

 #define getcmd_putch(ch)	putc(ch)
-#define getcmd_getch()		getc()
+#define getcmd_getch()		getchar()
 #define getcmd_cbeep()		getcmd_putch('\a')

 #define HIST_MAX		20
@@ -571,7 +571,7 @@ int cli_readline_into_buffer(const char *const prompt, char *buffer,
 			return -2;	/* timed out */
 		WATCHDOG_RESET();	/* Trigger watchdog, if needed */

-		c = getc();
+		c = getchar();

 		/*
 		 * Special character handling
diff --git a/common/console.c b/common/console.c
index 8e50af1f9d..3348436da6 100644
--- a/common/console.c
+++ b/common/console.c
@@ -131,7 +131,7 @@ static int console_setfile(int file, struct stdio_dev * dev)
 		 */
 		switch (file) {
 		case stdin:
-			gd->jt->getc = getc;
+			gd->jt->getc = getchar;
 			gd->jt->tstc = tstc;
 			break;
 		case stdout:
@@ -179,7 +179,7 @@ struct stdio_dev **console_devices[MAX_FILES];
 int cd_count[MAX_FILES];

 /*
- * This depends on tstc() always being called before getc().
+ * This depends on tstc() always being called before getchar().
  * This is guaranteed to be true because this routine is called
  * only from fgetc() which assures it.
  * No attempt is made to demultiplex multiple input sources.
@@ -404,7 +404,7 @@ int fprintf(int file, const char *fmt, ...)

 /** U-Boot INITIAL CONSOLE-COMPATIBLE FUNCTION *****************************/

-int getc(void)
+int getchar(void)
 {
 #ifdef CONFIG_DISABLE_CONSOLE
 	if (gd->flags & GD_FLG_DISABLE_CONSOLE)
@@ -663,7 +663,7 @@ int ctrlc(void)
 {
 	if (!ctrlc_disabled && gd->have_console) {
 		if (tstc()) {
-			switch (getc()) {
+			switch (getchar()) {
 			case 0x03:		/* ^C - Control C */
 				ctrlc_was_pressed = 1;
 				return 1;
@@ -685,10 +685,10 @@ int confirm_yesno(void)

 	/* Flush input */
 	while (tstc())
-		getc();
+		getchar();
 	i = 0;
 	while (i < sizeof(str_input)) {
-		str_input[i] = getc();
+		str_input[i] = getchar();
 		putc(str_input[i]);
 		if (str_input[i] == '\r')
 			break;
diff --git a/common/spl/spl_ymodem.c b/common/spl/spl_ymodem.c
index 284512478f..e979f780ad 100644
--- a/common/spl/spl_ymodem.c
+++ b/common/spl/spl_ymodem.c
@@ -32,7 +32,7 @@ struct ymodem_fit_info {

 static int getcymodem(void) {
 	if (tstc())
-		return (getc());
+		return (getchar());
 	return -1;
 }

diff --git a/common/xyzModem.c b/common/xyzModem.c
index 6bf2375671..fc3459ebba 100644
--- a/common/xyzModem.c
+++ b/common/xyzModem.c
@@ -72,7 +72,7 @@ CYGACC_COMM_IF_GETC_TIMEOUT (char chan, char *c)
     }
   if (tstc ())
     {
-      *c = getc ();
+      *c = getchar();
       return 1;
     }
   return 0;
diff --git a/drivers/ddr/fsl/main.c b/drivers/ddr/fsl/main.c
index 84139b85c3..c02badd4a8 100644
--- a/drivers/ddr/fsl/main.c
+++ b/drivers/ddr/fsl/main.c
@@ -705,7 +705,7 @@ phys_size_t __fsl_ddr_sdram(fsl_ddr_info_t *pinfo)

 	/* Compute it once normally. */
 #ifdef CONFIG_FSL_DDR_INTERACTIVE
-	if (tstc() && (getc() == 'd')) {	/* we got a key press of 'd' */
+	if (tstc() && (getchar() == 'd')) {	/* we got a key press of 'd' */
 		total_memory = fsl_ddr_interactive(pinfo, 0);
 	} else if (fsl_ddr_interactive_env_var_exists()) {
 		total_memory = fsl_ddr_interactive(pinfo, 1);
diff --git a/drivers/ram/stm32mp1/stm32mp1_interactive.c b/drivers/ram/stm32mp1/stm32mp1_interactive.c
index 38390c0d55..5a5d067046 100644
--- a/drivers/ram/stm32mp1/stm32mp1_interactive.c
+++ b/drivers/ram/stm32mp1/stm32mp1_interactive.c
@@ -394,7 +394,7 @@ bool stm32mp1_ddr_interactive(void *priv,
 		unsigned long start = get_timer(0);

 		while (1) {
-			if (tstc() && (getc() == 'd')) {
+			if (tstc() && (getchar() == 'd')) {
 				next_step = STEP_DDR_RESET;
 				break;
 			}
diff --git a/drivers/serial/serial-uclass.c b/drivers/serial/serial-uclass.c
index 0027625ebf..f3c25d4216 100644
--- a/drivers/serial/serial-uclass.c
+++ b/drivers/serial/serial-uclass.c
@@ -413,7 +413,7 @@ static int on_baudrate(const char *name, const char *value, enum env_op op,

 		if ((flags & H_INTERACTIVE) != 0)
 			while (1) {
-				if (getc() == '\r')
+				if (getchar() == '\r')
 					break;
 			}

diff --git a/drivers/serial/serial.c b/drivers/serial/serial.c
index 53358acb81..355659ba05 100644
--- a/drivers/serial/serial.c
+++ b/drivers/serial/serial.c
@@ -90,7 +90,7 @@ static int on_baudrate(const char *name, const char *value, enum env_op op,

 		if ((flags & H_INTERACTIVE) != 0)
 			while (1) {
-				if (getc() == '\r')
+				if (getchar() == '\r')
 					break;
 			}

diff --git a/include/_exports.h b/include/_exports.h
index 1e9ba86108..aeb666c847 100644
--- a/include/_exports.h
+++ b/include/_exports.h
@@ -8,7 +8,7 @@
 #define EXPORT_FUNC(a, b, c, ...)
 #endif
 	EXPORT_FUNC(get_version, unsigned long, get_version, void)
-	EXPORT_FUNC(getc, int, getc, void)
+	EXPORT_FUNC(getchar, int, getc, void)
 	EXPORT_FUNC(tstc, int, tstc, void)
 	EXPORT_FUNC(putc, void, putc, const char)
 	EXPORT_FUNC(puts, void, puts, const char *)
diff --git a/include/stdio.h b/include/stdio.h
index aedf374452..039f7df689 100644
--- a/include/stdio.h
+++ b/include/stdio.h
@@ -5,7 +5,7 @@
 #include <linux/compiler.h>

 /* stdin */
-int getc(void);
+int getchar(void);
 int tstc(void);

 /* stdout */
diff --git a/lib/charset.c b/lib/charset.c
index a28034ee1f..5686d6fb59 100644
--- a/lib/charset.c
+++ b/lib/charset.c
@@ -104,7 +104,7 @@ static u8 read_console(void *data)
 {
 	int ch;

-	ch = getc();
+	ch = getchar();
 	if (ch < 0)
 		ch = 0;
 	return ch;
diff --git a/lib/efi_loader/efi_console.c b/lib/efi_loader/efi_console.c
index 426de77951..011accab78 100644
--- a/lib/efi_loader/efi_console.c
+++ b/lib/efi_loader/efi_console.c
@@ -76,7 +76,7 @@ static int term_get_char(s32 *c)
 		if (timer_get_us() > timeout)
 			return 1;

-	*c = getc();
+	*c = getchar();
 	return 0;
 }

@@ -269,7 +269,7 @@ static int query_console_serial(int *rows, int *cols)

 	/* Empty input buffer */
 	while (tstc())
-		getc();
+		getchar();

 	/*
 	 * Not all terminals understand CSI [18t for querying the console size.
@@ -634,13 +634,13 @@ static int analyze_modifiers(struct efi_key_state *key_state)
 {
 	int c, mod = 0, ret = 0;

-	c = getc();
+	c = getchar();

 	if (c != ';') {
 		ret = c;
 		if (c == '~')
 			goto out;
-		c = getc();
+		c = getchar();
 	}
 	for (;;) {
 		switch (c) {
@@ -649,7 +649,7 @@ static int analyze_modifiers(struct efi_key_state *key_state)
 			mod += c - '0';
 		/* fall through */
 		case ';':
-			c = getc();
+			c = getchar();
 			break;
 		default:
 			goto out;
@@ -692,25 +692,25 @@ static efi_status_t efi_cin_read_key(struct efi_key_data *key)
 		 * Xterm Control Sequences
 		 * https://www.xfree86.org/4.8.0/ctlseqs.html
 		 */
-		ch = getc();
+		ch = getchar();
 		switch (ch) {
 		case cESC: /* ESC */
 			pressed_key.scan_code = 23;
 			break;
 		case 'O': /* F1 - F4, End */
-			ch = getc();
+			ch = getchar();
 			/* consider modifiers */
 			if (ch == 'F') { /* End */
 				pressed_key.scan_code = 6;
 				break;
 			} else if (ch < 'P') {
 				set_shift_mask(ch - '0', &key->key_state);
-				ch = getc();
+				ch = getchar();
 			}
 			pressed_key.scan_code = ch - 'P' + 11;
 			break;
 		case '[':
-			ch = getc();
+			ch = getchar();
 			switch (ch) {
 			case 'A'...'D': /* up, down right, left */
 				pressed_key.scan_code = ch - 'A' + 1;
@@ -868,7 +868,7 @@ static void efi_cin_check(void)
 static void efi_cin_empty_buffer(void)
 {
 	while (tstc())
-		getc();
+		getchar();
 	key_available = false;
 }

diff --git a/test/dm/usb.c b/test/dm/usb.c
index db4b8ba0f7..5d6ceefce0 100644
--- a/test/dm/usb.c
+++ b/test/dm/usb.c
@@ -427,7 +427,7 @@ static int dm_test_usb_keyb(struct unit_test_state *uts)

 		for (c = pos->result; *c; ++c) {
 			ut_asserteq(1, tstc());
-			ut_asserteq(*c, getc());
+			ut_asserteq(*c, getchar());
 		}
 		ut_asserteq(0, tstc());
 	}
--
2.28.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
