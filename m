Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E934D1A10C
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 18:11:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9421CA8E4E
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 16:11:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E637ACA8E4C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 16:11:55 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AG6CgY014692; Fri, 10 May 2019 18:11:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=4xH7Cr02QbWSvh5iR6eXAZUdSs1K+Mx2yLFjz6bk9qc=;
 b=xmY2Vxv6D+F5JMV0LDXKrke0jvfV1Br45n7DNOPcJFLab0a/T71BpXxpkBWcsllu1XxF
 A3kPks8gWGkjFn76fB5yIMnbPo2CMTNrfgJl2LuPod8/R9cRWdIn/wopd5rnEL/9ttFp
 wra3JBEdVtvtmNNsvLm0lsf6uq5OiiSJYPiE3gBiCzyt98zouTlyeVsZA2+RA6Z+eaRe
 xTq24KU1TnyAc1dw2anlB9yq1+gq7CZoQHY6WUZ1XMbpR62rXCrPsc8Rg98UNOp5SOPf
 9t2JL0etayb6zENlZhMA3LUnJirz93BRnIimzhbq14WqRb9Gmyk/i8c6lEMZ4b9veb6o ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2scbkajk32-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 18:11:40 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D9A1B34;
 Fri, 10 May 2019 16:11:39 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BA9182C1E;
 Fri, 10 May 2019 16:11:39 +0000 (GMT)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 10 May 2019 18:11:39 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 May 2019 18:11:24 +0200
Message-ID: <1557504691-26188-8-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557504691-26188-1-git-send-email-patrice.chotard@st.com>
References: <1557504691-26188-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Cc: Shyam Saini <mayhs11saini@gmail.com>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Quentin Schulz <quentin.schulz@bootlin.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Igor Grinberg <grinberg@compulab.co.il>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Yaniv Levinsky <yaniv.levinsky@compulab.co.il>,
 Neil Stainton <nstainton@asl-control.co.uk>
Subject: [Uboot-stm32] [PATCH 07/14] env: enable saveenv command when one
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
