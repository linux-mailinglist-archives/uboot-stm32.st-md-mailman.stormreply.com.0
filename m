Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B9BD12E7
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Oct 2019 17:36:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C5C2C36B0F
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Oct 2019 15:36:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03AFCC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2019 15:36:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x99FVkJR014545; Wed, 9 Oct 2019 17:36:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=LZDl9eL6FooZNa7kGigVi5Iqu/Fra6uT9Mw11gENkws=;
 b=Gy4RG5YSRuGVvBIfOStKH0B04+qFM6/lw0yaAfyKJxqk4KdA5n6vdNA0p8+6WJ9I/PmP
 E6ANno4YKUDy3NPNYVs3ds1YzEVPZjQ5KdEwk8moUuUPAJqQdtKLAqoNtb2wqZ2ckp//
 rKCGV0CXxcdt5Yii07lsRTTvIjA4pwb1ElasK7tLAOnnRdmNTI7gDb0NDJpd0LmNKfrO
 L5FL7Q/ie76qfRkMEHSEpOOCLb17Ap3C2pNKqaxa2+ynoNFsmMszPVZOsqpUsQw9G0Lv
 /AOi4UuyMMHjml1BO8Z+9z6JAMJvoUj3f/MgD9nAra9G1xdIUlkz0YUncAIl4S/NTtRk 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vej2pf305-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Oct 2019 17:36:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A7358100040;
 Wed,  9 Oct 2019 17:36:43 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9E3EA2A56A7;
 Wed,  9 Oct 2019 17:36:43 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 9 Oct 2019
 17:36:43 +0200
Received: from localhost (10.201.23.25) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 9 Oct 2019 17:36:43
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>, Lokesh Vutla <lokeshvutla@ti.com>
Date: Wed, 9 Oct 2019 17:36:27 +0200
Message-ID: <1570635389-8445-4-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570635389-8445-1-git-send-email-fabien.dessenne@st.com>
References: <1570635389-8445-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-09_07:2019-10-08,2019-10-09 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH 3/5] remoteproc: stm32: load resource table
	from firmware
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

Load the optional resource table from the firmware, and write its
address in the dedicated backup register.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 drivers/remoteproc/stm32_copro.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/remoteproc/stm32_copro.c b/drivers/remoteproc/stm32_copro.c
index 40bba37..eef3416 100644
--- a/drivers/remoteproc/stm32_copro.c
+++ b/drivers/remoteproc/stm32_copro.c
@@ -23,6 +23,7 @@
  * @hold_boot_offset:	offset of the register controlling the hold boot setting
  * @hold_boot_mask:	bitmask of the register for the hold boot field
  * @is_running:		is the remote processor running
+ * @rsc_table_addr:	resource table address
  */
 struct stm32_copro_privdata {
 	struct reset_ctl reset_ctl;
@@ -30,6 +31,7 @@ struct stm32_copro_privdata {
 	uint hold_boot_offset;
 	uint hold_boot_mask;
 	bool is_running;
+	ulong rsc_table_addr;
 };
 
 /**
@@ -141,6 +143,7 @@ static void *stm32_copro_device_to_virt(struct udevice *dev, ulong da,
 static int stm32_copro_load(struct udevice *dev, ulong addr, ulong size)
 {
 	struct stm32_copro_privdata *priv;
+	ulong rsc_table_size;
 	int ret;
 
 	priv = dev_get_priv(dev);
@@ -155,6 +158,12 @@ static int stm32_copro_load(struct udevice *dev, ulong addr, ulong size)
 		return ret;
 	}
 
+	if (rproc_elf32_load_rsc_table(dev, addr, size, &priv->rsc_table_addr,
+				       &rsc_table_size)) {
+		priv->rsc_table_addr = 0;
+		dev_warn(dev, "No valid resource table for this firmware\n");
+	}
+
 	return rproc_elf32_load_image(dev, addr, size);
 }
 
@@ -180,6 +189,10 @@ static int stm32_copro_start(struct udevice *dev)
 	 * rebooting autonomously
 	 */
 	ret = stm32_copro_set_hold_boot(dev, true);
+	if (!ret)
+		/* Store rsc_address in bkp register */
+		writel(priv->rsc_table_addr, TAMP_COPRO_RSC_TBL_ADDRESS);
+
 	priv->is_running = !ret;
 	return ret;
 }
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
