Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6544833CFDB
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Mar 2021 09:29:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2217BC57B55;
	Tue, 16 Mar 2021 08:29:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A95AC56632
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 08:29:51 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12G8LcQ8017603; Tue, 16 Mar 2021 09:29:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=DKixtIb0gSEl2t4zJHKC6un44TOrA7ii0ZShXJ889SI=;
 b=ADxFDIYg2dHYSqPwfcEp7areOJ/1F1pzr0lGBElKW7cwmalsHPeNO//WYXQZUnaYDwjc
 8A7vp8ac3zw4WFYy9qSN+7m3KMikN0L5StLjG3WJP4vMG44SL0IoxfW6sDbuklpZvFYR
 XScIc1e3FqJjVvUeTzTTmuz9xzSQXFMdlqGwMC7Tr1u9RBuGf+YRuvAq5dtXMP1prWNI
 or9xnuVdjxF7sQeRuB1wNhY64RFyfk3fu+hU2LPeewqmtMJHU48w/mu3Jza5jsGxAIqx
 ptvAbfYuGbK64tGCyx91BNu1evRXDFkrQ2q7nXxy+5qEw7bu3lLweiaEn6qhgXoWSLLa vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37a8pqvrr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 09:29:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1694610002A;
 Tue, 16 Mar 2021 09:29:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 09C0A21A04C;
 Tue, 16 Mar 2021 09:29:48 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 16 Mar 2021 09:29:47
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 16 Mar 2021 09:29:40 +0100
Message-ID: <20210316092937.1.Ie4df1c787d51eb06945ee580b4ff5248c609ab7b@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-16_03:2021-03-15,
 2021-03-16 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Etienne Carriere <etienne.carriere@linaro.org>,
 Sean Anderson <seanga2@gmail.com>
Subject: [Uboot-stm32] [PATCH] scmi: correctly configure MMU for SCMI buffer
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

Align the MMU area for SCMI shared buffer on section size;
use the ALIGN macro in mmu_set_region_dcache_behaviour call.

Since commit d877f8fd0f09 ("arm: provide a function for boards init
code to modify MMU virtual-physical map") the parameter of
mmu_set_region_dcache_behaviour need to be MMU_SECTION_SIZE
aligned.

Fixes: 240720e9052f ("firmware: scmi: mailbox/smt agent device")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/firmware/scmi/smt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/scmi/smt.c b/drivers/firmware/scmi/smt.c
index d25478796a..3c41013bca 100644
--- a/drivers/firmware/scmi/smt.c
+++ b/drivers/firmware/scmi/smt.c
@@ -54,8 +54,10 @@ int scmi_dt_get_smt_buffer(struct udevice *dev, struct scmi_smt *smt)
 
 #ifdef CONFIG_ARM
 	if (dcache_status())
-		mmu_set_region_dcache_behaviour((uintptr_t)smt->buf,
-						smt->size, DCACHE_OFF);
+		mmu_set_region_dcache_behaviour(ALIGN_DOWN((uintptr_t)smt->buf, MMU_SECTION_SIZE),
+						ALIGN(smt->size, MMU_SECTION_SIZE),
+						DCACHE_OFF);
+
 #endif
 
 	return 0;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
