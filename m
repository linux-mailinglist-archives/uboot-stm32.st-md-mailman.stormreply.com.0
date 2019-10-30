Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB9DE9C72
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 14:38:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAC80C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 13:38:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B700C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2019 13:38:51 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9UDboMk008191; Wed, 30 Oct 2019 14:38:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=20+26KR/R7jrYaGI0nbCwcM2BfLMR3/j5wUi1lmW35M=;
 b=sLuyVYS8231T6rpYf0NEq8VNpZcWrMdDH6RwOQ145zlI5Ue82Y3Hl20Yya42DigCtHgf
 cZ/5Co5HUViJQLMgzEizYCkSKCw0zBHXTVWNfMj2fFkdy8Z4eEUKm2G5sETeom8fZDl0
 E2+L+Mab5AWXeD+q6PIi7R2DRwVzrVkEFQbRs6uk000yfQa1NtHrCIOABgAwaeoz/PvS
 PcnhzFj6AwxRP3c6/XjV7p7KiHslopULbJGnzSn2zQlCTU+1Zw61vYJZCDv3HXpZPtjE
 YqUYHuClr2DcZ77/zmBPegJsyCKYaU/kRIfsJSGEEov3yOQmbtkqJ3aG3/OV5SMOKtFt xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vxwhe3xus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 14:38:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CCA5810002A;
 Wed, 30 Oct 2019 14:38:48 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C142F2BEC76;
 Wed, 30 Oct 2019 14:38:48 +0100 (CET)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 30 Oct
 2019 14:38:48 +0100
Received: from localhost (10.201.23.25) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 30 Oct 2019 14:38:48
 +0100
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>, "Lokesh
 Vutla" <lokeshvutla@ti.com>, Suman Anna <s-anna@ti.com>
Date: Wed, 30 Oct 2019 14:38:31 +0100
Message-ID: <1572442713-26353-5-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572442713-26353-1-git-send-email-fabien.dessenne@st.com>
References: <1572442713-26353-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-30_06:2019-10-30,2019-10-30 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH v2 4/6] remoteproc: stm32: track the
	coprocessor state in a backup register
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

Update the dedicated backup register to track the coprocessor state and
rely on that register to compute the .is_running() value (which expects
a return value of 0 -not 1- if the processor is running).

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 drivers/remoteproc/stm32_copro.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/stm32_copro.c b/drivers/remoteproc/stm32_copro.c
index 40bba37..dcafa54 100644
--- a/drivers/remoteproc/stm32_copro.c
+++ b/drivers/remoteproc/stm32_copro.c
@@ -22,14 +22,12 @@
  * @hold_boot_regmap:	regmap for remote processor reset hold boot
  * @hold_boot_offset:	offset of the register controlling the hold boot setting
  * @hold_boot_mask:	bitmask of the register for the hold boot field
- * @is_running:		is the remote processor running
  */
 struct stm32_copro_privdata {
 	struct reset_ctl reset_ctl;
 	struct regmap *hold_boot_regmap;
 	uint hold_boot_offset;
 	uint hold_boot_mask;
-	bool is_running;
 };
 
 /**
@@ -165,11 +163,8 @@ static int stm32_copro_load(struct udevice *dev, ulong addr, ulong size)
  */
 static int stm32_copro_start(struct udevice *dev)
 {
-	struct stm32_copro_privdata *priv;
 	int ret;
 
-	priv = dev_get_priv(dev);
-
 	/* move hold boot from true to false start the copro */
 	ret = stm32_copro_set_hold_boot(dev, false);
 	if (ret)
@@ -180,7 +175,8 @@ static int stm32_copro_start(struct udevice *dev)
 	 * rebooting autonomously
 	 */
 	ret = stm32_copro_set_hold_boot(dev, true);
-	priv->is_running = !ret;
+	writel(ret ? TAMP_COPRO_STATE_OFF : TAMP_COPRO_STATE_CRUN,
+	       TAMP_COPRO_STATE);
 	return ret;
 }
 
@@ -206,7 +202,7 @@ static int stm32_copro_reset(struct udevice *dev)
 		return ret;
 	}
 
-	priv->is_running = false;
+	writel(TAMP_COPRO_STATE_OFF, TAMP_COPRO_STATE);
 
 	return 0;
 }
@@ -224,14 +220,11 @@ static int stm32_copro_stop(struct udevice *dev)
 /**
  * stm32_copro_is_running() - Is the STM32 remote processor running
  * @dev:	corresponding STM32 remote processor device
- * @return 1 if the remote processor is running, 0 otherwise
+ * @return 0 if the remote processor is running, 1 otherwise
  */
 static int stm32_copro_is_running(struct udevice *dev)
 {
-	struct stm32_copro_privdata *priv;
-
-	priv = dev_get_priv(dev);
-	return priv->is_running;
+	return (readl(TAMP_COPRO_STATE) == TAMP_COPRO_STATE_OFF);
 }
 
 static const struct dm_rproc_ops stm32_copro_ops = {
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
