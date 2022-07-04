Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 743235652B5
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Jul 2022 12:46:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D6E1C640ED;
	Mon,  4 Jul 2022 10:46:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DDA2C640EB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jul 2022 10:46:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 264ANkOD007813;
 Mon, 4 Jul 2022 12:46:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=waw/hAVoTZhRC8S0Z8biwndfw3KapllOKWf6+JMp8jk=;
 b=WJUu0t62Jf8YNVMflAdA9W7JlI9APcjmhTKS6P/xCd0MqxwH1/c6rKe7ea4d8KSsyKWQ
 SrTCuBY4Ih+0mNVAZQA5WuAGHYjJexNsX9NNbvvDJJ6HdMH5b0LGWFp2ExRuBPm+xOpS
 Jq/ekPntdbm7fbn4/zYa2EjDA5B8OtCRDijJxg+7JWUyZki3/pZcsiTuMH1B6EVIBIMG
 VBs0SsGmcvitl/IQsWeLwCk15WCfAOPA3zEVb7xIYLz9tpkqbGi52/G9RvxltubY2m/w
 N6ipAFXbWVl/sAKCFftXvfirJLuwSwmzPVURjYY/xgXtzWpDd7Z11h0T/ST91Uxe5rZH yQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h2cwhsmyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jul 2022 12:46:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E142010002A;
 Mon,  4 Jul 2022 12:46:36 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DCF872187FE;
 Mon,  4 Jul 2022 12:46:36 +0200 (CEST)
Received: from localhost (10.75.127.48) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 4 Jul
 2022 12:45:48 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 4 Jul 2022 12:45:43 +0200
Message-ID: <20220704124540.2.I5eabf3f9fdbbaf763cd44e9c018cb5b74a0c65ac@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704124540.1.Ic02e6fb44225d1cfe15506c7c85f70a0893fb880@changeid>
References: <20220704124540.1.Ic02e6fb44225d1cfe15506c7c85f70a0893fb880@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-04_09,2022-06-28_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 2/2] usb: hub: increase HUB_DEBOUNCE_TIMEOUT
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

Increase HUB_DEBOUNCE_TIMEOUT to 2000 because some usb device
needs around 1.5s or more to make the hub port status to be
connected steadily after being powered off and powered on.

These value is aligned with Linux driver and avoids to configure
"usb_pgood_delay" as a workaround for connection timeout on
some USB device; normally the env variable "usb_pgood_delay" is used
to delay the first query after power ON and thus the device answer,
but this variable not to increase the connection timeout delay.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
Hi,

I think this patch solves a general issue because a 1s timeout for
USB connection is too short on problematic USB keys / USB HUB.
The issue was introduced by the commit c998da0d6709 ("usb: Change
power-on / scanning timeout handling")

Patching usb_hub allows to avoid to patch in each board/driver.

For example, commit 0417169054cb ("imx: ventana: add usb_pgood_delay
2sec default") => use pgood_delay = 2s !?

or ("ARM: stm32: Increase USB power-good delay on DHSOM")
https://patchwork.ozlabs.org/project/uboot/patch/20211113022444.231801-1-marex@denx.de/

or commit 2bf352f0c1b7 ("usb: dwc2: Add delay to fix the USB
detection problem on SoCFPGA") => patch in USB DWC2 driver to add
a timeout in driver

The commit 319418c01c95 ("usb: hub: allow pgood_delay to be
specified via env") introduces an env variable for warm-up times
managed by hub->query_delay.

But it is not linked to the connect timeout after power on
managed by hub->connect_timeout.

This patch can increase the boot time for some board when USB device is
not available; if it is a problem I can introduce a new config:
CONFIG_USB_HUB_DEBOUNCE_TIMEOUT to define this value with default = 1s
to keep the current behavior.

This issue appears with DWC2 and USB HUB used in STM32MP135F-DK board;
pgood_delay=2 is not enough to solved all the USB key detection issues.

Patrick


 common/usb_hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/common/usb_hub.c b/common/usb_hub.c
index d73638950b9..e681f1b3073 100644
--- a/common/usb_hub.c
+++ b/common/usb_hub.c
@@ -47,7 +47,7 @@
 #define HUB_SHORT_RESET_TIME	20
 #define HUB_LONG_RESET_TIME	200
 
-#define HUB_DEBOUNCE_TIMEOUT	1000
+#define HUB_DEBOUNCE_TIMEOUT	2000
 
 #define PORT_OVERCURRENT_MAX_SCAN_COUNT		3
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
