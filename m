Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4D31A147
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 18:20:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFA59CA8E71
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 16:20:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A428CA8E6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 16:20:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AG6Usc020376; Fri, 10 May 2019 18:20:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=4xH7Cr02QbWSvh5iR6eXAZUdSs1K+Mx2yLFjz6bk9qc=;
 b=vzbK5dkKMW1pspg8Tna60i4Rs1WbbmcIF3/8lAoP8W+lsJyvUABOdIQWmnwlvYUNsE43
 sIovjwRG8QhXyMLAxV1mFnwOuyuV46yx3BJftVvGYMUo56yoh7U9L/hv2xsFGLCcOgoE
 htQAeAHssPFs5W7meI6lzwKj9jgJkdjMw9Jha2gEobKZEabub+bfvD1gDR5u03bTWRvU
 3lLouBZWSYtf/8ItRJKDjIvFDg0AGjStIVPyMeDELUQZiFjWeGm+4uV9bY2v0FgWnMU0
 7ff0gndowsNEq6czxPBBbGhF87z3JdLXYd3DX1i1S1mRcU0vwjpR/jwXhyWBlUB28XQS Kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2scfv2sr2s-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 18:20:17 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 63FB634;
 Fri, 10 May 2019 16:20:16 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 46E332A91;
 Fri, 10 May 2019 16:20:16 +0000 (GMT)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 10 May 2019 18:20:15 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 May 2019 18:19:07 +0200
Message-ID: <1557505154-3856-7-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557505154-3856-1-git-send-email-patrice.chotard@st.com>
References: <1557505154-3856-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Cc: Christophe KERELLO <christophe.kerello@st.com>,
 Quentin Schulz <quentin.schulz@bootlin.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Igor Grinberg <grinberg@compulab.co.il>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stephen Warren <swarren@nvidia.com>,
 Yaniv Levinsky <yaniv.levinsky@compulab.co.il>,
 Neil Stainton <nstainton@asl-control.co.uk>
Subject: [Uboot-stm32] [PATCH 06/13] env: enable saveenv command when one
	CONFIG_ENV_IS_IN is activated
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

From: Patrick Delaunay <patrick.delaunay@st.com>

Introduce ENV_IS_IN_DEVICE to test if one the
CONFIG_ENV_IS_IN_ is defined and support the command
saveenv even if CONFIG_ENV_IS_NOWHERE is activated

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 cmd/nvedit.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/cmd/nvedit.c b/cmd/nvedit.c
index 24a6cf7..5d723ac 100644
--- a/cmd/nvedit.c
+++ b/cmd/nvedit.c
@@ -39,18 +39,24 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-#if	!defined(CONFIG_ENV_IS_IN_EEPROM)	&& \
-	!defined(CONFIG_ENV_IS_IN_FLASH)	&& \
-	!defined(CONFIG_ENV_IS_IN_MMC)		&& \
-	!defined(CONFIG_ENV_IS_IN_FAT)		&& \
-	!defined(CONFIG_ENV_IS_IN_EXT4)		&& \
-	!defined(CONFIG_ENV_IS_IN_NAND)		&& \
-	!defined(CONFIG_ENV_IS_IN_NVRAM)	&& \
-	!defined(CONFIG_ENV_IS_IN_ONENAND)	&& \
-	!defined(CONFIG_ENV_IS_IN_SATA)		&& \
-	!defined(CONFIG_ENV_IS_IN_SPI_FLASH)	&& \
-	!defined(CONFIG_ENV_IS_IN_REMOTE)	&& \
-	!defined(CONFIG_ENV_IS_IN_UBI)		&& \
+#if	defined(CONFIG_ENV_IS_IN_EEPROM)	|| \
+	defined(CONFIG_ENV_IS_IN_FLASH)		|| \
+	defined(CONFIG_ENV_IS_IN_MMC)		|| \
+	defined(CONFIG_ENV_IS_IN_FAT)		|| \
+	defined(CONFIG_ENV_IS_IN_EXT4)		|| \
+	defined(CONFIG_ENV_IS_IN_NAND)		|| \
+	defined(CONFIG_ENV_IS_IN_NVRAM)		|| \
+	defined(CONFIG_ENV_IS_IN_ONENAND)	|| \
+	defined(CONFIG_ENV_IS_IN_SATA)		|| \
+	defined(CONFIG_ENV_IS_IN_SPI_FLASH)	|| \
+	defined(CONFIG_ENV_IS_IN_REMOTE)	|| \
+	defined(CONFIG_ENV_IS_IN_UBI)
+
+#define ENV_IS_IN_DEVICE
+
+#endif
+
+#if	!defined(ENV_IS_IN_DEVICE)		&& \
 	!defined(CONFIG_ENV_IS_NOWHERE)
 # error Define one of CONFIG_ENV_IS_IN_{EEPROM|FLASH|MMC|FAT|EXT4|\
 NAND|NVRAM|ONENAND|SATA|SPI_FLASH|REMOTE|UBI} or CONFIG_ENV_IS_NOWHERE
@@ -749,7 +755,7 @@ ulong env_get_ulong(const char *name, int base, ulong default_val)
 }
 
 #ifndef CONFIG_SPL_BUILD
-#if defined(CONFIG_CMD_SAVEENV) && !defined(CONFIG_ENV_IS_NOWHERE)
+#if defined(CONFIG_CMD_SAVEENV) && defined(ENV_IS_IN_DEVICE)
 static int do_env_save(cmd_tbl_t *cmdtp, int flag, int argc,
 		       char * const argv[])
 {
@@ -1205,7 +1211,7 @@ static cmd_tbl_t cmd_env_sub[] = {
 #if defined(CONFIG_CMD_RUN)
 	U_BOOT_CMD_MKENT(run, CONFIG_SYS_MAXARGS, 1, do_run, "", ""),
 #endif
-#if defined(CONFIG_CMD_SAVEENV) && !defined(CONFIG_ENV_IS_NOWHERE)
+#if defined(CONFIG_CMD_SAVEENV) && defined(ENV_IS_IN_DEVICE)
 	U_BOOT_CMD_MKENT(save, 1, 0, do_env_save, "", ""),
 #endif
 	U_BOOT_CMD_MKENT(set, CONFIG_SYS_MAXARGS, 0, do_env_set, "", ""),
@@ -1280,7 +1286,7 @@ static char env_help_text[] =
 #if defined(CONFIG_CMD_RUN)
 	"env run var [...] - run commands in an environment variable\n"
 #endif
-#if defined(CONFIG_CMD_SAVEENV) && !defined(CONFIG_ENV_IS_NOWHERE)
+#if defined(CONFIG_CMD_SAVEENV) && defined(ENV_IS_IN_DEVICE)
 	"env save - save environment\n"
 #endif
 #if defined(CONFIG_CMD_NVEDIT_EFI)
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
