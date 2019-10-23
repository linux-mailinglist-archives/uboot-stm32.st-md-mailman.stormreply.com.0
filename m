Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93643E1D14
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 15:45:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E32F2C36B0E
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 13:45:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CFA0C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 13:45:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9NDgvlR013918; Wed, 23 Oct 2019 15:44:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=0a88TOZ8ke0BbkAm+WvSI7hsLSHO2KZTTnloOhxT9nU=;
 b=sGKpJhD+cs8Fs/MoywfTKq/GHcTwib/ANdP8OngUXGLiwghR77/MigKUk976rv3jqGlE
 naqk2DUfRTswB5GUE+dqKUF0aLMQ1anLpmizHraERVof5KRoiW4+LkbVehzvPnmHo8F2
 SA8tkJ4tXiAO+4Ya9LyNPoK1v5w6OMNyWasCU+UlFaZlP/yZUcc0B3IOrcyuZR+l55lO
 jGHRxkmmH8Cq6ZrejnwtmyY9wTAwyYpaXkGdpR4VwRbJponK0ypt8li6kdNIUiVmox0O
 nuNSNxHIgVsjE7Y68rPrF9Q8+fKzMyZzYRtvdTL3CM2nCHLTOnU9SQUOCeNqe1MGvHB7 dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vt9s4uxdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 15:44:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C34A9100034;
 Wed, 23 Oct 2019 15:44:54 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B7DB62FF5FE;
 Wed, 23 Oct 2019 15:44:54 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct
 2019 15:44:55 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 15:44:54
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 23 Oct 2019 15:44:36 +0200
Message-ID: <20191023134448.20149-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023134448.20149-1-patrick.delaunay@st.com>
References: <20191023134448.20149-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_03:2019-10-23,2019-10-23 signatures=0
Cc: Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Lukasz Majewski <lukma@denx.de>,
 Christoph Muellner <christoph.muellner@theobroma-systems.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: [Uboot-stm32] [PATCH 01/13] pinctrol: dm: remove the function
	pinctrl_decode_pin_config
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

Remove the pinctrl_decode_pin_config() API, because this
function is unused and not compatible with livetree
(it uses fdtdec_get_bool instead of ofnode API).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/pinctrl/pinctrl-uclass.c | 12 ------------
 include/dm/pinctrl.h             | 13 -------------
 2 files changed, 25 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-uclass.c b/drivers/pinctrl/pinctrl-uclass.c
index 761ee29f41..3425ed11b1 100644
--- a/drivers/pinctrl/pinctrl-uclass.c
+++ b/drivers/pinctrl/pinctrl-uclass.c
@@ -15,18 +15,6 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
-int pinctrl_decode_pin_config(const void *blob, int node)
-{
-	int flags = 0;
-
-	if (fdtdec_get_bool(blob, node, "bias-pull-up"))
-		flags |= 1 << PIN_CONFIG_BIAS_PULL_UP;
-	else if (fdtdec_get_bool(blob, node, "bias-pull-down"))
-		flags |= 1 << PIN_CONFIG_BIAS_PULL_DOWN;
-
-	return flags;
-}
-
 #if CONFIG_IS_ENABLED(PINCTRL_FULL)
 /**
  * pinctrl_config_one() - apply pinctrl settings for a single node
diff --git a/include/dm/pinctrl.h b/include/dm/pinctrl.h
index 3eca34fbf7..692e5fc8cb 100644
--- a/include/dm/pinctrl.h
+++ b/include/dm/pinctrl.h
@@ -369,19 +369,6 @@ int pinctrl_request_noflags(struct udevice *dev, int func);
  */
 int pinctrl_get_periph_id(struct udevice *dev, struct udevice *periph);
 
-/**
- * pinctrl_decode_pin_config() - decode pin configuration flags
- *
- * This decodes some of the PIN_CONFIG values into flags, with each value
- * being (1 << pin_cfg). This does not support things with values like the
- * slew rate.
- *
- * @blob:	Device tree blob
- * @node:	Node containing the PIN_CONFIG values
- * @return decoded flag value, or -ve on error
- */
-int pinctrl_decode_pin_config(const void *blob, int node);
-
 /**
  * pinctrl_get_gpio_mux() - get the mux value for a particular GPIO
  *
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
