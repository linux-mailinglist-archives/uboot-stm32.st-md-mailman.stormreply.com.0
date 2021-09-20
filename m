Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD3F4118B4
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Sep 2021 17:58:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E80A8C5A4CC;
	Mon, 20 Sep 2021 15:58:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 023FAC32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Sep 2021 15:58:44 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18KC9VhZ017922; 
 Mon, 20 Sep 2021 17:58:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=jRTuR0azTu09bAvClWi56zQzpCMV/O9wkJ4iDcWHf3g=;
 b=RbQXfgDPkHz+j1eX0D9IfoqcdfhZDVTs9NbW6mDa19L1+p9yu7pyJX2Hg38/H6625p/I
 HTAZbxr1lurBxTKcEOhaQ5PYctcGTjqiLXYUnPOnB21r8ovXReSv9yLPe3KXGnP7kEdZ
 uB3+mBmMRQ/b5fkFCALWcRkgVFSB0uQhG8fnpMCAAFTSfjxhRP4jS3+4LCUzZ1MbrWN8
 enJZdgNaF1/rFJ+XbadySx2cl/ns9jBpsDro+hB0KHODhagPvHYDHEJlHMPAlAueAXc/
 gX9Km4SDbGxYBdFG/uaUhUJdMLwEMs9BzwYM5qZQ/QSBTRbBYdNH8711nJF9Lo4PslCS YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b6t2c90p2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 17:58:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9C5BB10002A;
 Mon, 20 Sep 2021 17:58:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 94BC72309EA;
 Mon, 20 Sep 2021 17:58:42 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 20 Sep 2021 17:58:41
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 Sep 2021 17:58:33 +0200
Message-ID: <20210920175831.1.I218b17a86b820ee611e9dd643c1fb40e2b480257@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_07,2021-09-20_01,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH] demo: migrate uclass to livetree
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

Use dev_ function to read the sides and colour to support a live tree.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/demo/demo-uclass.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/demo/demo-uclass.c b/drivers/demo/demo-uclass.c
index 815f8de645..09f9a47d4d 100644
--- a/drivers/demo/demo-uclass.c
+++ b/drivers/demo/demo-uclass.c
@@ -10,15 +10,11 @@
 #include <dm.h>
 #include <dm-demo.h>
 #include <errno.h>
-#include <fdtdec.h>
 #include <log.h>
 #include <malloc.h>
-#include <asm/global_data.h>
 #include <asm/io.h>
 #include <linux/list.h>
 
-DECLARE_GLOBAL_DATA_PTR;
-
 UCLASS_DRIVER(demo) = {
 	.name		= "demo",
 	.id		= UCLASS_DEMO,
@@ -67,10 +63,9 @@ int demo_set_light(struct udevice *dev, int light)
 int demo_parse_dt(struct udevice *dev)
 {
 	struct dm_demo_pdata *pdata = dev_get_plat(dev);
-	int dn = dev_of_offset(dev);
 
-	pdata->sides = fdtdec_get_int(gd->fdt_blob, dn, "sides", 0);
-	pdata->colour = fdt_getprop(gd->fdt_blob, dn, "colour", NULL);
+	pdata->sides = dev_read_s32_default(dev, "sides", 0);
+	pdata->colour = dev_read_string(dev, "colour");
 	if (!pdata->sides || !pdata->colour) {
 		debug("%s: Invalid device tree data\n", __func__);
 		return -EINVAL;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
