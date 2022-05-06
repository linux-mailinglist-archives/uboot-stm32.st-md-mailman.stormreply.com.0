Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C0751D9E4
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 May 2022 16:06:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7B4DC628B1;
	Fri,  6 May 2022 14:06:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5616BC628AA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 May 2022 14:06:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246Bv0Sv026498;
 Fri, 6 May 2022 16:06:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=wlKy7MMG49nC5Sou4Id8gxyp9//u8f6JvBkL4hXZnYU=;
 b=8DOuIifmbI1wzOFskVuEyw9vownSgtOPAlcIWTZ5aW2KNkSsVgYSKWTD2OPqjVqzUjzK
 KGimly3bY91k+JxKtpoleSvpF1oOidOQsAzheFfE1t46l+qPGnJSi/Mb84dTCMbdVkgr
 j0+K5apruvNIT+FeaxNIWPG0HyFa6Y10HfUjW/be3T07Xez/9kD5fNq3ePmi42Cp2rzg
 g8gy57Ty0K1jSqapOZKIUyib82ETJKwSjSAEWQHFhP6AtG6EryeyyIRiuBVqqU6WfZve
 loCedqHRBOhmSIa7wympd3GqcOpnkycbAcTDiS7J7bt5DozwXwCwyVRt+Jsg/q+3GeCp sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frt89b7be-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 16:06:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D62A1100034;
 Fri,  6 May 2022 16:06:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CF49D2194F9;
 Fri,  6 May 2022 16:06:28 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 6 May 2022 16:06:27
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 May 2022 16:06:10 +0200
Message-ID: <20220506160540.3.I64f8491d095549bcba2adf2bfa962c50ecca7874@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_04,2022-05-06_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 03/16] arm: stm32mp: move the get_otp helper
	function in bsec
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

As the get_otp() helper function in bsec are common for all STM32MP family,
move this function in bsec driver

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/bsec.c                   | 17 +++++++++++++++++
 arch/arm/mach-stm32mp/cpu.c                    | 17 -----------------
 arch/arm/mach-stm32mp/include/mach/sys_proto.h |  3 +++
 3 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
index 506caa0a31..c00130b08b 100644
--- a/arch/arm/mach-stm32mp/bsec.c
+++ b/arch/arm/mach-stm32mp/bsec.c
@@ -632,3 +632,20 @@ bool bsec_dbgswenable(void)
 
 	return false;
 }
+
+u32 get_otp(int index, int shift, int mask)
+{
+	int ret;
+	struct udevice *dev;
+	u32 otp = 0;
+
+	ret = uclass_get_device_by_driver(UCLASS_MISC,
+					  DM_DRIVER_GET(stm32mp_bsec),
+					  &dev);
+
+	if (!ret)
+		ret = misc_read(dev, STM32_BSEC_SHADOW(index),
+				&otp, sizeof(otp));
+
+	return (otp >> shift) & mask;
+}
diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index 0ad5f307db..6f44c75515 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -349,23 +349,6 @@ u32 get_cpu_rev(void)
 	return (read_idc() & DBGMCU_IDC_REV_ID_MASK) >> DBGMCU_IDC_REV_ID_SHIFT;
 }
 
-static u32 get_otp(int index, int shift, int mask)
-{
-	int ret;
-	struct udevice *dev;
-	u32 otp = 0;
-
-	ret = uclass_get_device_by_driver(UCLASS_MISC,
-					  DM_DRIVER_GET(stm32mp_bsec),
-					  &dev);
-
-	if (!ret)
-		ret = misc_read(dev, STM32_BSEC_SHADOW(index),
-				&otp, sizeof(otp));
-
-	return (otp >> shift) & mask;
-}
-
 /* Get Device Part Number (RPN) from OTP */
 static u32 get_cpu_rpn(void)
 {
diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
index b91f98eb45..dc98f0c5a4 100644
--- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
+++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
@@ -52,3 +52,6 @@ int setup_mac_address(void);
 
 /* board power management : configure vddcore according OPP */
 void board_vddcore_init(u32 voltage_mv);
+
+/* helper function: read data from OTP */
+u32 get_otp(int index, int shift, int mask);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
