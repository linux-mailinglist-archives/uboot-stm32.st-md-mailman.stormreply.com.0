Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 409221896C9
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:23:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7707C36B15
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 08:23:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5715CC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 08:23:05 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I8HSQR019406; Wed, 18 Mar 2020 09:23:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=RorXdjeXMjt+VP4k9cUtSjQb/gl2E+5sxbPr6LuCzUw=;
 b=FAjZJNGLBTpyKFJIl/AhYeJrIUSlU0FxtLbBoIw/5WDcvfGnf70jfHI0iQsODBREYF3E
 piTSx7ZAoSLyWGilU74es4ItKyBdLsma+tAfaRk7zpIwZzHG8BKV+wXmXYvc2QrBvwbZ
 H2IrBw2g6FkEIa4TkvYEeGEC2uRIjulciqYs8sOlKGgWJftAsRi/Ds7D7ny/mkhvGEze
 vZ7C5xekerKenfns45fEdEdb48GUzV69Tfbe+8rR0KPYr8KveoUnUfpkA6jglFfrivXE
 cdts6C0rjD7ySBG37hPNSq3+RtN4GlGjf8Z7t41VKpHY89xDx6ZcBMToOAaM3DMs0rJt KQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu8eta8cx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 09:23:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 121EC100039;
 Wed, 18 Mar 2020 09:23:04 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 09B7C21CA91;
 Wed, 18 Mar 2020 09:23:04 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 09:23:03 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 09:22:50 +0100
Message-ID: <20200318092245.7.I918c95d6671221dfaa0bd39f24589baf98bcbd09@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318082254.7522-1-patrick.delaunay@st.com>
References: <20200318082254.7522-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 07/11] board: stm32mp1: use FDT address
	provided by TF-A at boot time
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

Save and use the FDT address provided by TF-A in r2 at boot time
(it is NT_FW_CONFIG = Non Trusted Firmware configuration file)

Address is saved in save_boot_params(), called by start.S
and the used DTB is gd->fdt_blob = board_fdt_blob_setup().

If dtb is not provided or invalid, U-Boot use as fallback
the builtin DTB.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/Makefile      |  1 +
 arch/arm/mach-stm32mp/boot_params.c | 45 +++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 arch/arm/mach-stm32mp/boot_params.c

diff --git a/arch/arm/mach-stm32mp/Makefile b/arch/arm/mach-stm32mp/Makefile
index eee39c27c3..19ca3b08a5 100644
--- a/arch/arm/mach-stm32mp/Makefile
+++ b/arch/arm/mach-stm32mp/Makefile
@@ -13,6 +13,7 @@ else
 obj-y += bsec.o
 obj-$(CONFIG_CMD_STM32KEY) += cmd_stm32key.o
 obj-$(CONFIG_ARMV7_PSCI) += psci.o
+obj-$(CONFIG_STM32MP1_TRUSTED) += boot_params.o
 endif
 
 obj-$(CONFIG_$(SPL_)DM_REGULATOR) += pwr_regulator.o
diff --git a/arch/arm/mach-stm32mp/boot_params.c b/arch/arm/mach-stm32mp/boot_params.c
new file mode 100644
index 0000000000..e4351de939
--- /dev/null
+++ b/arch/arm/mach-stm32mp/boot_params.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
+ */
+
+#include <common.h>
+#include <asm/sections.h>
+#include <asm/system.h>
+
+/*
+ * Force data-section, as .bss will not be valid
+ * when save_boot_params is invoked.
+ */
+static unsigned long nt_fw_dtb __section(".data");
+
+/*
+ * Save the FDT address provided by TF-A in r2 at boot time
+ * This function is called from start.S
+ */
+void save_boot_params(unsigned long r0, unsigned long r1, unsigned long r2,
+		      unsigned long r3)
+{
+	nt_fw_dtb = r2;
+
+	save_boot_params_ret();
+}
+
+/*
+ * Use the saved FDT address provided by TF-A at boot time (NT_FW_CONFIG =
+ * Non Trusted Firmware configuration file) when the pointer is valid
+ */
+void *board_fdt_blob_setup(void)
+{
+	debug("%s: nt_fw_dtb=%lx\n", __func__, nt_fw_dtb);
+
+	/* use external device tree only if address is valid */
+	if (nt_fw_dtb >= STM32_DDR_BASE) {
+		if (fdt_magic(nt_fw_dtb) == FDT_MAGIC)
+			return (void *)nt_fw_dtb;
+		debug("%s: DTB not found.\n", __func__);
+	}
+	debug("%s: fall back to builtin DTB, %p\n", __func__, &_end);
+
+	return (void *)&_end;
+}
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
