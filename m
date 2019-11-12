Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CEDF8C18
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 10:42:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0B12C36B0C
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 Nov 2019 09:42:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BB9FC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2019 09:42:27 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAC9gEXX004440; Tue, 12 Nov 2019 10:42:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=uCzuc5jmef3wyU3Zo83dV6m/IdgzxVkM/jUYAtgee9A=;
 b=Cfz9TjQaXm/NLh7qiRs6P9/VYgh/T9SJ3sYmkCpNDvZMpNY+a+MXykxcJ1uUrvzbwN/Y
 khQSJxGGuKklCuHXAje1Smmmm5w4xVEu3E3lsH6+wMlwOnI6+wVZbwskGl3Agqr9IpzB
 1uRRVS6JBYzB2nD5H86GxAfaL3HaVCANOhdEjEzrDnVJUF+QbFQLsJvSZRZkHAfSd/eX
 x5GZI2it5RqtkR+cw7pdhc83VPOpy2PmChPz1Eb/pMC5/ADcWq7z1GIzE2R5vKd2T/wd
 Mabzg7ICTGNsRwjAoEbKOOe72NELPMRRA+LYvol3NNJSTQ13jXptgdAqk0zx93r6+6XH Ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w7psjh5rr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 10:42:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D965B100039;
 Tue, 12 Nov 2019 10:42:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD3DE2B1879;
 Tue, 12 Nov 2019 10:42:19 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 12 Nov 2019 10:42:19 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 12 Nov 2019 10:42:13 +0100
Message-ID: <20191112094214.12686-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191112094214.12686-1-patrick.delaunay@st.com>
References: <20191112094214.12686-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-12_02:2019-11-11,2019-11-12 signatures=0
Cc: Marek Vasut <marex@denx.de>, simon.k.r.goldschmidt@gmail.com,
 Patrick Delaunay <patrick.delaunay@st.com>, b.galvani@gmail.com,
 ley.foon.tan@intel.com, Sven Schwermer <sven@svenschwermer.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: [Uboot-stm32] [PATCH v3 4/5] usb: host: dwc2: force reset assert
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

Changes in v3: None
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
