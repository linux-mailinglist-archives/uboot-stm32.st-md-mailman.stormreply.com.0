Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1559C4E97B
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:39:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC726CA75B6
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:39:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB351CA75B5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:39:30 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDbm4U014837; Fri, 21 Jun 2019 15:39:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=/VytvFhjdXHnLRdqqhbMYB7IFtk1VH3Rpa2/wmKV1LQ=;
 b=UAqvN6JTLa7/WtcO/U6RgrMWu1Zp+oKX54IBbKC/TOUTwoMhhvL4Vb+j+v5ak15WoaB5
 VoXCsn+sSlSP1eAh3SFLkBiJ89AmLUTN7pxtmPuPdV4DgRc7l0HRsgitNNspEB1I3dDe
 TgJKNh2siygS8Ah/UIU+8WFXj41FjSQNoYCWXM7yTQiJn1AplUoxi43lgK0N5gR1k3Y+
 T/cMSDvcMUuuLz5Y2P4pgRw6Q5dtOw87RvcbjB59nVuDPyLbrSMMKQmQpycV0lzKPmaZ
 PiAYLqQkW3q1sC2oALIehVqFo+8aPFDTXN/sAyU5wJoip/UPmYP9xiqZy+x28XfRqIJn 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7wxssbc5-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:39:29 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 977BB4A;
 Fri, 21 Jun 2019 13:39:28 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 880F22A67;
 Fri, 21 Jun 2019 13:39:28 +0000 (GMT)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 21 Jun 2019 15:39:28 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:39:23 +0200
Message-ID: <20190621133925.8643-3-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190621133925.8643-1-patrice.chotard@st.com>
References: <20190621133925.8643-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_10:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/4] pinctrl: stm32: update .bind callback
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

Update .bind callback in order to bind all pinctrl subnodes
with "gpio-controller" property to gpio_stm32 driver.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 drivers/pinctrl/pinctrl_stm32.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
index 43dbdd9d6a..e2e7be01ed 100644
--- a/drivers/pinctrl/pinctrl_stm32.c
+++ b/drivers/pinctrl/pinctrl_stm32.c
@@ -1,5 +1,6 @@
 #include <common.h>
 #include <dm.h>
+#include <dm/lists.h>
 #include <dm/pinctrl.h>
 #include <hwspinlock.h>
 #include <asm/arch/gpio.h>
@@ -364,6 +365,35 @@ static int stm32_pinctrl_config(int offset)
 	return 0;
 }
 
+static int stm32_pinctrl_bind(struct udevice *dev)
+{
+	ofnode node;
+	const char *name;
+	int ret;
+
+	dev_for_each_subnode(node, dev) {
+		debug("%s: bind %s\n", __func__, ofnode_get_name(node));
+
+		ofnode_get_property(node, "gpio-controller", &ret);
+		if (ret < 0)
+			continue;
+		/* Get the name of each gpio node */
+		name = ofnode_get_name(node);
+		if (!name)
+			return -EINVAL;
+
+		/* Bind each gpio node */
+		ret = device_bind_driver_to_node(dev, "gpio_stm32",
+						 name, node, NULL);
+		if (ret)
+			return ret;
+
+		debug("%s: bind %s\n", __func__, name);
+	}
+
+	return 0;
+}
+
 #if CONFIG_IS_ENABLED(PINCTRL_FULL)
 static int stm32_pinctrl_set_state(struct udevice *dev, struct udevice *config)
 {
@@ -433,7 +463,7 @@ U_BOOT_DRIVER(pinctrl_stm32) = {
 	.id			= UCLASS_PINCTRL,
 	.of_match		= stm32_pinctrl_ids,
 	.ops			= &stm32_pinctrl_ops,
-	.bind			= dm_scan_fdt_dev,
+	.bind			= stm32_pinctrl_bind,
 	.probe			= stm32_pinctrl_probe,
 	.priv_auto_alloc_size	= sizeof(struct stm32_pinctrl_priv),
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
