Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6535728DC89
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Oct 2020 11:17:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B949C424B2;
	Wed, 14 Oct 2020 09:17:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 585ADC424AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 09:16:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09E9CHPn010832; Wed, 14 Oct 2020 11:16:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=j5ZQW8HmvKtQ4YyPf41RvXNp14AB3k7CRTp5HpSCyxI=;
 b=aZuOgij793yRJtOUSEnV37JJ9dSxzuvZQfA1cWRpwuni0Mahps240qOXA3RG1FotDa40
 YFnVmmtoezsUipXW9VRrwCBDOh4vIEbGG36e9YU5cDoSgIzTSqrjYXbd6nX3wbzterPd
 ZhxqK5GDAvXmAkIoJgBe9eTdKxj8CAosxAYpf0BtaNTVlji2BWNjye6iPgm0KdrM67EF
 mTnlOnbC3VbJbouqtL0lcT9Doad4ryeYuNqnTOVNV59zfUN3T7uf1WamWh3oQhZr+SoD
 RFq974jvaVvDhJhFwnlFGQhRsZoPYiP412lFtetbLl3OF7ibPnIyiXbn2GCC0988Yfay sQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34353wd3sr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 11:16:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B2A35100039;
 Wed, 14 Oct 2020 11:16:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A93AB2ABA3E;
 Wed, 14 Oct 2020 11:16:55 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct 2020 11:16:55
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 14 Oct 2020 11:16:20 +0200
Message-ID: <20201014091646.4233-8-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014091646.4233-1-patrick.delaunay@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_06:2020-10-14,
 2020-10-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 07/33] ram: stm32: migrate trace to log macro
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
---

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
