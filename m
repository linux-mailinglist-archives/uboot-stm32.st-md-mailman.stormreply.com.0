Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E72A862C8
	for <lists+uboot-stm32@lfdr.de>; Fri, 11 Apr 2025 18:05:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F8C8C78006;
	Fri, 11 Apr 2025 16:05:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 084BEC640E5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Apr 2025 16:04:59 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BE4WsY020054;
 Fri, 11 Apr 2025 18:04:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=o/HUIwD4vOIUypZcmMHN+z
 PjfzkF42+BQKkvW6XGSI4=; b=SYLDnbmZfusbb2RNkL+JdwQeXKuDUpIYCUn3Nd
 1s73ynfabii5s4XRa4pIxr6hMK3O/Kg82mgqD4XhABFnBgPLzNUSWE9DAajEqlpC
 jtoKywk2KooZvtnY5fktvERy0Ll4/ygj4KPENF99VBcSFPN9+Yb5zbT2kODI4qCJ
 owICsS0H3+AZEcsxP/XFZMTaELBDphKaIqKhoT/9yNQ7wXXDIwZ+wUjzWrcjjJEr
 WDjv03RpEDuzwy+N6bN3MrvptFKExpXjZg4goxgMtOJCj8BzDtoEbc2cpMqeqKwO
 4ACn4TzqeRbFhSRBEzqrf/c7mfeY08oD1sJKMBZDtv2BMzHw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw5gpu4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Apr 2025 18:04:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 394674002D;
 Fri, 11 Apr 2025 18:03:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 29A1B9AC21E;
 Fri, 11 Apr 2025 18:03:39 +0200 (CEST)
Received: from localhost (10.252.25.37) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 18:03:38 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 11 Apr 2025 18:03:25 +0200
Message-ID: <20250411160326.4113545-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.25.37]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_06,2025-04-10_01,2024-11-22_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH] stm32mp: Add nvram driver
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

From: Simeon Marijon <simeon.marijon@foss.st.com>

TAMP backup registers will be exposed as nvmem cells.

Each registers ([0..127] for STM32MP2, [0..31] for STM32MP1) could be
exposed as nvmem cells under the nvram node in device tree

Signed-off-by: Simeon Marijon <simeon.marijon@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/mach-stm32mp/Kconfig  |   9 +
 arch/arm/mach-stm32mp/Makefile |   2 +
 arch/arm/mach-stm32mp/nvram.c  | 664 +++++++++++++++++++++++++++++++++
 3 files changed, 675 insertions(+)
 create mode 100644 arch/arm/mach-stm32mp/nvram.c

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 002da2e3d3b..d7323659811 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -144,6 +144,15 @@ config STM32_ECDSA_VERIFY
 	  ROM API provided on STM32MP.
 	  The ROM API is only available during SPL for now.
 
+config STM32MP_TAMP_NVMEM
+	bool "STM32 TAMP backup registers via NVMEM API"
+	select NVMEM
+	default y
+	help
+	  Say y to enable the uclass driver for TAMP Backup registers using the
+	  NVMEM API. It allows to access to boot mode or others shared information
+	  between software components/execution levels.
+
 config CMD_STM32KEY
 	bool "command stm32key to fuse public key hash"
 	depends on CMDLINE
diff --git a/arch/arm/mach-stm32mp/Makefile b/arch/arm/mach-stm32mp/Makefile
index 103e3410ad9..bc0fe9e2225 100644
--- a/arch/arm/mach-stm32mp/Makefile
+++ b/arch/arm/mach-stm32mp/Makefile
@@ -13,6 +13,8 @@ obj-$(CONFIG_STM32MP13X) += stm32mp1/
 obj-$(CONFIG_STM32MP25X) += stm32mp2/
 
 obj-$(CONFIG_MFD_STM32_TIMERS) += timers.o
+obj-$(CONFIG_STM32MP_TAMP_NVMEM) += nvram.o
+
 obj-$(CONFIG_STM32_ECDSA_VERIFY) += ecdsa_romapi.o
 ifndef CONFIG_XPL_BUILD
 obj-y += cmd_stm32prog/
diff --git a/arch/arm/mach-stm32mp/nvram.c b/arch/arm/mach-stm32mp/nvram.c
new file mode 100644
index 00000000000..3bfc53dd93d
--- /dev/null
+++ b/arch/arm/mach-stm32mp/nvram.c
@@ -0,0 +1,664 @@
+// SPDX-License-Identifier: GPL-2.0-or-lat OR BSD-3-Clause
+/*
+ * Copyright (C) 2025, STMicroelectronics - All Rights Reserved
+ */
+#define LOG_CATEGORY UCLASS_MISC
+
+#include <clk.h>
+#include <dm.h>
+#include <log.h>
+#include <misc.h>
+#include <regmap.h>
+#include <tee.h>
+#include <asm/io.h>
+#include <dm/device.h>
+#include <dm/device_compat.h>
+#include <dm/devres.h>
+
+#define RIF_CID1			0x1
+#define CURRENT_CID			RIF_CID1
+#define NB_ZONES_STM32MP1		3
+#define NB_ZONES_STM32MP2		7
+
+#define _TAMP_SECCFGR			0x20U
+#define _TAMP_BKPRIFR(x)		(0x70U + 0x4U * ((x) - 1))
+#define _TAMP_RXCIDCFGR(x)		(0x80U + 0x4U * ((x)))
+
+#define BKPREG_PROTECTION_ZONE_1	0
+#define BKPREG_PROTECTION_ZONE_2	1
+#define BKPREG_PROTECTION_ZONE_3	2
+
+#define BKPREG_PROTECTION_ZONE_1_RIF1	0
+#define BKPREG_PROTECTION_ZONE_1_RIF2	1
+#define BKPREG_PROTECTION_ZONE_2_RIF1	2
+#define BKPREG_PROTECTION_ZONE_2_RIF2	3
+#define BKPREG_PROTECTION_ZONE_3_RIF1	4
+#define BKPREG_PROTECTION_ZONE_3_RIF0	5
+#define BKPREG_PROTECTION_ZONE_3_RIF2	6
+#define NB_COMPARTMENT_STM32MP2		3
+
+enum stm32_tamp_bkpreg_access {
+	BKP_READ_WRITE,
+	BKP_READ,
+	BKP_NO
+};
+
+struct stm32_tamp_nvram_plat {
+	void __iomem *base;
+	void __iomem *parent_base;
+	fdt_size_t size;
+	fdt_size_t parent_size;
+	unsigned int nb_total_regs;
+};
+
+struct stm32_tamp_nvram_priv {
+	int *idx_bkpreg_zones_end;
+	struct regmap *config_regmap;
+	struct regmap *bkpregs_regmap;
+	enum stm32_tamp_bkpreg_access *bkpreg_access;
+};
+
+struct stm32_tamp_nvram_drvdata {
+	const unsigned int nb_zones;
+	const struct reg_field *reg_fields;
+};
+
+static const struct reg_field stm32mp1_tamp_nvram_zone_cfg_fields[NB_ZONES_STM32MP1 - 1] = {
+	[BKPREG_PROTECTION_ZONE_1] = REG_FIELD(_TAMP_SECCFGR, 0, 7),
+	[BKPREG_PROTECTION_ZONE_2] = REG_FIELD(_TAMP_SECCFGR, 16, 23),
+};
+
+static const struct reg_field stm32mp25_tamp_nvram_zone_cfg_fields[NB_ZONES_STM32MP2 - 1] = {
+	[BKPREG_PROTECTION_ZONE_1_RIF1] = REG_FIELD(_TAMP_BKPRIFR(1), 0,  7),
+	[BKPREG_PROTECTION_ZONE_1_RIF2] = REG_FIELD(_TAMP_SECCFGR,    0,  7),
+	[BKPREG_PROTECTION_ZONE_2_RIF1] = REG_FIELD(_TAMP_BKPRIFR(2), 0,  7),
+	[BKPREG_PROTECTION_ZONE_2_RIF2] = REG_FIELD(_TAMP_SECCFGR,   16, 23),
+	[BKPREG_PROTECTION_ZONE_3_RIF1] = REG_FIELD(_TAMP_BKPRIFR(3), 0,  7),
+	[BKPREG_PROTECTION_ZONE_3_RIF0] = REG_FIELD(_TAMP_BKPRIFR(3), 16, 23),
+};
+
+static const struct reg_field stm32mp25_tamp_nvram_rxcidcfg_cfen_fields[NB_COMPARTMENT_STM32MP2] = {
+	REG_FIELD(_TAMP_RXCIDCFGR(0), 0, 0),
+	REG_FIELD(_TAMP_RXCIDCFGR(1), 0, 0),
+	REG_FIELD(_TAMP_RXCIDCFGR(2), 0, 0),
+};
+
+static const struct reg_field stm32mp25_tamp_nvram_rxcidcfg_fields[NB_COMPARTMENT_STM32MP2] = {
+	REG_FIELD(_TAMP_RXCIDCFGR(0), 4, 6),
+	REG_FIELD(_TAMP_RXCIDCFGR(1), 4, 6),
+	REG_FIELD(_TAMP_RXCIDCFGR(2), 4, 6),
+};
+
+static enum stm32_tamp_bkpreg_access stm32mp1_tamp_bkpreg_access[NB_ZONES_STM32MP1] = {
+	[BKPREG_PROTECTION_ZONE_1] = BKP_NO,
+	[BKPREG_PROTECTION_ZONE_2] = BKP_READ,
+	[BKPREG_PROTECTION_ZONE_3] = BKP_READ_WRITE,
+};
+
+static const struct stm32_tamp_nvram_drvdata stm32mp1_tamp_nvram = {
+	.nb_zones = NB_ZONES_STM32MP1,
+	.reg_fields = stm32mp1_tamp_nvram_zone_cfg_fields,
+};
+
+static const struct stm32_tamp_nvram_drvdata stm32mp25_tamp_nvram = {
+	.nb_zones = NB_ZONES_STM32MP2,
+	.reg_fields = stm32mp25_tamp_nvram_zone_cfg_fields,
+};
+
+static int stm32_tamp_is_compartment_isolation_enabled_mp2X(struct udevice *dev)
+{
+	struct stm32_tamp_nvram_priv *priv = dev_get_priv(dev);
+	int nb_compartment_enabled = 0;
+	u32 cfen;
+	struct regmap_field *cfen_field;
+
+	for (int i = 0; i < NB_COMPARTMENT_STM32MP2; i++) {
+		cfen_field = devm_regmap_field_alloc(dev,
+						     priv->config_regmap,
+						     stm32mp25_tamp_nvram_rxcidcfg_cfen_fields[i]);
+		if (IS_ERR_OR_NULL(cfen_field)) {
+			dev_err(dev, "Can't allocate field for reading configuration\n");
+			return -ENOMEM;
+		}
+		if (regmap_field_read(cfen_field, &cfen) != 0) {
+			dev_err(dev, "Can't read field for registers zones\n");
+			devm_regmap_field_free(dev, cfen_field);
+			return -EINVAL;
+		}
+		nb_compartment_enabled += cfen;
+		devm_regmap_field_free(dev, cfen_field);
+	}
+
+	if (nb_compartment_enabled == 0)
+		return 0;
+	else if (nb_compartment_enabled == NB_COMPARTMENT_STM32MP2)
+		return 1;
+	else
+		return -EINVAL;
+}
+
+static bool *stm32_tamp_get_compartment_owner_mp2X(struct udevice *dev)
+{
+	struct stm32_tamp_nvram_priv *priv = dev_get_priv(dev);
+	struct regmap_field *cid_field;
+	u32 cid_per_zone;
+	int isolation_enabled;
+	bool *compartment_owner;
+
+	isolation_enabled = stm32_tamp_is_compartment_isolation_enabled_mp2X(dev);
+	if (isolation_enabled < 0)
+		return NULL;
+
+	compartment_owner = devm_kcalloc(dev,
+					 NB_COMPARTMENT_STM32MP2,
+					 sizeof(*compartment_owner),
+					 GFP_KERNEL);
+	if (!compartment_owner)
+		return ERR_PTR(-ENOMEM);
+
+	for (int i = 0; i < NB_COMPARTMENT_STM32MP2; i++) {
+		if (isolation_enabled) {
+			cid_field = devm_regmap_field_alloc(dev,
+							    priv->config_regmap,
+							    stm32mp25_tamp_nvram_rxcidcfg_fields[i]
+							    );
+
+			if (regmap_field_read(cid_field, &cid_per_zone) != 0) {
+				dev_err(dev, "Can't read field for registers zones\n");
+				devm_regmap_field_free(dev, cid_field);
+				devm_kfree(dev, compartment_owner);
+				return ERR_PTR(-EINVAL);
+			}
+			if (cid_per_zone == CURRENT_CID)
+				compartment_owner[i] = true;
+			else
+				compartment_owner[i] = false;
+
+			devm_regmap_field_free(dev, cid_field);
+		} else {
+			compartment_owner[i] = true;
+		}
+	}
+
+	return compartment_owner;
+}
+
+static enum stm32_tamp_bkpreg_access *stm32_tamp_get_access_rights_mp2X(struct udevice *dev)
+{
+	struct stm32_tamp_nvram_drvdata *drvdata =
+		(struct stm32_tamp_nvram_drvdata *)dev_get_driver_data(dev);
+	unsigned int nb_zones = drvdata->nb_zones;
+	bool *compartment_owner;
+	enum stm32_tamp_bkpreg_access *bkpreg_access;
+
+	compartment_owner = stm32_tamp_get_compartment_owner_mp2X(dev);
+	if (IS_ERR(compartment_owner))
+		return ERR_PTR(-ENODEV);
+
+	bkpreg_access = devm_kcalloc(dev,
+				     NB_ZONES_STM32MP2,
+				     sizeof(*bkpreg_access),
+				     GFP_KERNEL);
+
+	for (int protection_zone_idx = 0; protection_zone_idx < nb_zones;
+	     protection_zone_idx++) {
+		switch (protection_zone_idx) {
+		case BKPREG_PROTECTION_ZONE_1_RIF1:
+			bkpreg_access[protection_zone_idx] = BKP_NO;
+			break;
+		case BKPREG_PROTECTION_ZONE_1_RIF2:
+			bkpreg_access[protection_zone_idx] = BKP_NO;
+			break;
+		case BKPREG_PROTECTION_ZONE_2_RIF1:
+			if (compartment_owner[1] || compartment_owner[2])
+				bkpreg_access[protection_zone_idx] = BKP_READ;
+			else
+				bkpreg_access[protection_zone_idx] = BKP_NO;
+			break;
+		case BKPREG_PROTECTION_ZONE_2_RIF2:
+			if (compartment_owner[1] || compartment_owner[2])
+				bkpreg_access[protection_zone_idx] = BKP_READ;
+			else
+				bkpreg_access[protection_zone_idx] = BKP_NO;
+			break;
+		case BKPREG_PROTECTION_ZONE_3_RIF1:
+			if (compartment_owner[1])
+				bkpreg_access[protection_zone_idx] = BKP_READ_WRITE;
+			else if (compartment_owner[0] || compartment_owner[2])
+				bkpreg_access[protection_zone_idx] = BKP_READ;
+			else
+				bkpreg_access[protection_zone_idx] = BKP_NO;
+			break;
+		case BKPREG_PROTECTION_ZONE_3_RIF0:
+			if (compartment_owner[0])
+				bkpreg_access[protection_zone_idx] = BKP_READ_WRITE;
+			else if (compartment_owner[1] || compartment_owner[2])
+				bkpreg_access[protection_zone_idx] = BKP_READ;
+			else
+				bkpreg_access[protection_zone_idx] = BKP_NO;
+			break;
+		case BKPREG_PROTECTION_ZONE_3_RIF2:
+			if (compartment_owner[2])
+				bkpreg_access[protection_zone_idx] = BKP_READ_WRITE;
+			else if (compartment_owner[0] || compartment_owner[1])
+				bkpreg_access[protection_zone_idx] = BKP_READ;
+			else
+				bkpreg_access[protection_zone_idx] = BKP_NO;
+			break;
+		default:
+			devm_kfree(dev, bkpreg_access);
+			return ERR_PTR(-ENODEV);
+		}
+	}
+
+	return bkpreg_access;
+}
+
+static int stm32_tamp_nvram_bkpreg_get_zone_idx(struct udevice *dev, int reg)
+{
+	struct stm32_tamp_nvram_priv *priv = dev_get_priv(dev);
+	struct stm32_tamp_nvram_drvdata *drvdata =
+		(struct stm32_tamp_nvram_drvdata *)dev_get_driver_data(dev);
+	int *idx_bkpreg_zones_end = priv->idx_bkpreg_zones_end;
+	int nb_zones = drvdata->nb_zones;
+	int protection_zone_idx;
+
+	if (reg < 0)
+		return -1; // negative reg is the boundary of an empty zone
+
+	for (protection_zone_idx = 0; protection_zone_idx < nb_zones; protection_zone_idx++) {
+		if (reg <= idx_bkpreg_zones_end[protection_zone_idx])
+			break;
+	}
+
+	if (protection_zone_idx >= nb_zones)
+		return -1; // the reg is not a part of any zone
+
+	return protection_zone_idx;
+}
+
+static bool stm32_tamp_nvram_rights(struct udevice *dev, int reg, bool read_only)
+{
+	struct stm32_tamp_nvram_priv *priv = dev_get_priv(dev);
+	int protection_zone_idx = stm32_tamp_nvram_bkpreg_get_zone_idx(dev, reg);
+
+	if (protection_zone_idx < 0)
+		return false;
+
+	switch (priv->bkpreg_access[protection_zone_idx]) {
+	case BKP_READ_WRITE:
+		return true;
+	case BKP_READ:
+		return read_only;
+	case BKP_NO:
+		return false;
+	default:
+		dev_err(dev, "Can't get access rights for the zone\n");
+		return false;
+	}
+
+	return false;
+}
+
+static int stm32_tamp_nvram_write_byte(struct udevice *dev, u32 offset, u8 byte)
+{
+	struct stm32_tamp_nvram_priv *priv = dev_get_priv(dev);
+	int offset_aligned = ALIGN_DOWN(offset, sizeof(u32));
+	int byte_in_word = offset - offset_aligned;
+	u32 read_value, to_be_writen_value;
+	u32 reg_idx = offset_aligned / sizeof(u32);
+
+	if (!stm32_tamp_nvram_rights(dev, reg_idx, false))
+		return -EIO;
+
+	regmap_read(priv->bkpregs_regmap, offset_aligned, &read_value);
+	to_be_writen_value = read_value & ~(0xFFUL << byte_in_word * 8);
+	to_be_writen_value |=  (u32)byte << (byte_in_word * 8);
+
+	return regmap_write(priv->bkpregs_regmap, offset_aligned, to_be_writen_value);
+}
+
+static int stm32_tamp_nvram_read_byte(struct udevice *dev, unsigned int offset, u8 *byte)
+{
+	struct stm32_tamp_nvram_priv *priv = dev_get_priv(dev);
+	int offset_aligned = ALIGN_DOWN(offset, sizeof(u32));
+	int byte_in_word = offset - offset_aligned;
+	u32 read_value;
+	u32 reg_idx = offset_aligned / sizeof(u32);
+
+	if (!stm32_tamp_nvram_rights(dev, reg_idx, true))
+		return -EIO;
+
+	regmap_read(priv->bkpregs_regmap, offset_aligned, &read_value);
+	*byte = (read_value >> (byte_in_word * 8)) & 0xFF;
+
+	return 0;
+}
+
+static int stm32_tamp_nvram_read(struct udevice *dev, int offset, void *buf, int size)
+{
+	struct stm32_tamp_nvram_priv *priv = dev_get_priv(dev);
+	u8 byte;
+	u8 *buf_u8 = buf;
+	u32 temp_u32;
+	int i, ret;
+	int total = offset + size;
+	u32 reg_idx;
+
+	i = offset;
+	while (i < total)  {
+		reg_idx = i / sizeof(u32);
+		if (i + sizeof(u32) <= total && IS_ALIGNED(i, sizeof(u32))) {
+			if (!stm32_tamp_nvram_rights(dev, reg_idx, true)) {
+				dev_dbg(dev, "Backup register %u is not allowed to be read\n",
+					reg_idx);
+				temp_u32 = 0;
+			} else {
+				regmap_read(priv->bkpregs_regmap, i, &temp_u32);
+			}
+			memcpy(buf_u8, &temp_u32, sizeof(u32));
+			buf_u8 += sizeof(u32);
+			i += sizeof(u32);
+		} else {
+			ret = stm32_tamp_nvram_read_byte(dev, i, &byte);
+			if (ret != 0) {
+				dev_dbg(dev, "Backup register %u is not allowed to be read\n",
+					reg_idx);
+				byte = 0;
+			}
+			*buf_u8 = byte;
+			i++;
+			buf_u8++;
+		}
+	}
+
+	return size;
+}
+
+static int stm32_tamp_nvram_write(struct udevice *dev, int offset, const void *buf, int size)
+{
+	struct stm32_tamp_nvram_priv *priv = dev_get_priv(dev);
+	u8 *buf_u8 = (u8 *)buf;
+	u32 temp_u32;
+	size_t total = offset + size;
+	int i, ret;
+	u32 reg_idx;
+
+	i = offset;
+	while (i < total)  {
+		reg_idx = i / sizeof(u32);
+		if (i + sizeof(u32) <= total && IS_ALIGNED(i, sizeof(u32))) {
+			if (stm32_tamp_nvram_rights(dev, reg_idx, false)) {
+				memcpy(&temp_u32, buf_u8, sizeof(u32));
+				regmap_write(priv->bkpregs_regmap, i, temp_u32);
+			} else {
+				dev_dbg(dev, "Backup register %u is not allowed to be written",
+					reg_idx);
+			}
+			buf_u8 += sizeof(u32);
+			i += sizeof(u32);
+		} else {
+			ret = stm32_tamp_nvram_write_byte(dev, i, *buf_u8);
+			if (ret != 0)
+				dev_dbg(dev, "Backup register %u is not allowed to be written",
+					reg_idx);
+			i++;
+			buf_u8++;
+		}
+	}
+
+	return size;
+}
+
+static const struct misc_ops stm32_tamp_nvram_ops = {
+	.read = stm32_tamp_nvram_read,
+	.write = stm32_tamp_nvram_write,
+};
+
+static u32 *stm32_tamp_nvram_get_backup_zones(struct udevice *dev)
+{
+	struct stm32_tamp_nvram_plat *plat = dev_get_plat(dev);
+	struct stm32_tamp_nvram_priv *priv = dev_get_priv(dev);
+	const struct stm32_tamp_nvram_drvdata *drvdata =
+		(struct stm32_tamp_nvram_drvdata *)dev_get_driver_data(dev);
+	int nb_zones = drvdata->nb_zones;
+	int zone_idx;
+	int *idx_bkpreg_zones_end;
+	struct regmap *tamp_regmap = priv->config_regmap;
+	u32 offset_field;
+
+	idx_bkpreg_zones_end = devm_kcalloc(dev,
+					    sizeof(*idx_bkpreg_zones_end),
+					    nb_zones,
+					    GFP_KERNEL);
+	if (IS_ERR_OR_NULL(idx_bkpreg_zones_end)) {
+		dev_err(dev, "Can't allocate registers zones\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	//Get the n-1 frontiers of zone within the tamp configuration registers
+	for (zone_idx = 0; zone_idx < nb_zones - 1; zone_idx++) {
+		const struct reg_field reg_field = drvdata->reg_fields[zone_idx];
+		struct regmap_field *field = devm_regmap_field_alloc(dev,
+								     tamp_regmap,
+								     reg_field);
+
+		if (IS_ERR_OR_NULL(field)) {
+			dev_err(dev, "Can't allocate registers zones\n");
+			devm_kfree(dev, idx_bkpreg_zones_end);
+			return ERR_PTR(-ENOMEM);
+		}
+		if (regmap_field_read(field, &offset_field) != 0) {
+			dev_err(dev, "Can't read field for registers zones\n");
+			devm_kfree(dev, idx_bkpreg_zones_end);
+			return ERR_PTR(-EIO);
+		}
+
+		idx_bkpreg_zones_end[zone_idx] = offset_field - 1;
+	}
+
+	//The last zone end is defined by the number of registers in TAMP
+	idx_bkpreg_zones_end[zone_idx] = plat->nb_total_regs - 1;
+
+	return idx_bkpreg_zones_end;
+}
+
+static void stm32_tamp_nvram_print_zones(struct udevice *dev)
+{
+	struct stm32_tamp_nvram_priv *priv = dev_get_priv(dev);
+	int *zones_end = priv->idx_bkpreg_zones_end;
+
+	if (device_is_compatible(dev, "st,stm32mp25-tamp-nvram")) {
+		dev_dbg(dev,
+			"\n"
+			"Zone 1-RIF1 %3d - %3d %c%c\n"
+			"Zone 1-RIF2 %3d - %3d %c%c\n"
+			"Zone 2-RIF1 %3d - %3d %c%c\n"
+			"Zone 2-RIF2 %3d - %3d %c%c\n"
+			"Zone 3-RIF1 %3d - %3d %c%c\n"
+			"Zone 3-RIF0 %3d - %3d %c%c\n"
+			"Zone 3-RIF2 %3d - %3d %c%c\n",
+			0, zones_end[BKPREG_PROTECTION_ZONE_1_RIF1],
+			stm32_tamp_nvram_rights(dev, zones_end[BKPREG_PROTECTION_ZONE_1_RIF1],
+						true) ?
+				'R' :
+				'-',
+			stm32_tamp_nvram_rights(dev, zones_end[BKPREG_PROTECTION_ZONE_1_RIF1],
+						false) ?
+				'W' :
+				'-',
+			zones_end[BKPREG_PROTECTION_ZONE_1_RIF1] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_1_RIF2],
+			stm32_tamp_nvram_rights(dev, zones_end[BKPREG_PROTECTION_ZONE_1_RIF2],
+						true) ?
+				'R' :
+				'-',
+			stm32_tamp_nvram_rights(dev, zones_end[BKPREG_PROTECTION_ZONE_1_RIF2],
+						false) ?
+				'W' :
+				'-',
+			zones_end[BKPREG_PROTECTION_ZONE_1_RIF2] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_2_RIF1],
+			stm32_tamp_nvram_rights(dev, zones_end[BKPREG_PROTECTION_ZONE_2_RIF1],
+						true) ?
+				'R' :
+				'-',
+			stm32_tamp_nvram_rights(dev, zones_end[BKPREG_PROTECTION_ZONE_2_RIF1],
+						false) ?
+				'W' :
+				'-',
+			zones_end[BKPREG_PROTECTION_ZONE_2_RIF1] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_2_RIF2],
+			stm32_tamp_nvram_rights(dev, zones_end[BKPREG_PROTECTION_ZONE_2_RIF2],
+						true) ?
+				'R' :
+				'-',
+			stm32_tamp_nvram_rights(dev, zones_end[BKPREG_PROTECTION_ZONE_2_RIF2],
+						false) ?
+				'W' :
+				'-',
+			zones_end[BKPREG_PROTECTION_ZONE_2_RIF2] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_3_RIF1],
+			stm32_tamp_nvram_rights(dev, zones_end[BKPREG_PROTECTION_ZONE_3_RIF1],
+						true) ?
+				'R' :
+				'-',
+			stm32_tamp_nvram_rights(dev, zones_end[BKPREG_PROTECTION_ZONE_3_RIF1],
+						false) ?
+				'W' :
+				'-',
+			zones_end[BKPREG_PROTECTION_ZONE_3_RIF1] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_3_RIF0],
+			stm32_tamp_nvram_rights(dev, zones_end[BKPREG_PROTECTION_ZONE_3_RIF0],
+						true) ?
+				'R' :
+				'-',
+			stm32_tamp_nvram_rights(dev, zones_end[BKPREG_PROTECTION_ZONE_3_RIF0],
+						false) ?
+				'W' :
+				'-',
+			zones_end[BKPREG_PROTECTION_ZONE_3_RIF0] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_3_RIF2],
+			stm32_tamp_nvram_rights(dev, zones_end[BKPREG_PROTECTION_ZONE_3_RIF2],
+						true) ?
+				'R' :
+				'-',
+			stm32_tamp_nvram_rights(dev, zones_end[BKPREG_PROTECTION_ZONE_3_RIF2],
+						false) ?
+				'W' :
+				'-');
+	} else if (device_is_compatible(dev, "st,stm32mp15-tamp-nvram")) {
+		dev_dbg(dev,
+			"\n"
+			"Zone 1 %3d - %3d %c%c\n"
+			"Zone 2 %3d - %3d %c%c\n"
+			"Zone 3 %3d - %3d %c%c\n",
+			0, zones_end[BKPREG_PROTECTION_ZONE_1],
+			stm32_tamp_nvram_rights(dev, zones_end[BKPREG_PROTECTION_ZONE_1], true) ?
+				'R' :
+				'-',
+			stm32_tamp_nvram_rights(dev, zones_end[BKPREG_PROTECTION_ZONE_1], false) ?
+				'W' :
+				'-',
+			zones_end[BKPREG_PROTECTION_ZONE_1] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_2],
+			stm32_tamp_nvram_rights(dev, zones_end[BKPREG_PROTECTION_ZONE_2], true) ?
+				'R' :
+				'-',
+			stm32_tamp_nvram_rights(dev, zones_end[BKPREG_PROTECTION_ZONE_2], false) ?
+				'W' :
+				'-',
+			zones_end[BKPREG_PROTECTION_ZONE_2] + 1,
+			zones_end[BKPREG_PROTECTION_ZONE_3],
+			stm32_tamp_nvram_rights(dev, zones_end[BKPREG_PROTECTION_ZONE_3], true) ?
+				'R' :
+				'-',
+			stm32_tamp_nvram_rights(dev, zones_end[BKPREG_PROTECTION_ZONE_3], false) ?
+				'W' :
+				'-');
+	}
+}
+
+static int stm32_tamp_nvram_of_to_plat(struct udevice *dev)
+{
+	struct stm32_tamp_nvram_plat *plat = dev_get_plat(dev);
+	fdt_addr_t addr = dev_read_addr_size_index(dev, 0, &plat->size);
+	fdt_addr_t parent_addr = dev_read_addr_size_index(dev->parent, 0, &plat->parent_size);
+
+	if (addr == FDT_ADDR_T_NONE)
+		return -EINVAL;
+	plat->base = (void __iomem *)addr;
+
+	if (parent_addr == FDT_ADDR_T_NONE)
+		return -EINVAL;
+	plat->parent_base = (void __iomem *)parent_addr;
+
+	if (plat->size == FDT_ADDR_T_NONE)
+		return -EOPNOTSUPP;
+
+	plat->nb_total_regs =  plat->size / sizeof(uint32_t);
+
+	return 0;
+}
+
+static int stm32_tamp_nvram_probe(struct udevice *dev)
+{
+	struct stm32_tamp_nvram_plat *plat = dev_get_plat(dev);
+	struct stm32_tamp_nvram_priv *priv = dev_get_priv(dev);
+	struct regmap_config config_regmap;
+	struct regmap_config bckreg_regmap;
+
+	config_regmap.r_start = (ulong)(plat->parent_base);
+	config_regmap.r_size = plat->parent_size;
+	config_regmap.reg_offset_shift = 0;
+	config_regmap.width = REGMAP_SIZE_32;
+	priv->config_regmap = devm_regmap_init(dev, NULL, NULL, &config_regmap);
+
+	bckreg_regmap.r_start = (ulong)(plat->base);
+	bckreg_regmap.r_size = plat->size;
+	bckreg_regmap.reg_offset_shift = 0;
+	bckreg_regmap.width = REGMAP_SIZE_32;
+	priv->bkpregs_regmap = devm_regmap_init(dev, NULL, NULL, &bckreg_regmap);
+
+	priv->idx_bkpreg_zones_end = stm32_tamp_nvram_get_backup_zones(dev);
+	if (IS_ERR_OR_NULL(priv->idx_bkpreg_zones_end)) {
+		dev_err(dev, "Failed to get the backup zone from tamp regs\n\n");
+		return -ENODEV;
+	}
+
+	if (device_is_compatible(dev, "st,stm32mp25-tamp-nvram")) {
+		priv->bkpreg_access = stm32_tamp_get_access_rights_mp2X(dev);
+		if (IS_ERR_OR_NULL(priv->bkpreg_access))
+			return -ENODEV;
+	} else {
+		priv->bkpreg_access = stm32mp1_tamp_bkpreg_access;
+	}
+
+	stm32_tamp_nvram_print_zones(dev);
+
+	return 0;
+}
+
+static int stm32_tamp_nvram_remove(struct udevice *dev)
+{
+	return 0;
+}
+
+static const struct udevice_id stm32_tamp_nvram_ids[] = {
+	{ .compatible = "st,stm32mp15-tamp-nvram", .data = (ulong)&stm32mp1_tamp_nvram },
+	{ .compatible = "st,stm32mp25-tamp-nvram", .data = (ulong)&stm32mp25_tamp_nvram },
+	{},
+};
+
+U_BOOT_DRIVER(stm32_tamp_nvram) = {
+	.name = "stm32_tamp_nvram",
+	.id = UCLASS_MISC,
+	.of_match = stm32_tamp_nvram_ids,
+	.priv_auto = sizeof(struct stm32_tamp_nvram_priv),
+	.plat_auto = sizeof(struct stm32_tamp_nvram_plat),
+	.ops = &stm32_tamp_nvram_ops,
+	.of_to_plat = of_match_ptr(stm32_tamp_nvram_of_to_plat),
+	.probe = stm32_tamp_nvram_probe,
+	.remove = stm32_tamp_nvram_remove,
+};
+
-- 
2.25.1

base-commit: cb7555e93075114fe4af0adb806877ac4d4ef80d
branch: upstream_nvram_driver
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
