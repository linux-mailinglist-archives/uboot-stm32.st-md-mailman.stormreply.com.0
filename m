Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6225F502A9C
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Apr 2022 15:00:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AA58C5E2CC;
	Fri, 15 Apr 2022 13:00:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3555CC5C829
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Apr 2022 13:00:49 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23F8Hg2G008365;
 Fri, 15 Apr 2022 15:00:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=KBXnU7Yxh5Fw53FIgkB2zBVVSClvmq9TVBcL78X1u38=;
 b=nurafcnQ81nVCuExPxI3YrdAg2UkW2J4KTRUKQz9bS7o0T21BmsjJSzzSse6SzXLGhya
 U+TcLB8UJbJ7KR0ZT6hAMFbqasc8CdNKXJfoYjp3ntZk4Qe/btEcKkFLyGpiAwhytYGP
 0VftH5cCEIwf3RtdmWoSS6Nja31280L8rTWbRdvx6xoMBomZJbXVB+jpZrfVcOLUJ3E6
 Dr6V1Jd9p845xBeGqKAuRCx7xl8VBZEx0bmOVB/tXBQva5gtcGfw+ssarjx78Sn8UD+D
 Oe8DKsxrzAHEtE8z63CbcoZvxHeGbSJO+5+1fwqGE9aaOkZbqx4vWZ2I2cQj3WwgKYN3 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fdvj5nqkr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Apr 2022 15:00:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F344710002A;
 Fri, 15 Apr 2022 15:00:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EB8B9221779;
 Fri, 15 Apr 2022 15:00:45 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 15 Apr 2022 15:00:45
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 15 Apr 2022 15:00:43 +0200
Message-ID: <20220415150041.1.I46d09f298319fd632eaee4cd8888d751b908f0e6@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-15_04,2022-04-15_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] ARM: stm32mp: correctly handle Silicon
	revision
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

Handle correctly the silicon revision = REV_ID[15:0] of Device Version
and the associated device marking, A to Z on STMicroelectronics STM32MP
SOCs.

This patch prepare the introduction of next STM32MP family,
with STM32MP13x Rev.Z for REV_ID = 1.1.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cpu.c                    | 6 +++---
 arch/arm/mach-stm32mp/include/mach/sys_proto.h | 9 +++++----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index 325d710100..0ad5f307db 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -432,13 +432,13 @@ static void get_cpu_string_offsets(unsigned int *type, unsigned int *pkg,
 
 	/* Revision */
 	switch (get_cpu_rev()) {
-	case CPU_REVA:
+	case CPU_REV1:
 		*rev = 1;
 		break;
-	case CPU_REVB:
+	case CPU_REV2:
 		*rev = 2;
 		break;
-	case CPU_REVZ:
+	case CPU_REV2_1:
 		*rev = 3;
 		break;
 	default:
diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
index 4149d3a133..b91f98eb45 100644
--- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
+++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
@@ -25,11 +25,12 @@ u32 get_cpu_type(void);
 /* return CPU_DEV constants */
 u32 get_cpu_dev(void);
 
-#define CPU_REVA	0x1000
-#define CPU_REVB	0x2000
-#define CPU_REVZ	0x2001
+#define CPU_REV1	0x1000
+#define CPU_REV1_1	0x1001
+#define CPU_REV2	0x2000
+#define CPU_REV2_1	0x2001
 
-/* return CPU_REV constants */
+/* return Silicon revision = REV_ID[15:0] of Device Version */
 u32 get_cpu_rev(void);
 
 /* Get Package options from OTP */
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
