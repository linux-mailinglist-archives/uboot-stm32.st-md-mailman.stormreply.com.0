Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D364B4118AE
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Sep 2021 17:56:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 789D8C5A4CC;
	Mon, 20 Sep 2021 15:56:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FB11C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Sep 2021 15:56:20 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18KC9ZCu017961; 
 Mon, 20 Sep 2021 17:56:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=UCufCHfHUq37IxWmmkYAFYmSshV7KIPu8UMlCS91hoM=;
 b=M2OhEvXPujgNMQwRA2OTkk9yyhT4JR51CMV+kswD0D/UTYOISvtdOdmf6zJI1d8QkZ2e
 gSTq2h/FxKwNJBnCUZHKFeOdt6ASRl488+KbnSLNCIR2I+LqMDeQheF07znWb58PeCsh
 JycwJXYp05nRgvYxFSG0CMS12inslFBH5KJSrSJruJtjdNbtW+D27gsNUUp8ABuFOd3q
 VdXigXH6FyG/k3Dg4bw0jGTKVo+jdXWGkK7F5yrjnVQQ4HyLhS/ewYBs7XvLfcp8kY5Q
 UNCHzdyiM48zte0ydNLGjqlbIkZA8u/yx37mJq0xNmmM4QtfOBL7g00447ZdNiaJVkzh 8A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b6t2c90br-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 17:56:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 747B110002A;
 Mon, 20 Sep 2021 17:56:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 50FC92309E0;
 Mon, 20 Sep 2021 17:56:13 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 20 Sep 2021 17:56:12
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 Sep 2021 17:56:06 +0200
Message-ID: <20210920175547.1.I72392b8ba601c9d559c976adcbfb03bd5b559833@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_07,2021-09-20_01,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Pratyush Yadav <p.yadav@ti.com>
Subject: [Uboot-stm32] [PATCH] remoteproc: migrate uclass to livetree
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

Use dev_ function to read the name and boolean to support a live tree.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/remoteproc/rproc-uclass.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/rproc-uclass.c b/drivers/remoteproc/rproc-uclass.c
index 64c47c1e72..87e1ec7ad7 100644
--- a/drivers/remoteproc/rproc-uclass.c
+++ b/drivers/remoteproc/rproc-uclass.c
@@ -9,19 +9,15 @@
 #define pr_fmt(fmt) "%s: " fmt, __func__
 #include <common.h>
 #include <errno.h>
-#include <fdtdec.h>
 #include <log.h>
 #include <malloc.h>
 #include <remoteproc.h>
-#include <asm/global_data.h>
 #include <asm/io.h>
 #include <dm/device-internal.h>
 #include <dm.h>
 #include <dm/uclass.h>
 #include <dm/uclass-internal.h>
 
-DECLARE_GLOBAL_DATA_PTR;
-
 /**
  * for_each_remoteproc_device() - iterate through the list of rproc devices
  * @fn: check function to call per match, if this function returns fail,
@@ -121,21 +117,13 @@ static int rproc_pre_probe(struct udevice *dev)
 
 	if (!dev_get_plat(dev)) {
 #if CONFIG_IS_ENABLED(OF_CONTROL)
-		int node = dev_of_offset(dev);
-		const void *blob = gd->fdt_blob;
 		bool tmp;
-		if (!blob) {
-			debug("'%s' no dt?\n", dev->name);
-			return -EINVAL;
-		}
 		debug("'%s': using fdt\n", dev->name);
-		uc_pdata->name = fdt_getprop(blob, node,
-					     "remoteproc-name", NULL);
+		uc_pdata->name = dev_read_string(dev, "remoteproc-name");
 
 		/* Default is internal memory mapped */
 		uc_pdata->mem_type = RPROC_INTERNAL_MEMORY_MAPPED;
-		tmp = fdtdec_get_bool(blob, node,
-				      "remoteproc-internal-memory-mapped");
+		tmp = dev_read_bool(dev, "remoteproc-internal-memory-mapped");
 		if (tmp)
 			uc_pdata->mem_type = RPROC_INTERNAL_MEMORY_MAPPED;
 #else
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
