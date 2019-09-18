Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAE5B6034
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Sep 2019 11:30:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E80B2C36B3F
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Sep 2019 09:30:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 400C6C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 09:30:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8I96VGB019562; Wed, 18 Sep 2019 11:30:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=nn7v196sz4mF/LcCN5Rs8ArDBJw5CgUWP9YLgPNIAkQ=;
 b=jov72G30Ol+yQGOYoBi9F0qSvDGEElKTmLYG1RlN/9fTxgig/dQcaz0xXtl1SXfZZXUE
 HUDAy0lhrRig5xE/aRLlyFMNo73FvUFTh0LB85aQ9zE9NlPNXMBSNYsSVNIyDNdGNUUn
 peVnFDGOaeObp5iGsePmfQx/CayG10P1fyNPMPipd8+u0ITZwDXQi4iu03okkY/er4Do
 mMDdDhPS3n4KBxySf3q00we1pxznIavl1gEo0EYboLdUaXqNjxm1qZvcn1te9ZdcKJIk
 sGS5uz3W14lYOpUcLq4x8lEOjtbP0N6uUSmnqrjA/cq8/ib6liQCgspMQ4PXHwBdxrDh FA== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v37hqu72a-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 18 Sep 2019 11:30:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6B35450;
 Wed, 18 Sep 2019 09:29:59 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C5EDD2BB877;
 Wed, 18 Sep 2019 11:29:58 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 18 Sep
 2019 11:29:58 +0200
Received: from localhost (10.201.21.107) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 18 Sep 2019 11:29:58
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Sep 2019 11:29:19 +0200
Message-ID: <20190918092920.21435-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918092920.21435-1-patrick.delaunay@st.com>
References: <20190918092920.21435-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-18_06:2019-09-17,2019-09-18 signatures=0
Cc: Markus Klotzbuecher <markus.klotzbuecher@kistler.com>,
 Lukasz Majewski <lukma@denx.de>, Joe
 Hershberger <joe.hershberger@ni.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Hamish Guthrie <hamish.guthrie@kistler.com>,
 Marek Vasut <marek.vasut@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, AKASHI
 Takahiro <takahiro.akashi@linaro.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Heiko Schocher <hs@denx.de>, Ash Charles <ash@gumstix.com>,
 Wolfgang Denk <wd@denx.de>, Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>, Adam
 Ford <aford173@gmail.com>, Simon Glass <sjg@chromium.org>,
 Anup Patel <Anup.Patel@wdc.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v3 2/3] env: introduce macro
	ENV_IS_IN_SOMEWHERE
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

This patch introduce a macro ENV_IS_IN_SOMEWHERE to check if the
the environment can be saved somewhere, in a device or in a file system,
without assumption on CONFIG$(SPL_TPL_)ENV_IS_NOWHERE.

Since the commit 208bd2b85ecc ("env: allow ENV_IS_NOWHERE with
other storage target"), is is allowed to activated ENV_IS_NOWHERE with
other CONFIG_IS_IN...
It is only the case for U-Boot but the restriction in Kconfig
could also removed for SPL and TPL
(depends on !SPL_ENV_IS_NOWHERE / depends on !TPL_ENV_IS_NOWHERE).

This macro ENV_IS_IN_DEVICE can be used in code to check if the
environment for U-Boot / SPL / TPL is really managed (at least one
CONFIG$(SPL_TPL_)ENV_IS_IN_.. is activated).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3: None
Changes in v2: None

 cmd/nvedit.c  | 29 +++++++----------------------
 include/env.h | 13 +++++++++++++
 2 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/cmd/nvedit.c b/cmd/nvedit.c
index 1cb0bc1460..7a6ec5ae30 100644
--- a/cmd/nvedit.c
+++ b/cmd/nvedit.c
@@ -40,28 +40,13 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-#if	defined(CONFIG_ENV_IS_IN_EEPROM)	|| \
-	defined(CONFIG_ENV_IS_IN_FLASH)		|| \
-	defined(CONFIG_ENV_IS_IN_MMC)		|| \
-	defined(CONFIG_ENV_IS_IN_FAT)		|| \
-	defined(CONFIG_ENV_IS_IN_EXT4)		|| \
-	defined(CONFIG_ENV_IS_IN_NAND)		|| \
-	defined(CONFIG_ENV_IS_IN_NVRAM)		|| \
-	defined(CONFIG_ENV_IS_IN_ONENAND)	|| \
-	defined(CONFIG_ENV_IS_IN_SATA)		|| \
-	defined(CONFIG_ENV_IS_IN_SPI_FLASH)	|| \
-	defined(CONFIG_ENV_IS_IN_REMOTE)	|| \
-	defined(CONFIG_ENV_IS_IN_UBI)
-
-#define ENV_IS_IN_DEVICE
-
-#endif
-
-#if	!defined(ENV_IS_IN_DEVICE)		&& \
-	!defined(CONFIG_ENV_IS_NOWHERE)
+#if !defined(CONFIG_SPL_BUILD) || CONFIG_IS_ENABLED(ENV_SUPPORT)
+#if	!ENV_IS_IN_SOMEWHERE		&& \
+	!CONFIG_IS_ENABLED(ENV_IS_NOWHERE)
 # error Define one of CONFIG_ENV_IS_IN_{EEPROM|FLASH|MMC|FAT|EXT4|\
 NAND|NVRAM|ONENAND|SATA|SPI_FLASH|REMOTE|UBI} or CONFIG_ENV_IS_NOWHERE
 #endif
+#endif
 
 /*
  * Maximum expected input data size for import command
@@ -744,7 +729,7 @@ ulong env_get_ulong(const char *name, int base, ulong default_val)
 }
 
 #ifndef CONFIG_SPL_BUILD
-#if defined(CONFIG_CMD_SAVEENV) && defined(ENV_IS_IN_DEVICE)
+#if defined(CONFIG_CMD_SAVEENV) && ENV_IS_IN_SOMEWHERE
 static int do_env_save(cmd_tbl_t *cmdtp, int flag, int argc,
 		       char * const argv[])
 {
@@ -1309,7 +1294,7 @@ static cmd_tbl_t cmd_env_sub[] = {
 #if defined(CONFIG_CMD_RUN)
 	U_BOOT_CMD_MKENT(run, CONFIG_SYS_MAXARGS, 1, do_run, "", ""),
 #endif
-#if defined(CONFIG_CMD_SAVEENV) && defined(ENV_IS_IN_DEVICE)
+#if defined(CONFIG_CMD_SAVEENV) && ENV_IS_IN_SOMEWHERE
 	U_BOOT_CMD_MKENT(save, 1, 0, do_env_save, "", ""),
 #if defined(CONFIG_CMD_ERASEENV)
 	U_BOOT_CMD_MKENT(erase, 1, 0, do_env_erase, "", ""),
@@ -1392,7 +1377,7 @@ static char env_help_text[] =
 #if defined(CONFIG_CMD_RUN)
 	"env run var [...] - run commands in an environment variable\n"
 #endif
-#if defined(CONFIG_CMD_SAVEENV) && defined(ENV_IS_IN_DEVICE)
+#if defined(CONFIG_CMD_SAVEENV) && ENV_IS_IN_SOMEWHERE
 	"env save - save environment\n"
 #if defined(CONFIG_CMD_ERASEENV)
 	"env erase - erase environment\n"
diff --git a/include/env.h b/include/env.h
index a74a261337..0088d3b1e8 100644
--- a/include/env.h
+++ b/include/env.h
@@ -35,6 +35,19 @@ struct env_clbk_tbl {
 			int flags);
 };
 
+#define ENV_IS_IN_SOMEWHERE \
+		(CONFIG_IS_ENABLED(ENV_IS_IN_EEPROM) || \
+		 CONFIG_IS_ENABLED(ENV_IS_IN_EXT4) || \
+		 CONFIG_IS_ENABLED(ENV_IS_IN_FAT) || \
+		 CONFIG_IS_ENABLED(ENV_IS_IN_FLASH) || \
+		 CONFIG_IS_ENABLED(ENV_IS_IN_MMC) || \
+		 CONFIG_IS_ENABLED(ENV_IS_IN_NAND) || \
+		 CONFIG_IS_ENABLED(ENV_IS_IN_NVRAM) || \
+		 CONFIG_IS_ENABLED(ENV_IS_IN_ONENAND) || \
+		 CONFIG_IS_ENABLED(ENV_IS_IN_REMOTE) || \
+		 CONFIG_IS_ENABLED(ENV_IS_IN_SPI_FLASH) || \
+		 CONFIG_IS_ENABLED(ENV_IS_IN_UBI))
+
 /*
  * Define a callback that can be associated with variables.
  * when associated through the ".callbacks" environment variable, the callback
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
