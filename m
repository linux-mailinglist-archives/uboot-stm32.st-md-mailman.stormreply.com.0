Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2083E2630CB
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 17:44:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA961C3FAE4
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 15:44:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77059C3FAE1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 15:44:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 089FhMKi025385; Wed, 9 Sep 2020 17:44:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=77nPbOVaepb6iXxacab2Phujqf7ZKo9vJEiXdcYlOpM=;
 b=xTULBInLuA/UYBYa9idgqtZaN7L7zjJRvDLPZx9a07+AeNZiJXI3xWOSqZRCeIi6ypL4
 tHobgItzcZUm728Xa4M9pn3kEa+esLFyGFxqoRG7eCEOlbeYldDjhYW3kGXHllFZO84f
 K4eMvj94O3KxWMrZuaQJJj/DGCqiUhQTf052w1WMlvyk6jBgjWzCcqUMZhJkZS+MTC90
 ZaovsTM9zfmYOT79SPglLdq6ehJGINNL9jW/OiOjRzlnP6Vqf2eD7TElF3wHauHbLbR5
 WSq/RnZ43m+InPQ3sLlT5DzupnYQtnXq10hd9F3raNeqOjtBrSK9XhntF435aXHFnc0G Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c1jf69qy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 17:44:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CBE5610002A;
 Wed,  9 Sep 2020 17:44:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BF3222BE225;
 Wed,  9 Sep 2020 17:44:26 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 9 Sep 2020 17:44:26 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 9 Sep 2020 17:44:13 +0200
Message-ID: <20200909154413.28064-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909154413.28064-1-patrick.delaunay@st.com>
References: <20200909154413.28064-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_09:2020-09-09,
 2020-09-09 signatures=0
Cc: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH 2/2] video: stm32_dsi: Convert to use APIs
	which support live DT
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

Use ofnode_ or dev_ APIs instead of fdt_ and fdtdec_ APIs so that the
driver can support live DT.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/video/stm32/stm32_dsi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/stm32/stm32_dsi.c b/drivers/video/stm32/stm32_dsi.c
index 283151398b..9d5abacc2b 100644
--- a/drivers/video/stm32/stm32_dsi.c
+++ b/drivers/video/stm32/stm32_dsi.c
@@ -359,8 +359,7 @@ static int stm32_dsi_attach(struct udevice *dev)
 
 	ret = panel_get_display_timing(priv->panel, &timings);
 	if (ret) {
-		ret = fdtdec_decode_display_timing(gd->fdt_blob,
-						   dev_of_offset(priv->panel),
+		ret = ofnode_decode_display_timing(dev_ofnode(priv->panel),
 						   0, &timings);
 		if (ret) {
 			dev_err(dev, "decode display timing error %d\n", ret);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
