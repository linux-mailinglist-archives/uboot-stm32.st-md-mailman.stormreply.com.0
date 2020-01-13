Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7949C138F3F
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 11:35:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43E7FC36B12
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 10:35:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E703C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 10:35:35 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DASZJM005619; Mon, 13 Jan 2020 11:35:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=mwph4r+mXh9BNYKGTj4Jrf9SBDAvyT88eilbscA18BU=;
 b=HUtQ1lQcVEFHx1JJIPcAuqMFNx7ZommHaEtFFfPdplgsmpZbuKlm63dpyDZCjjaUVGYj
 5BVQOCvVj2t8bPmVjyEjwjWhst3UV+quQXEF4YWDgoA/C8kf7kDBYtAWGKp4V3U91peu
 b8poiNPuWRkGHr2XPTo5OSUa7T0MVEWOCg0eqLpORYeRlIQtXKEbEoNN7cD9B/RT44yG
 gX0zP5fUhxlNSNiAMsnuPk6EiJ0sTkUADn1Pr/+YXKW5dQe5a4DnjQIPo/H4D4wcCakQ
 djjyGICmHLgDy9CJAJJKFsaV4zwvdEfsqteUpGaleORCJEN7sa+ItdzqrTheluwQyWXD YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf77aqqk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 11:35:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F1727100038;
 Mon, 13 Jan 2020 11:35:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E72392A96E8;
 Mon, 13 Jan 2020 11:35:29 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 13 Jan 2020 11:35:29 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 13 Jan 2020 11:35:11 +0100
Message-ID: <20200113103515.20879-18-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113103515.20879-1-patrick.delaunay@st.com>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_02:2020-01-13,
 2020-01-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Heiko Schocher <hs@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 17/21] pinctrl: sandbox: Add mux
	information in get_pin_muxing
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
Reviewed-by: Simon Glass <sjg@chromium.org>
---

Changes in v3: None
Changes in v2: None

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
