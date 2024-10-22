Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D639AE51E
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Oct 2024 14:40:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07F16C78F65;
	Thu, 24 Oct 2024 12:40:31 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D57F5C6DD9F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 21:07:01 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4XY4Vr61CNz9sWN;
 Tue, 22 Oct 2024 23:07:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729631220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eqsoK/ur/TFIkTEpWyMTVL7qO3cOPC7WFXAmOzzn2Gs=;
 b=ByeFQFsQZOO/TpxsUBH01R9Y8uqJfPR7bOWb5Xfz6X9iYGUCZz9rXb5c7P944zg3KaYq8p
 keWmNYD0P2tKrS05tI9kNtwLaIYC9AHXfCpQx2JBaxeDEoFmxOUyVUa8Bpwaq4aeT0aObo
 cwU1VWo6P7IS8VdPn0PT16CAYLFHWHQqpoQeXsq7H75r/qFYtMrua3FSLsYGAIvsveFmMV
 VtL5GCt+oeX5XrhghTYj9tW6UROkhurJmLgfg4n26qjjqeReEMK/8bEVfgM7ynWm6G9YJl
 t4G3sd3OJYqBmENKQqzQyNfDifv7MEbYdB+AVJUWrv8/5kYx9OWyulyd/NgPwQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729631218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eqsoK/ur/TFIkTEpWyMTVL7qO3cOPC7WFXAmOzzn2Gs=;
 b=W9RbED1al9uqSflOFr79h3eLhRSzVduz0e1sVJTL2Gpn8GDd3kwx8tqPGYW/fa2QPLgwnf
 pQ4FiHCZUKiGuF+KXrIo2masOoiGEVCORYQptIInEZpZV/Bql7+/xgXUffo9fxPUuHAcfS
 XueNx3aUZ6dXWQF3sK/2+fthcDSgCX7wqny/QxnAjvcezUQSSKca0Qp7maofOS04LTica4
 B7qsrKY0MJkI9/VzbFfkKkOsjfTzrC8s2OV8O5G2iQDcSFg0aTqiPzodB53vplXDtWeqB7
 JA85HFtv5HuBbpulpGspeO6Vg6g3uQnefKmEGlhvSmmAiCiUDRZktnrankMNDg==
To: u-boot@lists.denx.de
Date: Tue, 22 Oct 2024 23:06:17 +0200
Message-ID: <20241022210633.271534-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
References: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: ekm38recsie8udtuax6nxewbe1nzrax9
X-MBO-RS-ID: 9aeda6d35f3270971c6
X-Mailman-Approved-At: Thu, 24 Oct 2024 12:40:30 +0000
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
Subject: [Uboot-stm32] [PATCH 2/6] Revert "spi: zynqmp_gqspi: Add parallel
	memories support in GQSPI driver"
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

This reverts commit 217b0a28b6db3d664300f82df8e4cf342de3b8a0.

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
 drivers/spi/zynqmp_gqspi.c | 141 +++++--------------------------------
 include/spi.h              |   4 --
 2 files changed, 16 insertions(+), 129 deletions(-)

diff --git a/drivers/spi/zynqmp_gqspi.c b/drivers/spi/zynqmp_gqspi.c
index 1d19b2606c5..ae795e50b0a 100644
--- a/drivers/spi/zynqmp_gqspi.c
+++ b/drivers/spi/zynqmp_gqspi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * (C) Copyright 2013 - 2022, Xilinx, Inc.
- * (C) Copyright 2023, Advanced Micro Devices, Inc.
+ * (C) Copyright 2018 Xilinx
+ *
  * Xilinx ZynqMP Generic Quad-SPI(QSPI) controller driver(master mode only)
  */
 
@@ -24,8 +24,6 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/sizes.h>
-#include <linux/mtd/spi-nor.h>
-#include "../mtd/spi/sf_internal.h"
 #include <zynqmp_firmware.h>
 
 #define GQSPI_GFIFO_STRT_MODE_MASK	BIT(29)
@@ -89,9 +87,6 @@
 #define SPI_XFER_ON_LOWER		1
 #define SPI_XFER_ON_UPPER		2
 
-#define GQSPI_SELECT_LOWER_CS          BIT(0)
-#define GQSPI_SELECT_UPPER_CS          BIT(1)
-
 #define GQSPI_DMA_ALIGN			0x4
 #define GQSPI_MAX_BAUD_RATE_VAL		7
 #define GQSPI_DFLT_BAUD_RATE_VAL	2
@@ -188,14 +183,13 @@ struct zynqmp_qspi_priv {
 	int bytes_to_transfer;
 	int bytes_to_receive;
 	const struct spi_mem_op *op;
-	unsigned int is_parallel;
-	unsigned int u_page;
-	unsigned int bus;
-	unsigned int stripe;
-	unsigned int flags;
-	u32 max_hz;
 };
 
+__weak int zynqmp_mmio_write(const u32 address, const u32 mask, const u32 value)
+{
+	return 0;
+}
+
 static int zynqmp_qspi_of_to_plat(struct udevice *bus)
 {
 	struct zynqmp_qspi_plat *plat = dev_get_plat(bus);
@@ -240,30 +234,8 @@ static u32 zynqmp_qspi_bus_select(struct zynqmp_qspi_priv *priv)
 {
 	u32 gqspi_fifo_reg = 0;
 
-	if (priv->is_parallel) {
-		if (priv->bus == SPI_XFER_ON_BOTH)
-			gqspi_fifo_reg = GQSPI_GFIFO_LOW_BUS |
-					 GQSPI_GFIFO_UP_BUS |
-					 GQSPI_GFIFO_CS_UPPER |
-					 GQSPI_GFIFO_CS_LOWER;
-		else if (priv->bus == SPI_XFER_ON_LOWER)
-			gqspi_fifo_reg = GQSPI_GFIFO_LOW_BUS |
-					 GQSPI_GFIFO_CS_UPPER |
-					 GQSPI_GFIFO_CS_LOWER;
-		else if (priv->bus == SPI_XFER_ON_UPPER)
-			gqspi_fifo_reg = GQSPI_GFIFO_UP_BUS |
-					 GQSPI_GFIFO_CS_LOWER |
-					 GQSPI_GFIFO_CS_UPPER;
-		else
-			debug("Wrong Bus selection:0x%x\n", priv->bus);
-	} else {
-		if (priv->u_page)
-			gqspi_fifo_reg = GQSPI_GFIFO_LOW_BUS |
-					 GQSPI_GFIFO_CS_UPPER;
-		else
-			gqspi_fifo_reg = GQSPI_GFIFO_LOW_BUS |
-					 GQSPI_GFIFO_CS_LOWER;
-	}
+	gqspi_fifo_reg = GQSPI_GFIFO_LOW_BUS |
+			 GQSPI_GFIFO_CS_LOWER;
 
 	return gqspi_fifo_reg;
 }
@@ -323,15 +295,8 @@ static void zynqmp_qspi_chipselect(struct zynqmp_qspi_priv *priv, int is_on)
 		gqspi_fifo_reg |= GQSPI_SPI_MODE_SPI |
 				  GQSPI_IMD_DATA_CS_ASSERT;
 	} else {
-		if (priv->is_parallel) {
-			gqspi_fifo_reg = GQSPI_GFIFO_UP_BUS |
-					 GQSPI_GFIFO_LOW_BUS;
-		} else if (priv->u_page) {
-			gqspi_fifo_reg = GQSPI_GFIFO_UP_BUS;
-		} else {
-			gqspi_fifo_reg = GQSPI_GFIFO_LOW_BUS;
-			gqspi_fifo_reg |= GQSPI_IMD_DATA_CS_DEASSERT;
-		}
+		gqspi_fifo_reg = GQSPI_GFIFO_LOW_BUS;
+		gqspi_fifo_reg |= GQSPI_IMD_DATA_CS_DEASSERT;
 	}
 
 	zynqmp_qspi_fill_gen_fifo(priv, gqspi_fifo_reg);
@@ -402,13 +367,12 @@ static int zynqmp_qspi_set_speed(struct udevice *bus, uint speed)
 
 	log_debug("%s, Speed: %d, Max: %d\n", __func__, speed, plat->frequency);
 
-	/*
-	 * If speed == 0 or speed > max freq, then set speed to highest
-	 */
-	if (!speed || speed > priv->max_hz)
-		speed = priv->max_hz;
+	if (speed > plat->frequency)
+		speed = plat->frequency;
 
 	if (plat->speed_hz != speed) {
+		/* Set the clock frequency */
+		/* If speed == 0, default to lowest speed */
 		while ((baud_rate_val < 8) &&
 		       ((plat->frequency /
 		       (2 << baud_rate_val)) > speed))
@@ -430,18 +394,6 @@ static int zynqmp_qspi_set_speed(struct udevice *bus, uint speed)
 	return 0;
 }
 
-static int zynqmp_qspi_child_pre_probe(struct udevice *bus)
-{
-	struct spi_slave *slave = dev_get_parent_priv(bus);
-	struct zynqmp_qspi_priv *priv = dev_get_priv(bus->parent);
-
-	slave->multi_cs_cap = true;
-	slave->bytemode = SPI_4BYTE_MODE;
-	priv->max_hz = slave->max_hz;
-
-	return 0;
-}
-
 static int zynqmp_qspi_probe(struct udevice *bus)
 {
 	struct zynqmp_qspi_plat *plat = dev_get_plat(bus);
@@ -506,17 +458,12 @@ static int zynqmp_qspi_set_mode(struct udevice *bus, uint mode)
 
 static int zynqmp_qspi_fill_tx_fifo(struct zynqmp_qspi_priv *priv, u32 size)
 {
-	u32 data, ier;
+	u32 data;
 	int ret = 0;
 	struct zynqmp_qspi_regs *regs = priv->regs;
 	u32 *buf = (u32 *)priv->tx_buf;
 	u32 len = size;
 
-	/* Enable interrupts */
-	ier = readl(&regs->ier);
-	ier |= GQSPI_IXR_ALL_MASK | GQSPI_IXR_TXFIFOEMPTY_MASK;
-	writel(ier, &regs->ier);
-
 	while (size) {
 		ret = wait_for_bit_le32(&regs->isr, GQSPI_IXR_TXNFULL_MASK, 1,
 					GQSPI_TIMEOUT, 1);
@@ -639,9 +586,6 @@ static int zynqmp_qspi_genfifo_fill_tx(struct zynqmp_qspi_priv *priv)
 	gen_fifo_cmd |= zynqmp_qspi_genfifo_mode(priv->op->data.buswidth);
 	gen_fifo_cmd |= GQSPI_GFIFO_TX | GQSPI_GFIFO_DATA_XFR_MASK;
 
-	if (priv->stripe)
-		gen_fifo_cmd |= GQSPI_GFIFO_STRIPE_MASK;
-
 	while (priv->len) {
 		len = zynqmp_qspi_calc_exp(priv, &gen_fifo_cmd);
 		zynqmp_qspi_fill_gen_fifo(priv, gen_fifo_cmd);
@@ -776,9 +720,6 @@ static int zynqmp_qspi_genfifo_fill_rx(struct zynqmp_qspi_priv *priv)
 	gen_fifo_cmd |= zynqmp_qspi_genfifo_mode(priv->op->data.buswidth);
 	gen_fifo_cmd |= GQSPI_GFIFO_RX | GQSPI_GFIFO_DATA_XFR_MASK;
 
-	if (priv->stripe)
-		gen_fifo_cmd |= GQSPI_GFIFO_STRIPE_MASK;
-
 	/*
 	 * Check if receive buffer is aligned to 4 byte and length
 	 * is multiples of four byte as we are using dma to receive.
@@ -819,33 +760,6 @@ static int zynqmp_qspi_release_bus(struct udevice *dev)
 	return 0;
 }
 
-static bool zynqmp_qspi_update_stripe(const struct spi_mem_op *op)
-{
-	/*
-	 * This is a list of opcodes for which we must not use striped access
-	 * even in dual parallel mode, but instead broadcast the same data to
-	 * both chips. This is primarily erase commands and writing some
-	 * registers.
-	 */
-	switch (op->cmd.opcode) {
-	case SPINOR_OP_BE_4K:
-	case SPINOR_OP_BE_32K:
-	case SPINOR_OP_CHIP_ERASE:
-	case SPINOR_OP_SE:
-	case SPINOR_OP_BE_32K_4B:
-	case SPINOR_OP_SE_4B:
-	case SPINOR_OP_BE_4K_4B:
-	case SPINOR_OP_WRSR:
-	case SPINOR_OP_WREAR:
-	case SPINOR_OP_BRWR:
-		return false;
-	case SPINOR_OP_WRSR2:
-		return op->addr.nbytes != 0;
-	default:
-		return true;
-	}
-}
-
 static int zynqmp_qspi_exec_op(struct spi_slave *slave,
 			       const struct spi_mem_op *op)
 {
@@ -857,25 +771,6 @@ static int zynqmp_qspi_exec_op(struct spi_slave *slave,
 	priv->rx_buf = op->data.buf.in;
 	priv->len = op->data.nbytes;
 
-	if (slave->flags & SPI_XFER_U_PAGE)
-		priv->u_page = 1;
-	else
-		priv->u_page = 0;
-
-	if ((slave->flags & GQSPI_SELECT_LOWER_CS) &&
-	    (slave->flags & GQSPI_SELECT_UPPER_CS))
-		priv->is_parallel = true;
-
-	priv->stripe = 0;
-	priv->bus = 0;
-
-	if (priv->is_parallel) {
-		if (slave->flags & SPI_XFER_MASK)
-			priv->bus = (slave->flags & SPI_XFER_MASK) >> 8;
-		if (zynqmp_qspi_update_stripe(op))
-			priv->stripe = 1;
-	}
-
 	zynqmp_qspi_chipselect(priv, 1);
 
 	/* Send opcode, addr, dummy */
@@ -889,9 +784,6 @@ static int zynqmp_qspi_exec_op(struct spi_slave *slave,
 
 	zynqmp_qspi_chipselect(priv, 0);
 
-	priv->is_parallel = false;
-	slave->flags &= ~SPI_XFER_MASK;
-
 	return ret;
 }
 
@@ -922,5 +814,4 @@ U_BOOT_DRIVER(zynqmp_qspi) = {
 	.plat_auto	= sizeof(struct zynqmp_qspi_plat),
 	.priv_auto	= sizeof(struct zynqmp_qspi_priv),
 	.probe  = zynqmp_qspi_probe,
-	.child_pre_probe = zynqmp_qspi_child_pre_probe,
 };
diff --git a/include/spi.h b/include/spi.h
index 3a92d02f215..b7148864e78 100644
--- a/include/spi.h
+++ b/include/spi.h
@@ -38,9 +38,6 @@
 
 #define SPI_DEFAULT_WORDLEN	8
 
-#define SPI_3BYTE_MODE 0x0
-#define SPI_4BYTE_MODE 0x1
-
 /* SPI transfer flags */
 #define SPI_XFER_STRIPE	(1 << 6)
 #define SPI_XFER_MASK	(3 << 8)
@@ -175,7 +172,6 @@ struct spi_slave {
 	 * at once.
 	 */
 	bool multi_cs_cap;
-	u32 bytemode;
 };
 
 /**
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
