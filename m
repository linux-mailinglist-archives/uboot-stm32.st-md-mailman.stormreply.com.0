Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D85C41E0B96
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 May 2020 12:20:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CBE9C36B2D
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 May 2020 10:20:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5850FC36B23
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 10:20:00 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04PAHlAg026084; Mon, 25 May 2020 12:19:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=8w9cDsZJ+V0JV2ApiFsMt2KhKkl/Twjzd3dJ5M3FhJU=;
 b=UvpWoz6KuIISIPxGUZ+6vskOmqcxI3WLcxNzvjVckxSSmM14hZ4RZ2hg1GeAkeG6mM/b
 Zs83CRbQZ1/+AGZlpVYFATUO+FGSDnGGC5SdZ72UwxrNpYzpRFuA5ekmVzZLeXptSEEf
 Vc9OL49T5N9KjeG72P3avMEUc77G6GITYxaGWmXfF40T5GQok6Tt4lltCKLLIYFfgjm3
 9X4cNt7Vt91kKQPeRih9xs2IGvMndbVg0a8C+U9TVGJ5GoW5rSgI+Rzz1Tog05Sz/HuD
 O5S7T3UB7tt5OhobVI6O1N4zSyEB9lpDkkDOClcjkjp1Eu5Nzg11LtHbtdgzI4EH9kSt cQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 316sa1stew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 May 2020 12:19:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1EB8D10002A;
 Mon, 25 May 2020 12:19:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1499620B84D;
 Mon, 25 May 2020 12:19:59 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 25 May 2020 12:19:58 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 25 May 2020 12:19:46 +0200
Message-ID: <20200525101949.15944-7-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200525101949.15944-1-patrick.delaunay@st.com>
References: <20200525101949.15944-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-25_04:2020-05-25,
 2020-05-25 signatures=0
Cc: Marek Vasut <marex@denx.de>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 6/9] board: st: stpmic1: add function
	stpmic1_init
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

Add a function stmpic_init to early initialize the PMIC STPMIC1
- keep vdd on during the reset cycle (to avoid issue when backup battery
  is absent)
- Check if debug is enabled to program PMIC according to the bit

This patch allows to remove the compilation of spl.c file from stm32mp1
board in dh_stm32mp1.

CONFIG_SPL_BOARD_INIT is removed as the new function is called earlier
in SPL, in the function board_early_init_f.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- add stpmic1_init function, called in board_early_init_f for
  dh_stm32mp1 board support (and no more use spl.c from stm32mp1)
- remove CONFIG_SPL_BOARD_INIT

 arch/arm/mach-stm32mp/Kconfig            |  1 -
 board/dhelectronics/dh_stm32mp1/Makefile |  4 ---
 board/dhelectronics/dh_stm32mp1/board.c  |  3 ++
 board/st/common/stpmic1.c                | 31 +++++++++++++++++++
 board/st/common/stpmic1.h                |  6 ++++
 board/st/stm32mp1/spl.c                  | 39 +++---------------------
 board/st/stm32mp1/stm32mp1.c             |  6 ++++
 configs/stm32mp15_basic_defconfig        |  1 +
 8 files changed, 52 insertions(+), 39 deletions(-)
 create mode 100644 board/st/common/stpmic1.h

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 6c995ed8d8..ea7d57477b 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -1,7 +1,6 @@
 if ARCH_STM32MP
 
 config SPL
-	select SPL_BOARD_INIT
 	select SPL_CLK
 	select SPL_DM
 	select SPL_DM_SEQ_ALIAS
diff --git a/board/dhelectronics/dh_stm32mp1/Makefile b/board/dhelectronics/dh_stm32mp1/Makefile
index 5758d9816b..b368b396a4 100644
--- a/board/dhelectronics/dh_stm32mp1/Makefile
+++ b/board/dhelectronics/dh_stm32mp1/Makefile
@@ -3,10 +3,6 @@
 # Copyright (C) 2018, STMicroelectronics - All Rights Reserved
 #
 
-ifdef CONFIG_SPL_BUILD
-obj-y += ../../st/stm32mp1/spl.o
-endif
-
 obj-y += ../../st/common/stpmic1.o board.o
 
 obj-$(CONFIG_SYS_MTDPARTS_RUNTIME) += ../../st/common/stm32mp_mtdparts.o
diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
index 85d56f6082..df0810dbda 100644
--- a/board/dhelectronics/dh_stm32mp1/board.c
+++ b/board/dhelectronics/dh_stm32mp1/board.c
@@ -37,6 +37,7 @@
 #include <usb.h>
 #include <usb/dwc2_udc.h>
 #include <watchdog.h>
+#include "../../st/common/stpmic1.h"
 
 /* SYSCFG registers */
 #define SYSCFG_BOOTR		0x00
@@ -194,6 +195,8 @@ int board_stm32mp1_ddr_config_name_match(struct udevice *dev,
 
 int board_early_init_f(void)
 {
+	if (IS_ENABLED(CONFIG_SPL_BUILD))
+		stpmic1_init();
 	board_get_coding_straps();
 
 	return 0;
diff --git a/board/st/common/stpmic1.c b/board/st/common/stpmic1.c
index ca10a2246b..64f24f1f6f 100644
--- a/board/st/common/stpmic1.c
+++ b/board/st/common/stpmic1.c
@@ -5,6 +5,7 @@
 
 #include <common.h>
 #include <dm.h>
+#include <asm/io.h>
 #include <asm/arch/ddr.h>
 #include <power/pmic.h>
 #include <power/stpmic1.h>
@@ -160,3 +161,33 @@ int board_ddr_power_init(enum ddr_type ddr_type)
 
 	return 0;
 }
+
+/* early init of PMIC */
+void stpmic1_init(void)
+{
+	struct udevice *dev;
+
+	if (uclass_get_device_by_driver(UCLASS_PMIC,
+					DM_GET_DRIVER(pmic_stpmic1), &dev))
+		return;
+
+	/* Keep vdd on during the reset cycle */
+	pmic_clrsetbits(dev,
+			STPMIC1_BUCKS_MRST_CR,
+			STPMIC1_MRST_BUCK(STPMIC1_BUCK3),
+			STPMIC1_MRST_BUCK(STPMIC1_BUCK3));
+
+	/* Check if debug is enabled to program PMIC according to the bit */
+	if (readl(TAMP_BOOT_CONTEXT) & TAMP_BOOT_DEBUG_ON) {
+		printf("Keep debug unit ON\n");
+
+		pmic_clrsetbits(dev, STPMIC1_BUCKS_MRST_CR,
+				STPMIC1_MRST_BUCK_DEBUG,
+				STPMIC1_MRST_BUCK_DEBUG);
+
+		if (STPMIC1_MRST_LDO_DEBUG)
+			pmic_clrsetbits(dev, STPMIC1_LDOS_MRST_CR,
+					STPMIC1_MRST_LDO_DEBUG,
+					STPMIC1_MRST_LDO_DEBUG);
+	}
+}
diff --git a/board/st/common/stpmic1.h b/board/st/common/stpmic1.h
new file mode 100644
index 0000000000..ecc3276697
--- /dev/null
+++ b/board/st/common/stpmic1.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause */
+/*
+ * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
+ */
+
+void stpmic1_init(void);
diff --git a/board/st/stm32mp1/spl.c b/board/st/stm32mp1/spl.c
index e65ff288ea..28efc5c0ae 100644
--- a/board/st/stm32mp1/spl.c
+++ b/board/st/stm32mp1/spl.c
@@ -5,41 +5,12 @@
 
 #include <config.h>
 #include <common.h>
-#include <spl.h>
-#include <dm.h>
-#include <ram.h>
-#include <asm/io.h>
-#include <power/pmic.h>
-#include <power/stpmic1.h>
-#include <asm/arch/ddr.h>
+#include "../common/stpmic1.h"
 
-void spl_board_init(void)
+int board_early_init_f(void)
 {
-	/* Keep vdd on during the reset cycle */
-#if defined(CONFIG_PMIC_STPMIC1) && defined(CONFIG_SPL_POWER_SUPPORT)
-	struct udevice *dev;
-	int ret;
+	if (IS_ENABLED(CONFIG_PMIC_STPMIC1) && CONFIG_IS_ENABLED(POWER_SUPPORT))
+		stpmic1_init();
 
-	ret = uclass_get_device_by_driver(UCLASS_PMIC,
-					  DM_GET_DRIVER(pmic_stpmic1), &dev);
-	if (!ret)
-		pmic_clrsetbits(dev,
-				STPMIC1_BUCKS_MRST_CR,
-				STPMIC1_MRST_BUCK(STPMIC1_BUCK3),
-				STPMIC1_MRST_BUCK(STPMIC1_BUCK3));
-
-	/* Check if debug is enabled to program PMIC according to the bit */
-	if ((readl(TAMP_BOOT_CONTEXT) & TAMP_BOOT_DEBUG_ON) && !ret) {
-		printf("Keep debug unit ON\n");
-
-		pmic_clrsetbits(dev, STPMIC1_BUCKS_MRST_CR,
-				STPMIC1_MRST_BUCK_DEBUG,
-				STPMIC1_MRST_BUCK_DEBUG);
-
-		if (STPMIC1_MRST_LDO_DEBUG)
-			pmic_clrsetbits(dev, STPMIC1_LDOS_MRST_CR,
-					STPMIC1_MRST_LDO_DEBUG,
-					STPMIC1_MRST_LDO_DEBUG);
-	}
-#endif
+	return 0;
 }
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 33cb7f6c4d..22ad2dba9a 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -79,6 +79,12 @@ DECLARE_GLOBAL_DATA_PTR;
 #define USB_START_LOW_THRESHOLD_UV	1230000
 #define USB_START_HIGH_THRESHOLD_UV	2150000
 
+int board_early_init_f(void)
+{
+	/* nothing to do, only used in SPL */
+	return 0;
+}
+
 int checkboard(void)
 {
 	int ret;
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index c7dd2926c9..628cde6cda 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -16,6 +16,7 @@ CONFIG_SPL_TEXT_BASE=0x2FFC2500
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
+CONFIG_BOARD_EARLY_INIT_F=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=3
 CONFIG_SPL_I2C_SUPPORT=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
