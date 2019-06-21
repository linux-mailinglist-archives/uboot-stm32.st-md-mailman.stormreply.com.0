Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 913944E913
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:27:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5969ACA0296
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:27:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2533DCA0285
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:27:24 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDRMdf007003; Fri, 21 Jun 2019 15:27:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=S0c4F8twZMzSuBgOx2iCRH953oBG0ApV4WvcomJMUO4=;
 b=agsGfEsCi3ViXgTOCeG+sRygzpCNvOiqxrEinmc6ARaLb2x+ZK5nufH89m5kM4SmFUlI
 yGGxShuc2gqETdd+0c4wtlpUJ6JwnW+XwNy3QLVGXj2zVBH5Bs5JNFRoyVXB13Vq+jOj
 6o6Y9iDcOFECyPrDB/1/U2Wb/w5tZK/KUPAl+qkE+pVOc3Z+XA3m4pVG+EaypTOJTRnF
 IgDG6yG52rXSVKvo6WKMoiL5Z2aY3QQusYbS+GxlcpiSubZ8ChQsse/Mo0bnCVsakNNQ
 n4/ntDuqHcbrwTKP8nqEXY+PeWJiEu6KFtWCb5TnQvZfJ1eSAwaXvsksb1+eASRVSjKj 5Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7wxss9kk-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:27:23 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4123B42;
 Fri, 21 Jun 2019 13:27:22 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 127FA2A50;
 Fri, 21 Jun 2019 13:27:22 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 15:27:21 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun 2019 15:27:21
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:26:55 +0200
Message-ID: <1561123618-2029-17-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
References: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH 17/20] spi: stm32_qspi: avoid warnings when
	building with W=1 option
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

This patch solves warnings detected by setting W=1 when building.

Warnings type detected:
 - [-Wtype-limits]
 - [-Wsign-compare]

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/spi/stm32_qspi.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/stm32_qspi.c b/drivers/spi/stm32_qspi.c
index bb1067f..8d612f2 100644
--- a/drivers/spi/stm32_qspi.c
+++ b/drivers/spi/stm32_qspi.c
@@ -361,9 +361,9 @@ static int stm32_qspi_probe(struct udevice *bus)
 	}
 
 	priv->clock_rate = clk_get_rate(&clk);
-	if (priv->clock_rate < 0) {
+	if (!priv->clock_rate) {
 		clk_disable(&clk);
-		return priv->clock_rate;
+		return -EINVAL;
 	}
 
 	ret = reset_get_by_index(bus, 0, &reset_ctl);
@@ -395,14 +395,15 @@ static int stm32_qspi_claim_bus(struct udevice *dev)
 {
 	struct stm32_qspi_priv *priv = dev_get_priv(dev->parent);
 	struct dm_spi_slave_platdata *slave_plat = dev_get_parent_platdata(dev);
+	int slave_cs = slave_plat->cs;
 
-	if (slave_plat->cs >= STM32_QSPI_MAX_CHIP)
+	if (slave_cs >= STM32_QSPI_MAX_CHIP)
 		return -ENODEV;
 
-	if (priv->cs_used != slave_plat->cs) {
-		struct stm32_qspi_flash *flash = &priv->flash[slave_plat->cs];
+	if (priv->cs_used != slave_cs) {
+		struct stm32_qspi_flash *flash = &priv->flash[slave_cs];
 
-		priv->cs_used = slave_plat->cs;
+		priv->cs_used = slave_cs;
 
 		if (flash->initialized) {
 			/* Set the configuration: speed + cs */
@@ -444,11 +445,12 @@ static int stm32_qspi_set_speed(struct udevice *bus, uint speed)
 	int ret;
 
 	if (speed > 0) {
-		prescaler = DIV_ROUND_UP(qspi_clk, speed) - 1;
-		if (prescaler > 255)
-			prescaler = 255;
-		else if (prescaler < 0)
-			prescaler = 0;
+		prescaler = 0;
+		if (qspi_clk) {
+			prescaler = DIV_ROUND_UP(qspi_clk, speed) - 1;
+			if (prescaler > 255)
+				prescaler = 255;
+		}
 	}
 
 	csht = DIV_ROUND_UP((5 * qspi_clk) / (prescaler + 1), 100000000);
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
