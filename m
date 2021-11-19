Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12538456C08
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Nov 2021 10:02:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA49CC5EC6B;
	Fri, 19 Nov 2021 09:02:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEA0DC5C82A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Nov 2021 09:02:35 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJ63qWl028259;
 Fri, 19 Nov 2021 10:02:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=kAfi2iJy7ZWJufgxfeuWawj2Mgw4nVlsGtUd5s3/qus=;
 b=4LruGyw5EZOf8qLQLmXh/HlZonQFVfbnFWBg4qvUAGUF6otDQxfxx//ElhKDNlFltt+6
 SUN0sR+qjFnBeFIrMbowvIihb8tcRP7bYAMMgH7qsOjQanxLFM/Wf1vsUGgXEP3HUW2u
 YQBZe5MOM3YL9pWfi03RdAtBwiiCuvxLx8kvOIvgrJuCoviHWJdoTVFBVHdm0dFpjhwg
 I1lZhXfWNy0gJuVJj+ePIOZoZT678q0N4tASqvvbNI5t7lOVoplMbU0xKXg7RCvFxbWe
 47R6FgDQzzpQDWCBacJKey/TIy77euo8n2gSqvz0GX+npszDkPu8kaNynjrwXeY/hcTq Yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ce6b1h0pd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 10:02:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DA7E0100038;
 Fri, 19 Nov 2021 10:02:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D279321BDD3;
 Fri, 19 Nov 2021 10:02:33 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 19 Nov 2021 10:02:33
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Nov 2021 10:02:27 +0100
Message-ID: <20211119100218.RESEND.2.Ie857134e9935cc3476949ba179f4b79c348ec671@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119090227.126391-1-patrick.delaunay@foss.st.com>
References: <20211119090227.126391-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_08,2021-11-17_01,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [RESEND PATCH 2/2] dm: add debug message when failed
	to select the default pinctrl
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

Add a message on probe in driver model core when the default
pinctrl selection failed.

This message is displayed only when the pinctrl API is
implemented, i.e. when result is not ENOSYS.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

 drivers/core/device.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/core/device.c b/drivers/core/device.c
index efd07176e3..f3c35ad20c 100644
--- a/drivers/core/device.c
+++ b/drivers/core/device.c
@@ -533,8 +533,12 @@ int device_probe(struct udevice *dev)
 	 * is set just above. However, the PCI bus' probe() method and
 	 * associated uclass methods have not yet been called.
 	 */
-	if (dev->parent && device_get_uclass_id(dev) != UCLASS_PINCTRL)
-		pinctrl_select_state(dev, "default");
+	if (dev->parent && device_get_uclass_id(dev) != UCLASS_PINCTRL) {
+		ret = pinctrl_select_state(dev, "default");
+		if (ret && ret != -ENOSYS)
+			log_debug("Device '%s' failed to configure default pinctrl: %d (%s)\n",
+				  dev->name, ret, errno_str(ret));
+	}
 
 	if (CONFIG_IS_ENABLED(POWER_DOMAIN) && dev->parent &&
 	    (device_get_uclass_id(dev) != UCLASS_POWER_DOMAIN) &&
@@ -586,8 +590,12 @@ int device_probe(struct udevice *dev)
 	if (ret)
 		goto fail_uclass;
 
-	if (dev->parent && device_get_uclass_id(dev) == UCLASS_PINCTRL)
-		pinctrl_select_state(dev, "default");
+	if (dev->parent && device_get_uclass_id(dev) == UCLASS_PINCTRL) {
+		ret = pinctrl_select_state(dev, "default");
+		if (ret && ret != -ENOSYS)
+			log_debug("Device '%s' failed to configure default pinctrl: %d (%s)\n",
+				  dev->name, ret, errno_str(ret));
+	}
 
 	return 0;
 fail_uclass:
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
