Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C55D443E465
	for <lists+uboot-stm32@lfdr.de>; Thu, 28 Oct 2021 16:57:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55720C5E2BA;
	Thu, 28 Oct 2021 14:57:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B8CFC5E2B7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Oct 2021 14:57:32 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SCR0LH000352; 
 Thu, 28 Oct 2021 16:57:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=QYNrbKSSss5PmfJ9vbr3JSZkhQkGVoOGabR3ka42duc=;
 b=m48Or8HOWBseJzk3r+VY7Dfyb3xygJ82eWFp1hvedfNNHkOQAsX4cocNmi5ofwtCnbrE
 Li5l6cg1HS9Py4HF8El5eO8QWj7tFTaIaiBCu8/B2sm7/CpsRofX3Yb6i8nAxOn5KGDN
 Hsr275W2NUI7vX5VEAN4pu1A0GoCjrN3M8yRC5dNZoU5yRgbjVmxz3jmHXr+qTQl+MsI
 27KcmHU8Eb8SfObjuFJ83o3gS0wHYcLBVZFECj0hO5QyuA9KUfsueA2ysR4pjS1By4iq
 b7MxWGL5R7vNZBTmgwgoBQ0vbLmcBvhLzNn1Xgnx23oJbkrlu5kW3SAG6Wap8p0MNw/W /w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bym0gkqek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 16:57:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 25509100034;
 Thu, 28 Oct 2021 16:57:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 144CA21152C;
 Thu, 28 Oct 2021 16:57:30 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 28 Oct 2021 16:57:29
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 28 Oct 2021 16:57:23 +0200
Message-ID: <20211028165656.v2.2.I674536257f276fde2471129e4809106d62e226e2@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028165656.v2.1.I8edf9d3b9867194e233bba15ce32a1477ce4@changeid>
References: <20211028165656.v2.1.I8edf9d3b9867194e233bba15ce32a1477ce4@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_01,2021-10-26_01,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Lukasz Majewski <lukma@denx.de>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 2/5] clk: scmi: define LOG_CATEGORY
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

Define LOG_CATEGORY to allow filtering with log command.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Acked-by: Etienne Carriere <etienne.carriere@linaro.org>
---

(no changes since v1)

 drivers/clk/clk_scmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk_scmi.c b/drivers/clk/clk_scmi.c
index 93a4819501..9a0a6f6643 100644
--- a/drivers/clk/clk_scmi.c
+++ b/drivers/clk/clk_scmi.c
@@ -2,6 +2,9 @@
 /*
  * Copyright (C) 2019-2020 Linaro Limited
  */
+
+#define LOG_CATEGORY UCLASS_CLK
+
 #include <common.h>
 #include <clk-uclass.h>
 #include <dm.h>
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
