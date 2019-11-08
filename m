Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9684BF4EAA
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Nov 2019 15:47:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E5B9C36B0E
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Nov 2019 14:47:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1455C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Nov 2019 14:47:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA8EgAVl016395; Fri, 8 Nov 2019 15:47:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=bLTMNI0lNPg8w7Ut7GrqA4OHpn++Y1Vo9VPqSBMYeL8=;
 b=mrglb6cg9Ltfti/X62+PohU7NwrrYPnLq0a73Vx7MB+5N14CpEgqy7gfyowafFbZTGBO
 vjO9xAHzFR0nyPpHCjOficigoZkxzVbssWJd/a0P3P3cvRru3r1wdyf26Q/VOtGs+DRV
 SlBNNQuQD0W1o5Er+lMb44F/Tf6L5d6PJEoyXcUge+k93nRgRF5orSDlmDCXWsWLNJ2a
 5IE7GtiGk20kVXqoO2ulghmu2hUbAAHcYn7Hs2lUyHdTqDs3Qve7A210AAzngwIdrMsN
 MjLdOpur3MSknzMytaMVAzo4yxpm9GWFatkVAt6dh2nb62LeXZsrqlgLMLZnY90apohk nA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2w41vmv6va-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Nov 2019 15:47:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EB98A100034;
 Fri,  8 Nov 2019 15:47:22 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E033A2BEC6E;
 Fri,  8 Nov 2019 15:47:22 +0100 (CET)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 8 Nov 2019
 15:47:22 +0100
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 8 Nov 2019 15:47:22
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 8 Nov 2019 15:47:15 +0100
Message-ID: <20191108144716.23829-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191108144716.23829-1-patrick.delaunay@st.com>
References: <20191108144716.23829-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-08_04:2019-11-08,2019-11-08 signatures=0
Cc: Marek Vasut <marex@denx.de>, simon.k.r.goldschmidt@gmail.com,
 Patrick Delaunay <patrick.delaunay@st.com>, b.galvani@gmail.com,
 Sven Schwermer <sven@svenschwermer.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: [Uboot-stm32] [PATCH v2 3/4] usb: host: dwc2: force reset assert
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

Changes in v2:
- add clk_disable_bulk in dwc2_usb_remove

 drivers/usb/host/dwc2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c
index 9a00bea24f..870b06459e 100644
--- a/drivers/usb/host/dwc2.c
+++ b/drivers/usb/host/dwc2.c
@@ -1149,6 +1149,8 @@ static int dwc2_reset(struct udevice *dev)
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
