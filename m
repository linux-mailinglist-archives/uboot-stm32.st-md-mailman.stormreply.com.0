Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF5760920
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jul 2019 17:20:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDAA4C35E01
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jul 2019 15:20:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C0D4C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2019 15:20:36 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x65FGRqb016826; Fri, 5 Jul 2019 17:20:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=JtEfdn/7Pe4EfGVPH/ECgGlNTJ+55C0LtowJ4YBWvrI=;
 b=1HO1eH6kGG3ZxYsy4PF5wKbPmxY8uZPZOnrPvCfHglrDxuEq491pR/6Ly/frFUJ7zTEV
 6mSKeWVRV9KYmX23dVP0DB/q4sFpSwY+cB8ab84s0yf88vZUhpW+J34KmM1c0d8K2NMK
 xw6PUhOcmuSszO/1DRkFlXKFNew3ige7IVXPEeOvt6CWGDd8ffo+F9tyS5NIfq3PINh3
 Z/lXNIUUBOTGjJTqGqHAgeREhd0WuYA8ETk+SqSz8J4aGX5W+AIPYsuRmLPejrGCaBl+
 5Lmv30rVIV2F4BKNeirEzaeDkI4M0eG8EYaPwsIqFnZ72Vtm/X6vNQTzrGva5BWwc9F+ Vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tdwf1kgfn-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 05 Jul 2019 17:20:35 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BF49238;
 Fri,  5 Jul 2019 15:20:34 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AC5DB4FBA;
 Fri,  5 Jul 2019 15:20:34 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 5 Jul 2019
 17:20:34 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 5 Jul 2019 17:20:34
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 5 Jul 2019 17:20:13 +0200
Message-ID: <1562340023-8516-7-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
References: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-05_05:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 06/16] stm32mp1: export get_cpu_package
	function
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

Prepare update of package information update
in Linux device tree.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2: None

 arch/arm/mach-stm32mp/cpu.c                    | 7 +------
 arch/arm/mach-stm32mp/include/mach/sys_proto.h | 9 +++++++++
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index e1a0a13..d4f2ea8 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -78,11 +78,6 @@
 #define PKG_SHIFT	27
 #define PKG_MASK	GENMASK(2, 0)
 
-#define PKG_AA_LBGA448	4
-#define PKG_AB_LBGA354	3
-#define PKG_AC_TFBGA361	2
-#define PKG_AD_TFBGA257	1
-
 #if !defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD)
 #ifndef CONFIG_STM32MP1_TRUSTED
 static void security_init(void)
@@ -277,7 +272,7 @@ u32 get_cpu_type(void)
 }
 
 /* Get Package options from OTP */
-static u32 get_cpu_package(void)
+u32 get_cpu_package(void)
 {
 	return get_otp(BSEC_OTP_PKG, PKG_SHIFT, PKG_MASK);
 }
diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
index 71a3ba7..99eefab 100644
--- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
+++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
@@ -19,5 +19,14 @@ u32 get_cpu_type(void);
 
 /* return CPU_REV constants */
 u32 get_cpu_rev(void);
+
+/* Get Package options from OTP */
+u32 get_cpu_package(void);
+
+#define PKG_AA_LBGA448	4
+#define PKG_AB_LBGA354	3
+#define PKG_AC_TFBGA361	2
+#define PKG_AD_TFBGA257	1
+
 /* return boot mode */
 u32 get_bootmode(void);
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
