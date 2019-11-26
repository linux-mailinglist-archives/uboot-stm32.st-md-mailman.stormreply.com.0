Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05229109A7A
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 09:49:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E57EC36B14
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 08:49:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 179ABC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2019 08:49:23 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQ8lFKK007562; Tue, 26 Nov 2019 09:49:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=2wkIT/SF+cgPPI41rbIzkEWHxDWJy3lzfbR0TI9w5y8=;
 b=s4YoZTIG4uYdDUnwXac0jQEiRtj8B5VGwyWX0UrIVydGy1RP5/j+87tQbDJggbhZAgEl
 veXzFDW1mvQqOTGpoE94qoRf2B4/9PbPsdUExfYGQDbXl/2RfJu+Hm3tq1Vek/kl2kkv
 o1vJhCrI+D67ArTJ+RyLljYBuTusfsz9ABTzQw8VC2D3gLDSFmhDnnhawW2RljtmvUFt
 vDiVjiFYQtElpNJQEcfhwBuSD/51h1Q+9VORMDhGEd7+3ug8WE/k3MyFiJ+ZSmDTCnG1
 JoYPhdKB7lObuDVZ7+vhHOBvAWRUn4DMn9fTR5cj+MDb1ktaUAJDWuB4awIoM2pRlZhk Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wevhjnxb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 09:49:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4604310002A;
 Tue, 26 Nov 2019 09:49:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3B69C2ACE57;
 Tue, 26 Nov 2019 09:49:21 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 26 Nov 2019 09:49:20 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 26 Nov 2019 09:49:07 +0100
Message-ID: <20191126084911.19761-11-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191126084911.19761-1-patrick.delaunay@st.com>
References: <20191126084911.19761-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_01:2019-11-21,2019-11-26 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 10/14] pinctrl: sandbox: Add mux
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
