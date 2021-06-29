Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A02ED3B705E
	for <lists+uboot-stm32@lfdr.de>; Tue, 29 Jun 2021 12:04:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64CCDC58D7F;
	Tue, 29 Jun 2021 10:04:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21F11C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jun 2021 10:04:29 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15TA2gxe029771; Tue, 29 Jun 2021 12:04:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=hB5Q38UcRdVpJC0Ftzdp/b8eoml/QhbUa7NkOxPOKXs=;
 b=zO+54tiPcMhvxLnc9wm8SopiC1MhuP63v56HXvCFIqMS8ZuzBfwH91XagRTwpXCAtVl0
 4VGTJBryGlxzdiVK+oyK4v1C4eDL1HdFyGrvYENfly31zms5xJvtSxY7M4IFKfP7jqgW
 LnEtNYwlKo+32FcCBi9sGQ13fXOaB3jAJ/lmrxvfe8W9V4jd+9g/JaQeICRqZsCVaP1v
 9emE9G68WAc4ywFhdi31L5UWWGtpfTQc4piyHwHEkf8o2iEo4GgpUx8m9N7OlSH59wfI
 i8FzBZdJIloX1q2P9iTVPJePm0fnSVKbTxgQA1TG9wTGx3/1azvrmdvo/N49cd/6Zzdb HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39fc116pkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 12:04:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 58CD4100034;
 Tue, 29 Jun 2021 12:04:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5085521ED39;
 Tue, 29 Jun 2021 12:04:26 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 29 Jun 2021 12:04:26
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 29 Jun 2021 12:04:23 +0200
Message-ID: <20210629120417.2.I6cc80b366a817fee3a61c5c284a208ca1a2d6188@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629120417.1.I711fb255292d0f086a2632041897c48c163403bd@changeid>
References: <20210629120417.1.I711fb255292d0f086a2632041897c48c163403bd@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-29_05:2021-06-28,
 2021-06-29 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 2/2] stm32mp: syscon: manage clock when
	present in device tree
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

Enable the clocks during syscon probe when they are present in device tree.

This patch avoids a freeze when the SYSCFG clock is not enabled by
TF-A / OP-TEE.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/syscon.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/mach-stm32mp/syscon.c b/arch/arm/mach-stm32mp/syscon.c
index 3e61ce4097..a0e8e1dfdc 100644
--- a/arch/arm/mach-stm32mp/syscon.c
+++ b/arch/arm/mach-stm32mp/syscon.c
@@ -4,6 +4,7 @@
  */
 
 #include <common.h>
+#include <clk.h>
 #include <dm.h>
 #include <syscon.h>
 #include <asm/arch/stm32.h>
@@ -14,9 +15,22 @@ static const struct udevice_id stm32mp_syscon_ids[] = {
 	{ }
 };
 
+static int stm32mp_syscon_probe(struct udevice *dev)
+{
+	struct clk_bulk clk_bulk;
+	int ret;
+
+	ret = clk_get_bulk(dev, &clk_bulk);
+	if (!ret)
+		clk_enable_bulk(&clk_bulk);
+
+	return 0;
+}
+
 U_BOOT_DRIVER(syscon_stm32mp) = {
 	.name = "stmp32mp_syscon",
 	.id = UCLASS_SYSCON,
 	.of_match = stm32mp_syscon_ids,
 	.bind = dm_scan_fdt_dev,
+	.probe = stm32mp_syscon_probe,
 };
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
