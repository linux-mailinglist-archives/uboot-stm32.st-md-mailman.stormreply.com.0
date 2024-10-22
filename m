Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F569AE51D
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Oct 2024 14:40:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01F2DC78F63;
	Thu, 24 Oct 2024 12:40:31 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3D79C6DD6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 21:06:58 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4XY4Vp1wczz9sW9;
 Tue, 22 Oct 2024 23:06:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729631218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=akpvMuqry4WLeDBINb41zGlnCaPOPYWZX6zAhIsKDQQ=;
 b=Ka+bjbs6fkuci8WLeWDWuMjNV1P0n20Z7KdXdAoCniY1NyNj+XKUbsYxy4qibQ66PtFvxD
 h8uRmX7YRIxg0DEHGGoHzdFg5sPLSxK+zugs3xB0F5pQERNd99w3pDus3jrwko2SUDjWHI
 0PHir8FSTwLeXI9Z8pmst4vqnsO60/sc/zl/IRtOoZ+xThfjX2qKyK52ezML49tI1HAaDz
 61FxZgXZhgfbsMeUe5cLZyzafrCBeGop6UyyCIV50VyCEnQBpztxWFMxAiNsDN6pDYt/OT
 UAOyVuz7k3ofWpuYMJorv6M6FRnPy49B5uWcEy3LB3DfZe/dII3c/b+AT+WjTQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729631216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=akpvMuqry4WLeDBINb41zGlnCaPOPYWZX6zAhIsKDQQ=;
 b=WXjV8fVQFw+5OgG0X2EaCl6+UQ+gDNUc7rj6Nh6P2fEYBj+QbHciu+rJ2nw1QYk1imVoqN
 8LfYneL8tiObUkrYcN8/TSmNipLqFDj9xH12SahUYAzVDnBR3ZKYzahGvrIg1bygVriish
 wxPb4RdkY9aWkhx6S+mSa4N12dTe9Ohc7niPSAgOay2Tf0yj2c8XW0H9JvkflzxBsuCaTm
 OFWA4Qe+LcIFeW/sQve89CAagXLr5YaVb0vUKOK24LbUs4Zv18JyDqdBCDyC9iHEY78JJY
 uWXkIc/UFxA68OXqdQw0ROGaGUHi8OuRIXuFFhZQUDm7JJ/xM15DQaiKY99aJw==
To: u-boot@lists.denx.de
Date: Tue, 22 Oct 2024 23:06:16 +0200
Message-ID: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: df97bf3ef6659eb083f
X-MBO-RS-META: 58jg1y6o4w4936ogmu313hc71xpdt34n
X-Rspamd-Queue-Id: 4XY4Vp1wczz9sW9
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
Subject: [Uboot-stm32] [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel
	memories support in QSPI driver"
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

This reverts commit 1e36d34b52e7a1ebe5a2a5339d6905540f4253aa.

This parallel/stacked support breaks basic SPI NOR support,
e.g. this no longer works:

=> sf probe && sf update 0x50000000 0 0x160000
SF: Detected s25fs512s with page size 256 Bytes, erase size 256 KiB, total 64 MiB
device 0 offset 0x0, size 0x160000
SPI flash failed in read step

Since none of this seems to be in Linux either, revert it all.

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
 drivers/spi/zynq_qspi.c | 115 ++++------------------------------------
 1 file changed, 11 insertions(+), 104 deletions(-)

diff --git a/drivers/spi/zynq_qspi.c b/drivers/spi/zynq_qspi.c
index f5b3fb5c125..e8bc196ce9e 100644
--- a/drivers/spi/zynq_qspi.c
+++ b/drivers/spi/zynq_qspi.c
@@ -1,8 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * (C) Copyright 2013 - 2022, Xilinx, Inc.
+ * (C) Copyright 2013 Xilinx, Inc.
  * (C) Copyright 2015 Jagan Teki <jteki@openedev.com>
- * (C) Copyright 2023, Advanced Micro Devices, Inc.
  *
  * Xilinx Zynq Quad-SPI(QSPI) controller driver (master mode only)
  */
@@ -13,12 +12,10 @@
 #include <log.h>
 #include <malloc.h>
 #include <spi.h>
-#include <spi_flash.h>
 #include <asm/global_data.h>
 #include <asm/io.h>
 #include <linux/bitops.h>
 #include <spi-mem.h>
-#include "../mtd/spi/sf_internal.h"
 
 DECLARE_GLOBAL_DATA_PTR;
 
@@ -44,21 +41,6 @@ DECLARE_GLOBAL_DATA_PTR;
 #define ZYNQ_QSPI_TXD_00_01_OFFSET	0x80	/* Transmit 1-byte inst */
 #define ZYNQ_QSPI_TXD_00_10_OFFSET	0x84	/* Transmit 2-byte inst */
 #define ZYNQ_QSPI_TXD_00_11_OFFSET	0x88	/* Transmit 3-byte inst */
-#define ZYNQ_QSPI_FR_QOUT_CODE		0x6B    /* read instruction code */
-
-#define QSPI_SELECT_LOWER_CS            BIT(0)
-#define QSPI_SELECT_UPPER_CS            BIT(1)
-
-/*
- * QSPI Linear Configuration Register
- *
- * It is named Linear Configuration but it controls other modes when not in
- * linear mode also.
- */
-#define ZYNQ_QSPI_LCFG_TWO_MEM_MASK     0x40000000 /* QSPI Enable Bit Mask */
-#define ZYNQ_QSPI_LCFG_SEP_BUS_MASK     0x20000000 /* QSPI Enable Bit Mask */
-#define ZYNQ_QSPI_LCFG_U_PAGE           0x10000000 /* QSPI Upper memory set */
-#define ZYNQ_QSPI_LCFG_DUMMY_SHIFT      8
 
 #define ZYNQ_QSPI_TXFIFO_THRESHOLD	1	/* Tx FIFO threshold level*/
 #define ZYNQ_QSPI_RXFIFO_THRESHOLD	32	/* Rx FIFO threshold level */
@@ -118,11 +100,7 @@ struct zynq_qspi_priv {
 	int bytes_to_transfer;
 	int bytes_to_receive;
 	unsigned int is_inst;
-	unsigned int is_parallel;
-	unsigned int is_stacked;
-	unsigned int u_page;
 	unsigned cs_change:1;
-	unsigned is_strip:1;
 };
 
 static int zynq_qspi_of_to_plat(struct udevice *bus)
@@ -133,6 +111,7 @@ static int zynq_qspi_of_to_plat(struct udevice *bus)
 
 	plat->regs = (struct zynq_qspi_regs *)fdtdec_get_addr(blob,
 							      node, "reg");
+
 	return 0;
 }
 
@@ -167,9 +146,6 @@ static void zynq_qspi_init_hw(struct zynq_qspi_priv *priv)
 	/* Disable Interrupts */
 	writel(ZYNQ_QSPI_IXR_ALL_MASK, &regs->idr);
 
-	/* Disable linear mode as the boot loader may have used it */
-	writel(0x0, &regs->lqspicfg);
-
 	/* Clear the TX and RX threshold reg */
 	writel(ZYNQ_QSPI_TXFIFO_THRESHOLD, &regs->txftr);
 	writel(ZYNQ_QSPI_RXFIFO_THRESHOLD, &regs->rxftr);
@@ -187,12 +163,13 @@ static void zynq_qspi_init_hw(struct zynq_qspi_priv *priv)
 	confr |= ZYNQ_QSPI_CR_IFMODE_MASK | ZYNQ_QSPI_CR_MCS_MASK |
 		ZYNQ_QSPI_CR_PCS_MASK | ZYNQ_QSPI_CR_FW_MASK |
 		ZYNQ_QSPI_CR_MSTREN_MASK;
-
-	if (priv->is_stacked)
-		confr |= 0x10;
-
 	writel(confr, &regs->cr);
 
+	/* Disable the LQSPI feature */
+	confr = readl(&regs->lqspicfg);
+	confr &= ~ZYNQ_QSPI_LQSPICFG_LQMODE_MASK;
+	writel(confr, &regs->lqspicfg);
+
 	/* Enable SPI */
 	writel(ZYNQ_QSPI_ENR_SPI_EN_MASK, &regs->enr);
 }
@@ -203,7 +180,6 @@ static int zynq_qspi_child_pre_probe(struct udevice *bus)
 	struct zynq_qspi_priv *priv = dev_get_priv(bus->parent);
 
 	priv->max_hz = slave->max_hz;
-	slave->multi_cs_cap = true;
 
 	return 0;
 }
@@ -386,8 +362,8 @@ static void zynq_qspi_fill_tx_fifo(struct zynq_qspi_priv *priv, u32 size)
 	unsigned len, offset;
 	struct zynq_qspi_regs *regs = priv->regs;
 	static const unsigned offsets[4] = {
-		ZYNQ_QSPI_TXD_00_01_OFFSET, ZYNQ_QSPI_TXD_00_10_OFFSET,
-		ZYNQ_QSPI_TXD_00_11_OFFSET, ZYNQ_QSPI_TXD_00_00_OFFSET };
+		ZYNQ_QSPI_TXD_00_00_OFFSET, ZYNQ_QSPI_TXD_00_01_OFFSET,
+		ZYNQ_QSPI_TXD_00_10_OFFSET, ZYNQ_QSPI_TXD_00_11_OFFSET };
 
 	while ((fifocount < size) &&
 			(priv->bytes_to_transfer > 0)) {
@@ -409,11 +385,7 @@ static void zynq_qspi_fill_tx_fifo(struct zynq_qspi_priv *priv, u32 size)
 				return;
 			len = priv->bytes_to_transfer;
 			zynq_qspi_write_data(priv, &data, len);
-			if ((priv->is_parallel || priv->is_stacked) &&
-			    !priv->is_inst && (len % 2))
-				len++;
-			offset = (priv->rx_buf) ?
-				 offsets[3] : offsets[len - 1];
+			offset = (priv->rx_buf) ? offsets[0] : offsets[len];
 			writel(data, &regs->cr + (offset / 4));
 		}
 	}
@@ -518,7 +490,6 @@ static int zynq_qspi_irq_poll(struct zynq_qspi_priv *priv)
  */
 static int zynq_qspi_start_transfer(struct zynq_qspi_priv *priv)
 {
-	static u8 current_u_page;
 	u32 data = 0;
 	struct zynq_qspi_regs *regs = priv->regs;
 
@@ -528,34 +499,6 @@ static int zynq_qspi_start_transfer(struct zynq_qspi_priv *priv)
 	priv->bytes_to_transfer = priv->len;
 	priv->bytes_to_receive = priv->len;
 
-	if (priv->is_parallel)
-		writel((ZYNQ_QSPI_LCFG_TWO_MEM_MASK |
-			ZYNQ_QSPI_LCFG_SEP_BUS_MASK |
-			(1 << ZYNQ_QSPI_LCFG_DUMMY_SHIFT) |
-			ZYNQ_QSPI_FR_QOUT_CODE), &regs->lqspicfg);
-
-	if (priv->is_inst && priv->is_stacked && current_u_page != priv->u_page) {
-		if (priv->u_page) {
-			/* Configure two memories on shared bus
-			 * by enabling upper mem
-			 */
-			writel((ZYNQ_QSPI_LCFG_TWO_MEM_MASK |
-				ZYNQ_QSPI_LCFG_U_PAGE |
-				(1 << ZYNQ_QSPI_LCFG_DUMMY_SHIFT) |
-				ZYNQ_QSPI_FR_QOUT_CODE),
-				&regs->lqspicfg);
-		} else {
-			/* Configure two memories on shared bus
-			 * by enabling lower mem
-			 */
-			writel((ZYNQ_QSPI_LCFG_TWO_MEM_MASK |
-				(1 << ZYNQ_QSPI_LCFG_DUMMY_SHIFT) |
-				ZYNQ_QSPI_FR_QOUT_CODE),
-				&regs->lqspicfg);
-		}
-		current_u_page = priv->u_page;
-	}
-
 	if (priv->len < 4)
 		zynq_qspi_fill_tx_fifo(priv, priv->len);
 	else
@@ -655,8 +598,7 @@ static int zynq_qspi_xfer(struct udevice *dev, unsigned int bitlen,
 	 * Assume that the beginning of a transfer with bits to
 	 * transmit must contain a device command.
 	 */
-	if ((dout && flags & SPI_XFER_BEGIN) ||
-	    (flags & SPI_XFER_END && !priv->is_strip))
+	if (dout && flags & SPI_XFER_BEGIN)
 		priv->is_inst = 1;
 	else
 		priv->is_inst = 0;
@@ -666,11 +608,6 @@ static int zynq_qspi_xfer(struct udevice *dev, unsigned int bitlen,
 	else
 		priv->cs_change = 0;
 
-	if (flags & SPI_XFER_U_PAGE)
-		priv->u_page = 1;
-	else
-		priv->u_page = 0;
-
 	zynq_qspi_transfer(priv);
 
 	return 0;
@@ -734,35 +671,14 @@ static int zynq_qspi_set_mode(struct udevice *bus, uint mode)
 	return 0;
 }
 
-bool update_stripe(const struct spi_mem_op *op)
-{
-	if (op->cmd.opcode == SPINOR_OP_BE_4K ||
-	    op->cmd.opcode == SPINOR_OP_CHIP_ERASE ||
-	    op->cmd.opcode == SPINOR_OP_SE ||
-	    op->cmd.opcode == SPINOR_OP_WREAR ||
-	    op->cmd.opcode == SPINOR_OP_WRSR
-	)
-		return false;
-
-	return true;
-}
-
 static int zynq_qspi_exec_op(struct spi_slave *slave,
 			     const struct spi_mem_op *op)
 {
-	struct udevice *bus = slave->dev->parent;
-	struct zynq_qspi_priv *priv = dev_get_priv(bus);
 	int op_len, pos = 0, ret, i;
 	unsigned int flag = 0;
 	const u8 *tx_buf = NULL;
 	u8 *rx_buf = NULL;
 
-	if ((slave->flags & QSPI_SELECT_LOWER_CS) &&
-	    (slave->flags & QSPI_SELECT_UPPER_CS))
-		priv->is_parallel = true;
-	if (slave->flags & SPI_XFER_STACKED)
-		priv->is_stacked = true;
-
 	if (op->data.nbytes) {
 		if (op->data.dir == SPI_MEM_DATA_IN)
 			rx_buf = op->data.buf.in;
@@ -787,9 +703,6 @@ static int zynq_qspi_exec_op(struct spi_slave *slave,
 	if (op->dummy.nbytes)
 		memset(op_buf + pos, 0xff, op->dummy.nbytes);
 
-	if (slave->flags & SPI_XFER_U_PAGE)
-		flag |= SPI_XFER_U_PAGE;
-
 	/* 1st transfer: opcode + address + dummy cycles */
 	/* Make sure to set END bit if no tx or rx data messages follow */
 	if (!tx_buf && !rx_buf)
@@ -800,9 +713,6 @@ static int zynq_qspi_exec_op(struct spi_slave *slave,
 	if (ret)
 		return ret;
 
-	if (priv->is_parallel)
-		priv->is_strip = update_stripe(op);
-
 	/* 2nd transfer: rx or tx data path */
 	if (tx_buf || rx_buf) {
 		ret = zynq_qspi_xfer(slave->dev, op->data.nbytes * 8, tx_buf,
@@ -811,9 +721,6 @@ static int zynq_qspi_exec_op(struct spi_slave *slave,
 			return ret;
 	}
 
-	priv->is_parallel = false;
-	priv->is_stacked = false;
-	slave->flags &= ~SPI_XFER_MASK;
 	spi_release_bus(slave);
 
 	return 0;
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
