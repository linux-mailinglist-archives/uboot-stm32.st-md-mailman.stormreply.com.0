Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCE743E175
	for <lists+uboot-stm32@lfdr.de>; Thu, 28 Oct 2021 15:01:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8AC3C5E2B1;
	Thu, 28 Oct 2021 13:01:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B25D7C5E2B1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Oct 2021 13:01:27 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SCR2Jd001117; 
 Thu, 28 Oct 2021 15:01:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=uPyXrQi+FzRdlJbBruk9ZlYPBCjvW9Utfa5r1rASNsY=;
 b=zbsDCI9LSGDn8fLwxwGa+eIKcSSQHjgP/zcKRW6er1AVulv/Kg4Dd4qpKXuy334tUxAR
 4naupJ3/86irX2cCTF9NB5/Hoi581OVSVNW8qWS6sHuuaAoEldnYCWklK5Rw2AY9Uxwa
 A6iFD/EW+hx4XbNwZrgV8mT2Iodbr5ZqY6geB1kZgJLrv6l+7omnOc+NzoU0q9rdJo7C
 etTlxPwjfavBCT+fdEyD6ODwjh2uqKB38pFZajWRNUPH6ulJPRYvfyI+Uk7sN6g/vE4P
 xB0m6mgOH+6Z5jVUl/4n8r8ILgcH/I3mHf73YBO9lnj/CEa69Zzslz+8zLphIJrBOP2c Jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bym0gk41x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 15:01:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0D02E10003B;
 Thu, 28 Oct 2021 15:01:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F1C42240760;
 Thu, 28 Oct 2021 15:01:24 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 28 Oct 2021 15:01:24
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 28 Oct 2021 15:01:10 +0200
Message-ID: <20211028150102.2.I674536257f276fde2471129e4809106d62e226e2@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028150102.1.I8edf9d3b9867194e233bba15ce32a1477ce4@changeid>
References: <20211028150102.1.I8edf9d3b9867194e233bba15ce32a1477ce4@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_01,2021-10-26_01,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Lukasz Majewski <lukma@denx.de>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Subject: [Uboot-stm32] [PATCH 2/5] clk: scmi: define LOG_CATEGORY
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
---

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
