Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 140ECAE97F1
	for <lists+uboot-stm32@lfdr.de>; Thu, 26 Jun 2025 10:18:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 733E9C30883;
	Thu, 26 Jun 2025 08:18:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3171BC36B0E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jun 2025 08:18:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q7hxWR025231;
 Thu, 26 Jun 2025 10:18:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=7NAlMoKCm2gHemic1XZt31
 9da8NkVaNqENxQRk0FXe8=; b=3pl5xMoptB/D549iGg8XksZkdTpoG2itiSC5ND
 YNEBG6tNKmWmMiRb8O/SW0mGPUE74NGXuCX49oc3h/XEzCrE/+lQPUtAuioqOHzI
 tym+oMyBUE7ZhTVbC78yMOOfhbzRcS5UtTChnIZoVbX75125adtpVi5aSkwNKkXg
 EMcR8TC9EAVmCPokmbgk3SZLg94a90LiXrWikK5ZP7dNjTm3Kg4zUcDb0Au3q92G
 vBB1bHp+tf9ckNA3CgHMBKT4vYV2CLtItyaoewjH/e93fPTgo6MFU9+E+pSKh8Kj
 K85mP18Mga9G1dnZhQbiCU6doTOVq2ihMonQZ3UpgQfzjlYg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dkmjw40c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Jun 2025 10:18:19 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8824B40053;
 Thu, 26 Jun 2025 10:17:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 231FEB1C00D;
 Thu, 26 Jun 2025 10:17:24 +0200 (CEST)
Received: from localhost (10.252.13.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 10:17:23 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 26 Jun 2025 10:17:21 +0200
Message-ID: <20250626081721.49349-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.13.141]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_04,2025-06-25_01,2025-03-28_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH] arm: stm32mp: replace space by tab in
	sys_proto.h
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

Cosmetic update to replace space by tab in sys_proto.h

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 .../arm/mach-stm32mp/include/mach/sys_proto.h | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
index 19073668497..5d67589bc79 100644
--- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
+++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
@@ -31,22 +31,22 @@
 #define CPU_STM32MP131Dxx	0x05010EC9
 
 /* ID for STM32MP25x = Device Part Number (RPN) (bit31:0) */
-#define CPU_STM32MP257Cxx       0x00002000
-#define CPU_STM32MP255Cxx       0x00082000
-#define CPU_STM32MP253Cxx       0x000B2004
-#define CPU_STM32MP251Cxx       0x000B3065
-#define CPU_STM32MP257Axx       0x40002E00
-#define CPU_STM32MP255Axx       0x40082E00
-#define CPU_STM32MP253Axx       0x400B2E04
-#define CPU_STM32MP251Axx       0x400B3E65
-#define CPU_STM32MP257Fxx       0x80002000
-#define CPU_STM32MP255Fxx       0x80082000
-#define CPU_STM32MP253Fxx       0x800B2004
-#define CPU_STM32MP251Fxx       0x800B3065
-#define CPU_STM32MP257Dxx       0xC0002E00
-#define CPU_STM32MP255Dxx       0xC0082E00
-#define CPU_STM32MP253Dxx       0xC00B2E04
-#define CPU_STM32MP251Dxx       0xC00B3E65
+#define CPU_STM32MP257Cxx	0x00002000
+#define CPU_STM32MP255Cxx	0x00082000
+#define CPU_STM32MP253Cxx	0x000B2004
+#define CPU_STM32MP251Cxx	0x000B3065
+#define CPU_STM32MP257Axx	0x40002E00
+#define CPU_STM32MP255Axx	0x40082E00
+#define CPU_STM32MP253Axx	0x400B2E04
+#define CPU_STM32MP251Axx	0x400B3E65
+#define CPU_STM32MP257Fxx	0x80002000
+#define CPU_STM32MP255Fxx	0x80082000
+#define CPU_STM32MP253Fxx	0x800B2004
+#define CPU_STM32MP251Fxx	0x800B3065
+#define CPU_STM32MP257Dxx	0xC0002E00
+#define CPU_STM32MP255Dxx	0xC0082E00
+#define CPU_STM32MP253Dxx	0xC00B2E04
+#define CPU_STM32MP251Dxx	0xC00B3E65
 
 /* return CPU_STMP32MP...Xxx constants */
 u32 get_cpu_type(void);
-- 
2.25.1

base-commit: 3b164fd951a9e93a13e793588cbcd3182089ec48
branch: upstream_cosmetic
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
