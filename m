Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B8FB0F69F
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Jul 2025 17:11:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0198C36B3F;
	Wed, 23 Jul 2025 15:11:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5F37C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 15:11:05 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NEpR3l030393;
 Wed, 23 Jul 2025 17:10:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=ic8QA+Ys/gQ+hgRrwJmZfT
 hZF47VCB3MfEMY5pDj+PQ=; b=qyZpLjyV8VrcSqPp+ByW2GatS7mu2FgtMaRDFa
 /1wLAuFNiwweI4ueiFalG2skcU9fkvM0CuNvIS3xTk1Luuc3xmpOacChh+ldX3l3
 kAlVLncwRcICCzSEOOnuZio07KxHoyrBpcpmAteNTVhv4mOZogqoHZpQPk5lb+2V
 SoGaxM5MVI1Y/OvOJErqbMhMNH4/jWhnnhR1kttcthmx8NUZzIEJQyMhEiY7VkT1
 rnA7lGZJzxMkYc7anWoheEyNmJ3vCLJshGNbo7P8/0bL3ouncWbP0lQI/m0hlSY8
 NSrEPNytBWElljuJlpwyJQZef8uPeFHmD4k+Q0N9YD6dCm9g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4802q2cmqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jul 2025 17:10:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 11B674005E;
 Wed, 23 Jul 2025 17:09:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C52E477F14F;
 Wed, 23 Jul 2025 17:09:18 +0200 (CEST)
Received: from localhost (10.48.86.182) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 17:09:18 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 23 Jul 2025 17:09:16 +0200
Message-ID: <20250723170913.1.I20e0e3d5851ea2e4a22b20be372800fe059cc2d1@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.182]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-23_01,2025-03-28_01
Cc: Marek Vasut <marex@denx.de>, Kongyang Liu <seashell11234455@gmail.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Peter Robinson <pbrobinson@gmail.com>, Junhui Liu <junhui.liu@pigmoral.tech>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] usb: dwc2: fix reset logic in dwc2_core_reset
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

Use GUSBCFG_FORCEHOSTMODE to detected the HOST forced mode as it is done
in the Linux driver drivers/usb/dwc2/core.c:dwc2_core_reset().

The host polling must be executed only if the current mode is host,
either due to the force HOST mode (which persists after core reset)
or the connector id pin.

The GUSBCFG_FORCEDEVMODE bits is used to force the device mode (for
example used on STM32MP1x platform) and when it is activated the DWC2 reset
failed with the trace:
"dwc2_core_reset: Waiting for GINTSTS_CURMODE_HOST timeout"

Fixes: c5d685b8993c ("usb: dwc2: Unify flush and reset logic with v4.20a support")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/usb/common/dwc2_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/common/dwc2_core.c b/drivers/usb/common/dwc2_core.c
index 63062d5cc943..37007134e5b3 100644
--- a/drivers/usb/common/dwc2_core.c
+++ b/drivers/usb/common/dwc2_core.c
@@ -17,7 +17,7 @@ int dwc2_core_reset(struct dwc2_core_regs *regs)
 	bool host_mode = false;
 
 	if (!(readl(&regs->global_regs.gotgctl) & GOTGCTL_CONID_B) ||
-	    (readl(&regs->global_regs.gusbcfg) & GUSBCFG_FORCEDEVMODE))
+	    (readl(&regs->global_regs.gusbcfg) & GUSBCFG_FORCEHOSTMODE))
 		host_mode = true;
 
 	/* Core Soft Reset */
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
