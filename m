Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A588E1D25
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 15:45:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67F08C36B0E
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 13:45:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 810B7C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 13:45:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9NDhG0v023207; Wed, 23 Oct 2019 15:45:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=H6eUoSBDkdZgpyV1EzLX25ZYtGqqiLykIECNFdiD8ZY=;
 b=HPWn8o0D1ylWygO8zxZ8/ClnlTRNpe46YR0cQYjf1BxIfJQNpoJm7NNPyhypn4AYLFir
 y5D30xvLOhC9sqlSFXh3WovypkJpMQYQt2/j/68Gcqx3S4WXYaiDEhk0w1Jg0FAZ+9Nc
 QRxW1Vciszy/FzWdikBHsVwK3IJ0pqKthQzguWwfdeaCCEII7hpQyRatviXCiAcuJ50E
 arZtEoa5dqRR5EJg99BIO1gIKVFEA/lTMTUwFCT03c0jMq3g+IYPVxGXelLis04le+kA
 yS7hd1DycUyDexEefc/G7LfFkErPV9QQSeDqiYy4qOl1ZdesCg1tOTL9RebVGymPG1B3 uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vt9s73xmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 15:45:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1C0D9100038;
 Wed, 23 Oct 2019 15:45:06 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 135DF2FF5FE;
 Wed, 23 Oct 2019 15:45:06 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct
 2019 15:45:05 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 15:45:05
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 23 Oct 2019 15:44:43 +0200
Message-ID: <20191023134448.20149-9-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023134448.20149-1-patrick.delaunay@st.com>
References: <20191023134448.20149-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_03:2019-10-23,2019-10-23 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 08/13] pinctrl: sandbox: Add mux information
	in get_pin_muxing
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

Add param information in pin information output.
This update prepare unitary test for pin configuration
in pinctrl node.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/pinctrl/pinctrl-sandbox.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-sandbox.c b/drivers/pinctrl/pinctrl-sandbox.c
index 0786afe747..d1a21f0f19 100644
--- a/drivers/pinctrl/pinctrl-sandbox.c
+++ b/drivers/pinctrl/pinctrl-sandbox.c
@@ -54,6 +54,10 @@ static const struct pinconf_param sandbox_conf_params[] = {
 	{ "input-disable", PIN_CONFIG_INPUT_ENABLE, 0 },
 };
 
+/* bitfield used to save param and value of each pin/selector */
+static unsigned int sandbox_pins_param[ARRAY_SIZE(sandbox_pins)];
+static unsigned int sandbox_pins_value[ARRAY_SIZE(sandbox_pins)];
+
 static int sandbox_get_pins_count(struct udevice *dev)
 {
 	return ARRAY_SIZE(sandbox_pins);
@@ -68,8 +72,25 @@ static int sandbox_get_pin_muxing(struct udevice *dev,
 				  unsigned int selector,
 				  char *buf, int size)
 {
+	const struct pinconf_param *p;
+	int i;
+
 	snprintf(buf, size, "%s", sandbox_pins_muxing[selector]);
 
+	if (sandbox_pins_param[selector]) {
+		for (i = 0, p = sandbox_conf_params;
+		     i < ARRAY_SIZE(sandbox_conf_params);
+		     i++, p++) {
+			if ((sandbox_pins_param[selector] & BIT(p->param)) &&
+			    (!!(sandbox_pins_value[selector] & BIT(p->param)) ==
+			     p->default_value)) {
+				strncat(buf, " ", size);
+				strncat(buf, p->property, size);
+			}
+		}
+	}
+	strncat(buf, ".", size);
+
 	return 0;
 }
 
@@ -102,6 +123,9 @@ static int sandbox_pinmux_set(struct udevice *dev, unsigned pin_selector,
 	      pin_selector, sandbox_get_pin_name(dev, pin_selector),
 	      func_selector, sandbox_get_function_name(dev, func_selector));
 
+	sandbox_pins_param[pin_selector] = 0;
+	sandbox_pins_value[pin_selector] = 0;
+
 	return 0;
 }
 
@@ -123,6 +147,12 @@ static int sandbox_pinconf_set(struct udevice *dev, unsigned pin_selector,
 	      pin_selector, sandbox_get_pin_name(dev, pin_selector),
 	      param, argument);
 
+	sandbox_pins_param[pin_selector] |= BIT(param);
+	if (argument)
+		sandbox_pins_value[pin_selector] |= BIT(param);
+	else
+		sandbox_pins_value[pin_selector] &= ~BIT(param);
+
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
