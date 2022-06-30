Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CE7561483
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jun 2022 10:17:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACE5EC5662F;
	Thu, 30 Jun 2022 08:17:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A704C03FC8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jun 2022 08:17:13 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25U2ctUI022248;
 Thu, 30 Jun 2022 10:17:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=al/sVmU0EMA4Z4z7GHPvo8lmi9IC7w+oYOScodVHA6Y=;
 b=Wfvm0hzuqTWnI9jGgCcLI5PL7LEYvweHJAhu8AAD1PBO4/pJuQSvZxqzOJ0Dv8vSRG3A
 OHjRo2cGgul06VoHQqUmtaAZBeuSEUjDhrfMdCPu7HPE4UyZEse8lIXy5IOy6makDILA
 aNP2HvQOplGfoHt36oOhFhgqWz2wRxCjDQ4taT7OuS3qYLnwdQNVtDEf5xU4u3omFxl+
 u5lSWYACrA7ONMMrR9LaZ1Wn1nW/9XXZ2VGh/kaRU/K1VpZJz1Axmg8U+WT5qS57ynLs
 GV8Lqow8t/pOl8yqKvJEWAJsFlEihNGo3UaqO0BhpWzWL+tbJjHt5PsqZdhJAPsb1mnB Kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gwsq1mee7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jun 2022 10:17:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 078F0100034;
 Thu, 30 Jun 2022 10:17:11 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 02B7A2132C1;
 Thu, 30 Jun 2022 10:17:11 +0200 (CEST)
Received: from localhost (10.75.127.45) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 30 Jun
 2022 10:16:39 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Jun 2022 10:16:27 +0200
Message-ID: <20220630101610.3.I09a7e6bd976c0720cef2de21e3acd62ff8a7b846@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630101610.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
References: <20220630101610.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_04,2022-06-28_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 03/10] stm32mp: add support of STM32MP13x Rev.Y
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

Add support of STM32MP13x Rev.Y for the Silicon revision REV_ID = 0x1003.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- fix value of CPU_REV1_2 = 0x1003, because minor version in REV_ID
  is bitfield at SoC level (0 = 0, 1 = 1, 2 = 3, 3 = 7, 4 =F, ....)

 arch/arm/mach-stm32mp/include/mach/sys_proto.h | 1 +
 arch/arm/mach-stm32mp/stm32mp13x.c             | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
index 4b564e86dc5..f19a70e53e0 100644
--- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
+++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
@@ -41,6 +41,7 @@ u32 get_cpu_dev(void);
 
 #define CPU_REV1	0x1000
 #define CPU_REV1_1	0x1001
+#define CPU_REV1_2	0x1003
 #define CPU_REV2	0x2000
 #define CPU_REV2_1	0x2001
 
diff --git a/arch/arm/mach-stm32mp/stm32mp13x.c b/arch/arm/mach-stm32mp/stm32mp13x.c
index bd3f24c349a..845d973ad1b 100644
--- a/arch/arm/mach-stm32mp/stm32mp13x.c
+++ b/arch/arm/mach-stm32mp/stm32mp13x.c
@@ -126,6 +126,9 @@ void get_soc_name(char name[SOC_NAME_SIZE])
 	case CPU_REV1_1:
 		cpu_r = "Z";
 		break;
+	case CPU_REV1_2:
+		cpu_r = "Y";
+		break;
 	default:
 		cpu_r = "?";
 		break;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
