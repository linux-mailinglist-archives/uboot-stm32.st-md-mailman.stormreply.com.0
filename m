Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEE47AF7D
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:17:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AFA8C35E03
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:17:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9A46C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:17:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHG2pN001949; Tue, 30 Jul 2019 19:17:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=RmWo7Q2AMBzgN1EYhY/f4Hp024NTHw6IlvYrW5IL68g=;
 b=WUQ0Qx4bWGTSntyJm5RsVpmk2YTNQEjR7j3JYooJq1IQ1nKl9YB3uEw8mD4g4KLFGBga
 nhaPMOZp+Utra7HD5qdrTjFFpheKbBOS5es8NnxhxyQwD/nKaXZkfva8f8/WwLf4KfKf
 0Qf8khy9k9IGtJyj8XF5Niq06lN3GK9je76IFqTtup6YiOK0BjHIBH8IN0h/2viEmHwi
 abO0wmd7f6F/ly2D/Ngrua9PYgoagAh53zZ3+S3UD/0r5XyIrJhwBHy1oq10G1l5+g1L
 iyaCtgWIxFfXN0N69Uq/45b5EyYBJoFW73b0AMp+GVH3KfhCc1pUXREGeODFJcsZ5Xrk ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u2jp4acrw-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A6F1738;
 Tue, 30 Jul 2019 17:17:15 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A09EFCEA01;
 Tue, 30 Jul 2019 19:17:15 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:17:15 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:17:15
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:21 +0200
Message-ID: <1564507016-16570-14-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
References: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 13/48] stm32mp1: configs: remove CONFIG_SYS_HZ
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

Use the default value from lib/Kconfig.


Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 include/configs/stm32mp1.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index 1bed570..033291e 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -10,11 +10,6 @@
 #include <linux/sizes.h>
 #include <asm/arch/stm32.h>
 
-/*
- * Number of clock ticks in 1 sec
- */
-#define CONFIG_SYS_HZ				1000
-
 #ifndef CONFIG_STM32MP1_TRUSTED
 /* PSCI support */
 #define CONFIG_ARMV7_PSCI_1_0
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
