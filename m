Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4881C38A6
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 May 2020 13:54:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD11FC36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 May 2020 11:54:46 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C379C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 May 2020 11:54:43 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id x18so20572411wrq.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 May 2020 04:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XWjEbVbDjSi+6Imz5rumMLgxmJKIXAWUc0hX09tTAjw=;
 b=Wb/P2GoSU8zVk/X9ycSaQdcSGYxPZ0S20kBmGwGPfPdIDTfAT3eeI1sZCcgCr4/Tyk
 CacLt7h9tZGcFgoPTI9PLRsluxCwBbq42zFZQGrfZ93ewQQeIpFRhaFUjspzhVNU/mlD
 Dl5fvUYd9kan3y9LjvvNXVvWoFAg+0cuCttPV41iknT7OHQucRGBLXXfURqhSkvkmzKk
 rOYEcFBVnPMmzemWcu/zgNZsJ9bynrMjSUsI80sFhFMbXULmqkpEXkQGz4FcO/HpPNh1
 8oRZrDbDPzUd7AhETCLErFUhillD35VwLXtQXo8Er18rmT4RKfVc94wbFiW8Eej15PU0
 jIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=XWjEbVbDjSi+6Imz5rumMLgxmJKIXAWUc0hX09tTAjw=;
 b=c0ay4HqGHm8JGswqNg+FlVOhBvORMmoND319ypRjOCZjKMq1hKC+tPunE5vpgPmjfw
 FewE7im0PE5P6Mx6BqDTd6YpOatchtLD3E2PdpyS2Hcf3eH7ARSI9I0R7chdGMcABJB4
 cxvDbhVWFeRfoQ0OWrH7ug88gYDGlNv+9oLM8UGGqoRfFmajjm13C6OUtxVb1iohVnUl
 w7gfgvAJxPJ7V5Ob1PE4/5p7AdN9ImzoQVnGKhoYjCKWZnzFT8+k+AL8bh4P6NF6Cvua
 pWwgjMRlSuEG2GAZqw0pfVVPqxytIqEKajbgEGqm+G/KgGSxDxt+/15n3uGYpt6KjEmy
 2zRw==
X-Gm-Message-State: AGi0PuYK/asgRyODCpFm3Fhgs4PZS4f6gGjcjOeaZ3ZuGgwcPNGYFQhm
 vLTh6C2IWfMG4vJFbqm3ZAIyWQ==
X-Google-Smtp-Source: APiQypIQNLg/wJdW4awTMm9xb4E7BuK63IX8XRez1NAEmfFICyqw73TsdkNqrOPGEXwgPbh/zW0nfA==
X-Received: by 2002:a5d:68c7:: with SMTP id p7mr3189742wrw.29.1588593283318;
 Mon, 04 May 2020 04:54:43 -0700 (PDT)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
 by smtp.gmail.com with ESMTPSA id z11sm10303781wro.48.2020.05.04.04.54.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 04 May 2020 04:54:42 -0700 (PDT)
From: Michal Simek <michal.simek@xilinx.com>
To: u-boot@lists.denx.de,
	git@xilinx.com
Date: Mon,  4 May 2020 13:54:40 +0200
Message-Id: <f5214e0dd5f7a2c713f18d75727cc112d2d5e88b.1588593276.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: Joel Johnson <mrjoel@lixil.net>,
 Hannes Schmelzer <hannes.schmelzer@br-automation.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>,
 Ken Lin <Ken.Lin@advantech.com.tw>, uboot-stm32@st-md-mailman.stormreply.com,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marex@denx.de>, Pascal Linder <pascal.linder@edu.hefr.ch>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Ian Ray <ian.ray@ge.com>,
 Thomas Hebb <tommyhebb@gmail.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Anatolij Gustschin <agust@denx.de>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Tetsuyuki Kobayashi <koba@kmckk.co.jp>,
 Andreas Geisreiter <ageisreiter@dh-electronics.de>,
 Otavio Salvador <otavio@ossystems.com.br>, Thomas Weber <weber@corscience.de>,
 Tim Harvey <tharvey@gateworks.com>,
 Troy Kisky <troy.kisky@boundarydevices.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>,
 Akshay Bhat <akshaybhat@timesys.com>, Adam Ford <aford173@gmail.com>,
 Ludwig Zenz <lzenz@dh-electronics.de>, Andreas Dannenberg <dannenberg@ti.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, Heiko Schocher <hs@denx.de>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Simon Glass <sjg@chromium.org>, Holger Brunck <holger.brunck@ch.abb.com>,
 Mario Six <mario.six@gdsys.cc>,
 Masakazu Mochizuki <masakazu.mochizuki.wd@hitachi.com>
Subject: [Uboot-stm32] [PATCH] cmd: mem: Remove CONFIG_SYS_MEMTEST_SCRATCH
	mapping
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

There is no real need to exactly define space for saving patterns for
alternate memory test. It is much easier to allocate space on the stack and
use it instead of trying to find out space where pattern should be saved.

For example if you want to test the whole DDR memory you can't save patter
to DDR and you need to find it out. On Xilinx devices DDR or OCM addresses
were chosen but that means that OCM needs to be mapped and U-Boot has
access permission there.

It is easier to remove this limitation and simply save it on stack because
it is very clear that memory test can't rewrite U-Boot and U-Boot has also
full access to memory where runs from.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 README                               | 4 ----
 cmd/mem.c                            | 9 ++-------
 include/configs/MigoR.h              | 1 -
 include/configs/advantech_dms-ba16.h | 1 -
 include/configs/apalis_imx6.h        | 1 -
 include/configs/aristainetos2.h      | 1 -
 include/configs/armadillo-800eva.h   | 1 -
 include/configs/blanche.h            | 1 -
 include/configs/cgtqmx6eval.h        | 1 -
 include/configs/colibri_imx6.h       | 1 -
 include/configs/dh_imx6.h            | 1 -
 include/configs/el6x_common.h        | 1 -
 include/configs/embestmx6boards.h    | 1 -
 include/configs/ge_bx50v3.h          | 1 -
 include/configs/gw_ventana.h         | 1 -
 include/configs/imx6_logic.h         | 1 -
 include/configs/kzm9g.h              | 1 -
 include/configs/mx6sabre_common.h    | 1 -
 include/configs/nitrogen6x.h         | 1 -
 include/configs/presidio_asic.h      | 1 -
 include/configs/sh7752evb.h          | 1 -
 include/configs/sh7753evb.h          | 1 -
 include/configs/sh7757lcr.h          | 1 -
 include/configs/stm32mp1.h           | 1 -
 include/configs/tao3530.h            | 1 -
 include/configs/tricorder.h          | 1 -
 include/configs/xilinx_versal.h      | 1 -
 include/configs/xilinx_versal_mini.h | 1 -
 include/configs/xilinx_zynqmp.h      | 4 ----
 include/configs/xilinx_zynqmp_mini.h | 1 -
 include/configs/xilinx_zynqmp_r5.h   | 1 -
 scripts/config_whitelist.txt         | 1 -
 32 files changed, 2 insertions(+), 44 deletions(-)

diff --git a/README b/README
index 083485067654..4efacf337b74 100644
--- a/README
+++ b/README
@@ -2479,10 +2479,6 @@ Configuration Settings:
 		Begin and End addresses of the area used by the
 		simple memory test.
 
-- CONFIG_SYS_MEMTEST_SCRATCH:
-		Scratch address used by the alternate memory test
-		You only need to set this if address zero isn't writeable
-
 - CONFIG_SYS_MEM_RESERVE_SECURE
 		Only implemented for ARMv8 for now.
 		If defined, the size of CONFIG_SYS_MEM_RESERVE_SECURE memory
diff --git a/cmd/mem.c b/cmd/mem.c
index 009b7b58f328..18f0510098be 100644
--- a/cmd/mem.c
+++ b/cmd/mem.c
@@ -25,10 +25,6 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-#ifndef CONFIG_SYS_MEMTEST_SCRATCH
-#define CONFIG_SYS_MEMTEST_SCRATCH 0
-#endif
-
 static int mod_mem(cmd_tbl_t *, int, int, int, char * const []);
 
 /* Display values from last command.
@@ -922,7 +918,8 @@ static int do_mem_mtest(cmd_tbl_t *cmdtp, int flag, int argc,
 			char * const argv[])
 {
 	ulong start, end;
-	vu_long *buf, *dummy;
+	vu_long scratch_space;
+	vu_long *buf, *dummy = &scratch_space;
 	ulong iteration_limit = 0;
 	ulong count = 0;
 	ulong errs = 0;	/* number of errors, or -1 if interrupted */
@@ -958,7 +955,6 @@ static int do_mem_mtest(cmd_tbl_t *cmdtp, int flag, int argc,
 	      start, end);
 
 	buf = map_sysmem(start, end - start);
-	dummy = map_sysmem(CONFIG_SYS_MEMTEST_SCRATCH, sizeof(vu_long));
 	for (iteration = 0;
 			!iteration_limit || iteration < iteration_limit;
 			iteration++) {
@@ -988,7 +984,6 @@ static int do_mem_mtest(cmd_tbl_t *cmdtp, int flag, int argc,
 	}
 
 	unmap_sysmem((void *)buf);
-	unmap_sysmem((void *)dummy);
 
 	if (errs == -1UL) {
 		/* Memory test was aborted - write a newline to finish off */
diff --git a/include/configs/MigoR.h b/include/configs/MigoR.h
index c58b7814ba94..2421300e1e13 100644
--- a/include/configs/MigoR.h
+++ b/include/configs/MigoR.h
@@ -32,7 +32,6 @@
 
 /* Enable alternate, more extensive, memory test */
 /* Scratch address used by the alternate memory test */
-#undef  CONFIG_SYS_MEMTEST_SCRATCH
 
 /* Enable temporary baudrate change while serial download */
 #undef  CONFIG_SYS_LOADS_BAUD_CHANGE
diff --git a/include/configs/advantech_dms-ba16.h b/include/configs/advantech_dms-ba16.h
index deb4374d1c4a..b7b1ac2f89b7 100644
--- a/include/configs/advantech_dms-ba16.h
+++ b/include/configs/advantech_dms-ba16.h
@@ -185,7 +185,6 @@
 
 #define CONFIG_SYS_MEMTEST_START       0x10000000
 #define CONFIG_SYS_MEMTEST_END         0x10010000
-#define CONFIG_SYS_MEMTEST_SCRATCH     0x10800000
 
 #define CONFIG_SYS_LOAD_ADDR           CONFIG_LOADADDR
 
diff --git a/include/configs/apalis_imx6.h b/include/configs/apalis_imx6.h
index fb0037444f4b..49a28f5a3f5e 100644
--- a/include/configs/apalis_imx6.h
+++ b/include/configs/apalis_imx6.h
@@ -212,7 +212,6 @@
 
 #define CONFIG_SYS_MEMTEST_START	0x10000000
 #define CONFIG_SYS_MEMTEST_END		0x10010000
-#define CONFIG_SYS_MEMTEST_SCRATCH	0x10800000
 
 #define CONFIG_SYS_LOAD_ADDR		CONFIG_LOADADDR
 
diff --git a/include/configs/aristainetos2.h b/include/configs/aristainetos2.h
index 5f4a4f854f9c..336cf1746ab0 100644
--- a/include/configs/aristainetos2.h
+++ b/include/configs/aristainetos2.h
@@ -409,7 +409,6 @@
 
 #define CONFIG_SYS_MEMTEST_START	PHYS_SDRAM
 #define CONFIG_SYS_MEMTEST_END		(CONFIG_SYS_MEMTEST_START + 0x100000)
-#define CONFIG_SYS_MEMTEST_SCRATCH	0x10800000
 
 /* Physical Memory Map */
 #define PHYS_SDRAM			MMDC0_ARB_BASE_ADDR
diff --git a/include/configs/armadillo-800eva.h b/include/configs/armadillo-800eva.h
index e56929628bc7..c089b9c27c64 100644
--- a/include/configs/armadillo-800eva.h
+++ b/include/configs/armadillo-800eva.h
@@ -43,7 +43,6 @@
 #define CONFIG_SYS_MEMTEST_START	(ARMADILLO_800EVA_SDRAM_BASE)
 #define CONFIG_SYS_MEMTEST_END		(CONFIG_SYS_MEMTEST_START + \
 					 504 * 1024 * 1024)
-#undef	CONFIG_SYS_MEMTEST_SCRATCH
 #undef	CONFIG_SYS_LOADS_BAUD_CHANGE
 
 #define CONFIG_SYS_SDRAM_BASE		(ARMADILLO_800EVA_SDRAM_BASE)
diff --git a/include/configs/blanche.h b/include/configs/blanche.h
index 7ee38a7ef9bc..fd29c5d0f1ed 100644
--- a/include/configs/blanche.h
+++ b/include/configs/blanche.h
@@ -22,7 +22,6 @@
 #define RCAR_GEN2_SDRAM_SIZE		(1024u * 1024 * 1024)
 #define RCAR_GEN2_UBOOT_SDRAM_SIZE	(512 * 1024 * 1024)
 
-#undef	CONFIG_SYS_MEMTEST_SCRATCH
 #undef	CONFIG_SYS_LOADS_BAUD_CHANGE
 
 /* FLASH */
diff --git a/include/configs/cgtqmx6eval.h b/include/configs/cgtqmx6eval.h
index 797fcb14590a..b6dfcdd08b95 100644
--- a/include/configs/cgtqmx6eval.h
+++ b/include/configs/cgtqmx6eval.h
@@ -189,7 +189,6 @@
 
 #define CONFIG_SYS_MEMTEST_START       0x10000000
 #define CONFIG_SYS_MEMTEST_END	       0x10010000
-#define CONFIG_SYS_MEMTEST_SCRATCH     0x10800000
 
 /* Physical Memory Map */
 #define PHYS_SDRAM		       MMDC0_ARB_BASE_ADDR
diff --git a/include/configs/colibri_imx6.h b/include/configs/colibri_imx6.h
index 4cdd3c53afbb..706665e37fc5 100644
--- a/include/configs/colibri_imx6.h
+++ b/include/configs/colibri_imx6.h
@@ -191,7 +191,6 @@
 
 #define CONFIG_SYS_MEMTEST_START	0x10000000
 #define CONFIG_SYS_MEMTEST_END		0x10010000
-#define CONFIG_SYS_MEMTEST_SCRATCH	0x10800000
 
 #define CONFIG_SYS_LOAD_ADDR		CONFIG_LOADADDR
 
diff --git a/include/configs/dh_imx6.h b/include/configs/dh_imx6.h
index 087d020cdd37..e16c9ee01d94 100644
--- a/include/configs/dh_imx6.h
+++ b/include/configs/dh_imx6.h
@@ -139,7 +139,6 @@
 
 #define CONFIG_SYS_MEMTEST_START	0x10000000
 #define CONFIG_SYS_MEMTEST_END		0x20000000
-#define CONFIG_SYS_MEMTEST_SCRATCH	0x10800000
 
 /* Environment */
 
diff --git a/include/configs/el6x_common.h b/include/configs/el6x_common.h
index 95c04c379706..bd42ad259d93 100644
--- a/include/configs/el6x_common.h
+++ b/include/configs/el6x_common.h
@@ -76,7 +76,6 @@
 
 #define CONFIG_SYS_MEMTEST_START       0x10000000
 #define CONFIG_SYS_MEMTEST_END         0x10800000
-#define CONFIG_SYS_MEMTEST_SCRATCH     0x10800000
 
 /* Physical Memory Map */
 #define PHYS_SDRAM                     MMDC0_ARB_BASE_ADDR
diff --git a/include/configs/embestmx6boards.h b/include/configs/embestmx6boards.h
index 62561116bbe3..bf51afbd9cdf 100644
--- a/include/configs/embestmx6boards.h
+++ b/include/configs/embestmx6boards.h
@@ -51,7 +51,6 @@
 
 #define CONFIG_SYS_MEMTEST_START       0x10000000
 #define CONFIG_SYS_MEMTEST_END         0x10010000
-#define CONFIG_SYS_MEMTEST_SCRATCH     0x10800000
 
 /* Physical Memory Map */
 #define PHYS_SDRAM                     MMDC0_ARB_BASE_ADDR
diff --git a/include/configs/ge_bx50v3.h b/include/configs/ge_bx50v3.h
index 3bf0cd518c1a..2b55f51b8ba0 100644
--- a/include/configs/ge_bx50v3.h
+++ b/include/configs/ge_bx50v3.h
@@ -146,7 +146,6 @@
 
 #define CONFIG_SYS_MEMTEST_START       0x10000000
 #define CONFIG_SYS_MEMTEST_END         0x10010000
-#define CONFIG_SYS_MEMTEST_SCRATCH     0x10800000
 
 #define CONFIG_SYS_LOAD_ADDR           CONFIG_LOADADDR
 
diff --git a/include/configs/gw_ventana.h b/include/configs/gw_ventana.h
index d169aa19de49..193c88e3da0a 100644
--- a/include/configs/gw_ventana.h
+++ b/include/configs/gw_ventana.h
@@ -133,7 +133,6 @@
 /* Memory configuration */
 #define CONFIG_SYS_MEMTEST_START       0x10000000
 #define CONFIG_SYS_MEMTEST_END	       0x10010000
-#define CONFIG_SYS_MEMTEST_SCRATCH     0x10800000
 
 /* Physical Memory Map */
 #define PHYS_SDRAM                     MMDC0_ARB_BASE_ADDR
diff --git a/include/configs/imx6_logic.h b/include/configs/imx6_logic.h
index 2274db0e2295..e77fb4a1b5e4 100644
--- a/include/configs/imx6_logic.h
+++ b/include/configs/imx6_logic.h
@@ -118,7 +118,6 @@
 
 #define CONFIG_SYS_MEMTEST_START       0x10000000
 #define CONFIG_SYS_MEMTEST_END         0x10010000
-#define CONFIG_SYS_MEMTEST_SCRATCH     0x10800000
 
 /* Physical Memory Map */
 #define PHYS_SDRAM                     MMDC0_ARB_BASE_ADDR
diff --git a/include/configs/kzm9g.h b/include/configs/kzm9g.h
index cceabdf66363..9ceb12f7e006 100644
--- a/include/configs/kzm9g.h
+++ b/include/configs/kzm9g.h
@@ -38,7 +38,6 @@
 #define CONFIG_SYS_MEMTEST_START	(KZM_SDRAM_BASE)
 #define CONFIG_SYS_MEMTEST_END \
 	(CONFIG_SYS_MEMTEST_START + (60 * 1024 * 1024))
-#undef  CONFIG_SYS_MEMTEST_SCRATCH
 #undef  CONFIG_SYS_LOADS_BAUD_CHANGE
 
 #define CONFIG_SYS_INIT_RAM_ADDR	(0xE5600000) /* on MERAM */
diff --git a/include/configs/mx6sabre_common.h b/include/configs/mx6sabre_common.h
index ee3b754910cc..b46367c83145 100644
--- a/include/configs/mx6sabre_common.h
+++ b/include/configs/mx6sabre_common.h
@@ -156,7 +156,6 @@
 
 #define CONFIG_SYS_MEMTEST_START       0x10000000
 #define CONFIG_SYS_MEMTEST_END         0x10010000
-#define CONFIG_SYS_MEMTEST_SCRATCH     0x10800000
 
 /* Physical Memory Map */
 #define PHYS_SDRAM                     MMDC0_ARB_BASE_ADDR
diff --git a/include/configs/nitrogen6x.h b/include/configs/nitrogen6x.h
index 9ef6ea90a3f6..5e09a783df2e 100644
--- a/include/configs/nitrogen6x.h
+++ b/include/configs/nitrogen6x.h
@@ -132,7 +132,6 @@
 /* Miscellaneous configurable options */
 #define CONFIG_SYS_MEMTEST_START       0x10000000
 #define CONFIG_SYS_MEMTEST_END	       0x10010000
-#define CONFIG_SYS_MEMTEST_SCRATCH     0x10800000
 
 /* Physical Memory Map */
 #define PHYS_SDRAM		       MMDC0_ARB_BASE_ADDR
diff --git a/include/configs/presidio_asic.h b/include/configs/presidio_asic.h
index 023092e486da..56f009ad4e34 100644
--- a/include/configs/presidio_asic.h
+++ b/include/configs/presidio_asic.h
@@ -27,7 +27,6 @@
 #define GICD_BASE			0xf7011000
 #define GICC_BASE			0xf7012000
 
-#define CONFIG_SYS_MEMTEST_SCRATCH	0x00100000
 #define CONFIG_SYS_MEMTEST_START	0x05000000
 #define CONFIG_SYS_MEMTEST_END		0x0D000000
 
diff --git a/include/configs/sh7752evb.h b/include/configs/sh7752evb.h
index c45b33a91a97..ff49b9c2171b 100644
--- a/include/configs/sh7752evb.h
+++ b/include/configs/sh7752evb.h
@@ -25,7 +25,6 @@
 #define CONFIG_SYS_MEMTEST_START	(SH7752EVB_SDRAM_BASE)
 #define CONFIG_SYS_MEMTEST_END		(CONFIG_SYS_MEMTEST_START + \
 					 480 * 1024 * 1024)
-#undef	CONFIG_SYS_MEMTEST_SCRATCH
 #undef	CONFIG_SYS_LOADS_BAUD_CHANGE
 
 #define CONFIG_SYS_SDRAM_BASE		(SH7752EVB_SDRAM_BASE)
diff --git a/include/configs/sh7753evb.h b/include/configs/sh7753evb.h
index 70e7fb932484..74fb528d2e97 100644
--- a/include/configs/sh7753evb.h
+++ b/include/configs/sh7753evb.h
@@ -25,7 +25,6 @@
 #define CONFIG_SYS_MEMTEST_START	(SH7753EVB_SDRAM_BASE)
 #define CONFIG_SYS_MEMTEST_END		(CONFIG_SYS_MEMTEST_START + \
 					 480 * 1024 * 1024)
-#undef	CONFIG_SYS_MEMTEST_SCRATCH
 #undef	CONFIG_SYS_LOADS_BAUD_CHANGE
 
 #define CONFIG_SYS_SDRAM_BASE		(SH7753EVB_SDRAM_BASE)
diff --git a/include/configs/sh7757lcr.h b/include/configs/sh7757lcr.h
index 6a34dc7954b6..8f5c84207fe8 100644
--- a/include/configs/sh7757lcr.h
+++ b/include/configs/sh7757lcr.h
@@ -28,7 +28,6 @@
 #define CONFIG_SYS_MEMTEST_START	(SH7757LCR_SDRAM_BASE)
 #define CONFIG_SYS_MEMTEST_END		(CONFIG_SYS_MEMTEST_START + \
 					 224 * 1024 * 1024)
-#undef	CONFIG_SYS_MEMTEST_SCRATCH
 #undef	CONFIG_SYS_LOADS_BAUD_CHANGE
 
 #define CONFIG_SYS_SDRAM_BASE		(SH7757LCR_SDRAM_BASE)
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index 2ba4fb1305a8..4dc7cf53a1f2 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -68,7 +68,6 @@
 
 #define CONFIG_SYS_MEMTEST_START	STM32_DDR_BASE
 #define CONFIG_SYS_MEMTEST_END		(CONFIG_SYS_MEMTEST_START + SZ_64M)
-#define CONFIG_SYS_MEMTEST_SCRATCH	(CONFIG_SYS_MEMTEST_END + 4)
 
 /*MMC SD*/
 #define CONFIG_SYS_MMC_MAX_DEVICE	3
diff --git a/include/configs/tao3530.h b/include/configs/tao3530.h
index e95cd0087d3f..c80776b4da0e 100644
--- a/include/configs/tao3530.h
+++ b/include/configs/tao3530.h
@@ -134,7 +134,6 @@
 #define CONFIG_SYS_MEMTEST_START	(0x82000000)		/* memtest */
 								/* defaults */
 #define CONFIG_SYS_MEMTEST_END		(0x83FFFFFF)		/* 64MB */
-#define CONFIG_SYS_MEMTEST_SCRATCH	(0x81000000)	/* dummy address */
 
 #define CONFIG_SYS_LOAD_ADDR		(OMAP34XX_SDRC_CS0)	/* default */
 							/* load address */
diff --git a/include/configs/tricorder.h b/include/configs/tricorder.h
index 1e4459747d54..de6abb58377d 100644
--- a/include/configs/tricorder.h
+++ b/include/configs/tricorder.h
@@ -248,5 +248,4 @@
 #define CONFIG_SYS_SPL_MALLOC_START	0x80208000
 #define CONFIG_SYS_SPL_MALLOC_SIZE	0x100000	/* 1 MB */
 
-#define CONFIG_SYS_MEMTEST_SCRATCH	0x81000000
 #endif /* __CONFIG_H */
diff --git a/include/configs/xilinx_versal.h b/include/configs/xilinx_versal.h
index 0c259a181f10..480afd993bcc 100644
--- a/include/configs/xilinx_versal.h
+++ b/include/configs/xilinx_versal.h
@@ -18,7 +18,6 @@
 #define GICD_BASE	0xF9000000
 #define GICR_BASE	0xF9080000
 
-#define CONFIG_SYS_MEMTEST_SCRATCH	0xfffc0000
 
 #define CONFIG_SYS_MEMTEST_START	0
 #define CONFIG_SYS_MEMTEST_END		1000
diff --git a/include/configs/xilinx_versal_mini.h b/include/configs/xilinx_versal_mini.h
index ee305e0226b3..ae7eca11553f 100644
--- a/include/configs/xilinx_versal_mini.h
+++ b/include/configs/xilinx_versal_mini.h
@@ -10,7 +10,6 @@
 #ifndef __CONFIG_VERSAL_MINI_H
 #define __CONFIG_VERSAL_MINI_H
 
-#define CONFIG_SYS_MEMTEST_SCRATCH     0xfffc0000
 
 #define CONFIG_EXTRA_ENV_SETTINGS
 
diff --git a/include/configs/xilinx_zynqmp.h b/include/configs/xilinx_zynqmp.h
index eddc2b402006..01e05200dfe0 100644
--- a/include/configs/xilinx_zynqmp.h
+++ b/include/configs/xilinx_zynqmp.h
@@ -19,10 +19,6 @@
 #define GICD_BASE	0xF9010000
 #define GICC_BASE	0xF9020000
 
-#ifndef CONFIG_SYS_MEMTEST_SCRATCH
-# define CONFIG_SYS_MEMTEST_SCRATCH	0x10800000
-#endif
-
 #define CONFIG_SYS_MEMTEST_START	0
 #define CONFIG_SYS_MEMTEST_END		1000
 
diff --git a/include/configs/xilinx_zynqmp_mini.h b/include/configs/xilinx_zynqmp_mini.h
index a6922896e0e1..3078b9c55b52 100644
--- a/include/configs/xilinx_zynqmp_mini.h
+++ b/include/configs/xilinx_zynqmp_mini.h
@@ -10,7 +10,6 @@
 #ifndef __CONFIG_ZYNQMP_MINI_H
 #define __CONFIG_ZYNQMP_MINI_H
 
-#define CONFIG_SYS_MEMTEST_SCRATCH     0xfffc0000
 
 #define CONFIG_EXTRA_ENV_SETTINGS
 
diff --git a/include/configs/xilinx_zynqmp_r5.h b/include/configs/xilinx_zynqmp_r5.h
index 155d7fe883f0..327f0af3145c 100644
--- a/include/configs/xilinx_zynqmp_r5.h
+++ b/include/configs/xilinx_zynqmp_r5.h
@@ -40,6 +40,5 @@
 /* 0x0 - 0x40 is used for placing exception vectors */
 #define CONFIG_SYS_MEMTEST_START	0x40
 #define CONFIG_SYS_MEMTEST_END		0x100
-#define CONFIG_SYS_MEMTEST_SCRATCH	0
 
 #endif /* __CONFIG_ZYNQ_ZYNQMP_R5_H */
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index 7a5da9d822a4..753d33333c9d 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -3079,7 +3079,6 @@ CONFIG_SYS_MEMAC_LITTLE_ENDIAN
 CONFIG_SYS_MEMORY_BASE
 CONFIG_SYS_MEMORY_SIZE
 CONFIG_SYS_MEMTEST_END
-CONFIG_SYS_MEMTEST_SCRATCH
 CONFIG_SYS_MEMTEST_START
 CONFIG_SYS_MEM_MAP
 CONFIG_SYS_MEM_RESERVE_SECURE
-- 
2.26.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
