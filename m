Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF099E9C74
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 14:38:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA58FC36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 13:38:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 312BCC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2019 13:38:53 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9UDbqR0008212; Wed, 30 Oct 2019 14:38:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=3X568Z5UXc5uqYtQgKiw/2JeDO/BBhwUUrUDbaiyz4o=;
 b=YMhU3PZCPS1ncNCeoZTm94nirYTu6Yz6TwiNCePwmtSXSMXjUgKiYcNyqLcdzgw4Jgjb
 Ns1j49/d6HWCTwQB+NWwsVGqtG+w2UB1mosLXxvcuZRuESAEe3fFbvGi4/zF2emtOLC9
 EnuRDeLkHMWZy8RE35c8rpB/mi31V6ribelOAUXEOlz7XXm9loaQLG93lCttnORl0H4h
 gO6mxdq6aXjw2pUyDxjSFK16zOFsQYLkdgd9QpX/+CfgVH1O1BJexaSQtdoS6QPqVeVs
 tIc8X9A2BAQo/bTi/xJAq/Er4AzPTGYtur01zLAL+RqDYvg3JHBmLo4MRTePx+XomfXK kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vxwhe3xuy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 14:38:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9ED1010002A;
 Wed, 30 Oct 2019 14:38:50 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 93AC62BEC75;
 Wed, 30 Oct 2019 14:38:50 +0100 (CET)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 30 Oct
 2019 14:38:50 +0100
Received: from localhost (10.201.23.25) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 30 Oct 2019 14:38:50
 +0100
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>, "Lokesh
 Vutla" <lokeshvutla@ti.com>, Suman Anna <s-anna@ti.com>
Date: Wed, 30 Oct 2019 14:38:33 +0100
Message-ID: <1572442713-26353-7-git-send-email-fabien.dessenne@st.com>
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
Subject: [Uboot-stm32] [PATCH v2 6/6] remoteproc: stm32: load resource table
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
 drivers/remoteproc/stm32_copro.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/remoteproc/stm32_copro.c b/drivers/remoteproc/stm32_copro.c
index dcafa54..c25488f 100644
--- a/drivers/remoteproc/stm32_copro.c
+++ b/drivers/remoteproc/stm32_copro.c
@@ -22,12 +22,14 @@
  * @hold_boot_regmap:	regmap for remote processor reset hold boot
  * @hold_boot_offset:	offset of the register controlling the hold boot setting
  * @hold_boot_mask:	bitmask of the register for the hold boot field
+ * @rsc_table_addr:	resource table address
  */
 struct stm32_copro_privdata {
 	struct reset_ctl reset_ctl;
 	struct regmap *hold_boot_regmap;
 	uint hold_boot_offset;
 	uint hold_boot_mask;
+	ulong rsc_table_addr;
 };
 
 /**
@@ -139,6 +141,7 @@ static void *stm32_copro_device_to_virt(struct udevice *dev, ulong da,
 static int stm32_copro_load(struct udevice *dev, ulong addr, ulong size)
 {
 	struct stm32_copro_privdata *priv;
+	ulong rsc_table_size;
 	int ret;
 
 	priv = dev_get_priv(dev);
@@ -153,6 +156,12 @@ static int stm32_copro_load(struct udevice *dev, ulong addr, ulong size)
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
 
@@ -163,8 +172,11 @@ static int stm32_copro_load(struct udevice *dev, ulong addr, ulong size)
  */
 static int stm32_copro_start(struct udevice *dev)
 {
+	struct stm32_copro_privdata *priv;
 	int ret;
 
+	priv = dev_get_priv(dev);
+
 	/* move hold boot from true to false start the copro */
 	ret = stm32_copro_set_hold_boot(dev, false);
 	if (ret)
@@ -177,6 +189,10 @@ static int stm32_copro_start(struct udevice *dev)
 	ret = stm32_copro_set_hold_boot(dev, true);
 	writel(ret ? TAMP_COPRO_STATE_OFF : TAMP_COPRO_STATE_CRUN,
 	       TAMP_COPRO_STATE);
+	if (!ret)
+		/* Store rsc_address in bkp register */
+		writel(priv->rsc_table_addr, TAMP_COPRO_RSC_TBL_ADDRESS);
+
 	return ret;
 }
 
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
