Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF51264986
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 18:18:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D85CCC424B8
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 16:18:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4043DC3FAE3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 16:18:28 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08AGGoDT023146; Thu, 10 Sep 2020 18:18:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=lccH6lOyYpcmpo0Ov/wWvpCd1DhxkVdx7xkNUe5tCcY=;
 b=wPr6KrEg65BhnEL+AYHUumMZxSbysSLT7pytJAVNswY5DnXxUejDe4oLCPA0sCUi16fr
 zqGzYfvQzFVGyUYZlccGb7YggOvsAuScccuawImCwpufANrOizhId0Go3JcIELKXFjB4
 LzHqeCSTRN67T1LfKQ/rBWNENweLbMXWxlpjhen18J9IznxTYuwLmfeMLIjpNjYA2lUn
 f1CsfQJvxF+GshZ/Zi7U7/E53+BW7Y95oSX8ClkVn8Jq/H6rLz16VKeYDpRDGV/sX+xV
 nMLdFPfhwd2OuBRUt5pEUiRNdZV4nTO3u5xxpTVNs06zoU19XL3h1WYm87+8CC8JeYsM jQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c0ev45ah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 18:18:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E6527100034;
 Thu, 10 Sep 2020 18:18:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D92742BA2D8;
 Thu, 10 Sep 2020 18:18:19 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 10 Sep 2020 18:18:19 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 10 Sep 2020 18:18:16 +0200
Message-ID: <20200910161817.27535-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-10_04:2020-09-10,
 2020-09-10 signatures=0
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] power: regulator: gpio-regulator: protect
	count value
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

Update the size of states_array to avoid overflow for
dev_pdata->voltages[j] and dev_pdata->states[j].

As the size of array is GPIO_REGULATOR_MAX_STATES, the size of
states_array is limited by GPIO_REGULATOR_MAX_STATES * 2 = 4
instead of 8 previously.

The value of the "count" variable is limited by the third parameter of
fdtdec_get_int_array_count.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/power/regulator/gpio-regulator.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/power/regulator/gpio-regulator.c b/drivers/power/regulator/gpio-regulator.c
index 947f812d09..017a3644fe 100644
--- a/drivers/power/regulator/gpio-regulator.c
+++ b/drivers/power/regulator/gpio-regulator.c
@@ -35,7 +35,7 @@ static int gpio_regulator_ofdata_to_platdata(struct udevice *dev)
 	const void *blob = gd->fdt_blob;
 	int node = dev_of_offset(dev);
 	int ret, count, i, j;
-	u32 states_array[8];
+	u32 states_array[GPIO_REGULATOR_MAX_STATES * 2];
 
 	dev_pdata = dev_get_platdata(dev);
 	uc_pdata = dev_get_uclass_platdata(dev);
@@ -58,7 +58,8 @@ static int gpio_regulator_ofdata_to_platdata(struct udevice *dev)
 		debug("regulator gpio - not found! Error: %d", ret);
 
 	count = fdtdec_get_int_array_count(blob, node, "states",
-					   states_array, 8);
+					   states_array,
+					   ARRAY_SIZE(states_array));
 
 	if (!count)
 		return -EINVAL;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
