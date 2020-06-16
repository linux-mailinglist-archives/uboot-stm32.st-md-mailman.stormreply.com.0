Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F22B1FBBA9
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 18:27:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 390BEC36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 16:27:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40B02C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 16:27:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05GGMHI5004546; Tue, 16 Jun 2020 18:27:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=U98RCxcp8XfAM9S4CadW+enIPlIkb26AM+emqzCiA4w=;
 b=WdWZxNgRfDST//xyf0l0ActZwvMt0qK0BngI/YdBBJoaBLCq4c5ReXV32svD+dRDpJ+e
 IUCnmFEqUBl7in19bgAVAXnQgtvn1aNET/3OlcB04Nms2vWY6ZgFof1/FTxmZyuWzCCB
 YMjdzRkujuw+qUAuXSdLuNy422MMto1QMtuvDFzqdehK5+8sr6qPL0epDkzmJ5PCUeoQ
 xStE6C9ZYDiBpkViE291dFzNKhanePP+cAdUKF/MHzmflxJLdfcciQv1RbhSfSYqQ7Bu
 8gu322Swdgzsm8eJDEzNrFVULYhEuHtYrylsOnNML6xUTUYDT2zOwMT+bmPvGNmtgsKc zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mnph872e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 18:27:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 853BC10002A;
 Tue, 16 Jun 2020 18:27:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7AA7F2C9D36;
 Tue, 16 Jun 2020 18:27:48 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 16 Jun 2020 18:27:48 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 16 Jun 2020 18:27:44 +0200
Message-ID: <20200616182741.1.Ibccba1760354fd05e2c6877f2295adbea775757d@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_10:2020-06-16,
 2020-06-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] arm: stm32mp: protect DBGMCU_IDC access with
	BSEC
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

As debugger must be totally closed on Sec closed chip,
the DBGMCU_IDC register is no more accessible (self
hosted debug is disabled with OTP).

This patch adds a function bsec_dbgswenable() to check
if the DBGMCU registers are available before to access them:
BSEC_DENABLE.DBGSWENABLE = self hosted debug status.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/bsec.c              | 25 +++++++++++++++++++++++
 arch/arm/mach-stm32mp/cpu.c               | 22 ++++++++++++++++----
 arch/arm/mach-stm32mp/include/mach/bsec.h |  7 +++++++
 3 files changed, 50 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/mach-stm32mp/include/mach/bsec.h

diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
index fc39230113..c4b33ff241 100644
--- a/arch/arm/mach-stm32mp/bsec.c
+++ b/arch/arm/mach-stm32mp/bsec.c
@@ -8,6 +8,7 @@
 #include <log.h>
 #include <misc.h>
 #include <asm/io.h>
+#include <asm/arch/bsec.h>
 #include <asm/arch/stm32mp1_smc.h>
 #include <linux/arm-smccc.h>
 #include <linux/iopoll.h>
@@ -21,6 +22,7 @@
 #define BSEC_OTP_WRDATA_OFF		0x008
 #define BSEC_OTP_STATUS_OFF		0x00C
 #define BSEC_OTP_LOCK_OFF		0x010
+#define BSEC_DENABLE_OFF		0x014
 #define BSEC_DISTURBED_OFF		0x01C
 #define BSEC_ERROR_OFF			0x034
 #define BSEC_WRLOCK_OFF			0x04C /* OTP write permananet lock */
@@ -46,6 +48,9 @@
 #define BSEC_MODE_PROGFAIL_MASK		0x10
 #define BSEC_MODE_PWR_MASK		0x20
 
+/* DENABLE Register */
+#define BSEC_DENABLE_DBGSWENABLE	BIT(10)
+
 /*
  * OTP Lock services definition
  * Value must corresponding to the bit number in the register
@@ -505,3 +510,23 @@ U_BOOT_DRIVER(stm32mp_bsec) = {
 	.probe = stm32mp_bsec_probe,
 #endif
 };
+
+bool bsec_dbgswenable(void)
+{
+	struct udevice *dev;
+	struct stm32mp_bsec_platdata *plat;
+	int ret;
+
+	ret = uclass_get_device_by_driver(UCLASS_MISC,
+					  DM_GET_DRIVER(stm32mp_bsec), &dev);
+	if (ret || !dev) {
+		pr_debug("bsec driver not available\n");
+		return false;
+	}
+
+	plat = dev_get_platdata(dev);
+	if (readl(plat->base + BSEC_DENABLE_OFF) & BSEC_DENABLE_DBGSWENABLE)
+		return true;
+
+	return false;
+}
diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index 472b140321..382067190c 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -12,6 +12,7 @@
 #include <misc.h>
 #include <net.h>
 #include <asm/io.h>
+#include <asm/arch/bsec.h>
 #include <asm/arch/stm32.h>
 #include <asm/arch/sys_proto.h>
 #include <dm/device.h>
@@ -155,8 +156,13 @@ static void dbgmcu_init(void)
 {
 	setbits_le32(RCC_DBGCFGR, RCC_DBGCFGR_DBGCKEN);
 
-	/* Freeze IWDG2 if Cortex-A7 is in debug mode */
-	setbits_le32(DBGMCU_APB4FZ1, DBGMCU_APB4FZ1_IWDG2);
+	/*
+	 * Freeze IWDG2 if Cortex-A7 is in debug mode
+	 * done in TF-A for TRUSTED boot and
+	 * DBGMCU access is controlled by BSEC_DENABLE.DBGSWENABLE
+	*/
+	if (!IS_ENABLED(CONFIG_TFABOOT) && bsec_dbgswenable())
+		setbits_le32(DBGMCU_APB4FZ1, DBGMCU_APB4FZ1_IWDG2);
 }
 #endif /* !defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD) */
 
@@ -276,9 +282,17 @@ void enable_caches(void)
 
 static u32 read_idc(void)
 {
-	setbits_le32(RCC_DBGCFGR, RCC_DBGCFGR_DBGCKEN);
+	/* DBGMCU access is controlled by BSEC_DENABLE.DBGSWENABLE */
+	if (bsec_dbgswenable()) {
+		setbits_le32(RCC_DBGCFGR, RCC_DBGCFGR_DBGCKEN);
 
-	return readl(DBGMCU_IDC);
+		return readl(DBGMCU_IDC);
+	}
+
+	if (CONFIG_IS_ENABLED(STM32MP15x))
+		return CPU_DEV_STM32MP15; /* STM32MP15x and unknown revision */
+	else
+		return 0x0;
 }
 
 u32 get_cpu_dev(void)
diff --git a/arch/arm/mach-stm32mp/include/mach/bsec.h b/arch/arm/mach-stm32mp/include/mach/bsec.h
new file mode 100644
index 0000000000..252eac3946
--- /dev/null
+++ b/arch/arm/mach-stm32mp/include/mach/bsec.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause */
+/*
+ * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
+ */
+
+/* check self hosted debug status = BSEC_DENABLE.DBGSWENABLE */
+bool bsec_dbgswenable(void);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
