Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2500A50FD30
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Apr 2022 14:38:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEAC2C60492;
	Tue, 26 Apr 2022 12:38:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D16B0C5F1D6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Apr 2022 12:38:00 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23QA8BGp025671;
 Tue, 26 Apr 2022 14:37:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=bwS5uKefxutQzGmGXE0S/5pP+6VRtfGJvAVKtQGK2L4=;
 b=ZY2AyPh7JOftXiFUiCHD1dLvRcy3j+tLc45mCBHoVXFOkXs1j9YSI6nGTvhKFFOjlaWr
 /LqAY8wi6m2AUbKIKY7p2YbO/Q8cwy/5aBXs7sHbkhnvYu982miiDAST8BtgdDPF0avU
 StZMkXJfgzxx+SZiCjEl8LtRmdm9HluCIbU4oRoMuB+DGPOdQzMO8xlEAvHCMM7ozIYL
 aIPARXh1QQr1EF+Rev99y1672dUV/I2GOYtwPCD0W7tPpm8ZDun1LbERmRPKjX1mh/8e
 hsZFXyc8pha8DWXUbrb1QiaNtVjnzj6Zr2W8WGkkl4iEo5//KpnQomI5aRjYJ3z203H7 Cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fm8t1px9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 14:37:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A5026100038;
 Tue, 26 Apr 2022 14:37:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9DABE2248B0;
 Tue, 26 Apr 2022 14:37:58 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 26 Apr 2022 14:37:58
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 26 Apr 2022 14:37:49 +0200
Message-ID: <20220426143736.3.Idf10564d4e488df57f60640bbe1f8a43e200b56f@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426123750.579726-1-patrick.delaunay@foss.st.com>
References: <20220426123750.579726-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_02,2022-04-26_02,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sean Anderson <seanga2@gmail.com>, Lukasz Majewski <lukma@denx.de>
Subject: [Uboot-stm32] [PATCH 3/3] clk: stm32mp: handle ck_usbo_48m clock
	provided by USBPHYC
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

Handle the input clock of RCC USB_PHY_48, provided by USBPHYC
and named "ck_usbo_48m".

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/clk/clk_stm32mp1.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
index 83ab6b728e..a02921c43a 100644
--- a/drivers/clk/clk_stm32mp1.c
+++ b/drivers/clk/clk_stm32mp1.c
@@ -962,6 +962,24 @@ static ulong stm32mp1_read_pll_freq(struct stm32mp1_clk_priv *priv,
 	return dfout;
 }
 
+static ulong stm32mp1_clk_get_by_name(const char *name)
+{
+	struct clk clk;
+	struct udevice *dev = NULL;
+	ulong clock = 0;
+
+	if (!uclass_get_device_by_name(UCLASS_CLK, name, &dev)) {
+		if (clk_request(dev, &clk)) {
+			log_err("%s request", name);
+		} else {
+			clk.id = 0;
+			clock = clk_get_rate(&clk);
+		}
+	}
+
+	return clock;
+}
+
 static ulong stm32mp1_clk_get(struct stm32mp1_clk_priv *priv, int p)
 {
 	u32 reg;
@@ -1127,24 +1145,11 @@ static ulong stm32mp1_clk_get(struct stm32mp1_clk_priv *priv, int p)
 		break;
 	/* other */
 	case _USB_PHY_48:
-		clock = 48000000;
+		clock = stm32mp1_clk_get_by_name("ck_usbo_48m");
 		break;
 	case _DSI_PHY:
-	{
-		struct clk clk;
-		struct udevice *dev = NULL;
-
-		if (!uclass_get_device_by_name(UCLASS_CLK, "ck_dsi_phy",
-					       &dev)) {
-			if (clk_request(dev, &clk)) {
-				log_err("ck_dsi_phy request");
-			} else {
-				clk.id = 0;
-				clock = clk_get_rate(&clk);
-			}
-		}
+		clock = stm32mp1_clk_get_by_name("ck_dsi_phy");
 		break;
-	}
 	default:
 		break;
 	}
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
