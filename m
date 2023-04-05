Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C84F26D78E8
	for <lists+uboot-stm32@lfdr.de>; Wed,  5 Apr 2023 11:53:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 749CFC6A60A;
	Wed,  5 Apr 2023 09:53:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17B87C03FC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 09:53:33 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3359R2gf004437; Wed, 5 Apr 2023 11:53:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=70AwYiCzKHyGeIkYE1+gqKfFR8tvL4SDuNXanKoebqQ=;
 b=In3dKwfjuOyMi8XsggoaiiSM42W5onJ4M7u/SUAUJWUWAr9fZB3vTPsX7gquuozknklA
 keVA56Vw1mpzWuHgixeUXPzUjOh0Q/rgupFLgF6dJ/hyymLe04mJa6HNZ8nISEXYbypp
 ezySlG5hL8grZqPUu5HfiddgC/0v4ND2aSMOj0r6wsJCDWNvWQxGUkKQ5KgjFxqSMabs
 wudIpadhyH+M6AnFJzrq4BHiruAulFwQ8OFcNxIGYryrggH0A1mu8XXAgk12dPoGtDUM
 BTwNZNAeYZgjcsvqjccxkvz/e4b2XI/gXHV9osrh02E2k5UOsTYqeUwSvnD8TCx9fR8d 2A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3prdhr8x31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Apr 2023 11:53:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 841FE100038;
 Wed,  5 Apr 2023 11:53:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6E549214D38;
 Wed,  5 Apr 2023 11:53:31 +0200 (CEST)
Received: from localhost (10.201.22.153) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 5 Apr
 2023 11:53:31 +0200
From: Lionel Debieve <lionel.debieve@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 5 Apr 2023 11:53:22 +0200
Message-ID: <20230405115313.v2.1.Ifbd51cee403b79546111ea80e1f9c3a0290c01dc@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.22.153]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_06,2023-04-04_05,2023-02-09_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>, Stefan Roese <sr@denx.de>
Subject: [Uboot-stm32] [PATCH v2] watchdog: arm_smc_wdt: add watchdog support
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

Implement a ARM SMCCC based driver that allow to use
a secure watchdog on the platform.

Signed-off-by: Lionel Debieve <lionel.debieve@foss.st.com>
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Tested-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 drivers/watchdog/Kconfig       |   8 +++
 drivers/watchdog/Makefile      |   1 +
 drivers/watchdog/arm_smc_wdt.c | 121 +++++++++++++++++++++++++++++++++
 3 files changed, 130 insertions(+)
 create mode 100644 drivers/watchdog/arm_smc_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index b5ac8f7f50d..3a0341f609d 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -352,6 +352,14 @@ config WDT_TANGIER
 	  Intel Tangier SoC. If you're using a board with Intel Tangier
 	  SoC, say Y here.
 
+config WDT_ARM_SMC
+	bool "ARM SMC watchdog timer support"
+	depends on WDT && ARM_SMCCC
+	imply WATCHDOG
+	help
+	  Select this to enable Arm SMC watchdog timer. This watchdog will manage
+	  a watchdog based on ARM SMCCC communication.
+
 config SPL_WDT
 	bool "Enable driver model for watchdog timer drivers in SPL"
 	depends on SPL_DM
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 446d961d7d2..a4633c0d2fa 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_$(SPL_TPL_)WDT) += wdt-uclass.o
 obj-$(CONFIG_WDT_SANDBOX) += sandbox_wdt.o
 obj-$(CONFIG_WDT_ALARM_SANDBOX) += sandbox_alarm-wdt.o
 obj-$(CONFIG_WDT_APPLE) += apple_wdt.o
+obj-$(CONFIG_WDT_ARM_SMC) += arm_smc_wdt.o
 obj-$(CONFIG_WDT_ARMADA_37XX) += armada-37xx-wdt.o
 obj-$(CONFIG_WDT_ASPEED) += ast_wdt.o
 obj-$(CONFIG_WDT_AST2600) += ast2600_wdt.o
diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wdt.c
new file mode 100644
index 00000000000..70ab99bdbfb
--- /dev/null
+++ b/drivers/watchdog/arm_smc_wdt.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * ARM Secure Monitor Call watchdog driver
+ * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
+ * This file is based on Linux driver drivers/watchdog/arm_smc_wdt.c
+ */
+
+#define LOG_CATEGORY UCLASS_WDT
+
+#include <dm.h>
+#include <dm/device_compat.h>
+#include <linux/arm-smccc.h>
+#include <linux/psci.h>
+#include <wdt.h>
+
+#define DRV_NAME		"arm_smc_wdt"
+
+#define WDT_TIMEOUT_SECS(TIMEOUT)	((TIMEOUT) / 1000)
+
+enum smcwd_call {
+	SMCWD_INIT		= 0,
+	SMCWD_SET_TIMEOUT	= 1,
+	SMCWD_ENABLE		= 2,
+	SMCWD_PET		= 3,
+	SMCWD_GET_TIMELEFT	= 4,
+};
+
+struct smcwd_priv_data {
+	u32 smc_id;
+	unsigned int min_timeout;
+	unsigned int max_timeout;
+};
+
+static int smcwd_call(struct udevice *dev, enum smcwd_call call,
+		      unsigned long arg, struct arm_smccc_res *res)
+{
+	struct smcwd_priv_data *priv = dev_get_priv(dev);
+	struct arm_smccc_res local_res;
+
+	if (!res)
+		res = &local_res;
+
+	arm_smccc_smc(priv->smc_id, call, arg, 0, 0, 0, 0, 0, res);
+
+	if (res->a0 == PSCI_RET_NOT_SUPPORTED)
+		return -ENODEV;
+	if (res->a0 == PSCI_RET_INVALID_PARAMS)
+		return -EINVAL;
+	if (res->a0 != PSCI_RET_SUCCESS)
+		return -EIO;
+
+	return 0;
+}
+
+static int smcwd_reset(struct udevice *dev)
+{
+	return smcwd_call(dev, SMCWD_PET, 0, NULL);
+}
+
+static int smcwd_stop(struct udevice *dev)
+{
+	return smcwd_call(dev, SMCWD_ENABLE, 0, NULL);
+}
+
+static int smcwd_start(struct udevice *dev, u64 timeout_ms, ulong flags)
+{
+	struct smcwd_priv_data *priv = dev_get_priv(dev);
+	u64 timeout_sec = WDT_TIMEOUT_SECS(timeout_ms);
+	int err;
+
+	if (timeout_sec < priv->min_timeout || timeout_sec > priv->max_timeout)	{
+		dev_err(dev, "Timeout value not supported\n");
+		return -EINVAL;
+	}
+
+	err = smcwd_call(dev, SMCWD_SET_TIMEOUT, timeout_sec, NULL);
+	if (err) {
+		dev_err(dev, "Timeout out configuration failed\n");
+		return err;
+	}
+
+	return smcwd_call(dev, SMCWD_ENABLE, 1, NULL);
+}
+
+static int smcwd_probe(struct udevice *dev)
+{
+	struct smcwd_priv_data *priv = dev_get_priv(dev);
+	struct arm_smccc_res res;
+	int err;
+
+	priv->smc_id = dev_read_u32_default(dev, "arm,smc-id", 0x82003D06);
+
+	err = smcwd_call(dev, SMCWD_INIT, 0, &res);
+	if (err < 0)
+		return err;
+
+	priv->min_timeout = res.a1;
+	priv->max_timeout = res.a2;
+
+	return 0;
+}
+
+static const struct wdt_ops smcwd_ops = {
+	.start		= smcwd_start,
+	.stop		= smcwd_stop,
+	.reset		= smcwd_reset,
+};
+
+static const struct udevice_id smcwd_dt_ids[] = {
+	{ .compatible = "arm,smc-wdt" },
+	{}
+};
+
+U_BOOT_DRIVER(wdt_sandbox) = {
+	.name = "smcwd",
+	.id = UCLASS_WDT,
+	.of_match = smcwd_dt_ids,
+	.priv_auto = sizeof(struct smcwd_priv_data),
+	.probe = smcwd_probe,
+	.ops = &smcwd_ops,
+};
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
