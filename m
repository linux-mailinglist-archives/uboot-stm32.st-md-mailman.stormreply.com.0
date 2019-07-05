Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 361E860921
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jul 2019 17:20:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F36B6C35E05
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jul 2019 15:20:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D557C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2019 15:20:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x65FGDb2002472; Fri, 5 Jul 2019 17:20:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Roc1Wqcb7VFkuiwEzrPjL+2zzU2XA4WyKY/R8PM6P+g=;
 b=FL1fKFDIBrH+/KiwtckpHf2fiqJrCVzVvUh1iwsn8qeUyLjiY9YIK2+uR+hPIh+I75Zp
 peCM4spu8s464qIc7RavPd1qF1ncIfDLMTBlOKN/Niqu1ODjXfoicTxYOgrBbryg5n2P
 08QZMwtcqrSRH7lMHf8eycdF1SuexNxV4Y3qX4i2Vadt5VhTpnDOH5RPf9iMkdqkTXCA
 +dcZeMPapMR6R7NfUibrFY1VLF0j7Sva4Gqy8YtHwo2pE7JMmQwuNN7nGRKW0u7X+CL1
 mzOo7tHN4UMUQ5VVvCM4AQb9+Xer+L86esL8IDsSZQ6GmnLnQ9PxfZc/utFPqEdufBaf Zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tdxvjkgc4-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 05 Jul 2019 17:20:36 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9EB2431;
 Fri,  5 Jul 2019 15:20:35 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7B45C4FBA;
 Fri,  5 Jul 2019 15:20:35 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 5 Jul 2019
 17:20:35 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 5 Jul 2019 17:20:35
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 5 Jul 2019 17:20:14 +0200
Message-ID: <1562340023-8516-8-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
References: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-05_05:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 07/16] stm32mp1: update package information
	in device tree
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

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2: None

 arch/arm/Kconfig               |  1 +
 arch/arm/mach-stm32mp/Makefile |  1 +
 arch/arm/mach-stm32mp/fdt.c    | 45 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 arch/arm/mach-stm32mp/fdt.c

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index f5a7630..6f9c201 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1488,6 +1488,7 @@ config ARCH_STM32MP
 	select MISC
 	select OF_CONTROL
 	select OF_LIBFDT
+	select OF_SYSTEM_SETUP
 	select PINCTRL
 	select REGMAP
 	select SUPPORT_SPL
diff --git a/arch/arm/mach-stm32mp/Makefile b/arch/arm/mach-stm32mp/Makefile
index 1493914..e59bd81 100644
--- a/arch/arm/mach-stm32mp/Makefile
+++ b/arch/arm/mach-stm32mp/Makefile
@@ -17,3 +17,4 @@ endif
 endif
 obj-$(CONFIG_ARMV7_PSCI) += psci.o
 obj-$(CONFIG_$(SPL_)DM_REGULATOR) += pwr_regulator.o
+obj-$(CONFIG_OF_SYSTEM_SETUP) += fdt.o
diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c
new file mode 100644
index 0000000..c635353
--- /dev/null
+++ b/arch/arm/mach-stm32mp/fdt.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
+ */
+
+#include <common.h>
+#include <fdt_support.h>
+#include <asm/arch/sys_proto.h>
+#include <dt-bindings/pinctrl/stm32-pinfunc.h>
+
+/*
+ * This function is called right before the kernel is booted. "blob" is the
+ * device tree that will be passed to the kernel.
+ */
+int ft_system_setup(void *blob, bd_t *bd)
+{
+	int ret = 0;
+	u32 pkg;
+
+	switch (get_cpu_package()) {
+	case PKG_AA_LBGA448:
+		pkg = STM32MP_PKG_AA;
+		break;
+	case PKG_AB_LBGA354:
+		pkg = STM32MP_PKG_AB;
+		break;
+	case PKG_AC_TFBGA361:
+		pkg = STM32MP_PKG_AC;
+		break;
+	case PKG_AD_TFBGA257:
+		pkg = STM32MP_PKG_AD;
+		break;
+	default:
+		pkg = 0;
+		break;
+	}
+	if (pkg) {
+		do_fixup_by_compat_u32(blob, "st,stm32mp157-pinctrl",
+				       "st,package", pkg, false);
+		do_fixup_by_compat_u32(blob, "st,stm32mp157-z-pinctrl",
+				       "st,package", pkg, false);
+	}
+
+	return ret;
+}
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
