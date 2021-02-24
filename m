Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BB7323A62
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Feb 2021 11:20:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22FB5C57B66;
	Wed, 24 Feb 2021 10:20:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40C6AC5718D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 10:20:16 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OAGvDk024982; Wed, 24 Feb 2021 11:20:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=6wN6d2Dg9M3g3XPbO9pI+7glBKR52gumfLM/yZkT13o=;
 b=QqSHMk6+uYTQsP+tTDX6HJk0lLPIcYYi8kT/NGfY0WofRTzLJqS333UJAra5f87Lz7B7
 ylfERlrDbnJEgpr7qePgCV8qucUwHOr4U9Y+Ia1pGfwElsfI9gC/a3XiQOlG5tUhbjO+
 PupOq+8peLMOr5ORdT1q0ZAkG9goiU3f0nF4mhVg47TfTo/0RaEtTuNz1X5Wph/XnYd2
 yEaw4pwBzHbbMVNcuJRAYbFwWPz7+OeZe7f7SQ/En6yWL9WyXjaAomb+FLM4Fxic5PH3
 Fx42X7Ah57Dq0dzXo+/OS08LuqXOcIxm+54qaExVK+NpzmjDIclFz0eZL6YYuMDHKvKU 7g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66tw8mb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 11:20:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 56E5F100034;
 Wed, 24 Feb 2021 11:20:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4B618225296;
 Wed, 24 Feb 2021 11:20:13 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 24 Feb 2021 11:20:12
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 24 Feb 2021 11:19:43 +0100
Message-ID: <20210224111907.3.I5f01e1c1c0c7f0d06dec0c0af215c1e476d730de@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210224101946.32003-1-patrick.delaunay@foss.st.com>
References: <20210224101946.32003-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_03:2021-02-24,
 2021-02-24 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Etienne Carriere <etienne.carriere@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 3/6] scmi: Include device_compat.h
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

Include the file needed for log function prototype, this patch solves the
compilation issue for undefined reference to `dev_err'.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/firmware/scmi/smccc_agent.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/scmi/smccc_agent.c b/drivers/firmware/scmi/smccc_agent.c
index 64d0929f69..81c2884bb7 100644
--- a/drivers/firmware/scmi/smccc_agent.c
+++ b/drivers/firmware/scmi/smccc_agent.c
@@ -9,6 +9,7 @@
 #include <scmi_agent.h>
 #include <scmi_agent-uclass.h>
 #include <dm/devres.h>
+#include <dm/device_compat.h>
 #include <dm/device-internal.h>
 #include <linux/arm-smccc.h>
 #include <linux/compat.h>
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
