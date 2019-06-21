Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CB44E8D5
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:22:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1304CA0260
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:22:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D00B5C9FE9D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:22:14 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDGtEv032276; Fri, 21 Jun 2019 15:22:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=sBHf3t/XDqOCT9FwpblgbephLEFZoQt5gpt8AQxP8js=;
 b=bmlNO6Fdvlaw2kfRn2t7ddZFG7y6ZmOnisz0J1w1cukzVQVhL+FmgiWp4q4K/9DVgnDK
 f8xnMIpckYVYzCiEx1ZUgkx3QDX0ucQWekjPZCyjWhrUv3JexFW9fOejegaoZm3EjsNZ
 RpI3UpsXbz7bhCUxVq06iKhCvXW4Mj+luw3/RFy1RJK/ZaAKzr8o4OKv/f+CdOl8ZNNr
 0MVH7K1yX+WFlWm6vvBSfuF4CRPsV32ZjEhJqFFuqOTqv8Wb/tP7kunt+krPXzREK9i+
 bY4C6a4i+QlI0kVJLU6ZS044ix+P2eDbAz8wAUPKfdaPiuzLXwjZ3LdtISms/Ca4Gqsf xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7wxss8t5-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:22:13 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EF6C831;
 Fri, 21 Jun 2019 13:22:12 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D9A4C2A2E;
 Fri, 21 Jun 2019 13:22:12 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 15:22:12 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun 2019 15:22:12
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:21:44 +0200
Message-ID: <1561123314-709-7-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561123314-709-1-git-send-email-patrick.delaunay@st.com>
References: <1561123314-709-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 06/16] stm32mp1: export get_cpu_package
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
