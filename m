Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8693758799D
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 Aug 2022 11:09:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 519F0C640F5;
	Tue,  2 Aug 2022 09:09:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98D8FC0D2C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Aug 2022 09:09:23 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27290c0B020349;
 Tue, 2 Aug 2022 11:09:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=b2yT4rCAbTXBx+TO8x+iHEcVgfAR65vl0c4ojPIloF8=;
 b=Gup4uhEMPN+Kj2uwbbPJPS4DmVcHXvgEpQb+3aOpjeB01mwjIpAXWH1T/qqwz+R+NCP9
 AzQgA/UTCd+wYLugYzc/MRrw8sFizxYP2qZVzElUVmufHC+/9/1lTrhwpDDKkL/bM0c6
 /yXv6IUQQ8PLNrhx+ZrIfM4x9gDkotZfet9PeaD7B/FlympohAJ+mAlYGcVmrBrmdM/L
 jeHDT2v0vWF8ctVcbmZ5kzFc661+LnI76wc70lTP1haeTUzncYe+4e22Z2kU7kI5a7Pb
 YiUPrzaC20FnYPOruTTMGAwwyTuYB9AMaZ3AnCfY5OzkeJ6DrMvUdnW6cyz5EFdnVriA dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hmt2kb967-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Aug 2022 11:09:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 634E210002A;
 Tue,  2 Aug 2022 11:09:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EB3D221FEB2;
 Tue,  2 Aug 2022 11:09:12 +0200 (CEST)
Received: from localhost (10.75.127.51) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 2 Aug
 2022 11:09:12 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 2 Aug 2022 11:09:08 +0200
Message-ID: <20220802090910.277343-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802090910.277343-1-patrice.chotard@foss.st.com>
References: <20220802090910.277343-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-02_05,2022-08-01_01,2022-06-22_01
Cc: Samuel Holland <samuel@sholland.org>, Andrew Jeffery <andrew@aj.id.au>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Eddie James <eajames@linux.ibm.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/3] gpio: Allow to print pin's label even for
	pin with GPIOF_FUNC function
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

Currently, if pin's function is GPIOF_FUNC, only "func" if displayed
without any other information. It would be interesting, if information is
available, to indicate which pinmuxing's name is used.

For example, for STM32 SoC's based platform, "gpio status" command
output :

   before
    Bank GPIOZ:
      GPIOZ0: unused : 0 [ ]
      GPIOZ1: unused : 0 [ ]
      GPIOZ2: unused : 0 [ ]
      GPIOZ3: unused : 0 [ ]
      GPIOZ4: func
      GPIOZ5: func
      GPIOZ6: unused : 0 [ ]
      GPIOZ7: unused : 0 [ ]
      GPIOZ8: unknown
      GPIOZ9: unknown
      GPIOZ10: unknown
      GPIOZ11: unknown
      GPIOZ12: unknown
      GPIOZ13: unknown
      GPIOZ14: unknown
      GPIOZ15: unknown

   After
    Bank GPIOZ:
      GPIOZ0: unused : 0 [ ]
      GPIOZ1: unused : 0 [ ]
      GPIOZ2: unused : 0 [ ]
      GPIOZ3: unused : 0 [ ]
      GPIOZ4: func i2c4-0
      GPIOZ5: func i2c4-0
      GPIOZ6: unused : 0 [ ]
      GPIOZ7: unused : 0 [ ]
      GPIOZ8: unknown
      GPIOZ9: unknown
      GPIOZ10: unknown
      GPIOZ11: unknown
      GPIOZ12: unknown
      GPIOZ13: unknown
      GPIOZ14: unknown
      GPIOZ15: unknown

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/gpio/gpio-uclass.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
index 0ed32b7217..d60e46159a 100644
--- a/drivers/gpio/gpio-uclass.c
+++ b/drivers/gpio/gpio-uclass.c
@@ -884,26 +884,31 @@ int gpio_get_status(struct udevice *dev, int offset, char *buf, int buffsize)
 	const struct dm_gpio_ops *ops = gpio_get_ops(dev);
 	struct gpio_dev_priv *priv;
 	char *str = buf;
+	const char *label;
 	int func;
 	int ret;
 	int len;
+	bool used;
 
 	BUILD_BUG_ON(GPIOF_COUNT != ARRAY_SIZE(gpio_function));
 
 	*buf = 0;
 	priv = dev_get_uclass_priv(dev);
-	ret = gpio_get_raw_function(dev, offset, NULL);
+	ret = gpio_get_raw_function(dev, offset, &label);
 	if (ret < 0)
 		return ret;
 	func = ret;
 	len = snprintf(str, buffsize, "%s%d: %s",
 		       priv->bank_name ? priv->bank_name : "",
 		       offset, gpio_function[func]);
-	if (func == GPIOF_INPUT || func == GPIOF_OUTPUT ||
-	    func == GPIOF_UNUSED) {
-		const char *label;
-		bool used;
 
+	switch (func) {
+	case GPIOF_FUNC:
+		snprintf(str + len, buffsize - len, " %s", label ? label : "");
+		break;
+	case GPIOF_INPUT:
+	case GPIOF_OUTPUT:
+	case GPIOF_UNUSED:
 		ret = ops->get_value(dev, offset);
 		if (ret < 0)
 			return ret;
@@ -913,6 +918,7 @@ int gpio_get_status(struct udevice *dev, int offset, char *buf, int buffsize)
 			 used ? 'x' : ' ',
 			 used ? " " : "",
 			 label ? label : "");
+		break;
 	}
 
 	return 0;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
