Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E3F3DB6FB
	for <lists+uboot-stm32@lfdr.de>; Fri, 30 Jul 2021 12:12:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73992C57182;
	Fri, 30 Jul 2021 10:12:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 300E6C57182
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jul 2021 10:12:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16UA72nf002366; Fri, 30 Jul 2021 12:12:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=4LJtQ4XRo9QyrgHs/n/2veYMG9AoX/a1dTeqSR08jwI=;
 b=sut+8rpj2ZqV55R8+c+UMXCo0EJ5HsvyvYn+lj4ztsDW7HJx37LXS7rIyZEqtej5g2e/
 4nq7BSrKDvU+tZCHReSl0O05rBiFdJp98KAOmedkcZLzUfALqdMmSSRJx1B28BLV9w8o
 qtdbO3LaenLxst455YmNEqnson7dkvVQrecA8byeENpRNqglxbl0j/khLppmthDV5sWl
 9ICJAPF7EqKL7uxYLNuwXFZ5vnZ56kO5zB8kBhI2/AGWbKaH52KxabNpVt61/j7brzZv
 Ueov/rkwjavfJz402SSK8lb97MeslxIOpu4SQieF3F7stRrRAm9/13VUoEtmjSVXwpB7 yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a3tetdkvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 12:12:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 62FAB10002A;
 Fri, 30 Jul 2021 12:12:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 58B5621FE90;
 Fri, 30 Jul 2021 12:12:17 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 30 Jul 2021 12:12:16
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 30 Jul 2021 12:12:11 +0200
Message-ID: <20210730121202.2.I548969a35a3522881113dc073f34b86bb15d29a6@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730121202.1.If3a702960ca11240d2dbce54d144144f814d588a@changeid>
References: <20210730121202.1.If3a702960ca11240d2dbce54d144144f814d588a@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-30_05:2021-07-29,
 2021-07-30 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 2/2] dm: add debug message when failed to
	select the default pinctrl
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
---

 drivers/core/device.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/core/device.c b/drivers/core/device.c
index 29668f6fb3..6710c847e1 100644
--- a/drivers/core/device.c
+++ b/drivers/core/device.c
@@ -532,8 +532,12 @@ int device_probe(struct udevice *dev)
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
@@ -578,8 +582,12 @@ int device_probe(struct udevice *dev)
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
