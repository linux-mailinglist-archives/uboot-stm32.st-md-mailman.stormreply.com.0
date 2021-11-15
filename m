Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CC045088C
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Nov 2021 16:32:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B09AC5EC57;
	Mon, 15 Nov 2021 15:32:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8052DC57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Nov 2021 15:32:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AF9wd25030859;
 Mon, 15 Nov 2021 16:32:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=AqJ0lmA7kGqpcCC/lM/jinnqnFvaKGdP6tGbBvYgOQA=;
 b=V1wXbAV9rxTtUGbhoSXrdofbo2I7/+G+IVPnVrNfXeNWWBbU2VyBY2tzE+0EbxfDgP7c
 7Zz/hMawtg5r4jpkgu0STxP+6Nm8goOu9kXIKglCK5w0vtfAXdxru5QRJSnP/0tIg7Sq
 dvM85Utv8tRe1aPF2QwqrEiIqF9/jxOkOF+raLVGFBXtLUpuA6hXZpbsyDEWO2dGXuPg
 g+V9ujgfUtiqv8m8dxOKlZNoWIGMlGyJHbZIlzS8HnaYSJwGI2w6wbpavMiXccYJn7dq
 Ge47+0GK5MTRTensIK3loDXMK5GD4iVQmhsOiAaqERiQb+HejZ2BzBorxNbxoUUkhTbl Jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cben9vp8n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 16:32:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8976910003A;
 Mon, 15 Nov 2021 16:32:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 829B12C38AA;
 Mon, 15 Nov 2021 16:32:39 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 15 Nov 2021 16:32:39
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Nov 2021 16:32:20 +0100
Message-ID: <20211115163155.4.I1fdc777bed680de1bea00b4d1eea43fd75a66e42@changeid>
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
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 4/7] video: Add video_is_active function
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

Add the helper function video_is_active() to test if one video device
is active.

This function can be used in board code to execute operation
only when the display is probed / really used.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/video/video-uclass.c | 14 ++++++++++++++
 include/video.h              |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/video/video-uclass.c b/drivers/video/video-uclass.c
index 9f8cf6ef2a..43ebb3c565 100644
--- a/drivers/video/video-uclass.c
+++ b/drivers/video/video-uclass.c
@@ -228,6 +228,20 @@ void video_sync_all(void)
 	}
 }
 
+bool video_is_active(void)
+{
+	struct udevice *dev;
+
+	for (uclass_find_first_device(UCLASS_VIDEO, &dev);
+	     dev;
+	     uclass_find_next_device(&dev)) {
+		if (device_active(dev))
+			return true;
+	}
+
+	return false;
+}
+
 int video_get_xsize(struct udevice *dev)
 {
 	struct video_priv *priv = dev_get_uclass_priv(dev);
diff --git a/include/video.h b/include/video.h
index f14fb15f84..5ac1387a39 100644
--- a/include/video.h
+++ b/include/video.h
@@ -276,6 +276,13 @@ static inline int video_sync_copy_all(struct udevice *dev)
 
 #endif
 
+/**
+ * video_is_active() - Test if one video device it active
+ *
+ * @return true if at least one video device is active, else false.
+ */
+bool video_is_active(void);
+
 #ifndef CONFIG_DM_VIDEO
 
 /* Video functions */
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
