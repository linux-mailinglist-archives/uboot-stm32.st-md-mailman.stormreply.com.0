Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD27E203A
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 18:12:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2F3DC36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 16:12:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC64DC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 16:12:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9NG6wwq009873; Wed, 23 Oct 2019 18:12:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=IjTw+3MeIBEmETuGjw18X+CGQKeDL7VyKEPyXRzGAYQ=;
 b=lZBVrx7/3Zo/12FyD+nmTflohEH9XSwctk9CakruJR8SbPkSPnKJUHK0jEhmPZ5duC7K
 iNS0ZdO4/QOlgdwr4y7fkmxXdj3PPRjoTscY6n4fRkwzApCbfqo5VJfXt4sNwFsc55GJ
 q0pcmnQo/sX15XeEhRPK4nwcZkFmexynjSVCcNVG0tMwM73FH0e8qwCjxWmE4ngCUYI0
 25PDnBBiRNg8uQ6RnGdkkwe4jdxjJLHF3/IYGLSSIwHYizBgK33sxnCHAM4uUb9pj7iQ
 uYzuutzX6vivMeGs5iUl6j5Q6cPpWwJNT0C8/tm8kEPWyP/Yw896U2+iCe3BJIzDkyaN 5A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vt9s4vna6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 18:12:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D742B10002A;
 Wed, 23 Oct 2019 18:12:08 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C9FF52C2E62;
 Wed, 23 Oct 2019 18:12:08 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct
 2019 18:12:08 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 18:12:08
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 23 Oct 2019 18:11:59 +0200
Message-ID: <20191023181153.1.I1b4851af3f935a0e9b02f80c3f5303f9f80502df@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023161203.23616-1-patrick.delaunay@st.com>
References: <20191023161203.23616-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_04:2019-10-23,2019-10-23 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/5] pinctrl: stmfx: add information on pin
	configuration
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

 drivers/pinctrl/pinctrl-stmfx.c | 35 ++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 0b5a0433cd..0cd371fefa 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -286,6 +286,37 @@ static const char *stmfx_pinctrl_get_pin_name(struct udevice *dev,
 	return pin_name;
 }
 
+static const char *stmfx_pinctrl_get_pin_conf(struct udevice *dev,
+					      unsigned int pin, int func)
+{
+	int pupd, type;
+	u32 mask = get_mask(pin);
+
+	type = stmfx_read(dev, STMFX_REG_GPIO_TYPE + get_reg(pin));
+	if (type < 0)
+		return "";
+	type &= mask;
+
+	if (func == GPIOF_INPUT) {
+		if (type)
+			return "drive-open-drain";
+		else
+			return "drive-push-pull";
+	}
+	if (!type)
+		return "bias-disable";
+
+	pupd = stmfx_read(dev, STMFX_REG_GPIO_PUPD + get_reg(pin));
+	if (pupd < 0)
+		return "";
+	pupd &= mask;
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
@@ -297,7 +328,9 @@ static int stmfx_pinctrl_get_pin_muxing(struct udevice *dev,
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
