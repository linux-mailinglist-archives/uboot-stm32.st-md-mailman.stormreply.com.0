Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 228636FF48F
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 May 2023 16:37:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8407C65E60;
	Thu, 11 May 2023 14:37:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97AA1C62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 May 2023 14:37:15 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34BEama8027340; Thu, 11 May 2023 16:37:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=1Mw9MMyQyBOcN64M4T5SqZrEfWr8UyvBg11eYit4aDY=;
 b=ML+tf3NidX/5scDBeiNn7ycXOsYip00syyt4qOJFSFTcuUmiwhTOI/Oi0KFpMoGbresE
 WEeSCwN+r1zcXmg2hfVJJlnvpViD8XEpvpylX7lNip0T2nb0GnELo6E08NDXW4CiQGqe
 DSzWlPvWaXqMsP32rSLAF36ctyrzGP5JWLDZBkQoHVEIiraBh02vJTo+IyrQSYf226D5
 bM2pOUg2dnBOmWYHVnuhkB1lBOvuuUmGdxaUJRBfl2fTP9aEc+yWMMfGJmCk6ozeV5FK
 vOcQwEAi013mBX0j2I7uErG+xmRf0NFmEGd78Gc77PlgxnjXjd29VVhGhPq1Edtutbhq +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qf79huv93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 16:37:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C6A5B10002A;
 Thu, 11 May 2023 16:37:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B03D0229A7B;
 Thu, 11 May 2023 16:37:08 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 11 May
 2023 16:37:08 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 11 May 2023 16:36:52 +0200
Message-ID: <20230511163616.1.I4548bdac5ed5e82ef903e7187781536e21d9b06a@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_11,2023-05-05_01,2023-02-09_01
Cc: Dzmitry Sankouski <dsankouski@gmail.com>,
 Sean Anderson <sean.anderson@seco.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Nikhil M Jain <n-jain1@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH] drivers: core: ofnode: fix typo in panel
	timing decode
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

From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

In case where a single timing resolution is implemented in the
device-tree, the property is named "panel-timing", as specify
in Linux kernel binding file:

Documentation/devicetree/bindings/display/panel/panel-common.yaml

  # Display Timings
  panel-timing:
    description:
      Most display panels are restricted to a single resolution and
      require specific display timings. The panel-timing subnode expresses those
      timings.
    $ref: panel-timing.yaml#

  display-timings:
    description:
      Some display panels support several resolutions with different timings.
      The display-timings bindings supports specifying several timings and
      optionally specifying which is the native mode.
    $ref: display-timings.yaml#

Fixes: 0347cc773270 ("drivers: core: ofnode: Add panel timing decode.")
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/sandbox/dts/test.dts | 2 +-
 drivers/core/ofnode.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
index 453e53db71a8..e6586aaa05fa 100644
--- a/arch/sandbox/dts/test.dts
+++ b/arch/sandbox/dts/test.dts
@@ -344,7 +344,7 @@
 				vsync-len = <13>;
 			};
 		};
-		panel-timings {
+		panel-timing {
 			clock-frequency = <6500000>;
 			hactive = <240>;
 			vactive = <320>;
diff --git a/drivers/core/ofnode.c b/drivers/core/ofnode.c
index f49ee493d3cc..ec574c446079 100644
--- a/drivers/core/ofnode.c
+++ b/drivers/core/ofnode.c
@@ -998,7 +998,7 @@ int ofnode_decode_panel_timing(ofnode parent,
 	u32 val = 0;
 	int ret = 0;
 
-	timings = ofnode_find_subnode(parent, "panel-timings");
+	timings = ofnode_find_subnode(parent, "panel-timing");
 	if (!ofnode_valid(timings))
 		return -EINVAL;
 	memset(dt, 0, sizeof(*dt));
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
