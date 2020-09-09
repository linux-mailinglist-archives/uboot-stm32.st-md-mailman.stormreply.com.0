Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7912630F7
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 17:51:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6EEFC3FAE2
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 15:51:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2814DC3FAE1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 15:51:36 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 089FlNNA001708; Wed, 9 Sep 2020 17:51:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=qNvfBomvmYSPl4htYRLfhCKnEuKKwuPHEQSmUZJXpzI=;
 b=rR8JdiEHL6ordL95F3sMPh/cLChfw5Wv4DPQxddc1/y9/mGHISgR5UMi8sVUvihiJ0c/
 krPNkIOB2j001nxl3LQIsC/5kE+gDtR/nEd+Npj7u6tDlw1zCi8rHTEPruiZj3G0vv5r
 8Z2MGRRT0893XXPeuz9PYKblMk3D+ANDFyYn6pllzJjB2DtIC+zWVS2aQ65o0728yfiU
 Rz6NbwhCiVWETjmLjR1ONpI5oMauAPcJT9x8ti2tIxUtpgvf6ouCvZrDhGCjJJYs4qSY
 LBTcoh1AW8SxAPh+ZLTVoeOty8DqZd3tGYKVB5D+s/KorDdf1+JRGGlaf7RQ8rUmGKe4 Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c1jf6ar3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 17:51:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D604C10002A;
 Wed,  9 Sep 2020 17:51:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CACC82BE242;
 Wed,  9 Sep 2020 17:51:34 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 9 Sep 2020 17:50:36 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 9 Sep 2020 17:50:14 +0200
Message-ID: <20200909155015.29227-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_09:2020-09-09,
 2020-09-09 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] pinctrl: stm32: Convert to use APIs which
	support live DT
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

 drivers/pinctrl/pinctrl_stm32.c | 43 ++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
index 71fa29a389..24ed83dd46 100644
--- a/drivers/pinctrl/pinctrl_stm32.c
+++ b/drivers/pinctrl/pinctrl_stm32.c
@@ -13,8 +13,6 @@
 #include <linux/err.h>
 #include <linux/libfdt.h>
 
-DECLARE_GLOBAL_DATA_PTR;
-
 #define MAX_PINS_ONE_IP			70
 #define MODE_BITS_MASK			3
 #define OSPEED_MASK			3
@@ -308,7 +306,8 @@ static int prep_gpio_dsc(struct stm32_gpio_dsc *gpio_dsc, u32 port_pin)
 	return 0;
 }
 
-static int prep_gpio_ctl(struct stm32_gpio_ctl *gpio_ctl, u32 gpio_fn, int node)
+static int prep_gpio_ctl(struct stm32_gpio_ctl *gpio_ctl, u32 gpio_fn,
+			 ofnode node)
 {
 	gpio_fn &= 0x00FF;
 	gpio_ctl->af = 0;
@@ -329,16 +328,16 @@ static int prep_gpio_ctl(struct stm32_gpio_ctl *gpio_ctl, u32 gpio_fn, int node)
 		break;
 	}
 
-	gpio_ctl->speed = fdtdec_get_int(gd->fdt_blob, node, "slew-rate", 0);
+	gpio_ctl->speed = ofnode_read_u32_default(node, "slew-rate", 0);
 
-	if (fdtdec_get_bool(gd->fdt_blob, node, "drive-open-drain"))
+	if (ofnode_read_bool(node, "drive-open-drain"))
 		gpio_ctl->otype = STM32_GPIO_OTYPE_OD;
 	else
 		gpio_ctl->otype = STM32_GPIO_OTYPE_PP;
 
-	if (fdtdec_get_bool(gd->fdt_blob, node, "bias-pull-up"))
+	if (ofnode_read_bool(node, "bias-pull-up"))
 		gpio_ctl->pupd = STM32_GPIO_PUPD_UP;
-	else if (fdtdec_get_bool(gd->fdt_blob, node, "bias-pull-down"))
+	else if (ofnode_read_bool(node, "bias-pull-down"))
 		gpio_ctl->pupd = STM32_GPIO_PUPD_DOWN;
 	else
 		gpio_ctl->pupd = STM32_GPIO_PUPD_NO;
@@ -350,32 +349,37 @@ static int prep_gpio_ctl(struct stm32_gpio_ctl *gpio_ctl, u32 gpio_fn, int node)
 	return 0;
 }
 
-static int stm32_pinctrl_config(int offset)
+static int stm32_pinctrl_config(ofnode node)
 {
 	u32 pin_mux[MAX_PINS_ONE_IP];
 	int rv, len;
+	ofnode subnode;
 
 	/*
 	 * check for "pinmux" property in each subnode (e.g. pins1 and pins2 for
 	 * usart1) of pin controller phandle "pinctrl-0"
 	 * */
-	fdt_for_each_subnode(offset, gd->fdt_blob, offset) {
+	ofnode_for_each_subnode(subnode, node) {
 		struct stm32_gpio_dsc gpio_dsc;
 		struct stm32_gpio_ctl gpio_ctl;
 		int i;
 
-		len = fdtdec_get_int_array_count(gd->fdt_blob, offset,
-						 "pinmux", pin_mux,
-						 ARRAY_SIZE(pin_mux));
+		rv = ofnode_read_size(subnode, "pinmux");
+		if (rv < 0)
+			return rv;
+		len = rv / sizeof(pin_mux[0]);
 		debug("%s: no of pinmux entries= %d\n", __func__, len);
-		if (len < 0)
+		if (len > MAX_PINS_ONE_IP)
 			return -EINVAL;
+		rv = ofnode_read_u32_array(subnode, "pinmux", pin_mux, len);
+		if (rv < 0)
+			return rv;
 		for (i = 0; i < len; i++) {
 			struct gpio_desc desc;
 
 			debug("%s: pinmux = %x\n", __func__, *(pin_mux + i));
 			prep_gpio_dsc(&gpio_dsc, *(pin_mux + i));
-			prep_gpio_ctl(&gpio_ctl, *(pin_mux + i), offset);
+			prep_gpio_ctl(&gpio_ctl, *(pin_mux + i), subnode);
 			rv = uclass_get_device_by_seq(UCLASS_GPIO,
 						      gpio_dsc.port,
 						      &desc.dev);
@@ -424,19 +428,18 @@ static int stm32_pinctrl_bind(struct udevice *dev)
 #if CONFIG_IS_ENABLED(PINCTRL_FULL)
 static int stm32_pinctrl_set_state(struct udevice *dev, struct udevice *config)
 {
-	return stm32_pinctrl_config(dev_of_offset(config));
+	return stm32_pinctrl_config(dev_ofnode(config));
 }
 #else /* PINCTRL_FULL */
 static int stm32_pinctrl_set_state_simple(struct udevice *dev,
 					  struct udevice *periph)
 {
-	const void *fdt = gd->fdt_blob;
 	const fdt32_t *list;
 	uint32_t phandle;
-	int config_node;
+	ofnode config_node;
 	int size, i, ret;
 
-	list = fdt_getprop(fdt, dev_of_offset(periph), "pinctrl-0", &size);
+	list = ofnode_get_property(dev_ofnode(periph), "pinctrl-0", &size);
 	if (!list)
 		return -EINVAL;
 
@@ -446,8 +449,8 @@ static int stm32_pinctrl_set_state_simple(struct udevice *dev,
 	for (i = 0; i < size; i++) {
 		phandle = fdt32_to_cpu(*list++);
 
-		config_node = fdt_node_offset_by_phandle(fdt, phandle);
-		if (config_node < 0) {
+		config_node = ofnode_get_by_phandle(phandle);
+		if (!ofnode_valid(config_node)) {
 			pr_err("prop pinctrl-0 index %d invalid phandle\n", i);
 			return -EINVAL;
 		}
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
