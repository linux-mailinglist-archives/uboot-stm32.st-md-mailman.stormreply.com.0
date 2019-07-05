Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 003666091C
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jul 2019 17:20:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBB7DC36B3F
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jul 2019 15:20:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF26CC35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2019 15:20:33 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x65FFpIG006742; Fri, 5 Jul 2019 17:20:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=BEMshe6FXDME/u5zvtN43AD0MeMSkcwxdhgJIy76KvU=;
 b=KPjUM5w4WELEMl3ddQcD8XvRtkHMHFQtlRENPwSLfRRu8Tx8dK63T9rlYFxVGSYxTzYg
 Ae/TAiwACy/6b2DC+yjFVVbZ3P645tTB69eEgfMl9fsl+BAwdvDeOj3GrHBoZDitCpcr
 D4/+wGdgsK0Yu32vQISCV2z57nZhTGJ13SDFtW0hXa0TDMnYocSWECb0VCrcUbU9Mxow
 uJIYxmn0yhwz8Nx2/c5LfOxRfyfBB4THDymT/4Tb81d+FhyJsZP2oDLASq1iVzEHjWNy
 gff/kCsjskt1bKLyWJAVhJLOij9UFlM58JdkrwOs0HvDYV3rrUQKE6sxISqWLNcA62wm Tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tgx0qy821-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 05 Jul 2019 17:20:31 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1F1C331;
 Fri,  5 Jul 2019 15:20:31 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 087414FB8;
 Fri,  5 Jul 2019 15:20:31 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 5 Jul 2019
 17:20:31 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 5 Jul 2019 17:20:30
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 5 Jul 2019 17:20:10 +0200
Message-ID: <1562340023-8516-4-git-send-email-patrick.delaunay@st.com>
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
Subject: [Uboot-stm32] [PATCH v2 03/16] stm32mp1: syscon: remove etzpc
	support
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

Support for ETZPC is removed as this device is not present
in Linux kernel device tree.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2: None

 arch/arm/mach-stm32mp/include/mach/stm32.h | 1 -
 arch/arm/mach-stm32mp/syscon.c             | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
index 6795352..1e3299a 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
@@ -36,7 +36,6 @@
 /* enumerated used to identify the SYSCON driver instance */
 enum {
 	STM32MP_SYSCON_UNKNOWN,
-	STM32MP_SYSCON_ETZPC,
 	STM32MP_SYSCON_PWR,
 	STM32MP_SYSCON_STGEN,
 	STM32MP_SYSCON_SYSCFG,
diff --git a/arch/arm/mach-stm32mp/syscon.c b/arch/arm/mach-stm32mp/syscon.c
index 242f834..e10c42e 100644
--- a/arch/arm/mach-stm32mp/syscon.c
+++ b/arch/arm/mach-stm32mp/syscon.c
@@ -9,7 +9,6 @@
 #include <asm/arch/stm32.h>
 
 static const struct udevice_id stm32mp_syscon_ids[] = {
-	{ .compatible = "st,stm32mp1-etzpc", .data = STM32MP_SYSCON_ETZPC },
 	{ .compatible = "st,stm32mp1-pwr", .data = STM32MP_SYSCON_PWR },
 	{ .compatible = "st,stm32-stgen", .data = STM32MP_SYSCON_STGEN },
 	{ .compatible = "st,stm32mp157-syscfg",
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
