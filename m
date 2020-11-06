Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 472202A9B64
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 19:02:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0ED10C3FAE2;
	Fri,  6 Nov 2020 18:02:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 115E1C3FAD9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 18:02:18 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6Hw7Uj013730; Fri, 6 Nov 2020 19:02:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Qmk+6panKMvKNRII9FZQemG481qB5DTUMicrq/4m3C0=;
 b=EQR90YnOChIj5KF+Oy89EnDEJQVjTRkX4ogeQgxqkEh5EKE4xOhsDqPlO/uK3j06ju/V
 +zQuunQijHi9gsGRbrDjT54LfrqgejClg5MWajgyZaSWFTONAr3EnjFmqS3U7vAS7/u7
 bP5fio+lvht4Y14+mErcc8aUySQTPbcBw+rIahpflj4hVE9G/dMa4EE6h/Es9+UkhmQS
 Qjw+rE3U3Vg8Ir8aDeJwCTBhk0geh2oiruicUR3qQ0bDbib7U9ME9K8526bPv/kUSOZo
 Y/Z9lLa00jvad+a6/c4j5QW40752a/4v1k5a2a9bGW7hgSH/adoVdvJdRLvhrMNCh1aL LA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gyw1xg9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 19:02:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C4A4310002A;
 Fri,  6 Nov 2020 19:02:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE9DD24C782;
 Fri,  6 Nov 2020 19:02:11 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 19:02:10
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 19:01:32 +0100
Message-ID: <20201106180201.31784-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106180201.31784-1-patrick.delaunay@st.com>
References: <20201106180201.31784-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 04/33] pinctrl: stm32: migrate trace to log
	macro
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

Change debug to log macro and define LOG_CATEGORY.

Remove "%s:" with __func__ as it is managed by log macro
(CONFIG_LOGF_FUNC)

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---

Changes in v2:
- Solve merge conflict
- Add dm/device_compat.h

 drivers/pinctrl/pinctrl_stm32.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
index dbea99532c..5f944d5bc5 100644
--- a/drivers/pinctrl/pinctrl_stm32.c
+++ b/drivers/pinctrl/pinctrl_stm32.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2017-2020 STMicroelectronics - All Rights Reserved
  */
 
+#define LOG_CATEGORY UCLASS_PINCTRL
+
 #include <common.h>
 #include <dm.h>
 #include <hwspinlock.h>
@@ -256,8 +258,8 @@ static int stm32_pinctrl_probe(struct udevice *dev)
 	/* hwspinlock property is optional, just log the error */
 	ret = hwspinlock_get_by_index(dev, 0, &priv->hws);
 	if (ret)
-		debug("%s: hwspinlock_get_by_index may have failed (%d)\n",
-		      __func__, ret);
+		dev_dbg(dev, "hwspinlock_get_by_index may have failed (%d)\n",
+			ret);
 
 	return 0;
 }
@@ -305,8 +307,7 @@ static int prep_gpio_dsc(struct stm32_gpio_dsc *gpio_dsc, u32 port_pin)
 {
 	gpio_dsc->port = (port_pin & 0x1F000) >> 12;
 	gpio_dsc->pin = (port_pin & 0x0F00) >> 8;
-	debug("%s: GPIO:port= %d, pin= %d\n", __func__, gpio_dsc->port,
-	      gpio_dsc->pin);
+	log_debug("GPIO:port= %d, pin= %d\n", gpio_dsc->port, gpio_dsc->pin);
 
 	return 0;
 }
@@ -347,9 +348,9 @@ static int prep_gpio_ctl(struct stm32_gpio_ctl *gpio_ctl, u32 gpio_fn,
 	else
 		gpio_ctl->pupd = STM32_GPIO_PUPD_NO;
 
-	debug("%s: gpio fn= %d, slew-rate= %x, op type= %x, pull-upd is = %x\n",
-	      __func__,  gpio_fn, gpio_ctl->speed, gpio_ctl->otype,
-	     gpio_ctl->pupd);
+	log_debug("gpio fn= %d, slew-rate= %x, op type= %x, pull-upd is = %x\n",
+		  gpio_fn, gpio_ctl->speed, gpio_ctl->otype,
+		  gpio_ctl->pupd);
 
 	return 0;
 }
@@ -373,7 +374,7 @@ static int stm32_pinctrl_config(ofnode node)
 		if (rv < 0)
 			return rv;
 		len = rv / sizeof(pin_mux[0]);
-		debug("%s: no of pinmux entries= %d\n", __func__, len);
+		log_debug("No of pinmux entries= %d\n", len);
 		if (len > MAX_PINS_ONE_IP)
 			return -EINVAL;
 		rv = ofnode_read_u32_array(subnode, "pinmux", pin_mux, len);
@@ -382,7 +383,7 @@ static int stm32_pinctrl_config(ofnode node)
 		for (i = 0; i < len; i++) {
 			struct gpio_desc desc;
 
-			debug("%s: pinmux = %x\n", __func__, *(pin_mux + i));
+			log_debug("pinmux = %x\n", *(pin_mux + i));
 			prep_gpio_dsc(&gpio_dsc, *(pin_mux + i));
 			prep_gpio_ctl(&gpio_ctl, *(pin_mux + i), subnode);
 			rv = uclass_get_device_by_seq(UCLASS_GPIO,
@@ -392,7 +393,7 @@ static int stm32_pinctrl_config(ofnode node)
 				return rv;
 			desc.offset = gpio_dsc.pin;
 			rv = stm32_gpio_config(&desc, &gpio_ctl);
-			debug("%s: rv = %d\n\n", __func__, rv);
+			log_debug("rv = %d\n\n", rv);
 			if (rv)
 				return rv;
 		}
@@ -408,7 +409,7 @@ static int stm32_pinctrl_bind(struct udevice *dev)
 	int ret;
 
 	dev_for_each_subnode(node, dev) {
-		debug("%s: bind %s\n", __func__, ofnode_get_name(node));
+		dev_dbg(dev, "bind %s\n", ofnode_get_name(node));
 
 		ofnode_get_property(node, "gpio-controller", &ret);
 		if (ret < 0)
@@ -424,7 +425,7 @@ static int stm32_pinctrl_bind(struct udevice *dev)
 		if (ret)
 			return ret;
 
-		debug("%s: bind %s\n", __func__, name);
+		dev_dbg(dev, "bind %s\n", name);
 	}
 
 	return 0;
@@ -448,7 +449,7 @@ static int stm32_pinctrl_set_state_simple(struct udevice *dev,
 	if (!list)
 		return -EINVAL;
 
-	debug("%s: periph->name = %s\n", __func__, periph->name);
+	dev_dbg(dev, "periph->name = %s\n", periph->name);
 
 	size /= sizeof(*list);
 	for (i = 0; i < size; i++) {
@@ -456,7 +457,8 @@ static int stm32_pinctrl_set_state_simple(struct udevice *dev,
 
 		config_node = ofnode_get_by_phandle(phandle);
 		if (!ofnode_valid(config_node)) {
-			pr_err("prop pinctrl-0 index %d invalid phandle\n", i);
+			dev_err(periph,
+				"prop pinctrl-0 index %d invalid phandle\n", i);
 			return -EINVAL;
 		}
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
