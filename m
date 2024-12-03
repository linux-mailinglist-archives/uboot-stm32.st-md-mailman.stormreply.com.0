Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D9A9E18E3
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Dec 2024 11:10:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E76AAC6C83D;
	Tue,  3 Dec 2024 10:10:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A56F9C5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 10:10:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B37fjYD008546;
 Tue, 3 Dec 2024 11:10:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=lY5VbOW+oblvng9ZPjtntz
 JDUsWt5V73M/Xcowk75Bk=; b=eIgtUgOdiugmkKPj9bO+lBXox9ZC7JOmn9tC1T
 42s0qlTqxHxApmLU6gsA117LKFackNfDcrY1LVcfQ4P/ANsAgUcktI7Is+PYBzLu
 eueT5ZsP50WO7UDLnjj/nNtSXsoOgf/X4AVkNmPPPXCW5AmF4pHoHPHmo2hbb+ff
 bkACGlt2fG6G5MoOGwzxWi9s5IdeOjTGzDCp8294n3IaRhYgrB3rgycacQkK7Vjt
 wstnnrd8zbfRDUBLWKWZ53XgRL9N5Iq4xdJ8gRjFrXcmoDbSU4J2yLxOOSx+4aIY
 bSvb4D68ODJAZP4EZ8tD+/GS7lNTl/lKlfHVVbGnSumMddgg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 437rq94esn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2024 11:10:15 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B8F9040053;
 Tue,  3 Dec 2024 11:08:54 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 15ED1267112;
 Tue,  3 Dec 2024 11:06:14 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 3 Dec
 2024 11:06:13 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 3 Dec 2024 11:06:10 +0100
Message-ID: <20241203100611.354468-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Jonas Karlman <jonas@kwiboo.se>, Quentin Schulz <quentin.schulz@cherry.de>,
 Simon Glass <sjg@chromium.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 1/2] power: regulator: replace some debug()
	by dev_dbg()
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

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

Changes in v2:
      - rework dev_dbg() message to avoid printing twice dev->name.

 drivers/power/regulator/regulator-uclass.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/power/regulator/regulator-uclass.c b/drivers/power/regulator/regulator-uclass.c
index decd0802c84..80ea5e65d48 100644
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
@@ -43,8 +44,7 @@ static void regulator_set_value_ramp_delay(struct udevice *dev, int old_uV,
 {
 	int delay = DIV_ROUND_UP(abs(new_uV - old_uV), ramp_delay);
 
-	debug("regulator %s: delay %u us (%d uV -> %d uV)\n", dev->name, delay,
-	      old_uV, new_uV);
+	dev_dbg(dev, "delay %u us (%d uV -> %d uV)\n", delay, old_uV, new_uV);
 
 	udelay(delay);
 }
@@ -263,7 +263,7 @@ int regulator_get_by_platname(const char *plat_name, struct udevice **devp)
 	for (ret = uclass_find_first_device(UCLASS_REGULATOR, &dev); dev;
 	     ret = uclass_find_next_device(&dev)) {
 		if (ret) {
-			debug("regulator %s, ret=%d\n", dev->name, ret);
+			dev_dbg(dev, "ret=%d\n", ret);
 			continue;
 		}
 
@@ -439,16 +439,15 @@ static int regulator_post_bind(struct udevice *dev)
 	/* Regulator's mandatory constraint */
 	uc_pdata->name = dev_read_string(dev, property);
 	if (!uc_pdata->name) {
-		debug("%s: dev '%s' has no property '%s'\n",
-		      __func__, dev->name, property);
+		dev_dbg(dev, "has no property '%s'\n", property);
 		uc_pdata->name = dev_read_name(dev);
 		if (!uc_pdata->name)
 			return -EINVAL;
 	}
 
 	if (!regulator_name_is_unique(dev, uc_pdata->name)) {
-		debug("'%s' of dev: '%s', has nonunique value: '%s\n",
-		      property, dev->name, uc_pdata->name);
+		dev_dbg(dev, "'%s' has nonunique value: '%s\n",
+			property, uc_pdata->name);
 		return -EINVAL;
 	}
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
