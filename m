Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A581D1EE46F
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Jun 2020 14:30:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CCA0C36B28
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Jun 2020 12:30:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22B5FC36B23
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2020 12:30:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 054CCNOI007269; Thu, 4 Jun 2020 14:30:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=KTNHpwqDtuRBcMK8dJ/4ZtSM8Xxhujdi/A2UIUPPTdU=;
 b=xT+xmyrhf5iBwCs5SKb0Hee5jIfbw/wWwXuNiisXJUw6902DgtQ5Xk4eolQnvkt9Jci6
 sRF52se805x1LeVSTrKyMZI5lQ3ThoBqGa5FMPz03X1cHHUVuGtpgWHLIOVpDNuISF8T
 GHlozqE1CAFWOZBpADLGDdazRcTPlz6/mIoKcGBCqI/U7VXzP4f4CrE64LTvW8J/iiWi
 8yvtFBsqSqfyVhcKlN42+P7rzm0+M/Kj/YLTF4DMGUo7vAQxqeypgFIbLLwdDWbgVixe
 bw5hk1sECTy8/3wIVuv01uI5WbJP8h3aKq0q7YJ7KNBreKHn+sif//Oulo7oYChO9vF0 uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31ejxautd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jun 2020 14:30:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B237810002A;
 Thu,  4 Jun 2020 14:30:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A96312BE22C;
 Thu,  4 Jun 2020 14:30:42 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 4 Jun 2020 14:30:42 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 4 Jun 2020 14:30:32 +0200
Message-ID: <20200604143022.v2.10.I1b4851af3f935a0e9b02f80c3f5303f9f80502df@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200604123033.25499-1-patrick.delaunay@st.com>
References: <20200604123033.25499-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-04_10:2020-06-02,
 2020-06-04 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 10/11] pinctrl: stmfx: add information on
	pin configuration
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

Add information on pin configuration used for pinmux command.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2: None

 drivers/pinctrl/pinctrl-stmfx.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 1d326ecf17..c2ea82770e 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -358,6 +358,34 @@ static const char *stmfx_pinctrl_get_pin_name(struct udevice *dev,
 	return pin_name;
 }
 
+static const char *stmfx_pinctrl_get_pin_conf(struct udevice *dev,
+					      unsigned int pin, int func)
+{
+	int pupd, type;
+
+	type = stmfx_conf_get_type(dev, pin);
+	if (type < 0)
+		return "";
+
+	if (func == GPIOF_OUTPUT) {
+		if (type)
+			return "drive-open-drain";
+		else
+			return ""; /* default: push-pull*/
+	}
+	if (!type)
+		return ""; /* default: bias-disable*/
+
+	pupd = stmfx_conf_get_pupd(dev, pin);
+	if (pupd < 0)
+		return "";
+
+	if (pupd)
+		return "bias-pull-up";
+	else
+		return "bias-pull-down";
+}
+
 static int stmfx_pinctrl_get_pin_muxing(struct udevice *dev,
 					unsigned int selector,
 					char *buf, int size)
@@ -369,7 +397,9 @@ static int stmfx_pinctrl_get_pin_muxing(struct udevice *dev,
 	if (func < 0)
 		return func;
 
-	snprintf(buf, size, "%s", func == GPIOF_INPUT ? "input" : "output");
+	snprintf(buf, size, "%s ", func == GPIOF_INPUT ? "input" : "output");
+
+	strncat(buf, stmfx_pinctrl_get_pin_conf(dev, selector, func), size);
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
