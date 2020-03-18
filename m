Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB511896C3
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:23:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A64FEC36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 08:23:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9642DC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 08:23:02 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I8HTUt019413; Wed, 18 Mar 2020 09:22:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Xk89PfdFePRczhM3gqiEdZEDTJp7i3iFtHXwKiNn7H4=;
 b=vuavzwJA0VCA/tb6BzCROHAO5flR4MJcjgyTsnTCW6IPbrt6RkerA+r+VFywmfjYGrtu
 1xTg38mL+Q6GAINr0qzYVkZgqs0/08yEPgmITPFMs8NjKVZPtBQKvYEeM5jbXptDkDyg
 feJis7zFXjyvCbBMyCPOo6BScGX+nzI3Hed+Q9EjbBwxaPuFLk0sJtsLsZeZtSHKrR8+
 GiuGR55DF4bpMA41jHcms8e1x1HMI/QCR4b8OM02RNYKONuxX+5khPEmfqbJsPNv/qt7
 XMrmz+cnDs9cdRuaVhGw/OKvJMV9u3m65Re1aiGOV90dsr+aTeYSMgxVKTqt5fsyCaZY 0A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu8eta8ca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 09:22:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB61C10002A;
 Wed, 18 Mar 2020 09:22:57 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A4D8F21CA90;
 Wed, 18 Mar 2020 09:22:57 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 09:22:57 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 09:22:44 +0100
Message-ID: <20200318082254.7522-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318082254.7522-1-patrick.delaunay@st.com>
References: <20200318082254.7522-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 01/11] board: stm32mp1: move
	board_get_mtdparts in st common directory
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

Move the stm32mp1 common code board_get_mtdparts() in common directory,
this patch reduce the maintenance effort on this generic part (not board
dependent).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/dhelectronics/dh_stm32mp1/Makefile |   1 +
 board/dhelectronics/dh_stm32mp1/board.c  |  89 ------------------
 board/st/common/Makefile                 |   4 +
 board/st/common/stm32mp_mtdparts.c       | 115 +++++++++++++++++++++++
 board/st/stm32mp1/stm32mp1.c             | 102 --------------------
 5 files changed, 120 insertions(+), 191 deletions(-)
 create mode 100644 board/st/common/stm32mp_mtdparts.c

diff --git a/board/dhelectronics/dh_stm32mp1/Makefile b/board/dhelectronics/dh_stm32mp1/Makefile
index b42c4e4c04..c77a1e3a84 100644
--- a/board/dhelectronics/dh_stm32mp1/Makefile
+++ b/board/dhelectronics/dh_stm32mp1/Makefile
@@ -8,3 +8,4 @@ obj-y += ../../st/stm32mp1/spl.o
 endif
 
 obj-y += ../../st/stm32mp1/board.o board.o
+obj-$(CONFIG_SYS_MTDPARTS_RUNTIME) += ../../st/common/stm32mp_mtdparts.o
diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
index b663696983..2baa36278c 100644
--- a/board/dhelectronics/dh_stm32mp1/board.c
+++ b/board/dhelectronics/dh_stm32mp1/board.c
@@ -519,95 +519,6 @@ enum env_location env_get_location(enum env_operation op, int prio)
 #endif
 }
 
-#ifdef CONFIG_SYS_MTDPARTS_RUNTIME
-
-#define MTDPARTS_LEN		256
-#define MTDIDS_LEN		128
-
-/**
- * The mtdparts_nand0 and mtdparts_nor0 variable tends to be long.
- * If we need to access it before the env is relocated, then we need
- * to use our own stack buffer. gd->env_buf will be too small.
- *
- * @param buf temporary buffer pointer MTDPARTS_LEN long
- * @return mtdparts variable string, NULL if not found
- */
-static const char *env_get_mtdparts(const char *str, char *buf)
-{
-	if (gd->flags & GD_FLG_ENV_READY)
-		return env_get(str);
-	if (env_get_f(str, buf, MTDPARTS_LEN) != -1)
-		return buf;
-
-	return NULL;
-}
-
-/**
- * update the variables "mtdids" and "mtdparts" with content of mtdparts_<dev>
- */
-static void board_get_mtdparts(const char *dev,
-			       char *mtdids,
-			       char *mtdparts)
-{
-	char env_name[32] = "mtdparts_";
-	char tmp_mtdparts[MTDPARTS_LEN];
-	const char *tmp;
-
-	/* name of env variable to read = mtdparts_<dev> */
-	strcat(env_name, dev);
-	tmp = env_get_mtdparts(env_name, tmp_mtdparts);
-	if (tmp) {
-		/* mtdids: "<dev>=<dev>, ...." */
-		if (mtdids[0] != '\0')
-			strcat(mtdids, ",");
-		strcat(mtdids, dev);
-		strcat(mtdids, "=");
-		strcat(mtdids, dev);
-
-		/* mtdparts: "mtdparts=<dev>:<mtdparts_<dev>>;..." */
-		if (mtdparts[0] != '\0')
-			strncat(mtdparts, ";", MTDPARTS_LEN);
-		else
-			strcat(mtdparts, "mtdparts=");
-		strncat(mtdparts, dev, MTDPARTS_LEN);
-		strncat(mtdparts, ":", MTDPARTS_LEN);
-		strncat(mtdparts, tmp, MTDPARTS_LEN);
-	}
-}
-
-void board_mtdparts_default(const char **mtdids, const char **mtdparts)
-{
-	struct udevice *dev;
-	static char parts[3 * MTDPARTS_LEN + 1];
-	static char ids[MTDIDS_LEN + 1];
-	static bool mtd_initialized;
-
-	if (mtd_initialized) {
-		*mtdids = ids;
-		*mtdparts = parts;
-		return;
-	}
-
-	memset(parts, 0, sizeof(parts));
-	memset(ids, 0, sizeof(ids));
-
-	/* probe all MTD devices */
-	for (uclass_first_device(UCLASS_MTD, &dev);
-	     dev;
-	     uclass_next_device(&dev)) {
-		pr_debug("mtd device = %s\n", dev->name);
-	}
-
-	if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev))
-		board_get_mtdparts("nor0", ids, parts);
-
-	mtd_initialized = true;
-	*mtdids = ids;
-	*mtdparts = parts;
-	debug("%s:mtdids=%s & mtdparts=%s\n", __func__, ids, parts);
-}
-#endif
-
 #if defined(CONFIG_OF_BOARD_SETUP)
 int ft_board_setup(void *blob, bd_t *bd)
 {
diff --git a/board/st/common/Makefile b/board/st/common/Makefile
index 8553606b90..4bb8b49867 100644
--- a/board/st/common/Makefile
+++ b/board/st/common/Makefile
@@ -4,3 +4,7 @@
 #
 
 obj-$(CONFIG_CMD_STBOARD) += cmd_stboard.o
+
+ifeq ($(CONFIG_ARCH_STM32MP),y)
+obj-$(CONFIG_SYS_MTDPARTS_RUNTIME) += stm32mp_mtdparts.o
+endif
diff --git a/board/st/common/stm32mp_mtdparts.c b/board/st/common/stm32mp_mtdparts.c
new file mode 100644
index 0000000000..d77e075864
--- /dev/null
+++ b/board/st/common/stm32mp_mtdparts.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
+ */
+
+#include <common.h>
+#include <dm.h>
+#include <env.h>
+#include <env_internal.h>
+#include <mtd.h>
+#include <mtd_node.h>
+
+#define MTDPARTS_LEN		256
+#define MTDIDS_LEN		128
+
+/*
+ * Get a global data pointer
+ */
+DECLARE_GLOBAL_DATA_PTR;
+
+/**
+ * The mtdparts_nand0 and mtdparts_nor0 variable tends to be long.
+ * If we need to access it before the env is relocated, then we need
+ * to use our own stack buffer. gd->env_buf will be too small.
+ *
+ * @param buf temporary buffer pointer MTDPARTS_LEN long
+ * @return mtdparts variable string, NULL if not found
+ */
+static const char *env_get_mtdparts(const char *str, char *buf)
+{
+	if (gd->flags & GD_FLG_ENV_READY)
+		return env_get(str);
+	if (env_get_f(str, buf, MTDPARTS_LEN) != -1)
+		return buf;
+
+	return NULL;
+}
+
+/**
+ * update the variables "mtdids" and "mtdparts" with content of mtdparts_<dev>
+ */
+static void board_get_mtdparts(const char *dev,
+			       char *mtdids,
+			       char *mtdparts)
+{
+	char env_name[32] = "mtdparts_";
+	char tmp_mtdparts[MTDPARTS_LEN];
+	const char *tmp;
+
+	/* name of env variable to read = mtdparts_<dev> */
+	strcat(env_name, dev);
+	tmp = env_get_mtdparts(env_name, tmp_mtdparts);
+	if (tmp) {
+		/* mtdids: "<dev>=<dev>, ...." */
+		if (mtdids[0] != '\0')
+			strcat(mtdids, ",");
+		strcat(mtdids, dev);
+		strcat(mtdids, "=");
+		strcat(mtdids, dev);
+
+		/* mtdparts: "mtdparts=<dev>:<mtdparts_<dev>>;..." */
+		if (mtdparts[0] != '\0')
+			strncat(mtdparts, ";", MTDPARTS_LEN);
+		else
+			strcat(mtdparts, "mtdparts=");
+		strncat(mtdparts, dev, MTDPARTS_LEN);
+		strncat(mtdparts, ":", MTDPARTS_LEN);
+		strncat(mtdparts, tmp, MTDPARTS_LEN);
+	}
+}
+
+void board_mtdparts_default(const char **mtdids, const char **mtdparts)
+{
+	struct mtd_info *mtd;
+	struct udevice *dev;
+	static char parts[3 * MTDPARTS_LEN + 1];
+	static char ids[MTDIDS_LEN + 1];
+	static bool mtd_initialized;
+
+	if (mtd_initialized) {
+		*mtdids = ids;
+		*mtdparts = parts;
+		return;
+	}
+
+	memset(parts, 0, sizeof(parts));
+	memset(ids, 0, sizeof(ids));
+
+	/* probe all MTD devices */
+	for (uclass_first_device(UCLASS_MTD, &dev);
+	     dev;
+	     uclass_next_device(&dev)) {
+		pr_debug("mtd device = %s\n", dev->name);
+	}
+
+	mtd = get_mtd_device_nm("nand0");
+	if (!IS_ERR_OR_NULL(mtd)) {
+		board_get_mtdparts("nand0", ids, parts);
+		put_mtd_device(mtd);
+	}
+
+	mtd = get_mtd_device_nm("spi-nand0");
+	if (!IS_ERR_OR_NULL(mtd)) {
+		board_get_mtdparts("spi-nand0", ids, parts);
+		put_mtd_device(mtd);
+	}
+
+	if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev))
+		board_get_mtdparts("nor0", ids, parts);
+
+	mtd_initialized = true;
+	*mtdids = ids;
+	*mtdparts = parts;
+	debug("%s:mtdids=%s & mtdparts=%s\n", __func__, ids, parts);
+}
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index b9d852efa4..bbeeb15d7e 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -828,108 +828,6 @@ const char *env_ext4_get_dev_part(void)
 }
 #endif
 
-#ifdef CONFIG_SYS_MTDPARTS_RUNTIME
-
-#define MTDPARTS_LEN		256
-#define MTDIDS_LEN		128
-
-/**
- * The mtdparts_nand0 and mtdparts_nor0 variable tends to be long.
- * If we need to access it before the env is relocated, then we need
- * to use our own stack buffer. gd->env_buf will be too small.
- *
- * @param buf temporary buffer pointer MTDPARTS_LEN long
- * @return mtdparts variable string, NULL if not found
- */
-static const char *env_get_mtdparts(const char *str, char *buf)
-{
-	if (gd->flags & GD_FLG_ENV_READY)
-		return env_get(str);
-	if (env_get_f(str, buf, MTDPARTS_LEN) != -1)
-		return buf;
-
-	return NULL;
-}
-
-/**
- * update the variables "mtdids" and "mtdparts" with content of mtdparts_<dev>
- */
-static void board_get_mtdparts(const char *dev,
-			       char *mtdids,
-			       char *mtdparts)
-{
-	char env_name[32] = "mtdparts_";
-	char tmp_mtdparts[MTDPARTS_LEN];
-	const char *tmp;
-
-	/* name of env variable to read = mtdparts_<dev> */
-	strcat(env_name, dev);
-	tmp = env_get_mtdparts(env_name, tmp_mtdparts);
-	if (tmp) {
-		/* mtdids: "<dev>=<dev>, ...." */
-		if (mtdids[0] != '\0')
-			strcat(mtdids, ",");
-		strcat(mtdids, dev);
-		strcat(mtdids, "=");
-		strcat(mtdids, dev);
-
-		/* mtdparts: "mtdparts=<dev>:<mtdparts_<dev>>;..." */
-		if (mtdparts[0] != '\0')
-			strncat(mtdparts, ";", MTDPARTS_LEN);
-		else
-			strcat(mtdparts, "mtdparts=");
-		strncat(mtdparts, dev, MTDPARTS_LEN);
-		strncat(mtdparts, ":", MTDPARTS_LEN);
-		strncat(mtdparts, tmp, MTDPARTS_LEN);
-	}
-}
-
-void board_mtdparts_default(const char **mtdids, const char **mtdparts)
-{
-	struct mtd_info *mtd;
-	struct udevice *dev;
-	static char parts[3 * MTDPARTS_LEN + 1];
-	static char ids[MTDIDS_LEN + 1];
-	static bool mtd_initialized;
-
-	if (mtd_initialized) {
-		*mtdids = ids;
-		*mtdparts = parts;
-		return;
-	}
-
-	memset(parts, 0, sizeof(parts));
-	memset(ids, 0, sizeof(ids));
-
-	/* probe all MTD devices */
-	for (uclass_first_device(UCLASS_MTD, &dev);
-	     dev;
-	     uclass_next_device(&dev)) {
-		pr_debug("mtd device = %s\n", dev->name);
-	}
-
-	mtd = get_mtd_device_nm("nand0");
-	if (!IS_ERR_OR_NULL(mtd)) {
-		board_get_mtdparts("nand0", ids, parts);
-		put_mtd_device(mtd);
-	}
-
-	mtd = get_mtd_device_nm("spi-nand0");
-	if (!IS_ERR_OR_NULL(mtd)) {
-		board_get_mtdparts("spi-nand0", ids, parts);
-		put_mtd_device(mtd);
-	}
-
-	if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev))
-		board_get_mtdparts("nor0", ids, parts);
-
-	mtd_initialized = true;
-	*mtdids = ids;
-	*mtdparts = parts;
-	debug("%s:mtdids=%s & mtdparts=%s\n", __func__, ids, parts);
-}
-#endif
-
 #if defined(CONFIG_OF_BOARD_SETUP)
 int ft_board_setup(void *blob, bd_t *bd)
 {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
