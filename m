Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC15032D2A7
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Mar 2021 13:11:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AE12C57B53;
	Thu,  4 Mar 2021 12:11:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 865C1C3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Mar 2021 12:11:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 124C85B5019125; Thu, 4 Mar 2021 13:11:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=3D7jRwEeExxR4e1EZcR+20Ku3FFI0v9vzJX2CrRiGIE=;
 b=oUW11S++BgerOccqrvee+2zuwTZ0K1fEqMbeG/T6IYmUlEwuflShQPsoQxLfsb23WV+y
 yL8+J9+bLNdiOxjdFdhcVGGC0QCktZK3VkspmdFVfKLwl4KEn0H3Jj0EskLbus9+qN+Q
 7qj3qLjSY0Qt18Ju7GaGMT9+LHWOU/7j6pf0zACcECDnFzCMSbQtPQvnCxw1uAIBQvX+
 Z8giEwPxKEEZuFwAgrHACW7tNEVrNn71HMHLrxIsRgyxa+1NizR0JgJnCHnw9hj4r/jq
 hwUF9i9fiLx2GUIWSBtCIrPL267cdrpkS2jssbg2rwRGUqcklzzNmb33jpLL8K9Wis+W cQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36yf9qfaqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 13:11:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 43CAD10002A;
 Thu,  4 Mar 2021 13:11:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 35DEE23450F;
 Thu,  4 Mar 2021 13:11:08 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Mar 2021 13:11:07
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 4 Mar 2021 13:10:33 +0100
Message-ID: <20210304131031.1.I7936291936df6580c70e36c7d96ed2a7c82bc577@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-04_03:2021-03-03,
 2021-03-04 signatures=0
Cc: Simon Glass <sjg@chromium.org>, Philippe Cornu <philippe.cornu@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH] video: stm32: remove all child of DSI bridge
	when its probe failed
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

From: Patrick Delaunay <patrick.delaunay@st.com>

Remove the child device of the STM32 DSI bridge when the driver probe
failed to stop futher probe request on panels used with STMicroelectronics
board (orisetech_otm8009a.c or raydium-rm68200.c driver).

This patch avoid the trace "cannot get reset GPIO" when
STM32MP157 device tree is used on stm32MP151 SOC without DSI support.

In this hw_version value is 0, as DSI bridge is absent and the panel
ofdata_to_platdata is called for each try of panel probe,
the gpio reset pin is requested but after dsi father probe failed).

For the next request, the PANEL ofdata_to_platdata failed as the gpio
is already used.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/video/stm32/stm32_dsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/stm32/stm32_dsi.c b/drivers/video/stm32/stm32_dsi.c
index 8891ca4b78..4027e978c8 100644
--- a/drivers/video/stm32/stm32_dsi.c
+++ b/drivers/video/stm32/stm32_dsi.c
@@ -483,6 +483,9 @@ static int stm32_dsi_probe(struct udevice *dev)
 	if (priv->hw_version != HWVER_130 &&
 	    priv->hw_version != HWVER_131) {
 		dev_err(dev, "DSI version 0x%x not supported\n", priv->hw_version);
+		dev_dbg(dev, "remove and unbind all DSI child\n");
+		device_chld_remove(dev, NULL, DM_REMOVE_NORMAL);
+		device_chld_unbind(dev, NULL);
 		ret = -ENODEV;
 		goto err_clk;
 	}
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
