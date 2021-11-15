Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F101745088E
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Nov 2021 16:32:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9DFFC5EC74;
	Mon, 15 Nov 2021 15:32:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D526C5EC59
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Nov 2021 15:32:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AFCwS40014045;
 Mon, 15 Nov 2021 16:32:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=Nj3GIr3/NO4FVmHRke3AEU6t0dZK0CyNQ6U9fgt7BwI=;
 b=XTlGdFlHMBMaVgkd34OhEzEdVH34co9E8oGZI359HmdsW+bH/HVREIOdIKJqybQaOR48
 jKRSkgN2I5Fib8G4otTIewe0jcECL6Mw3paLJJXZdyM40X0fM/uPjTT0D7Nghlv2w3d3
 vxIdXMZYBgyHkTywxHl/PckQPujUtNW4SR8bO8l3DOJdlpfIrwrypdOS01anHFJ55yPT
 9Kz41pocX5rWZRFCzqr0QQriIkUWToh9wI2YRjCFHw9Xhb73olvKq82QHpXz/jY+WOHw
 4ENs0zwhgL3kOrnGMYrzXXRwMBD995WgMkgxKfcNUxITIRO2t+AGpXFzC9pyGFfHuv+h TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cben34p71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 16:32:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 53C0A100034;
 Mon, 15 Nov 2021 16:32:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D4522C38AA;
 Mon, 15 Nov 2021 16:32:41 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 15 Nov 2021 16:32:40
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Nov 2021 16:32:22 +0100
Message-ID: <20211115163155.6.I1e3c35ed5deec91edfad2e93b4e12dda56a4d1c5@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211115153223.563377-1-patrick.delaunay@foss.st.com>
References: <20211115153223.563377-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_10,2021-11-15_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH 6/7] video: stm32: stm32_ltdc: align
	framebuffer on 2MB
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

Align the framebuffer size on MMU_SECTION_SIZE in kernel, = max 2MB for
LPAE for armV7, to avoid issue with the simple frame buffer activation,
when U-Boot add a reserved memory in the kernel device tree to preserve
the splash screen until Linux driver initialization.

See Linux documentation for details:
Documentation/devicetree/bindings/display/simple-framebuffer.yaml

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/video/stm32/stm32_ltdc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/video/stm32/stm32_ltdc.c b/drivers/video/stm32/stm32_ltdc.c
index 65c882d9f1..87e5fd54d9 100644
--- a/drivers/video/stm32/stm32_ltdc.c
+++ b/drivers/video/stm32/stm32_ltdc.c
@@ -459,7 +459,10 @@ static int stm32_ltdc_bind(struct udevice *dev)
 	uc_plat->size = CONFIG_VIDEO_STM32_MAX_XRES *
 			CONFIG_VIDEO_STM32_MAX_YRES *
 			(CONFIG_VIDEO_STM32_MAX_BPP >> 3);
-	dev_dbg(dev, "frame buffer max size %d bytes\n", uc_plat->size);
+	/* align framebuffer on kernel MMU_SECTION_SIZE = max 2MB for LPAE */
+	uc_plat->align = SZ_2M;
+	dev_dbg(dev, "frame buffer max size %d bytes align %x\n",
+		uc_plat->size, uc_plat->align);
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
