Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EFD5A62E4
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Aug 2022 14:09:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24134C57B6C;
	Tue, 30 Aug 2022 12:09:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF916C03FD4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 12:09:23 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27U9QRv0018055;
 Tue, 30 Aug 2022 14:09:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=M3gqVIWCqeezOz5NuY9+kI/wcRhXUxCGP2DffOJLKu8=;
 b=DzEcbLUe/VxBOLmKV9D01fTPStRfHwraDVjn8FpHA5tMR8emNp4/guxnpQpkF001fbze
 vbHO2JDjoC8QBeiJabQin6SdDgc5gpsYn/H5KFHibpknTlX++VnhtuCmGQKIAHa54D7r
 lscDUZs+qvnrO2aLAnF6Jb+ym21A88iypfayq3ai/vQ8X1TXbrFAXLhPDU75hC3scHP/
 fDfBLltldFtE5fFdtlV5mK3ghdIHF9xDY6nI5VGsiMk7oEH9zB0Lyx6vJfV44XPxVuen
 d09bGgrK2N8oZEbe3aC6vJNJKZ0KvPGo3CiPi41xlO77d835K+QlF3yu8QF4IhzW8Pbk Yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j78pk7xs3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 14:09:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 400B9100039;
 Tue, 30 Aug 2022 14:09:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 38204226FCD;
 Tue, 30 Aug 2022 14:09:22 +0200 (CEST)
Received: from localhost (10.75.127.118) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Tue, 30 Aug
 2022 14:09:22 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Aug 2022 14:09:13 +0200
Message-ID: <20220830120914.2329522-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220830120914.2329522-1-patrice.chotard@foss.st.com>
References: <20220830120914.2329522-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_06,2022-08-30_01,2022-06-22_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v3 3/4] pinctrl: pinctrl_stm32: Populate
	uc_priv->name[] with pinmux node's name
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

Populate uc_priv->name[] with pinmux node's name in order to indicate
the pinmuxing's name in case GPIO is configured in alternate.

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

(no changes since v1)

 drivers/pinctrl/pinctrl_stm32.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
index 990cd19286..b755fa42b4 100644
--- a/drivers/pinctrl/pinctrl_stm32.c
+++ b/drivers/pinctrl/pinctrl_stm32.c
@@ -257,10 +257,12 @@ static int stm32_pinctrl_probe(struct udevice *dev)
 	return 0;
 }
 
-static int stm32_gpio_config(struct gpio_desc *desc,
+static int stm32_gpio_config(ofnode node,
+			     struct gpio_desc *desc,
 			     const struct stm32_gpio_ctl *ctl)
 {
 	struct stm32_gpio_priv *priv = dev_get_priv(desc->dev);
+	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(desc->dev);
 	struct stm32_gpio_regs *regs = priv->regs;
 	struct stm32_pinctrl_priv *ctrl_priv;
 	int ret;
@@ -291,6 +293,8 @@ static int stm32_gpio_config(struct gpio_desc *desc,
 	index = desc->offset;
 	clrsetbits_le32(&regs->otyper, OTYPE_MSK << index, ctl->otype << index);
 
+	uc_priv->name[desc->offset] = strdup(ofnode_get_name(node));
+
 	hwspinlock_unlock(&ctrl_priv->hws);
 
 	return 0;
@@ -385,7 +389,7 @@ static int stm32_pinctrl_config(ofnode node)
 			if (rv)
 				return rv;
 			desc.offset = gpio_dsc.pin;
-			rv = stm32_gpio_config(&desc, &gpio_ctl);
+			rv = stm32_gpio_config(node, &desc, &gpio_ctl);
 			log_debug("rv = %d\n\n", rv);
 			if (rv)
 				return rv;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
