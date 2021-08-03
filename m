Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C93E43DEA5A
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Aug 2021 12:05:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6888C5A4CD;
	Tue,  3 Aug 2021 10:05:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 903EDC597BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Aug 2021 10:05:36 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 173A3dim002743; Tue, 3 Aug 2021 12:05:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=KLPWDTl7ah8P75cfvjRNE6GGnN1qp6/3rDziJJ2YsJo=;
 b=1634xwKoTyBw5aSZepotxj6JFqfSfm26/2xIqdQCFkTbVEK7f+lBv7kpFlov0T8NQcYV
 zp8CD0Z0bzB6fsTg4s3tRFdgMWPogzKi1kalfsT3Aqm5o4nL9qC1mgcAoDDrhuFvMH7P
 l9mH+maMTmk+zeF1w654wGY+O0lVD6ZZTsDaAHX6J9ZsS3Curyt4fhQRgeJZ3Wpz1qgF
 eMMJcFH/8YqgNfnnkL3oxFTfpQMI0b0KtC3GsiZ89ef/mypjh6EKlZSYaW/mWPmcqz73
 1Umdzcl+cHCi3EcK00yjJN2hN4sym3KZpTf0GnRqOg7cCBfO1aHqYmw+pXH6D0H0anTj Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a70js158r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 12:05:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8354210002A;
 Tue,  3 Aug 2021 12:05:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A24E21BF5A;
 Tue,  3 Aug 2021 12:05:34 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Aug 2021 12:05:34
 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 3 Aug 2021 12:05:12 +0200
Message-ID: <20210803100515.29383-5-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210803100515.29383-1-patrice.chotard@foss.st.com>
References: <20210803100515.29383-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-03_02:2021-08-03,
 2021-08-03 signatures=0
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>
Subject: [Uboot-stm32] [PATCH v1 4/7] i2c: stm32f7: support DT binding
	i2c-analog-filter
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

From: Patrick Delaunay <patrick.delaunay@foss.st.com>

Replace driver internally coded enabling/disabling of the
analog-filter with the DT binding "i2c-analog-filter".

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/i2c/stm32f7_i2c.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
index b449084b5f..e71a0e0aa3 100644
--- a/drivers/i2c/stm32f7_i2c.c
+++ b/drivers/i2c/stm32f7_i2c.c
@@ -108,7 +108,6 @@ struct stm32_i2c_regs {
 #define STM32_I2C_DNF_DEFAULT			0
 #define STM32_I2C_DNF_MAX			16
 
-#define STM32_I2C_ANALOG_FILTER_ENABLE	1
 #define STM32_I2C_ANALOG_FILTER_DELAY_MIN	50	/* ns */
 #define STM32_I2C_ANALOG_FILTER_DELAY_MAX	260	/* ns */
 
@@ -919,7 +918,7 @@ static int stm32_of_to_plat(struct udevice *dev)
 					 STM32_I2C_FALL_TIME_DEFAULT);
 
 	i2c_priv->setup.dnf = STM32_I2C_DNF_DEFAULT;
-	i2c_priv->setup.analog_filter = STM32_I2C_ANALOG_FILTER_ENABLE;
+	i2c_priv->setup.analog_filter = dev_read_bool(dev, "i2c-analog-filter");
 
 	/* Optional */
 	i2c_priv->regmap = syscon_regmap_lookup_by_phandle(dev,
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
