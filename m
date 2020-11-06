Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8CB2A9B67
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 19:02:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86161C3FAD9;
	Fri,  6 Nov 2020 18:02:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D78EC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 18:02:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6HwEnV022600; Fri, 6 Nov 2020 19:02:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=qqUw/es8/Z+ljTeI1ScuZAVj6+iE0DJjoBamcFUogyg=;
 b=WUCPKijinvf5iI0cwQFYV0flaT3HxRLrAJ+PiRZci6dlFOfmvMZjkivQqcTMNGTubGYu
 Yr7h1JuvyLpzeBJw5uWoanfZxHZfhWJ6PotaMO23q3UY/wG7LsjXX+JX/O7NfciNNdCF
 dVUbrNqao7OZs4zxOtrYEQjSLSoYjeY8qNyuTm1v8yndoiajCCr29f8V+t8YmqnyF2Ly
 0uxlrdC+C81dRyj+qgoi+wlmInfC1S9pHlgtiFj0CPQbwvS95tbP5ZFQlhiclkl+vFuY
 FWNjPArRW7BC5Lwni0yBnNpEyTFiLJHEzfUvQWDp6JcU6kr5bzaUh6c9JKD6t2bdgMfw GQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gywrfv0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 19:02:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C3A7910002A;
 Fri,  6 Nov 2020 19:02:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BBFEF24C782;
 Fri,  6 Nov 2020 19:02:16 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 19:02:16
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 19:01:35 +0100
Message-ID: <20201106180201.31784-8-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106180201.31784-1-patrick.delaunay@st.com>
References: <20201106180201.31784-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 07/33] ram: stm32: migrate trace to log
	macro
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

Define LOG_CATEGORY, change debug to dev_dbg and remove "%s:" __func__
header as it is managed by dev macro (dev->name is displayed)

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---

(no changes since v1)

 drivers/ram/stm32_sdram.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/ram/stm32_sdram.c b/drivers/ram/stm32_sdram.c
index 3fddf4df96..9e0e70ca97 100644
--- a/drivers/ram/stm32_sdram.c
+++ b/drivers/ram/stm32_sdram.c
@@ -4,6 +4,8 @@
  * Author(s): Vikas Manocha, <vikas.manocha@st.com> for STMicroelectronics.
  */
 
+#define LOG_CATEGORY UCLASS_RAM
+
 #include <common.h>
 #include <clk.h>
 #include <dm.h>
@@ -272,7 +274,7 @@ static int stm32_fmc_ofdata_to_platdata(struct udevice *dev)
 	ret = dev_read_phandle_with_args(dev, "st,syscfg", NULL, 0, 0,
 						 &args);
 	if (ret) {
-		dev_dbg(dev, "%s: can't find syscon device (%d)\n", __func__, ret);
+		dev_dbg(dev, "can't find syscon device (%d)\n", ret);
 	} else {
 		syscfg_base = (u32 *)ofnode_get_addr(args.node);
 
@@ -281,7 +283,7 @@ static int stm32_fmc_ofdata_to_platdata(struct udevice *dev)
 			/* set memory mapping selection */
 			clrsetbits_le32(syscfg_base, MEM_MODE_MASK, mem_remap);
 		} else {
-			dev_dbg(dev, "%s: cannot find st,mem_remap property\n", __func__);
+			dev_dbg(dev, "cannot find st,mem_remap property\n");
 		}
 		
 		swp_fmc = dev_read_u32_default(dev, "st,swp_fmc", NOT_FOUND);
@@ -289,7 +291,7 @@ static int stm32_fmc_ofdata_to_platdata(struct udevice *dev)
 			/* set fmc swapping selection */
 			clrsetbits_le32(syscfg_base, SWP_FMC_MASK, swp_fmc << SWP_FMC_OFFSET);
 		} else {
-			dev_dbg(dev, "%s: cannot find st,swp_fmc property\n", __func__);
+			dev_dbg(dev, "cannot find st,swp_fmc property\n");
 		}
 
 		dev_dbg(dev, "syscfg %x = %x\n", (u32)syscfg_base, *syscfg_base);
@@ -348,7 +350,7 @@ static int stm32_fmc_ofdata_to_platdata(struct udevice *dev)
 	}
 
 	params->no_sdram_banks = bank;
-	debug("%s, no of banks = %d\n", __func__, params->no_sdram_banks);
+	dev_dbg(dev, "no of banks = %d\n", params->no_sdram_banks);
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
