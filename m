Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B709DE6AA
	for <lists+uboot-stm32@lfdr.de>; Fri, 29 Nov 2024 13:46:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E913C78025;
	Fri, 29 Nov 2024 12:46:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECCA2C71289
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Nov 2024 12:46:20 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATB2lH3002458;
 Fri, 29 Nov 2024 13:46:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=GJU9RKCgIKiiO+SCBcvWA+
 GMavOa6SleRwhZP2y7ra8=; b=wiyUyPWOI24pzUwfbX/ItiRZVC2XDBlQ/9d5bv
 T1rG5TTu4EmUBOAejYaRWjNEiwQXgoIuh/GwCJW7U5SUqlxI8FtCJxyhudOjx+yw
 V+/eV9AhZCDPSyZPfVbQ1efMKTBn8CZHMCJabP8xFQ2JvdumexaeW3Y0ki+Q71MT
 C+WIeS0c5R9d8UxJ74BNw2vJhFEbuFmf1vKjcaxFA16LlZYvDzrTCt0j8TG+9XO+
 QJBxxru2JR0h1LKKXfvHpEHFfvm+kk5whZTnQbe4Mpi5+lZ4FoCyxAi3m/B6EoZE
 1qDOFHQZz5mq8+1HKmjgnyna1rkTL6Q5knCECsY273yfxP+g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4367199rk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2024 13:46:11 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 101CE40048;
 Fri, 29 Nov 2024 13:45:00 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D6A6828FB21;
 Fri, 29 Nov 2024 13:44:25 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 29 Nov
 2024 13:44:25 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 29 Nov 2024 13:44:22 +0100
Message-ID: <20241129124422.435998-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Jonas Karlman <jonas@kwiboo.se>, Quentin Schulz <quentin.schulz@cherry.de>,
 Simon Glass <sjg@chromium.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] power: regulator: replace some debug() by
	dev_dbg/err()
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

Replace some debug() by dev_dbg() when dev variable
is available/valid.

To ease debugging, use dev_err() instead of dev_dbg() for
alerting when regulator has nonunique value.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/power/regulator/regulator-uclass.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/power/regulator/regulator-uclass.c b/drivers/power/regulator/regulator-uclass.c
index decd0802c84..aa6918ef50a 100644
--- a/drivers/power/regulator/regulator-uclass.c
+++ b/drivers/power/regulator/regulator-uclass.c
@@ -9,6 +9,7 @@
 #include <errno.h>
 #include <dm.h>
 #include <log.h>
+#include <dm/device_compat.h>
 #include <dm/uclass-internal.h>
 #include <linux/delay.h>
 #include <power/pmic.h>
@@ -43,8 +44,8 @@ static void regulator_set_value_ramp_delay(struct udevice *dev, int old_uV,
 {
 	int delay = DIV_ROUND_UP(abs(new_uV - old_uV), ramp_delay);
 
-	debug("regulator %s: delay %u us (%d uV -> %d uV)\n", dev->name, delay,
-	      old_uV, new_uV);
+	dev_dbg(dev, "regulator %s: delay %u us (%d uV -> %d uV)\n", dev->name, delay,
+		old_uV, new_uV);
 
 	udelay(delay);
 }
@@ -263,7 +264,7 @@ int regulator_get_by_platname(const char *plat_name, struct udevice **devp)
 	for (ret = uclass_find_first_device(UCLASS_REGULATOR, &dev); dev;
 	     ret = uclass_find_next_device(&dev)) {
 		if (ret) {
-			debug("regulator %s, ret=%d\n", dev->name, ret);
+			dev_dbg(dev, "regulator %s, ret=%d\n", dev->name, ret);
 			continue;
 		}
 
@@ -439,16 +440,16 @@ static int regulator_post_bind(struct udevice *dev)
 	/* Regulator's mandatory constraint */
 	uc_pdata->name = dev_read_string(dev, property);
 	if (!uc_pdata->name) {
-		debug("%s: dev '%s' has no property '%s'\n",
-		      __func__, dev->name, property);
+		dev_dbg(dev, "%s: dev '%s' has no property '%s'\n",
+			__func__, dev->name, property);
 		uc_pdata->name = dev_read_name(dev);
 		if (!uc_pdata->name)
 			return -EINVAL;
 	}
 
 	if (!regulator_name_is_unique(dev, uc_pdata->name)) {
-		debug("'%s' of dev: '%s', has nonunique value: '%s\n",
-		      property, dev->name, uc_pdata->name);
+		dev_err(dev, "'%s' of dev: '%s', has nonunique value: '%s\n",
+			property, dev->name, uc_pdata->name);
 		return -EINVAL;
 	}
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
