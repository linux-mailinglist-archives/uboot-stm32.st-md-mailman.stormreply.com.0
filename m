Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1B153AB15
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Jun 2022 18:33:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64AB6C03FC1;
	Wed,  1 Jun 2022 16:33:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0B1DC32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Jun 2022 16:33:44 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 251FCRLM017967;
 Wed, 1 Jun 2022 18:33:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=kC9UoDIgiPe/LsBVix8PBvU4oYx6U9gg15fnKmzkmRI=;
 b=VVZnNhPQDAgVzWFr3XvHVTi5zLVT2FqTpxySw6auoHQi56NE4l2HrW/IUK/sCDM1YOx8
 c+OR//YKJgMpxLQK6JMcq3GWgEtnMGeQtRH5NeYQmJVubb6WE++JeBe2HNQFavlycTQC
 kWE3YxQLTd3gsQ/wvEuW8UPb85j/6bNSti5wRuYQWrAC4lkhzPOg4K61oGOp5B6bzY41
 MrECpr4yYpOrsW6b+Umq/XKROWwWnVkH+R3Wjf4DVkRNW2l96r6mvwQ4zI94SCOxwqOn
 PaNxgU8ZZDDU+Dj4kuH3IxVMSiZmZmWqD1MUmqQr7UphKQnO3BDg0tUBYyNm7Jmpmv0D QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gbc2vt6wb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jun 2022 18:33:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 027DD100034;
 Wed,  1 Jun 2022 18:33:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D60C922FA53;
 Wed,  1 Jun 2022 18:33:41 +0200 (CEST)
Received: from localhost (10.75.127.46) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 1 Jun
 2022 18:33:41 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 1 Jun 2022 18:33:40 +0200
Message-ID: <20220601183338.1.I50f3ce7fb4a4bb3169f40cf4bab0ec75936e5c03@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-01_05,2022-06-01_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] stm32mp: stpmic1: remove the debug unit
	request by debugger
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

Depending on backup register value, U-Boot SPL maintains the debug unit
powered-on for debugging purpose; only BUCK1 is required for powering
the debug unit, so revert the setting for all the other power lanes,
except BUCK3 that has to be always on.

To be functional this patch requires a modification in the debugger
,openocd for example, to update the STM32MP15 backup register when it is
required to debug SPL after reset. After deeper analysis this behavior
will be never supported in tools so the associated code, will be never
used and the associated code can be removed.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/include/mach/stm32.h |  1 -
 board/st/common/stpmic1.c                  | 14 --------------
 include/power/stpmic1.h                    |  3 ---
 3 files changed, 18 deletions(-)

diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
index 47e88fc3dc..13cb7db9f0 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
@@ -117,7 +117,6 @@ enum boot_device {
 #define TAMP_BOOT_DEVICE_MASK		GENMASK(7, 4)
 #define TAMP_BOOT_INSTANCE_MASK		GENMASK(3, 0)
 #define TAMP_BOOT_FORCED_MASK		GENMASK(7, 0)
-#define TAMP_BOOT_DEBUG_ON		BIT(16)
 
 enum forced_boot_mode {
 	BOOT_NORMAL = 0x00,
diff --git a/board/st/common/stpmic1.c b/board/st/common/stpmic1.c
index 5fb1be2fd3..d52dce4f65 100644
--- a/board/st/common/stpmic1.c
+++ b/board/st/common/stpmic1.c
@@ -202,18 +202,4 @@ void stpmic1_init(u32 voltage_mv)
 			STPMIC1_BUCKS_MRST_CR,
 			STPMIC1_MRST_BUCK(STPMIC1_BUCK3),
 			STPMIC1_MRST_BUCK(STPMIC1_BUCK3));
-
-	/* Check if debug is enabled to program PMIC according to the bit */
-	if (readl(TAMP_BOOT_CONTEXT) & TAMP_BOOT_DEBUG_ON) {
-		log_info("Keep debug unit ON\n");
-
-		pmic_clrsetbits(dev, STPMIC1_BUCKS_MRST_CR,
-				STPMIC1_MRST_BUCK_DEBUG,
-				STPMIC1_MRST_BUCK_DEBUG);
-
-		if (STPMIC1_MRST_LDO_DEBUG)
-			pmic_clrsetbits(dev, STPMIC1_LDOS_MRST_CR,
-					STPMIC1_MRST_LDO_DEBUG,
-					STPMIC1_MRST_LDO_DEBUG);
-	}
 }
diff --git a/include/power/stpmic1.h b/include/power/stpmic1.h
index d3567df326..201b1df762 100644
--- a/include/power/stpmic1.h
+++ b/include/power/stpmic1.h
@@ -23,12 +23,9 @@
 
 /* BUCKS_MRST_CR */
 #define STPMIC1_MRST_BUCK(buck)		BIT(buck)
-#define STPMIC1_MRST_BUCK_DEBUG		(STPMIC1_MRST_BUCK(STPMIC1_BUCK1) | \
-					 STPMIC1_MRST_BUCK(STPMIC1_BUCK3))
 
 /* LDOS_MRST_CR */
 #define STPMIC1_MRST_LDO(ldo)		BIT(ldo)
-#define STPMIC1_MRST_LDO_DEBUG		0
 
 /* BUCKx_MAIN_CR (x=1...4) */
 #define STPMIC1_BUCK_ENA		BIT(0)
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
