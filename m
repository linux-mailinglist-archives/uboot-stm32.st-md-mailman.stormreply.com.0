Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B932A9B7D
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 19:02:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E085C424B9;
	Fri,  6 Nov 2020 18:02:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 756F6C424B9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 18:02:53 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6HwGRt022715; Fri, 6 Nov 2020 19:02:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=hBtSdiOOM1Wne52tRpXblFJ0DcTMCe0RHrcqiCZOWX4=;
 b=Ibv6Pb4fwRifYSKSXBk363H3/wVO65a+GaF94lVUBOR4WVAwT7P8W8J0SDITptpteTST
 I9kYc3YKUCWKIJSFoCzt2QunoM8fM7/WnpqlcPYTK/P/ZhIW3Y7CklPGDnzUiIdy1evE
 1bWdRENcqoP9VvMlGbTbuj+jeUpe5Pk8uWBmhWHmHA62V616KGqVs4pOcu+SIQxOrL6O
 ooD4t7qKvn02PT3+sSZEgQ+DSlT8kJiL3hGX70CTPwWPkL441mwYLTgbJbQRSHwtkWiU
 qB7sWDx25mlHYh6VXTmrfCRozHi2EqQKY9g05Fcm6pkfUC3HjSlK8AxY/8PWqKTbWcTe tQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gywrfv30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 19:02:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B8F0910002A;
 Fri,  6 Nov 2020 19:02:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B00A825079D;
 Fri,  6 Nov 2020 19:02:45 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 19:02:44
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 19:01:52 +0100
Message-ID: <20201106180201.31784-25-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106180201.31784-1-patrick.delaunay@st.com>
References: <20201106180201.31784-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH v2 24/33] spi: stm32_spi: migrate trace to dev
	and log macro
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

Change debug/pr_debug to log_debug or dev_dbg macro and
define LOG_CATEGORY.

Remove the "%s:" __func__  header as it is managed by dev macro
(dev->name is displayed) or log macro (CONFIG_LOGF_FUNC).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---

(no changes since v1)

 drivers/spi/stm32_spi.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/stm32_spi.c b/drivers/spi/stm32_spi.c
index 4a0833b6fa..086a84572b 100644
--- a/drivers/spi/stm32_spi.c
+++ b/drivers/spi/stm32_spi.c
@@ -4,6 +4,9 @@
  *
  * Driver for STMicroelectronics Serial peripheral interface (SPI)
  */
+
+#define LOG_CATEGORY UCLASS_SPI
+
 #include <common.h>
 #include <clk.h>
 #include <dm.h>
@@ -138,7 +141,7 @@ static void stm32_spi_write_txfifo(struct stm32_spi_priv *priv)
 		}
 	}
 
-	debug("%s: %d bytes left\n", __func__, priv->tx_len);
+	log_debug("%d bytes left\n", priv->tx_len);
 }
 
 static void stm32_spi_read_rxfifo(struct stm32_spi_priv *priv)
@@ -176,12 +179,12 @@ static void stm32_spi_read_rxfifo(struct stm32_spi_priv *priv)
 		rxplvl = (sr & SPI_SR_RXPLVL) >> SPI_SR_RXPLVL_SHIFT;
 	}
 
-	debug("%s: %d bytes left\n", __func__, priv->rx_len);
+	log_debug("%d bytes left\n", priv->rx_len);
 }
 
 static int stm32_spi_enable(struct stm32_spi_priv *priv)
 {
-	debug("%s\n", __func__);
+	log_debug("\n");
 
 	/* Enable the SPI hardware */
 	setbits_le32(priv->base + STM32_SPI_CR1, SPI_CR1_SPE);
@@ -191,7 +194,7 @@ static int stm32_spi_enable(struct stm32_spi_priv *priv)
 
 static int stm32_spi_disable(struct stm32_spi_priv *priv)
 {
-	debug("%s\n", __func__);
+	log_debug("\n");
 
 	/* Disable the SPI hardware */
 	clrbits_le32(priv->base + STM32_SPI_CR1, SPI_CR1_SPE);
@@ -204,7 +207,7 @@ static int stm32_spi_claim_bus(struct udevice *slave)
 	struct udevice *bus = dev_get_parent(slave);
 	struct stm32_spi_priv *priv = dev_get_priv(bus);
 
-	debug("%s\n", __func__);
+	dev_dbg(slave, "\n");
 
 	/* Enable the SPI hardware */
 	return stm32_spi_enable(priv);
@@ -215,7 +218,7 @@ static int stm32_spi_release_bus(struct udevice *slave)
 	struct udevice *bus = dev_get_parent(slave);
 	struct stm32_spi_priv *priv = dev_get_priv(bus);
 
-	debug("%s\n", __func__);
+	dev_dbg(slave, "\n");
 
 	/* Disable the SPI hardware */
 	return stm32_spi_disable(priv);
@@ -227,7 +230,7 @@ static void stm32_spi_stopxfer(struct udevice *dev)
 	u32 cr1, sr;
 	int ret;
 
-	debug("%s\n", __func__);
+	dev_dbg(dev, "\n");
 
 	cr1 = readl(priv->base + STM32_SPI_CR1);
 
@@ -255,7 +258,7 @@ static int stm32_spi_set_cs(struct udevice *dev, unsigned int cs, bool enable)
 {
 	struct stm32_spi_priv *priv = dev_get_priv(dev);
 
-	debug("%s: cs=%d enable=%d\n", __func__, cs, enable);
+	dev_dbg(dev, "cs=%d enable=%d\n", cs, enable);
 
 	if (cs >= MAX_CS_COUNT)
 		return -ENODEV;
@@ -274,7 +277,7 @@ static int stm32_spi_set_mode(struct udevice *bus, uint mode)
 	struct stm32_spi_priv *priv = dev_get_priv(bus);
 	u32 cfg2_clrb = 0, cfg2_setb = 0;
 
-	debug("%s: mode=%d\n", __func__, mode);
+	dev_dbg(bus, "mode=%d\n", mode);
 
 	if (mode & SPI_CPOL)
 		cfg2_setb |= SPI_CFG2_CPOL;
@@ -330,7 +333,7 @@ static int stm32_spi_set_speed(struct udevice *bus, uint hz)
 	u32 mbrdiv;
 	long div;
 
-	debug("%s: hz=%d\n", __func__, hz);
+	dev_dbg(bus, "hz=%d\n", hz);
 
 	if (priv->cur_hz == hz)
 		return 0;
@@ -404,8 +407,8 @@ static int stm32_spi_xfer(struct udevice *slave, unsigned int bitlen,
 		stm32_spi_enable(priv);
 	}
 
-	debug("%s: priv->tx_len=%d priv->rx_len=%d\n", __func__,
-	      priv->tx_len, priv->rx_len);
+	dev_dbg(bus, "priv->tx_len=%d priv->rx_len=%d\n",
+		priv->tx_len, priv->rx_len);
 
 	slave_plat = dev_get_parent_platdata(slave);
 	if (flags & SPI_XFER_BEGIN)
@@ -477,7 +480,7 @@ static int stm32_spi_get_fifo_size(struct udevice *dev)
 
 	stm32_spi_disable(priv);
 
-	debug("%s %d x 8-bit fifo size\n", __func__, count);
+	dev_dbg(dev, "%d x 8-bit fifo size\n", count);
 
 	return count;
 }
@@ -522,7 +525,7 @@ static int stm32_spi_probe(struct udevice *dev)
 	ret = gpio_request_list_by_name(dev, "cs-gpios", priv->cs_gpios,
 					ARRAY_SIZE(priv->cs_gpios), 0);
 	if (ret < 0) {
-		pr_err("Can't get %s cs gpios: %d", dev->name, ret);
+		dev_err(dev, "Can't get cs gpios: %d", ret);
 		goto reset_err;
 	}
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
