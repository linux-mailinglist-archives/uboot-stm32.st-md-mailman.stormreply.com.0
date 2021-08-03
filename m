Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BFF3DE999
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Aug 2021 11:17:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52678C597BC;
	Tue,  3 Aug 2021 09:17:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74EACC597AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Aug 2021 09:16:58 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1738vO3a006396; Tue, 3 Aug 2021 11:16:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=3bP0fAUjsUaWUKBD/+N1gRBdeMojq+lKdFOApnI40iE=;
 b=xw/Vo1Lmu1e60Xsp2b1nKiVzCl1ejZSkf4ai4tPlLsfQE8tb6rqA0H9+qA0rJs4SBqQN
 KhQe8PD7afQ6yJcZ+LR+baJ3bXHlG8ozPF/c6Xv3GMWGgqwtaL9LjISGqauTcLlh4jEu
 fxGlXP9o8rHsBsBSeqzQDZUnNJms5BIjXuVJYM7etdl28JJJ7u7DQ0rczCz3g2MTM/N+
 b2ft7fM5Y6OFz4Qn4z4qn84jyPE2GAM3/E35fNZ+EF7cyPjkqTQ6Sdeh9MBLYS53P/Q/
 Xooz3jpPo+ToEP3huAHxSN+pahew4qKWrd0QB8mVeLu4QfE6ksG9t96jfbFo4ZJKs66i WQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a6tqkjc9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 11:16:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3D35910002A;
 Tue,  3 Aug 2021 11:16:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 174D520FA2E;
 Tue,  3 Aug 2021 11:16:56 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Aug 2021 11:16:55
 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 3 Aug 2021 11:16:40 +0200
Message-ID: <20210803091640.13146-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-03_02:2021-08-03,
 2021-08-03 signatures=0
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH] spi: stm32: Add ofdata_to_platdata() callback
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

Parse DT in ofdata_to_platdata() callback instead of probe().

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/spi/stm32_spi.c | 224 +++++++++++++++++++++++-----------------
 1 file changed, 132 insertions(+), 92 deletions(-)

diff --git a/drivers/spi/stm32_spi.c b/drivers/spi/stm32_spi.c
index bd8514033d..fe5419e851 100644
--- a/drivers/spi/stm32_spi.c
+++ b/drivers/spi/stm32_spi.c
@@ -97,11 +97,14 @@
 #define SPI_SIMPLEX_RX		2
 #define SPI_HALF_DUPLEX		3
 
-struct stm32_spi_priv {
+struct stm32_spi_plat {
 	void __iomem *base;
 	struct clk clk;
 	struct reset_ctl rst_ctl;
 	struct gpio_desc cs_gpios[MAX_CS_COUNT];
+};
+
+struct stm32_spi_priv {
 	ulong bus_clk_rate;
 	unsigned int fifo_size;
 	unsigned int cur_bpw;
@@ -115,28 +118,32 @@ struct stm32_spi_priv {
 	bool cs_high;
 };
 
-static void stm32_spi_write_txfifo(struct stm32_spi_priv *priv)
+static void stm32_spi_write_txfifo(struct udevice *bus)
 {
+	struct stm32_spi_priv *priv = dev_get_priv(bus);
+	struct stm32_spi_plat *plat = dev_get_plat(bus);
+	void __iomem *base = plat->base;
+
 	while ((priv->tx_len > 0) &&
-	       (readl(priv->base + STM32_SPI_SR) & SPI_SR_TXP)) {
+	       (readl(base + STM32_SPI_SR) & SPI_SR_TXP)) {
 		u32 offs = priv->cur_xferlen - priv->tx_len;
 
 		if (priv->tx_len >= sizeof(u32) &&
 		    IS_ALIGNED((uintptr_t)(priv->tx_buf + offs), sizeof(u32))) {
 			const u32 *tx_buf32 = (const u32 *)(priv->tx_buf + offs);
 
-			writel(*tx_buf32, priv->base + STM32_SPI_TXDR);
+			writel(*tx_buf32, base + STM32_SPI_TXDR);
 			priv->tx_len -= sizeof(u32);
 		} else if (priv->tx_len >= sizeof(u16) &&
 			   IS_ALIGNED((uintptr_t)(priv->tx_buf + offs), sizeof(u16))) {
 			const u16 *tx_buf16 = (const u16 *)(priv->tx_buf + offs);
 
-			writew(*tx_buf16, priv->base + STM32_SPI_TXDR);
+			writew(*tx_buf16, base + STM32_SPI_TXDR);
 			priv->tx_len -= sizeof(u16);
 		} else {
 			const u8 *tx_buf8 = (const u8 *)(priv->tx_buf + offs);
 
-			writeb(*tx_buf8, priv->base + STM32_SPI_TXDR);
+			writeb(*tx_buf8, base + STM32_SPI_TXDR);
 			priv->tx_len -= sizeof(u8);
 		}
 	}
@@ -144,9 +151,12 @@ static void stm32_spi_write_txfifo(struct stm32_spi_priv *priv)
 	log_debug("%d bytes left\n", priv->tx_len);
 }
 
-static void stm32_spi_read_rxfifo(struct stm32_spi_priv *priv)
+static void stm32_spi_read_rxfifo(struct udevice *bus)
 {
-	u32 sr = readl(priv->base + STM32_SPI_SR);
+	struct stm32_spi_priv *priv = dev_get_priv(bus);
+	struct stm32_spi_plat *plat = dev_get_plat(bus);
+	void __iomem *base = plat->base;
+	u32 sr = readl(base + STM32_SPI_SR);
 	u32 rxplvl = (sr & SPI_SR_RXPLVL) >> SPI_SR_RXPLVL_SHIFT;
 
 	while ((priv->rx_len > 0) &&
@@ -158,7 +168,7 @@ static void stm32_spi_read_rxfifo(struct stm32_spi_priv *priv)
 		    (priv->rx_len >= sizeof(u32) || (sr & SPI_SR_RXWNE))) {
 			u32 *rx_buf32 = (u32 *)(priv->rx_buf + offs);
 
-			*rx_buf32 = readl(priv->base + STM32_SPI_RXDR);
+			*rx_buf32 = readl(base + STM32_SPI_RXDR);
 			priv->rx_len -= sizeof(u32);
 		} else if (IS_ALIGNED((uintptr_t)(priv->rx_buf + offs), sizeof(u16)) &&
 			   (priv->rx_len >= sizeof(u16) ||
@@ -166,38 +176,38 @@ static void stm32_spi_read_rxfifo(struct stm32_spi_priv *priv)
 			    (rxplvl >= 2 || priv->cur_bpw > 8)))) {
 			u16 *rx_buf16 = (u16 *)(priv->rx_buf + offs);
 
-			*rx_buf16 = readw(priv->base + STM32_SPI_RXDR);
+			*rx_buf16 = readw(base + STM32_SPI_RXDR);
 			priv->rx_len -= sizeof(u16);
 		} else {
 			u8 *rx_buf8 = (u8 *)(priv->rx_buf + offs);
 
-			*rx_buf8 = readb(priv->base + STM32_SPI_RXDR);
+			*rx_buf8 = readb(base + STM32_SPI_RXDR);
 			priv->rx_len -= sizeof(u8);
 		}
 
-		sr = readl(priv->base + STM32_SPI_SR);
+		sr = readl(base + STM32_SPI_SR);
 		rxplvl = (sr & SPI_SR_RXPLVL) >> SPI_SR_RXPLVL_SHIFT;
 	}
 
 	log_debug("%d bytes left\n", priv->rx_len);
 }
 
-static int stm32_spi_enable(struct stm32_spi_priv *priv)
+static int stm32_spi_enable(void __iomem *base)
 {
 	log_debug("\n");
 
 	/* Enable the SPI hardware */
-	setbits_le32(priv->base + STM32_SPI_CR1, SPI_CR1_SPE);
+	setbits_le32(base + STM32_SPI_CR1, SPI_CR1_SPE);
 
 	return 0;
 }
 
-static int stm32_spi_disable(struct stm32_spi_priv *priv)
+static int stm32_spi_disable(void __iomem *base)
 {
 	log_debug("\n");
 
 	/* Disable the SPI hardware */
-	clrbits_le32(priv->base + STM32_SPI_CR1, SPI_CR1_SPE);
+	clrbits_le32(base + STM32_SPI_CR1, SPI_CR1_SPE);
 
 	return 0;
 }
@@ -205,45 +215,48 @@ static int stm32_spi_disable(struct stm32_spi_priv *priv)
 static int stm32_spi_claim_bus(struct udevice *slave)
 {
 	struct udevice *bus = dev_get_parent(slave);
-	struct stm32_spi_priv *priv = dev_get_priv(bus);
+	struct stm32_spi_plat *plat = dev_get_plat(bus);
+	void __iomem *base = plat->base;
 
 	dev_dbg(slave, "\n");
 
 	/* Enable the SPI hardware */
-	return stm32_spi_enable(priv);
+	return stm32_spi_enable(base);
 }
 
 static int stm32_spi_release_bus(struct udevice *slave)
 {
 	struct udevice *bus = dev_get_parent(slave);
-	struct stm32_spi_priv *priv = dev_get_priv(bus);
+	struct stm32_spi_plat *plat = dev_get_plat(bus);
+	void __iomem *base = plat->base;
 
 	dev_dbg(slave, "\n");
 
 	/* Disable the SPI hardware */
-	return stm32_spi_disable(priv);
+	return stm32_spi_disable(base);
 }
 
 static void stm32_spi_stopxfer(struct udevice *dev)
 {
-	struct stm32_spi_priv *priv = dev_get_priv(dev);
+	struct stm32_spi_plat *plat = dev_get_plat(dev);
+	void __iomem *base = plat->base;
 	u32 cr1, sr;
 	int ret;
 
 	dev_dbg(dev, "\n");
 
-	cr1 = readl(priv->base + STM32_SPI_CR1);
+	cr1 = readl(base + STM32_SPI_CR1);
 
 	if (!(cr1 & SPI_CR1_SPE))
 		return;
 
 	/* Wait on EOT or suspend the flow */
-	ret = readl_poll_timeout(priv->base + STM32_SPI_SR, sr,
+	ret = readl_poll_timeout(base + STM32_SPI_SR, sr,
 				 !(sr & SPI_SR_EOT), 100000);
 	if (ret < 0) {
 		if (cr1 & SPI_CR1_CSTART) {
-			writel(cr1 | SPI_CR1_CSUSP, priv->base + STM32_SPI_CR1);
-			if (readl_poll_timeout(priv->base + STM32_SPI_SR,
+			writel(cr1 | SPI_CR1_CSUSP, base + STM32_SPI_CR1);
+			if (readl_poll_timeout(base + STM32_SPI_SR,
 					       sr, !(sr & SPI_SR_SUSP),
 					       100000) < 0)
 				dev_err(dev, "Suspend request timeout\n");
@@ -251,11 +264,12 @@ static void stm32_spi_stopxfer(struct udevice *dev)
 	}
 
 	/* clear status flags */
-	setbits_le32(priv->base + STM32_SPI_IFCR, SPI_IFCR_ALL);
+	setbits_le32(base + STM32_SPI_IFCR, SPI_IFCR_ALL);
 }
 
 static int stm32_spi_set_cs(struct udevice *dev, unsigned int cs, bool enable)
 {
+	struct stm32_spi_plat *plat = dev_get_plat(dev);
 	struct stm32_spi_priv *priv = dev_get_priv(dev);
 
 	dev_dbg(dev, "cs=%d enable=%d\n", cs, enable);
@@ -263,18 +277,20 @@ static int stm32_spi_set_cs(struct udevice *dev, unsigned int cs, bool enable)
 	if (cs >= MAX_CS_COUNT)
 		return -ENODEV;
 
-	if (!dm_gpio_is_valid(&priv->cs_gpios[cs]))
+	if (!dm_gpio_is_valid(&plat->cs_gpios[cs]))
 		return -EINVAL;
 
 	if (priv->cs_high)
 		enable = !enable;
 
-	return dm_gpio_set_value(&priv->cs_gpios[cs], enable ? 1 : 0);
+	return dm_gpio_set_value(&plat->cs_gpios[cs], enable ? 1 : 0);
 }
 
 static int stm32_spi_set_mode(struct udevice *bus, uint mode)
 {
 	struct stm32_spi_priv *priv = dev_get_priv(bus);
+	struct stm32_spi_plat *plat = dev_get_plat(bus);
+	void __iomem *base = plat->base;
 	u32 cfg2_clrb = 0, cfg2_setb = 0;
 
 	dev_dbg(bus, "mode=%d\n", mode);
@@ -295,7 +311,7 @@ static int stm32_spi_set_mode(struct udevice *bus, uint mode)
 		cfg2_clrb |= SPI_CFG2_LSBFRST;
 
 	if (cfg2_clrb || cfg2_setb)
-		clrsetbits_le32(priv->base + STM32_SPI_CFG2,
+		clrsetbits_le32(base + STM32_SPI_CFG2,
 				cfg2_clrb, cfg2_setb);
 
 	if (mode & SPI_CS_HIGH)
@@ -308,6 +324,8 @@ static int stm32_spi_set_mode(struct udevice *bus, uint mode)
 static int stm32_spi_set_fthlv(struct udevice *dev, u32 xfer_len)
 {
 	struct stm32_spi_priv *priv = dev_get_priv(dev);
+	struct stm32_spi_plat *plat = dev_get_plat(dev);
+	void __iomem *base = plat->base;
 	u32 fthlv, half_fifo;
 
 	/* data packet should not exceed 1/2 of fifo space */
@@ -321,7 +339,7 @@ static int stm32_spi_set_fthlv(struct udevice *dev, u32 xfer_len)
 
 	if (!fthlv)
 		fthlv = 1;
-	clrsetbits_le32(priv->base + STM32_SPI_CFG1, SPI_CFG1_FTHLV,
+	clrsetbits_le32(base + STM32_SPI_CFG1, SPI_CFG1_FTHLV,
 			(fthlv - 1) << SPI_CFG1_FTHLV_SHIFT);
 
 	return 0;
@@ -330,6 +348,8 @@ static int stm32_spi_set_fthlv(struct udevice *dev, u32 xfer_len)
 static int stm32_spi_set_speed(struct udevice *bus, uint hz)
 {
 	struct stm32_spi_priv *priv = dev_get_priv(bus);
+	struct stm32_spi_plat *plat = dev_get_plat(bus);
+	void __iomem *base = plat->base;
 	u32 mbrdiv;
 	long div;
 
@@ -353,7 +373,7 @@ static int stm32_spi_set_speed(struct udevice *bus, uint hz)
 	if (!mbrdiv)
 		return -EINVAL;
 
-	clrsetbits_le32(priv->base + STM32_SPI_CFG1, SPI_CFG1_MBR,
+	clrsetbits_le32(base + STM32_SPI_CFG1, SPI_CFG1_MBR,
 			(mbrdiv - 1) << SPI_CFG1_MBR_SHIFT);
 
 	priv->cur_hz = hz;
@@ -367,6 +387,8 @@ static int stm32_spi_xfer(struct udevice *slave, unsigned int bitlen,
 	struct udevice *bus = dev_get_parent(slave);
 	struct dm_spi_slave_plat *slave_plat;
 	struct stm32_spi_priv *priv = dev_get_priv(bus);
+	struct stm32_spi_plat *plat = dev_get_plat(bus);
+	void __iomem *base = plat->base;
 	u32 sr;
 	u32 ifcr = 0;
 	u32 xferlen;
@@ -376,7 +398,7 @@ static int stm32_spi_xfer(struct udevice *slave, unsigned int bitlen,
 	xferlen = bitlen / 8;
 
 	if (xferlen <= SPI_CR2_TSIZE)
-		writel(xferlen, priv->base + STM32_SPI_CR2);
+		writel(xferlen, base + STM32_SPI_CR2);
 	else
 		return -EMSGSIZE;
 
@@ -396,15 +418,15 @@ static int stm32_spi_xfer(struct udevice *slave, unsigned int bitlen,
 		priv->cur_xferlen = xferlen;
 
 		/* Disable the SPI hardware to unlock CFG1/CFG2 registers */
-		stm32_spi_disable(priv);
+		stm32_spi_disable(base);
 
-		clrsetbits_le32(priv->base + STM32_SPI_CFG2, SPI_CFG2_COMM,
+		clrsetbits_le32(base + STM32_SPI_CFG2, SPI_CFG2_COMM,
 				mode << SPI_CFG2_COMM_SHIFT);
 
 		stm32_spi_set_fthlv(bus, xferlen);
 
 		/* Enable the SPI hardware */
-		stm32_spi_enable(priv);
+		stm32_spi_enable(base);
 	}
 
 	dev_dbg(bus, "priv->tx_len=%d priv->rx_len=%d\n",
@@ -416,12 +438,12 @@ static int stm32_spi_xfer(struct udevice *slave, unsigned int bitlen,
 
 	/* Be sure to have data in fifo before starting data transfer */
 	if (priv->tx_buf)
-		stm32_spi_write_txfifo(priv);
+		stm32_spi_write_txfifo(bus);
 
-	setbits_le32(priv->base + STM32_SPI_CR1, SPI_CR1_CSTART);
+	setbits_le32(base + STM32_SPI_CR1, SPI_CR1_CSTART);
 
 	while (1) {
-		sr = readl(priv->base + STM32_SPI_SR);
+		sr = readl(base + STM32_SPI_SR);
 
 		if (sr & SPI_SR_OVR) {
 			dev_err(bus, "Overrun: RX data lost\n");
@@ -433,7 +455,7 @@ static int stm32_spi_xfer(struct udevice *slave, unsigned int bitlen,
 			dev_warn(bus, "System too slow is limiting data throughput\n");
 
 			if (priv->rx_buf && priv->rx_len > 0)
-				stm32_spi_read_rxfifo(priv);
+				stm32_spi_read_rxfifo(bus);
 
 			ifcr |= SPI_SR_SUSP;
 		}
@@ -443,23 +465,23 @@ static int stm32_spi_xfer(struct udevice *slave, unsigned int bitlen,
 
 		if (sr & SPI_SR_TXP)
 			if (priv->tx_buf && priv->tx_len > 0)
-				stm32_spi_write_txfifo(priv);
+				stm32_spi_write_txfifo(bus);
 
 		if (sr & SPI_SR_RXP)
 			if (priv->rx_buf && priv->rx_len > 0)
-				stm32_spi_read_rxfifo(priv);
+				stm32_spi_read_rxfifo(bus);
 
 		if (sr & SPI_SR_EOT) {
 			if (priv->rx_buf && priv->rx_len > 0)
-				stm32_spi_read_rxfifo(priv);
+				stm32_spi_read_rxfifo(bus);
 			break;
 		}
 
-		writel(ifcr, priv->base + STM32_SPI_IFCR);
+		writel(ifcr, base + STM32_SPI_IFCR);
 	}
 
 	/* clear status flags */
-	setbits_le32(priv->base + STM32_SPI_IFCR, SPI_IFCR_ALL);
+	setbits_le32(base + STM32_SPI_IFCR, SPI_IFCR_ALL);
 	stm32_spi_stopxfer(bus);
 
 	if (flags & SPI_XFER_END)
@@ -470,42 +492,72 @@ static int stm32_spi_xfer(struct udevice *slave, unsigned int bitlen,
 
 static int stm32_spi_get_fifo_size(struct udevice *dev)
 {
-	struct stm32_spi_priv *priv = dev_get_priv(dev);
+	struct stm32_spi_plat *plat = dev_get_plat(dev);
+	void __iomem *base = plat->base;
 	u32 count = 0;
 
-	stm32_spi_enable(priv);
+	stm32_spi_enable(base);
 
-	while (readl(priv->base + STM32_SPI_SR) & SPI_SR_TXP)
-		writeb(++count, priv->base + STM32_SPI_TXDR);
+	while (readl(base + STM32_SPI_SR) & SPI_SR_TXP)
+		writeb(++count, base + STM32_SPI_TXDR);
 
-	stm32_spi_disable(priv);
+	stm32_spi_disable(base);
 
 	dev_dbg(dev, "%d x 8-bit fifo size\n", count);
 
 	return count;
 }
 
+static int stm32_spi_of_to_plat(struct udevice *dev)
+{
+	struct stm32_spi_plat *plat = dev_get_plat(dev);
+	int ret;
+
+	plat->base = dev_read_addr_ptr(dev);
+	if (!plat->base) {
+		dev_err(dev, "can't get registers base address\n");
+		return -ENOENT;
+	}
+
+	ret = clk_get_by_index(dev, 0, &plat->clk);
+	if (ret < 0)
+		return ret;
+
+	ret = reset_get_by_index(dev, 0, &plat->rst_ctl);
+	if (ret < 0)
+		goto clk_err;
+
+	ret = gpio_request_list_by_name(dev, "cs-gpios", plat->cs_gpios,
+					ARRAY_SIZE(plat->cs_gpios), 0);
+	if (ret < 0) {
+		dev_err(dev, "Can't get %s cs gpios: %d", dev->name, ret);
+		ret = -ENOENT;
+		goto clk_err;
+	}
+
+	return 0;
+
+clk_err:
+	clk_free(&plat->clk);
+
+	return ret;
+}
+
 static int stm32_spi_probe(struct udevice *dev)
 {
+	struct stm32_spi_plat *plat = dev_get_plat(dev);
 	struct stm32_spi_priv *priv = dev_get_priv(dev);
+	void __iomem *base = plat->base;
 	unsigned long clk_rate;
 	int ret;
 	unsigned int i;
 
-	priv->base = dev_remap_addr(dev);
-	if (!priv->base)
-		return -EINVAL;
-
 	/* enable clock */
-	ret = clk_get_by_index(dev, 0, &priv->clk);
+	ret = clk_enable(&plat->clk);
 	if (ret < 0)
 		return ret;
 
-	ret = clk_enable(&priv->clk);
-	if (ret < 0)
-		return ret;
-
-	clk_rate = clk_get_rate(&priv->clk);
+	clk_rate = clk_get_rate(&plat->clk);
 	if (!clk_rate) {
 		ret = -EINVAL;
 		goto clk_err;
@@ -514,46 +566,34 @@ static int stm32_spi_probe(struct udevice *dev)
 	priv->bus_clk_rate = clk_rate;
 
 	/* perform reset */
-	ret = reset_get_by_index(dev, 0, &priv->rst_ctl);
-	if (ret < 0)
-		goto clk_err;
-
-	reset_assert(&priv->rst_ctl);
+	reset_assert(&plat->rst_ctl);
 	udelay(2);
-	reset_deassert(&priv->rst_ctl);
-
-	ret = gpio_request_list_by_name(dev, "cs-gpios", priv->cs_gpios,
-					ARRAY_SIZE(priv->cs_gpios), 0);
-	if (ret < 0) {
-		dev_err(dev, "Can't get cs gpios: %d", ret);
-		goto reset_err;
-	}
+	reset_deassert(&plat->rst_ctl);
 
 	priv->fifo_size = stm32_spi_get_fifo_size(dev);
-
 	priv->cur_mode = SPI_FULL_DUPLEX;
 	priv->cur_xferlen = 0;
 	priv->cur_bpw = SPI_DEFAULT_WORDLEN;
-	clrsetbits_le32(priv->base + STM32_SPI_CFG1, SPI_CFG1_DSIZE,
+	clrsetbits_le32(base + STM32_SPI_CFG1, SPI_CFG1_DSIZE,
 			priv->cur_bpw - 1);
 
-	for (i = 0; i < ARRAY_SIZE(priv->cs_gpios); i++) {
-		if (!dm_gpio_is_valid(&priv->cs_gpios[i]))
+	for (i = 0; i < ARRAY_SIZE(plat->cs_gpios); i++) {
+		if (!dm_gpio_is_valid(&plat->cs_gpios[i]))
 			continue;
 
-		dm_gpio_set_dir_flags(&priv->cs_gpios[i],
+		dm_gpio_set_dir_flags(&plat->cs_gpios[i],
 				      GPIOD_IS_OUT | GPIOD_IS_OUT_ACTIVE);
 	}
 
 	/* Ensure I2SMOD bit is kept cleared */
-	clrbits_le32(priv->base + STM32_SPI_I2SCFGR, SPI_I2SCFGR_I2SMOD);
+	clrbits_le32(base + STM32_SPI_I2SCFGR, SPI_I2SCFGR_I2SMOD);
 
 	/*
 	 * - SS input value high
 	 * - transmitter half duplex direction
 	 * - automatic communication suspend when RX-Fifo is full
 	 */
-	setbits_le32(priv->base + STM32_SPI_CR1,
+	setbits_le32(base + STM32_SPI_CR1,
 		     SPI_CR1_SSI | SPI_CR1_HDDIR | SPI_CR1_MASRX);
 
 	/*
@@ -562,40 +602,38 @@ static int stm32_spi_probe(struct udevice *dev)
 	 *   SS input value is determined by the SSI bit
 	 * - keep control of all associated GPIOs
 	 */
-	setbits_le32(priv->base + STM32_SPI_CFG2,
+	setbits_le32(base + STM32_SPI_CFG2,
 		     SPI_CFG2_MASTER | SPI_CFG2_SSM | SPI_CFG2_AFCNTR);
 
 	return 0;
 
-reset_err:
-	reset_free(&priv->rst_ctl);
-
 clk_err:
-	clk_disable(&priv->clk);
-	clk_free(&priv->clk);
+	clk_disable(&plat->clk);
+	clk_free(&plat->clk);
 
 	return ret;
 };
 
 static int stm32_spi_remove(struct udevice *dev)
 {
-	struct stm32_spi_priv *priv = dev_get_priv(dev);
+	struct stm32_spi_plat *plat = dev_get_plat(dev);
+	void __iomem *base = plat->base;
 	int ret;
 
 	stm32_spi_stopxfer(dev);
-	stm32_spi_disable(priv);
+	stm32_spi_disable(base);
 
-	ret = reset_assert(&priv->rst_ctl);
+	ret = reset_assert(&plat->rst_ctl);
 	if (ret < 0)
 		return ret;
 
-	reset_free(&priv->rst_ctl);
+	reset_free(&plat->rst_ctl);
 
-	ret = clk_disable(&priv->clk);
+	ret = clk_disable(&plat->clk);
 	if (ret < 0)
 		return ret;
 
-	clk_free(&priv->clk);
+	clk_free(&plat->clk);
 
 	return ret;
 };
@@ -618,7 +656,9 @@ U_BOOT_DRIVER(stm32_spi) = {
 	.id			= UCLASS_SPI,
 	.of_match		= stm32_spi_ids,
 	.ops			= &stm32_spi_ops,
-	.priv_auto	= sizeof(struct stm32_spi_priv),
+	.of_to_plat		= stm32_spi_of_to_plat,
+	.plat_auto		= sizeof(struct stm32_spi_plat),
+	.priv_auto		= sizeof(struct stm32_spi_priv),
 	.probe			= stm32_spi_probe,
 	.remove			= stm32_spi_remove,
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
