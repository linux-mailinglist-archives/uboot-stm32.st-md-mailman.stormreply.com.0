Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CD4264985
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 18:18:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1672C3FAFE
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 16:18:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C643EC3FAE3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 16:18:27 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08AGDADx013125; Thu, 10 Sep 2020 18:18:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=622U/G2f2UhwGSgNbRGhHbrirybN982HhMIj3wPf9P0=;
 b=KH8k73/Wh9LvfM171ZAM154fVtZIkKOpEC7atA+Wy4vH2tPDLZoS9COp3W2231Q+nWsU
 mbUEdccMQJ9oePjVEy1zglVnDomEUbO9TC592M4TyUPTRCliWKBFatsqUNvZ6Efg7Ve5
 rAUfb7ZUMVTEK5tVjb2Yuu6kTMpy5clGehDtaHwJFlL5HKz7cyWn+oDSCO4d/sEOjVuV
 0QE5f/YTMeZdmct6DX36d19rkHCBmRb/Z6k4MlC9Y4sftvB37J9Pd/RW832NXu3nRB4a
 zH/ZgweNM7yNqLlgWmbbUiI6JGgjRRJuOs71FYUWQgrk+MbU3Hy8Onii7H20S1TM7Jgf lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c051m71n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 18:18:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BE8E5100038;
 Thu, 10 Sep 2020 18:18:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AF9EE2BA2D8;
 Thu, 10 Sep 2020 18:18:20 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 10 Sep 2020 18:18:20 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 10 Sep 2020 18:18:17 +0200
Message-ID: <20200910161817.27535-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910161817.27535-1-patrick.delaunay@st.com>
References: <20200910161817.27535-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-10_05:2020-09-10,
 2020-09-10 signatures=0
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/2] power: regulator: gpio-regulator: Convert
	to use APIs which support live DT
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

 drivers/power/regulator/gpio-regulator.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/power/regulator/gpio-regulator.c b/drivers/power/regulator/gpio-regulator.c
index 017a3644fe..28c9e222e2 100644
--- a/drivers/power/regulator/gpio-regulator.c
+++ b/drivers/power/regulator/gpio-regulator.c
@@ -18,8 +18,6 @@
 
 #define GPIO_REGULATOR_MAX_STATES	2
 
-DECLARE_GLOBAL_DATA_PTR;
-
 struct gpio_regulator_platdata {
 	struct regulator_common_platdata common;
 	struct gpio_desc gpio; /* GPIO for regulator voltage control */
@@ -32,8 +30,6 @@ static int gpio_regulator_ofdata_to_platdata(struct udevice *dev)
 	struct dm_regulator_uclass_platdata *uc_pdata;
 	struct gpio_regulator_platdata *dev_pdata;
 	struct gpio_desc *gpio;
-	const void *blob = gd->fdt_blob;
-	int node = dev_of_offset(dev);
 	int ret, count, i, j;
 	u32 states_array[GPIO_REGULATOR_MAX_STATES * 2];
 
@@ -57,12 +53,20 @@ static int gpio_regulator_ofdata_to_platdata(struct udevice *dev)
 	if (ret)
 		debug("regulator gpio - not found! Error: %d", ret);
 
-	count = fdtdec_get_int_array_count(blob, node, "states",
-					   states_array,
-					   ARRAY_SIZE(states_array));
+	ret = dev_read_size(dev, "states");
+	if (ret < 0)
+		return ret;
 
-	if (!count)
-		return -EINVAL;
+	count = ret / sizeof(states_array[0]);
+	if (count > ARRAY_SIZE(states_array)) {
+		debug("regulator gpio - to many states (%d > %d)",
+		      count / 2, GPIO_REGULATOR_MAX_STATES);
+		count = ARRAY_SIZE(states_array);
+	}
+
+	ret = dev_read_u32_array(dev, "states", states_array, count);
+	if (ret < 0)
+		return ret;
 
 	for (i = 0, j = 0; i < count; i += 2) {
 		dev_pdata->voltages[j] = states_array[i];
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
