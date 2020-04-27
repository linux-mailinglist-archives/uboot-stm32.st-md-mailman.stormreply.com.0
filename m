Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BF81BA4BA
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Apr 2020 15:30:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBB52C36B0D
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Apr 2020 13:30:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 305B1C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2020 13:30:14 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03RDILkt001525; Mon, 27 Apr 2020 15:30:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=EwLVxMIqIAsdtfF7zgsFCOqL+25ryLfu5HjZ5tfWPD8=;
 b=HMSQsnDSRgn5oQZQHCs3CITGv4fcNrh/ware4cABidp84MSzLRg1VXPmUK2MSPItgcLW
 YMN5wgYyKiw/bI3wFCE6FZjtNxjbGYUfD2x2en96uMqtMMLpeu/8NUvTJ8IYBWh+2kRL
 4e1jtWN0maPQ9j4qg6vCYSCO4Ml4yDc2zgjrFN1gZESCvmNfgG0vaSF6bTvL9rq9lZe+
 eDVk60PzMUcDUsRUmBUxm0u0KMdvWnFAv2bisIP8e40OtrKLBAFoOnuTOoK61lZC9TEI
 KcdgHISLebI3WPPPLnBEHAyD3UAcA2jU2bbOXpQcOGe7vvRvbVo6J9AtBgstIau1zpDs Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30n4j5p4fw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 15:30:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8CF81100038;
 Mon, 27 Apr 2020 15:30:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8119121BAB3;
 Mon, 27 Apr 2020 15:30:06 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 27 Apr 2020 15:30:06 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 27 Apr 2020 15:30:00 +0200
Message-ID: <20200427133001.5557-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200427133001.5557-1-patrick.delaunay@st.com>
References: <20200427133001.5557-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_10:2020-04-24,
 2020-04-27 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Simon Glass <sjg@chromium.org>, simon.k.r.goldschmidt@gmail.com,
 Patrick Delaunay <patrick.delaunay@st.com>, b.galvani@gmail.com,
 ley.foon.tan@intel.com,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: [Uboot-stm32] [RESEND PATCH v6 4/5] usb: host: dwc2: force reset
	assert
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

Changes in v6: None
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
