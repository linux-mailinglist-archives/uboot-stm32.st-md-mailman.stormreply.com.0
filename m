Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 630234119C6
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Sep 2021 18:27:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17C52C5A4CC;
	Mon, 20 Sep 2021 16:27:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C787EC32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Sep 2021 16:27:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18KE2KwI025385; 
 Mon, 20 Sep 2021 18:27:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=wdZdqQTidQRAiYLanVUFLPFzSxuSZ0AEJtAO8UNEJak=;
 b=jIfLPpI2a65lt0Lfl5P9u0VLANAZjjKsIKiPGRqEGlrlgkSjSYwRb6955oX0xT7PnKIe
 srOP5O8XiyRxDSz/Ofh5H5XxLexAvRqBSYuA9rT/rgpx3s53ydIst0pnYSbiohnmmAST
 UaDIwOn0s8N3oeDiRNFchBbjtlqqeZSc9yFMBBsmFrsEN6aiHVPzbLNSs4ZnrwGeXDSk
 Jp20IaAe4+YoYvP1DeohJZZ3cBnT2ZIsQZoP8YwMGKPhIwmqsDw4GmXnrnAMlyHGaXwk
 Qdp3tROisIf/XPJiNfArttW52DiyJQWpzSKUBJuDvobd68+1MaJOvZNh4e3O61/BHoI+ 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b6uq3rkr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 18:27:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E8DB010002A;
 Mon, 20 Sep 2021 18:27:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E1148231DDE;
 Mon, 20 Sep 2021 18:27:31 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 20 Sep 2021 18:27:31
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 Sep 2021 18:27:20 +0200
Message-ID: <20210920182717.1.I218b17a86b820ee611e9dd643c1fb40e2b480257@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_07,2021-09-20_01,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Nandor Han <nandor.han@vaisala.com>
Subject: [Uboot-stm32] [PATCH] reboot-mode: migrate uclass to livetree
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

Use dev_ function to support a live tree.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/reboot-mode/reboot-mode-uclass.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/reboot-mode/reboot-mode-uclass.c b/drivers/reboot-mode/reboot-mode-uclass.c
index bb7a355fbf..2b38aa26b8 100644
--- a/drivers/reboot-mode/reboot-mode-uclass.c
+++ b/drivers/reboot-mode/reboot-mode-uclass.c
@@ -10,8 +10,6 @@
 #include <exports.h>
 #include <reboot-mode/reboot-mode.h>
 
-DECLARE_GLOBAL_DATA_PTR;
-
 int dm_reboot_mode_update(struct udevice *dev)
 {
 	struct reboot_mode_ops *ops = reboot_mode_get_ops(dev);
@@ -66,25 +64,20 @@ int dm_reboot_mode_pre_probe(struct udevice *dev)
 		return -EINVAL;
 
 #if CONFIG_IS_ENABLED(OF_CONTROL)
-	const int node = dev_of_offset(dev);
 	const char *mode_prefix = "mode-";
 	const int mode_prefix_len = strlen(mode_prefix);
-	int property;
+	struct ofprop property;
 	const u32 *propvalue;
 	const char *propname;
 
-	plat_data->env_variable = fdt_getprop(gd->fdt_blob,
-					      node,
-					      "u-boot,env-variable",
-					      NULL);
+	plat_data->env_variable = dev_read_string(dev, "u-boot,env-variable");
 	if (!plat_data->env_variable)
 		plat_data->env_variable = "reboot-mode";
 
 	plat_data->count = 0;
 
-	fdt_for_each_property_offset(property, gd->fdt_blob, node) {
-		propvalue = fdt_getprop_by_offset(gd->fdt_blob,
-						  property, &propname, NULL);
+	dev_for_each_property(property, dev) {
+		propvalue = dev_read_prop_by_prop(&property, &propname, NULL);
 		if (!propvalue) {
 			dev_err(dev, "Could not get the value for property %s\n",
 				propname);
@@ -100,9 +93,8 @@ int dm_reboot_mode_pre_probe(struct udevice *dev)
 
 	struct reboot_mode_mode *next = plat_data->modes;
 
-	fdt_for_each_property_offset(property, gd->fdt_blob, node) {
-		propvalue = fdt_getprop_by_offset(gd->fdt_blob,
-						  property, &propname, NULL);
+	dev_for_each_property(property, dev) {
+		propvalue = dev_read_prop_by_prop(&property, &propname, NULL);
 		if (!propvalue) {
 			dev_err(dev, "Could not get the value for property %s\n",
 				propname);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
