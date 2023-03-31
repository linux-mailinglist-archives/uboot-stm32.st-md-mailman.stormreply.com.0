Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BD06D1969
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Mar 2023 10:08:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39E27C64107;
	Fri, 31 Mar 2023 08:08:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1748C0356E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 07:14:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32V6oIN6022275; Fri, 31 Mar 2023 09:14:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=42xkKl2msGM0NcS3BjXCfwXB6MqRCQ/CY+jPp+fEw7w=;
 b=ESQzOxz+flws2bhsd9UYhrYGuflnDzGJuDf0lygrzIBQ6CK/h6wnpZLMlL9Cz5T273BE
 f4k0jK35sn3x/zTPber/9VkIl/Wysqu8D24I02EOm8bLnunjTgZCmyNNMcznaoe5tBkX
 rcTwRxBY4uEDRY9GGXseQyxVcP9WlYhvf4uS8cuJpWBVV8ARXGh7qI17xkUh9FF4e2n5
 Qf9Nq/4ACLfDqbQMnoolws8cRfpxGlMAwxd/pPuIk3sw3mXkK1okIDqfCr2vD0QPP42G
 kOiXw4eCuSm1lNstC6YX9P97pejbFeC9HSgPWn0tPnC8VJexZGcc1iJw5TqTHOQjfuF4 XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pn8jwe3v0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 09:14:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A88A810004A;
 Fri, 31 Mar 2023 09:14:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9D3F22115E3;
 Fri, 31 Mar 2023 09:14:37 +0200 (CEST)
Received: from localhost (10.201.22.153) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 31 Mar
 2023 09:14:37 +0200
From: Lionel Debieve <lionel.debieve@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 31 Mar 2023 09:14:26 +0200
Message-ID: <20230331091422.1.Ifbd51cee403b79546111ea80e1f9c3a0290c01dc@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.22.153]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_02,2023-03-30_04,2023-02-09_01
X-Mailman-Approved-At: Fri, 31 Mar 2023 08:08:19 +0000
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>, Stefan Roese <sr@denx.de>
Subject: [Uboot-stm32] [PATCH] watchdog: arm_smc_wdt: add watchdog support
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
---

 drivers/watchdog/Kconfig       |   8 +++
 drivers/watchdog/Makefile      |   1 +
 drivers/watchdog/arm_smc_wdt.c | 116 +++++++++++++++++++++++++++++++++
 3 files changed, 125 insertions(+)
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
index 00000000000..e2e3c455082
--- /dev/null
+++ b/drivers/watchdog/arm_smc_wdt.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * ARM Secure Monitor Call watchdog driver
+ * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
+ */
+
+#include <dm.h>
+#include <dm/device_compat.h>
+#include <dm/of_access.h>
+#include <linux/arm-smccc.h>
+#include <linux/psci.h>
+#include <wdt.h>
+
+#define DRV_NAME		"arm_smc_wdt"
+#define DRV_VERSION		"1.0"
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
+	struct arm_smccc_res local_res;
+	struct smcwd_priv_data *priv = dev_get_priv(dev);
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
+	int err;
+	u64 timeout_sec = WDT_TIMEOUT_SECS(timeout_ms);
+	struct smcwd_priv_data *priv = dev_get_priv(dev);
+
+	if (timeout_sec < priv->min_timeout || timeout_sec > priv->max_timeout)
+		return -EINVAL;
+
+	err = smcwd_call(dev, SMCWD_SET_TIMEOUT, timeout_sec, NULL);
+	if (err)
+		return err;
+
+	return smcwd_call(dev, SMCWD_ENABLE, 1, NULL);
+}
+
+static int smcwd_probe(struct udevice *dev)
+{
+	int err;
+	struct arm_smccc_res res;
+	struct smcwd_priv_data *priv = dev_get_priv(dev);
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
