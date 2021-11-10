Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A2B44C5C1
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Nov 2021 18:14:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7093EC5EC6B;
	Wed, 10 Nov 2021 17:14:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98750C5EC4A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 17:14:15 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AABtZUl015764;
 Wed, 10 Nov 2021 18:14:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=cxS+urZ3MZllwZXUQQ01sf83W49FbeG/okZOkDdzdho=;
 b=ArDZ0WhYcjHDIxtyILXLqZt1pvPqeFBgq7dWbDPjmXJaSBOHnVE4BM2hjQrCDqwqJ00U
 SDf4mRWeq1WvowxzIH5cnAfbAuMuULdsPlyeQ9lRCCQ1Ew2DogYOxnNfiaFjyQVcjr03
 WvLJyO1kFTTJCvrKOMCuWtGwIEpZz/SBE5raKcSZUJBDyn5EJmvW/05k6wnW2BscRgFP
 cOMfEoOYPF7ClY4RtYzsR2PLyld8EyyZ4NvmUawgqVnyb5CfSxVitSwiBQ5KfdVyukaA
 OOQv7wmpc3AAqzmAdtYz4rr/e0BZmEemT/xsVf8njP7jsUuMhCPiPmiqw7SDV7nGY3rS NQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c8dmw1xb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 18:14:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C171110002A;
 Wed, 10 Nov 2021 18:14:12 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BA5EC20F6AA;
 Wed, 10 Nov 2021 18:14:12 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 10 Nov 2021 18:14:12
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 10 Nov 2021 18:14:10 +0100
Message-ID: <20211110181402.1.I2300405d8f776ab7d8c372b93b10bd39df4ed633@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-10_06,2021-11-08_02,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Simon Glass <sjg@chromium.org>,
 Pratyush Yadav <p.yadav@ti.com>
Subject: [Uboot-stm32] [PATCH] pinctrl: stmfx: define LOG_CATEGORY
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

 drivers/pinctrl/pinctrl-stmfx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index fe7a59d431..509e2a80e9 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -5,8 +5,12 @@
  * Driver for STMicroelectronics Multi-Function eXpander (STMFX) GPIO expander
  * based on Linux driver : pinctrl/pinctrl-stmfx.c
  */
+
+#define LOG_CATEGORY UCLASS_PINCTRL
+
 #include <common.h>
 #include <dm.h>
+#include <log.h>
 #include <i2c.h>
 #include <asm/gpio.h>
 #include <dm/device.h>
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
