Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B252A43A7
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Nov 2020 12:02:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2331FC36B0B;
	Tue,  3 Nov 2020 11:02:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14870C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Nov 2020 11:02:03 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A3B1jc5000520; Tue, 3 Nov 2020 12:01:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=s4ma8d0w4WII2q79JofrQpwq4zHYGe86Nxd0IFkJSVA=;
 b=qmfYo583ovazlGb1YRFxuNxblhQ7WANC0Cb4c4SybKJAhjiXT9JRuhzA55W8j9zDxQnv
 H4HVZd/KonNxrRdyOYVc0qrgTXY7en3FEvKaUAxeCNMGcKrZrO4UZDoVWBorvrsIN030
 saJjLwonVk08SFawd9y6nSwhPVq8P8xZiCPmLxQ1z19Ddv5SzFmnqXsFDAlYAQ25u9c3
 0LaUPjwsj3n1Y0pkOuJWNt8WRBaQh/OW6882dgI6SUJjgvVzH3MeomeQpNE3F2U6s6K9
 TVEJeMGkNY/A4nWtsxdLlLBg+Lsib6L24LQWSA0GjRzZackFOpM9OFqGaSSt1zbeISat Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34h00e7su1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Nov 2020 12:01:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7089810003A;
 Tue,  3 Nov 2020 12:01:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 609752461ED;
 Tue,  3 Nov 2020 12:01:59 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov 2020 12:01:18
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 3 Nov 2020 12:01:13 +0100
Message-ID: <20201103110115.12875-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201103120047.1.I30ef60ea8b13322a6ec7b675dc2de5f63f336fc3@changeid>
References: <20201103120047.1.I30ef60ea8b13322a6ec7b675dc2de5f63f336fc3@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-03_07:2020-11-03,
 2020-11-03 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Etienne Carriere <etienne.carriere@linaro.org>,
 Patrick Delaunay <patrick.delaunay@st.com>, Sean Anderson <seanga2@gmail.com>
Subject: [Uboot-stm32] [PATCH 4/4] scmi: smt: correct
	mmu_set_region_dcache_behaviour parameters
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

Since commit d877f8fd0f09 ("arm: provide a function for boards init code to
modify MMU virtual-physical map"), the mmu_set_region_dcache_behaviour_phys
parameters need to be aligned on MMU_SECTION_SIZE to avoid unpredictable
behavior (alignment was done previously done in the function
mmu_set_region_dcache_behaviour_phys).

CC: Etienne Carriere <etienne.carriere@linaro.org>
Fixes: 240720e9052f ("firmware: scmi: mailbox/smt agent device")
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/firmware/scmi/smt.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/scmi/smt.c b/drivers/firmware/scmi/smt.c
index d25478796a..b88e228dc8 100644
--- a/drivers/firmware/scmi/smt.c
+++ b/drivers/firmware/scmi/smt.c
@@ -53,9 +53,12 @@ int scmi_dt_get_smt_buffer(struct udevice *dev, struct scmi_smt *smt)
 		return -ENOMEM;
 
 #ifdef CONFIG_ARM
-	if (dcache_status())
-		mmu_set_region_dcache_behaviour((uintptr_t)smt->buf,
-						smt->size, DCACHE_OFF);
+	if (dcache_status()) {
+		uintptr_t start = ALIGN_DOWN((uintptr_t)smt->buf, MMU_SECTION_SIZE);
+		size_t size = ALIGN((uintptr_t)smt->buf - start + smt->size, MMU_SECTION_SIZE);
+
+		mmu_set_region_dcache_behaviour(start, size, DCACHE_OFF);
+    }
 #endif
 
 	return 0;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
