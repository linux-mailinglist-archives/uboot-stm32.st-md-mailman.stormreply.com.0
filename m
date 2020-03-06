Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0948C17B9BD
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 11:02:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADF37C36B0F
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 10:02:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69AAAC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2020 10:02:03 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0269wB5M003889; Fri, 6 Mar 2020 11:01:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=CVMoFE01dDIf5/HFMBjiWGETD2O6FImJyCP/AIjGmtw=;
 b=VmUmJkt5uGbrB5h517+hpn47MsusbAhkT+UH4xPaw2t/d0AjG4UYv1n2VXkwOrBqFI3T
 HS6yof7STuFLI3Y2rsDdSX5vqpkQuidkJj2hr47NMCSkd23jH5D6nvXCC/GLP8xjwzWL
 6N2fhuF/B3bTwqZm1zLwPl6zdAHIqScQNYRxGWZvAmE1hc5/L8L5JovG4p0YmKFNF+5D
 /p2OHZCLe4VHY8A/mKyvHFOh/hiE8PnD05+ZUjWiKn8SWp2it4JQ+2UaUB1qUzyjdyTd
 ZaQnzGHdlwWCMPi5RppIo0RuF5w//jfJI4crkLx9oNwTDJR8TG1ASYo6UM/C0RMp9XaM IQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfem1e9wm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 11:01:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A5065100038;
 Fri,  6 Mar 2020 11:01:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 98B432A59CF;
 Fri,  6 Mar 2020 11:01:53 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 6 Mar 2020 11:01:52 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Mar 2020 11:01:39 +0100
Message-ID: <20200306100140.27582-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200306100140.27582-1-patrick.delaunay@st.com>
References: <20200306100140.27582-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_02:2020-03-05,
 2020-03-06 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Simon Glass <sjg@chromium.org>, simon.k.r.goldschmidt@gmail.com,
 Patrick Delaunay <patrick.delaunay@st.com>, b.galvani@gmail.com,
 ley.foon.tan@intel.com,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: [Uboot-stm32] [PATCH v5 4/5] usb: host: dwc2: force reset assert
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

Assert reset before deassert in dwc2_reset;
this patch solve issues when the DWC2 registers are already
initialized with value incompatible with host mode.

Force a hardware reset of the IP reset all the DWC2 registers at
default value, the host driver start with a clean state
(Core Soft reset doen in dwc_otg_core_reset is not enought
 to reset all register).

The error can occurs in U-Boot when DWC2 device gadget driver
force device mode (called by ums or dfu command, before to execute
the usb start command).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
- add clk_disable_bulk in dwc2_usb_remove

 drivers/usb/host/dwc2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c
index b1b79d0a18..640ae3e730 100644
--- a/drivers/usb/host/dwc2.c
+++ b/drivers/usb/host/dwc2.c
@@ -1151,6 +1151,8 @@ static int dwc2_reset(struct udevice *dev)
 			return ret;
 	}
 
+	/* force reset to clear all IP register */
+	reset_assert_bulk(&priv->resets);
 	ret = reset_deassert_bulk(&priv->resets);
 	if (ret) {
 		reset_release_bulk(&priv->resets);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
