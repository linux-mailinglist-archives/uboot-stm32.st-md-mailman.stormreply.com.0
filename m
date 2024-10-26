Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2149B1AB7
	for <lists+uboot-stm32@lfdr.de>; Sat, 26 Oct 2024 22:18:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB881C7803D;
	Sat, 26 Oct 2024 20:18:39 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3622C7803D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Oct 2024 20:18:38 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4XbWFB4CLMz9sp9;
 Sat, 26 Oct 2024 22:18:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729973918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zwf2pykDhtfOtwKhWgFo9DuxzuccW0MTRwhofwAR37w=;
 b=Ydd0FQNVk4VP34OgHbpDD0peRo1hkEBMpjFdME1h/zkYopYjbDWX5LtnVDjGUT+rov7iXf
 0brh9ri5re79M/zh1HIZADwVnRIDgKUvyHfP/4ibcfLThKnKLz6kIbGybksDOOcRu6j/Nq
 wtxQ7jwaYzSQ7Xd7jSzWILxZuCKagCymwfoeVWAnm7wlU7uJCfWW8WwsAv570h8iHKyW7+
 RoNdV2K33wJR16jQvj8Hn9kc87hVvlaKzuJCya6ZYcBBEQbY4Wz36KMcxtw8/X+NrVcoSO
 T5D4qj/mnsN3eufWOvRT9x/6q8CQbxt9NiDOk8adbE1TUwGLKtDVqN8hbE8rbA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729973916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zwf2pykDhtfOtwKhWgFo9DuxzuccW0MTRwhofwAR37w=;
 b=c0yxP/VIuoClZynnvASD/nIncCYZtWAIRX19a0I/6ssAeNqsZac+BXP5lgS/o59msfqjmv
 iCkg14rC/FldA2bqWGQX8cO3mduSDxlbed4JeP73hTGN0uOjoyJG+UemUnrCCVAgbLBqcp
 gzZZ0EI+obm+FbYSKAhOWvzyLQENAVWOHGP6qJePlTh9yP94HJX9WS7LhIn9dV8NWdRpAo
 6SK5mE84TuHrjZomeRCvcaEuxszrLO+J6iwhVGPiiYoUcJYLEVCLQMiusNbp3afoGO86Cq
 CpSZr4RJECx2biRfGrF8WxdEKZF65n9kFdAgmhV9Vtf018MNWvnfLYFMnT9Pzg==
To: u-boot@lists.denx.de
Date: Sat, 26 Oct 2024 22:16:25 +0200
Message-ID: <20241026201741.171073-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
References: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: eeu7ya3y4t6a3arbtzouekkerqu65mwh
X-MBO-RS-ID: 791edde0a828d7b17f7
X-Rspamd-Queue-Id: 4XbWFB4CLMz9sp9
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Michael Walle <mwalle@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Ashok Reddy Soma <ashok.reddy.soma@amd.com>, Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [Uboot-stm32] [PATCH 8/9] mtd: spi-nor: Rename SPI_ADVANCE to
	SPI_STACKED_PARALLEL
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

The SPI_ADVANCE description does not explain what the switch does.
It does not have anything to do with any advanced functionality, it
only gates off support for stacked and parallel SPI NORs. Rename the
Kconfig symbol, update description, and move it right next to Xilinx
hardware as it seems to be specific to this hardware. Make sure the
symbol is also protected by if DM_SPI in Kconfig.

Fixes: 5d40b3d384dc ("mtd: spi-nor: Add parallel and stacked memories support")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Ashok Reddy Soma <ashok.reddy.soma@amd.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Pratyush Yadav <p.yadav@ti.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Sean Anderson <seanga2@gmail.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 drivers/mtd/spi/spi-nor-core.c |  4 ++--
 drivers/spi/Kconfig            | 12 ++++++------
 include/linux/mtd/spi-nor.h    |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi/spi-nor-core.c b/drivers/mtd/spi/spi-nor-core.c
index c1ee466bcc0..74aec6b60c4 100644
--- a/drivers/mtd/spi/spi-nor-core.c
+++ b/drivers/mtd/spi/spi-nor-core.c
@@ -3047,7 +3047,7 @@ static int spi_nor_init_params(struct spi_nor *nor,
 			       const struct flash_info *info,
 			       struct spi_nor_flash_parameter *params)
 {
-#if CONFIG_IS_ENABLED(DM_SPI) && CONFIG_IS_ENABLED(SPI_ADVANCE)
+#if CONFIG_IS_ENABLED(DM_SPI) && CONFIG_IS_ENABLED(SPI_STACKED_PARALLEL)
 	struct udevice *dev = nor->spi->dev;
 	u64 flash_size[SNOR_FLASH_CNT_MAX] = {0};
 	u32 idx = 0, i = 0;
@@ -3172,7 +3172,7 @@ static int spi_nor_init_params(struct spi_nor *nor,
 
 		spi_nor_post_sfdp_fixups(nor, params);
 	}
-#if CONFIG_IS_ENABLED(DM_SPI) && CONFIG_IS_ENABLED(SPI_ADVANCE)
+#if CONFIG_IS_ENABLED(DM_SPI) && CONFIG_IS_ENABLED(SPI_STACKED_PARALLEL)
 	/*
 	 * The flashes that are connected in stacked mode should be of same make.
 	 * Except the flash size all other properties are identical for all the
diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index fa817ec4883..fd5cb3694f6 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -20,12 +20,6 @@ menuconfig SPI
 
 if SPI
 
-config SPI_ADVANCE
-	bool "Enable the advance feature"
-	help
-	 Enable the SPI advance feature support. By default this is disabled.
-	 If you intend to use the advance feature support you should enable.
-
 config DM_SPI
 	bool "Enable Driver Model for SPI drivers"
 	depends on DM
@@ -615,6 +609,12 @@ config ZYNQMP_GQSPI
 	  This option is used to enable ZynqMP QSPI controller driver which
 	  is used to communicate with qspi flash devices.
 
+config SPI_STACKED_PARALLEL
+	bool "Enable support for stacked or parallel memories"
+	help
+	 Enable support for stacked/or parallel memories. This functionality
+	 may appear on Xilinx hardware. By default this is disabled.
+
 endif # if DM_SPI
 
 config FSL_ESPI
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 655a6d197ea..b8b207f7b5c 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -308,7 +308,7 @@ enum spi_nor_option_flags {
 	SNOR_F_BROKEN_RESET	= BIT(6),
 	SNOR_F_SOFT_RESET	= BIT(7),
 	SNOR_F_IO_MODE_EN_VOLATILE = BIT(8),
-#if defined(CONFIG_SPI_ADVANCE)
+#if defined(CONFIG_SPI_STACKED_PARALLEL)
 	SNOR_F_HAS_STACKED	= BIT(9),
 	SNOR_F_HAS_PARALLEL	= BIT(10),
 #else
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
