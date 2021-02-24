Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E53C323A64
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Feb 2021 11:20:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34FD3C57B58;
	Wed, 24 Feb 2021 10:20:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAF18C57B55
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 10:20:18 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OAGtaf024888; Wed, 24 Feb 2021 11:20:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=orUC94f6bvtPXSi6qRkDpFqWh0kgcclWPU+cRiTTuSk=;
 b=t3Wtjukd/PIcYNl/YmZgRdqA9Ak5pN6fd0Ijzubpb1UUYcXJhJDEU45aPyr+Utplgzw/
 F0vDuF2p4T6+FslEX0Pkc2es4VoDf+bwSKumIZHDstKYaR1uGkckd/MNpHR8gIe7usKu
 wRU3cjfKkvoaC5jKPEw2NBSrGmQYEFyKArXTDG2zK9CmYhHUyGYvNEx2Z7so0OU2SrBX
 MZ9N+50VOCIpYLLpGM8YNEaHIf2r2Rkfsd3oHxzSv0W9iu0hfRAOGxyBZW+7wgSxJh/Z
 nHCove6RVTrEFqnogcOImaWH1J8vyKvARuPHiKs5x2/RfCkXT8Bh31zEcS916kmSKyB0 1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66tw8mf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 11:20:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3666B100034;
 Wed, 24 Feb 2021 11:20:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A814225296;
 Wed, 24 Feb 2021 11:20:15 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 24 Feb 2021 11:20:14
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 24 Feb 2021 11:19:45 +0100
Message-ID: <20210224111907.5.I9181e07a082adec8ea1c0afd5b103d005f05b860@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210224101946.32003-1-patrick.delaunay@foss.st.com>
References: <20210224101946.32003-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_03:2021-02-24,
 2021-02-24 signatures=0
Cc: Marek Vasut <marex@denx.de>, Simon Glass <sjg@chromium.org>,
 Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: [Uboot-stm32] [PATCH 5/6] scmi: cosmetic: reorder include files
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

Reorder include files in expected order.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/firmware/scmi/mailbox_agent.c     | 2 +-
 drivers/firmware/scmi/scmi_agent-uclass.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/scmi/mailbox_agent.c b/drivers/firmware/scmi/mailbox_agent.c
index 8043e2c2de..ea35e7e09e 100644
--- a/drivers/firmware/scmi/mailbox_agent.c
+++ b/drivers/firmware/scmi/mailbox_agent.c
@@ -7,11 +7,11 @@
 
 #include <common.h>
 #include <dm.h>
-#include <dm/device_compat.h>
 #include <errno.h>
 #include <mailbox.h>
 #include <scmi_agent.h>
 #include <scmi_agent-uclass.h>
+#include <dm/device_compat.h>
 #include <dm/devres.h>
 #include <linux/compat.h>
 
diff --git a/drivers/firmware/scmi/scmi_agent-uclass.c b/drivers/firmware/scmi/scmi_agent-uclass.c
index 2491e0a747..527163b5ce 100644
--- a/drivers/firmware/scmi/scmi_agent-uclass.c
+++ b/drivers/firmware/scmi/scmi_agent-uclass.c
@@ -7,11 +7,10 @@
 
 #include <common.h>
 #include <dm.h>
-#include <dm/device_compat.h>
 #include <errno.h>
 #include <scmi_agent-uclass.h>
 #include <scmi_protocols.h>
-
+#include <dm/device_compat.h>
 #include <dm/device-internal.h>
 #include <linux/compat.h>
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
