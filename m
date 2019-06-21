Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F05084E8D6
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:22:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB26DCA0262
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:22:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5CF7C9FE9D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:22:15 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDGxCD004156; Fri, 21 Jun 2019 15:22:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=kWObKQrLMqzgjYxC+ZW1BHInmE+A0Lp5FrgGxeUhAeo=;
 b=UuwjfvPJC2ss/cIqkyWaCham2aHxr/g8g4HRAhEuo+VR7ifRqrWWKOA4HdZNdAuSAHsP
 Vl7IJ894q0QOWvsltNCdQiAzG+lOO2B1cMtA2mQ0jkKhBqij5MDFpFw8KXf4MyaO97dP
 ChTGiyR/GD2chAUIs2qmIXxbInQNCYc9xQyB57nQVG2RydJ+cZXxAZpIMZ/Zg+RMIEKp
 uj6GIPFOfGl/0kCxIB/uRXC/Nt8J1qVr8vU9Ow5liip+5qPP7Iv3zqggGrf4bNGagC8j
 6oN58Wpbe8dTUrgvlO4yMhsxT8w/BCI+qBthUL3n2HKeALqPszqRmW8DMj5GBl0PbaDe uA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t781v7nr2-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:22:14 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 38DC431;
 Fri, 21 Jun 2019 13:22:14 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 22ACE2A2E;
 Fri, 21 Jun 2019 13:22:14 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 15:22:14 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun 2019 15:22:13
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:21:45 +0200
Message-ID: <1561123314-709-8-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561123314-709-1-git-send-email-patrick.delaunay@st.com>
References: <1561123314-709-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 07/16] stm32mp1: update package information in
	device tree
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

 arch/arm/Kconfig               |  1 +
 arch/arm/mach-stm32mp/Makefile |  1 +
 arch/arm/mach-stm32mp/fdt.c    | 45 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 arch/arm/mach-stm32mp/fdt.c

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 01ff57c..a44cc3b 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1478,6 +1478,7 @@ config ARCH_STM32MP
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
