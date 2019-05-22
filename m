Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A0925F0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 May 2019 10:07:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E127CC65070
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 May 2019 08:07:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B307C628C7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 08:07:23 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4M87MeT002997; Wed, 22 May 2019 10:07:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=bFml7mvq2d8hO5vYwVnT2shEnCF+zb/iKfUq/cJL0l0=;
 b=nKoUMYJPwrILWBjwblk6XxqVITcCZfNbkypalI12WeBBwV03qAZH1jVeILqPpzUbPtdT
 /9LQ7Osl2mUjwlYPfff3Cus39oROyqvFEcTW87aaWzECpHFbsDxxpmadXsUI9yMnRBsr
 DJ5g06TqV8PIF7fU7wwxv82QYAJMarL5UE614xl4GV0LdQZlrQzT+I6fnmtXpF5Oi9rm
 1gDA6fNMAHonmALcAVk0+PFtonGrCyeqFlVR4tOXndeUOOYSZ9ewAvbQIXrcduL2YET3
 BcgYNfsloZ4Mq8bDwvsdoFwd9q2ZmAAWnAfQPGAOCBZb7fyMhySGR1kibgg8JgbqWDdc 9g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sj8xgeu7t-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 22 May 2019 10:07:22 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B3EE34A;
 Wed, 22 May 2019 08:07:11 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9625118B2;
 Wed, 22 May 2019 08:07:11 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.44) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 22 May
 2019 10:07:11 +0200
Received: from localhost (10.201.23.25) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 22 May 2019 10:07:11
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Loic Pallardy <loic.pallardy@st.com>
Date: Wed, 22 May 2019 10:06:47 +0200
Message-ID: <1558512409-32376-6-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558512409-32376-1-git-send-email-fabien.dessenne@st.com>
References: <1558512409-32376-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-22_03:, , signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH 5/7] remoteproc: Introduce STM32 Cortex-M4
	remoteproc driver
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

This patch introduces support of Cortex-M4 remote processor for STM32
MCU and MPU families.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 drivers/remoteproc/Kconfig       |  10 ++
 drivers/remoteproc/Makefile      |   1 +
 drivers/remoteproc/stm32_copro.c | 257 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 268 insertions(+)
 create mode 100644 drivers/remoteproc/stm32_copro.c

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 9eb532b..fa6f111 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -40,6 +40,16 @@ config REMOTEPROC_SANDBOX
 	  Say 'y' here to add support for test processor which does dummy
 	  operations for sandbox platform.
 
+config REMOTEPROC_STM32_COPRO
+	bool "Support for STM32 coprocessor"
+	select REMOTEPROC
+	depends on DM
+	depends on ARCH_STM32MP
+	depends on OF_CONTROL
+	help
+	  Say 'y' here to add support for STM32 Cortex-M4 coprocessors via the
+	  remoteproc framework.
+
 config REMOTEPROC_TI_POWER
 	bool "Support for TI Power processor"
 	select REMOTEPROC
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 77eb708..5b120c1 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -10,4 +10,5 @@ obj-$(CONFIG_$(SPL_)REMOTEPROC) += rproc-uclass.o
 obj-$(CONFIG_K3_SYSTEM_CONTROLLER) += k3_system_controller.o
 obj-$(CONFIG_REMOTEPROC_K3) += k3_rproc.o
 obj-$(CONFIG_REMOTEPROC_SANDBOX) += sandbox_testproc.o
+obj-$(CONFIG_REMOTEPROC_STM32_COPRO) += stm32_copro.o
 obj-$(CONFIG_REMOTEPROC_TI_POWER) += ti_power_proc.o
diff --git a/drivers/remoteproc/stm32_copro.c b/drivers/remoteproc/stm32_copro.c
new file mode 100644
index 0000000..5abdf30
--- /dev/null
+++ b/drivers/remoteproc/stm32_copro.c
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
+ */
+#define pr_fmt(fmt) "%s: " fmt, __func__
+#include <common.h>
+#include <dm.h>
+#include <errno.h>
+#include <fdtdec.h>
+#include <regmap.h>
+#include <remoteproc.h>
+#include <reset.h>
+#include <syscon.h>
+
+#define RCC_GCR_HOLD_BOOT	0
+#define RCC_GCR_RELEASE_BOOT	1
+
+/**
+ * struct stm32_copro_privdata - power processor private data
+ * @reset_ctl:		reset controller handle
+ * @hold_boot_regmap:	regmap for remote processor reset hold boot
+ * @hold_boot_offset:	offset of the register controlling the hold boot setting
+ * @hold_boot_mask:	bitmask of the register for the hold boot field
+ * @is_running:		is the remote processor running
+ */
+struct stm32_copro_privdata {
+	struct reset_ctl reset_ctl;
+	struct regmap *hold_boot_regmap;
+	uint hold_boot_offset;
+	uint hold_boot_mask;
+	bool is_running;
+};
+
+/**
+ * stm32_copro_probe() - Basic probe
+ * @dev:	corresponding STM32 remote processor device
+ *
+ * Return: 0 if all went ok, else corresponding -ve error
+ */
+static int stm32_copro_probe(struct udevice *dev)
+{
+	struct stm32_copro_privdata *priv;
+	struct regmap *regmap;
+	const fdt32_t *cell;
+	int len, ret;
+
+	priv = dev_get_priv(dev);
+
+	regmap = syscon_regmap_lookup_by_phandle(dev, "st,syscfg-holdboot");
+	if (IS_ERR(regmap)) {
+		dev_err(dev, "unable to find holdboot regmap (%ld)\n",
+			PTR_ERR(regmap));
+		return PTR_ERR(regmap);
+	}
+
+	cell = dev_read_prop(dev, "st,syscfg-holdboot", &len);
+	if (len < 3 * sizeof(fdt32_t)) {
+		dev_err(dev, "holdboot offset and mask not available\n");
+		return -EINVAL;
+	}
+
+	priv->hold_boot_regmap = regmap;
+	priv->hold_boot_offset = fdtdec_get_number(cell + 1, 1);
+	priv->hold_boot_mask = fdtdec_get_number(cell + 2, 1);
+
+	ret = reset_get_by_index(dev, 0, &priv->reset_ctl);
+	if (ret) {
+		dev_err(dev, "failed to get reset (%d)\n", ret);
+		return ret;
+	}
+
+	dev_dbg(dev, "probed\n");
+
+	return 0;
+}
+
+/**
+ * stm32_copro_set_hold_boot() - Hold boot bit management
+ * @dev:	corresponding STM32 remote processor device
+ * @hold:	hold boot value
+ *
+ * Return: 0 if all went ok, else corresponding -ve error
+ */
+static int stm32_copro_set_hold_boot(struct udevice *dev, bool hold)
+{
+	struct stm32_copro_privdata *priv;
+	uint val;
+	int ret;
+
+	priv = dev_get_priv(dev);
+
+	val = hold ? RCC_GCR_HOLD_BOOT : RCC_GCR_RELEASE_BOOT;
+
+	/*
+	 * Note: shall run an SMC call (STM32_SMC_RCC) if platform is secured.
+	 * To be updated when the code for this SMC service is available which
+	 * is not the case for the time being.
+	 */
+	ret = regmap_update_bits(priv->hold_boot_regmap, priv->hold_boot_offset,
+				 priv->hold_boot_mask, val);
+	if (ret)
+		dev_err(dev, "failed to set hold boot\n");
+
+	return ret;
+}
+
+/**
+ * stm32_copro_da_to_pa() - Convert DeviceAddress to PhysicalAddress
+ * @dev:	corresponding STM32 remote processor device
+ * @da:		device address
+ *
+ * Return: 0 if all went ok, else corresponding -ve error
+ */
+static ulong stm32_copro_da_to_pa(struct udevice *dev, ulong da)
+{
+	fdt32_t in_addr = cpu_to_be32(da);
+
+	return dev_translate_dma_address(dev, &in_addr);
+}
+
+/**
+ * stm32_copro_load() - Loadup the STM32 remote processor
+ * @dev:	corresponding STM32 remote processor device
+ * @addr:	Address in memory where image is stored
+ * @size:	Size in bytes of the image
+ *
+ * Return: 0 if all went ok, else corresponding -ve error
+ */
+static int stm32_copro_load(struct udevice *dev, ulong addr, ulong size)
+{
+	struct stm32_copro_privdata *priv;
+	int ret;
+
+	priv = dev_get_priv(dev);
+
+	ret = stm32_copro_set_hold_boot(dev, true);
+	if (ret)
+		return ret;
+
+	ret = reset_assert(&priv->reset_ctl);
+	if (ret) {
+		dev_err(dev, "Unable to assert reset line (ret=%d)\n", ret);
+		return ret;
+	}
+
+	/* Support only ELF image */
+	if (!rproc_elf_is_valid(addr, size))
+		return -EINVAL;
+
+	if (!rproc_elf_sanity_check(addr, size))
+		return -EINVAL;
+
+	return rproc_elf_load_image(dev, addr);
+}
+
+/**
+ * stm32_copro_start() - Start the STM32 remote processor
+ * @dev:	corresponding STM32 remote processor device
+ *
+ * Return: 0 if all went ok, else corresponding -ve error
+ */
+static int stm32_copro_start(struct udevice *dev)
+{
+	struct stm32_copro_privdata *priv;
+	int ret;
+
+	priv = dev_get_priv(dev);
+
+	/* move hold boot from true to false start the copro */
+	ret = stm32_copro_set_hold_boot(dev, false);
+	if (ret)
+		return ret;
+
+	/*
+	 * Once copro running, reset hold boot flag to avoid copro
+	 * rebooting autonomously
+	 */
+	ret = stm32_copro_set_hold_boot(dev, true);
+	priv->is_running = !ret;
+	return ret;
+}
+
+/**
+ * stm32_copro_reset() - Reset the STM32 remote processor
+ * @dev:	corresponding STM32 remote processor device
+ *
+ * Return: 0 if all went ok, else corresponding -ve error
+ */
+static int stm32_copro_reset(struct udevice *dev)
+{
+	struct stm32_copro_privdata *priv;
+	int ret;
+
+	priv = dev_get_priv(dev);
+
+	ret = stm32_copro_set_hold_boot(dev, true);
+	if (ret)
+		return ret;
+
+	ret = reset_assert(&priv->reset_ctl);
+	if (ret) {
+		dev_err(dev, "Unable to assert reset line (ret=%d)\n", ret);
+		return ret;
+	}
+
+	priv->is_running = false;
+
+	return 0;
+}
+
+/**
+ * stm32_copro_stop() - Stop the STM32 remote processor
+ * @dev:	corresponding STM32 remote processor device
+ *
+ * Return: 0 if all went ok, else corresponding -ve error
+ */
+static int stm32_copro_stop(struct udevice *dev)
+{
+	return stm32_copro_reset(dev);
+}
+
+/**
+ * stm32_copro_is_running() - Is the STM32 remote processor running
+ * @dev:	corresponding STM32 remote processor device
+ *
+ * Return: 1 if the remote processor is running, 0 otherwise
+ */
+static int stm32_copro_is_running(struct udevice *dev)
+{
+	struct stm32_copro_privdata *priv;
+
+	priv = dev_get_priv(dev);
+	return priv->is_running;
+}
+
+static const struct dm_rproc_ops stm32_copro_ops = {
+	.load = stm32_copro_load,
+	.start = stm32_copro_start,
+	.stop =  stm32_copro_stop,
+	.reset = stm32_copro_reset,
+	.is_running = stm32_copro_is_running,
+	.da_to_pa = stm32_copro_da_to_pa,
+};
+
+static const struct udevice_id stm32_copro_ids[] = {
+	{.compatible = "st,stm32mp1-rproc"},
+	{}
+};
+
+U_BOOT_DRIVER(stm32_copro) = {
+	.name = "stm32_m4_proc",
+	.of_match = stm32_copro_ids,
+	.id = UCLASS_REMOTEPROC,
+	.ops = &stm32_copro_ops,
+	.probe = stm32_copro_probe,
+	.priv_auto_alloc_size = sizeof(struct stm32_copro_privdata),
+};
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
