Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B290C4E915
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:27:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DD74CA0298
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:27:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 451A5CA0296
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:27:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDRAYS023532; Fri, 21 Jun 2019 15:27:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Z/PZ69KVVvpXrPdXfdmu2ZWSemroQRqYJynGnYCjAVA=;
 b=eS8mwhwuKyv1B9F817D19gxRrG7zap8E2gP2MLbsMCaD+QNlFHvxCdjabGPJzCb09IeL
 wK9G3Bw6yHFi+WVqEVGqm/ATIgBM8Z/Im/FEjhjOPaH8ELRIWJR5x1bRIcAHCUyLoWzu
 AQo3m7tvvgwoGYQHyEHTa7lH9LBCHF/uLZ2Iq0ViJgyF5gak4+mhUjG3XN42IDUjKSt2
 2Kj2Gc4RwvhWDz2/mb7mBg5/qVhxdmAdi7vgOax4wNSn4w/1h8wFlYb/FjOh+VwTN6V7
 3ygRA/Vre2vO6B3En2sv9SoNTfzalqqFW579z8+3TpAPJy8KuKgxHDgvv52PRcNJwGH1 XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t78137tn3-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:27:27 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB0E33F;
 Fri, 21 Jun 2019 13:27:26 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 912542A50;
 Fri, 21 Jun 2019 13:27:26 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 15:27:26 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun 2019 15:27:26
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:26:58 +0200
Message-ID: <1561123618-2029-20-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
References: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 20/20] spi: stm32: Fix warnings when compiling
	with W=1
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

This patch solves the following warnings:

drivers/spi/stm32_spi.c: In function 'stm32_spi_write_txfifo':
drivers/spi/stm32_spi.c:116:20: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
   if (priv->tx_len >= sizeof(u32) &&
                    ^~
drivers/spi/stm32_spi.c:122:27: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
   } else if (priv->tx_len >= sizeof(u16) &&
                           ^~
drivers/spi/stm32_spi.c: In function 'stm32_spi_read_rxfifo':
drivers/spi/stm32_spi.c:150:21: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
       (priv->rx_len >= sizeof(u32) || (sr & SPI_SR_RXWNE))) {
                     ^~
drivers/spi/stm32_spi.c:156:21: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
       (priv->rx_len >= sizeof(u16) ||
                     ^~
drivers/core/simple-bus.c:15:12: warning: no previous prototype for 'simple_bus_translate' [-Wmissing-prototypes]
 fdt_addr_t simple_bus_translate(struct udevice *dev, fdt_addr_t addr)
            ^~~~~~~~~~~~~~~~~~~~
drivers/spi/stm32_spi.c: In function 'stm32_spi_set_speed':
drivers/spi/stm32_spi.c:335:10: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      div > STM32_MBR_DIV_MAX)
          ^
drivers/spi/stm32_spi.c:344:19: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
  if ((mbrdiv - 1) < 0)
                   ^
drivers/spi/stm32_spi.c: In function 'stm32_spi_probe':
drivers/spi/stm32_spi.c:531:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
  for (i = 0; i < ARRAY_SIZE(priv->cs_gpios); i++) {
                ^
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/spi/stm32_spi.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/stm32_spi.c b/drivers/spi/stm32_spi.c
index 34b2175..75b6006 100644
--- a/drivers/spi/stm32_spi.c
+++ b/drivers/spi/stm32_spi.c
@@ -99,8 +99,8 @@ struct stm32_spi_priv {
 	unsigned int cur_bpw;
 	unsigned int cur_hz;
 	unsigned int cur_xferlen; /* current transfer length in bytes */
-	int tx_len;		  /* number of data to be written in bytes */
-	int rx_len;		  /* number of data to be read in bytes */
+	unsigned int tx_len;	  /* number of data to be written in bytes */
+	unsigned int rx_len;	  /* number of data to be read in bytes */
 	const void *tx_buf;	  /* data to be written, or NULL */
 	void *rx_buf;		  /* data to be read, or NULL */
 	u32 cur_mode;
@@ -322,7 +322,8 @@ static int stm32_spi_set_fthlv(struct udevice *dev, u32 xfer_len)
 static int stm32_spi_set_speed(struct udevice *bus, uint hz)
 {
 	struct stm32_spi_priv *priv = dev_get_priv(bus);
-	u32 div, mbrdiv;
+	u32 mbrdiv;
+	long div;
 
 	debug("%s: hz=%d\n", __func__, hz);
 
@@ -341,7 +342,7 @@ static int stm32_spi_set_speed(struct udevice *bus, uint hz)
 	else
 		mbrdiv = fls(div) - 1;
 
-	if ((mbrdiv - 1) < 0)
+	if (!mbrdiv)
 		return -EINVAL;
 
 	clrsetbits_le32(priv->base + STM32_SPI_CFG1, SPI_CFG1_MBR,
@@ -481,7 +482,7 @@ static int stm32_spi_probe(struct udevice *dev)
 	struct stm32_spi_priv *priv = dev_get_priv(dev);
 	unsigned long clk_rate;
 	int ret;
-	int i;
+	unsigned int i;
 
 	priv->base = dev_remap_addr(dev);
 	if (!priv->base)
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
