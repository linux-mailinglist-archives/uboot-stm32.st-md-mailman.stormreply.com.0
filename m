Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A14A9C9EF
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Apr 2025 15:16:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8487DC78F9A;
	Fri, 25 Apr 2025 13:16:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC64FC78F97
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Apr 2025 13:16:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8APsS008990;
 Fri, 25 Apr 2025 15:16:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 azMmIAQMglUtYecfy+YgpaSpRdolkcwn9y3y+/Yx1Nk=; b=FeQHJaJp3U9dYjC7
 ot8ZX/Ng/p3Ka9v3HY3EgvnpacotKS2L4iKo7xAdzacSW+Ne+O0hyiUJemWa/9Rl
 Df6TUKA0wy8mAt293xfL8VeJUIQI5s//lNzpJOO05ISFUnnAOfNWxL+fkppi1RCC
 x0po/gg9YKdmm8ALyhq3Mb9Adpw4RLvdeRaw/Uif697hm4uCgKsgBZSTNgceIAWp
 EueIJNKKe6jCCZCX0P0w/70vz6ZhYC/D9OxtnZg8GywAIC+iyUrF5SPNzcgQvKhi
 Dd0YaH+kqC9qkSAzdpU8gI1tIBx1gzgepZ0UuJGR4w7E1nXZZbFeD5zlCD545Sko
 1u2oDg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jjxm8j2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Apr 2025 15:16:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6E6A140057;
 Fri, 25 Apr 2025 15:16:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C06FF90BF7F;
 Fri, 25 Apr 2025 15:15:52 +0200 (CEST)
Received: from localhost (10.252.18.92) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 15:15:52 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 25 Apr 2025 15:15:27 +0200
Message-ID: <20250425131533.392747-17-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250425131533.392747-1-patrice.chotard@foss.st.com>
References: <20250425131533.392747-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.18.92]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_03,2025-04-24_02,2025-02-21_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH v2 16/22] arm: stm32mp: implement new
	STM32MP25 revision ID system
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

From: Patrick Delaunay <patrick.delaunay@foss.st.com>

The STM32MP25 revision ID are now defined with the OTP102, this patch
implements this new system.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice CHOTARD <patrice.chotard@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

(no changes since v1)

 arch/arm/mach-stm32mp/include/mach/stm32.h    |  1 +
 .../arm/mach-stm32mp/include/mach/sys_proto.h | 11 +++++++++-
 arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c   | 21 ++++++++++++++-----
 3 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
index 156009f51e3..a9ac49bc5d2 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
@@ -212,6 +212,7 @@ enum forced_boot_mode {
 #ifdef CONFIG_STM32MP25X
 #define BSEC_OTP_SERIAL	5
 #define BSEC_OTP_RPN	9
+#define BSEC_OTP_REVID	102
 #define BSEC_OTP_PKG	122
 #define BSEC_OTP_BOARD	246
 #define BSEC_OTP_MAC	247
diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
index 2a65efc0a50..0770f0a0cf6 100644
--- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
+++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
@@ -58,6 +58,7 @@ u32 get_cpu_type(void);
 /* return CPU_DEV constants */
 u32 get_cpu_dev(void);
 
+/* Silicon revision = REV_ID[15:0] of Device Version */
 #define CPU_REV1	0x1000
 #define CPU_REV1_1	0x1001
 #define CPU_REV1_2	0x1003
@@ -65,7 +66,15 @@ u32 get_cpu_dev(void);
 #define CPU_REV2_1	0x2001
 #define CPU_REV2_2	0x2003
 
-/* return Silicon revision = REV_ID[15:0] of Device Version */
+/* OTP revision ID = 6 bits : 3 for Major / 3 for Minor */
+#define OTP_REVID_1	0b001000
+#define OTP_REVID_1_1	0b001001
+#define OTP_REVID_1_2	0b001010
+#define OTP_REVID_2	0b010000
+#define OTP_REVID_2_1	0b010001
+#define OTP_REVID_2_2	0b010010
+
+/* return SoC revision = Silicon revision (STM32MP1) or OTP revision ID (STM32MP2)*/
 u32 get_cpu_rev(void);
 
 /* Get Package options from OTP */
diff --git a/arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c b/arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c
index 7f896a0d65d..ac229bdf7cc 100644
--- a/arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c
+++ b/arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c
@@ -15,8 +15,10 @@
 #define SYSCFG_DEVICEID_OFFSET		0x6400
 #define SYSCFG_DEVICEID_DEV_ID_MASK	GENMASK(11, 0)
 #define SYSCFG_DEVICEID_DEV_ID_SHIFT	0
-#define SYSCFG_DEVICEID_REV_ID_MASK	GENMASK(31, 16)
-#define SYSCFG_DEVICEID_REV_ID_SHIFT	16
+
+/* Revision ID = OTP102[5:0] 6 bits : 3 for Major / 3 for Minor*/
+#define REVID_SHIFT	0
+#define REVID_MASK	GENMASK(5, 0)
 
 /* Device Part Number (RPN) = OTP9 */
 #define RPN_SHIFT	0
@@ -46,7 +48,7 @@ u32 get_cpu_dev(void)
 
 u32 get_cpu_rev(void)
 {
-	return (read_deviceid() & SYSCFG_DEVICEID_REV_ID_MASK) >> SYSCFG_DEVICEID_REV_ID_SHIFT;
+	return get_otp(BSEC_OTP_REVID, REVID_SHIFT, REVID_MASK);
 }
 
 /* Get Device Part Number (RPN) from OTP */
@@ -164,12 +166,21 @@ void get_soc_name(char name[SOC_NAME_SIZE])
 		}
 		/* REVISION */
 		switch (get_cpu_rev()) {
-		case CPU_REV1:
+		case OTP_REVID_1:
 			cpu_r = "A";
 			break;
-		case CPU_REV2:
+		case OTP_REVID_1_1:
+			cpu_r = "Z";
+			break;
+		case OTP_REVID_2:
 			cpu_r = "B";
 			break;
+		case OTP_REVID_2_1:
+			cpu_r = "Y";
+			break;
+		case OTP_REVID_2_2:
+			cpu_r = "X";
+			break;
 		default:
 			break;
 		}
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
