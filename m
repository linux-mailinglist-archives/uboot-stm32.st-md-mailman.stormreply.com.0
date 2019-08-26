Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CC89CE94
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Aug 2019 13:50:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2480CC36B3F
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Aug 2019 11:50:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81705C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2019 11:50:57 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7QBlCmC009093; Mon, 26 Aug 2019 13:50:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=O5emuF/jtxboUrbFPZuDeAl4k+va/eAFfZl5Ss0aQy4=;
 b=hEAxsoGSMJO003F0253kyTGtUh5NPtPWZ+GZlF6yfIqOu0+xgF3jsSCApApf2dqk2m6W
 iCi79jipA/26QJC7hAYwetrDPQ68ilfSIj5HE/eJrebDDjRpPV3hAjPQAYRljtvTl1vP
 CqPthgBb7hxYFMgjXwkaHLUC2FJWyxrp1710FVGqn61iiRzuPQeFhcejHxbS2aXXad2H
 yZrgyFygK+xPzvtfzZMzVd98fDHeO7Y0cNTVb+5J2UgDlWTTRQYW0hddOWT8TRAaXTI8
 xQ2ccWPJ81AMynMz0b7Ga0vfmDt3+QrdaSWszmIfPMGRw6yVv911FvULwZqIapF4ExVd Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2ujv4kkb2v-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 26 Aug 2019 13:50:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2CDC931;
 Mon, 26 Aug 2019 11:50:47 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 16D072DA0B8;
 Mon, 26 Aug 2019 13:50:47 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 26 Aug
 2019 13:50:47 +0200
Received: from localhost (10.201.23.73) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 26 Aug 2019 13:50:46
 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 26 Aug 2019 13:50:31 +0200
Message-ID: <20190826115031.25099-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.201.23.73]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-26_06:, , signatures=0
Cc: Christophe Kerello <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, Lukasz
 Majewski <lukma@denx.de>, Jaehoon Chung <jh80.chung@samsung.com>,
 Sven Schwermer <sven@svenschwermer.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2] regulator: fixed: Modify
	enable-active-high behavior
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

Regulator should not be enabled at probe time if regulator-boot-on
property is not in the dt node.

"enable-active-high" property is only used to indicate the GPIO
polarity.

See kernel documentation :
 - Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
 - Documentation/devicetree/bindings/regulator/gpio-regulator.yaml

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

Changes in v2:
  - fix build issue

 drivers/power/regulator/regulator_common.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/power/regulator/regulator_common.c b/drivers/power/regulator/regulator_common.c
index 3dabbe2a85..2041086567 100644
--- a/drivers/power/regulator/regulator_common.c
+++ b/drivers/power/regulator/regulator_common.c
@@ -12,10 +12,15 @@ int regulator_common_ofdata_to_platdata(struct udevice *dev,
 	struct regulator_common_platdata *dev_pdata, const char *enable_gpio_name)
 {
 	struct gpio_desc *gpio;
+	struct dm_regulator_uclass_platdata *uc_pdata;
 	int flags = GPIOD_IS_OUT;
 	int ret;
 
-	if (dev_read_bool(dev, "enable-active-high"))
+	uc_pdata = dev_get_uclass_platdata(dev);
+
+	if (!dev_read_bool(dev, "enable-active-high"))
+		flags |= GPIOD_ACTIVE_LOW;
+	if (uc_pdata->boot_on)
 		flags |= GPIOD_IS_OUT_ACTIVE;
 
 	/* Get optional enable GPIO desc */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
