Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECEA828784
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Jan 2024 15:00:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E65AAC6DD74;
	Tue,  9 Jan 2024 14:00:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2E3DC6DD73
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jan 2024 14:00:24 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4099FJP2014975; Tue, 9 Jan 2024 15:00:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=ze7yZBG
 3+0mLL3viz6bj3xaP1nlBrlm56zMeKLIjgdc=; b=KyojuvK84hocKKWkK6e+P/l
 hur4+nNyy2JUNd0iRICNPexlb8mCDxShfGS6vA7CUFvCiOWsn1FSUWOUKgXD6ZvJ
 5Wz8JWbsX1E4Y/Sutqdjrn1Oxrr9DihHLMQf0k4bgYxszivEYL6c3e2mo6OxIo8y
 28ajOaxl9qNXIsaU8GMM8bfAcgzPT0nqH/cxTl7FpMDzf8VKbV+kNPo7UzwbgXu2
 lKqJO3/WjrtRKEqATjpfbt1Wkq1fKNSU2rrZpSYB37jQrWFsYr5VCOhRWZTGJKpK
 IU9A/zToKE/waDZWJp5Fh5IWZY0IUAetAmexRQS4yy4WaPuiomqBJBxFIkS2xng=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vey30m39n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jan 2024 15:00:22 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6925710002A;
 Tue,  9 Jan 2024 15:00:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 569D6210F7E;
 Tue,  9 Jan 2024 15:00:22 +0100 (CET)
Received: from localhost (10.201.20.205) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 9 Jan
 2024 15:00:22 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 9 Jan 2024 15:00:17 +0100
Message-ID: <20240109140018.2015396-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.205]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Igor Opaniuk <igor.opaniuk@foundries.io>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] stm32mp2: Fix CONFIG_STM32MP25X flag usage
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

"#if" was used instead of "#ifdef"

Fixes: 01a701994b05 ("stm32mp2: initial support")
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/mach-stm32mp/include/mach/stm32.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
index 46d469881b3..175f2a88490 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
@@ -157,7 +157,7 @@ enum forced_boot_mode {
 #endif /* __ASSEMBLY__ */
 #endif /* CONFIG_STM32MP15X || CONFIG_STM32MP13X */
 
-#if CONFIG_STM32MP25X
+#ifdef CONFIG_STM32MP25X
 #define STM32_RCC_BASE			0x44200000
 #define STM32_TAMP_BASE			0x46010000
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
