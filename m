Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C5329CF52
	for <lists+uboot-stm32@lfdr.de>; Wed, 28 Oct 2020 10:52:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D9FBC36B0B;
	Wed, 28 Oct 2020 09:52:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C66FC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Oct 2020 09:52:03 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09S9m57j026388; Wed, 28 Oct 2020 10:52:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=NozU89qkk2y2VJBracQxChnWQ0ynA7RFfrSTt70SHtg=;
 b=NKTUyIBTp/ZZ7LeV5MChmulp0AKYxfhyO8dbxIV2xMAh7wROub42NFPaYcxIeekCvU2u
 SvtgQrBfSkDavI2A0oWT4jlEk1YdtkbSt0lfTy2QoMb9A9o7d+v9mr+d0QuDDMQ8oPmq
 zakGvZH1HVuzVn187pu9uus69PC+Vbx/3yPCWzGZF3c79SLEZZXSaLdykQKX8Kg53W78
 kngr87kC9Xo+MJP/8zzaL6foSCW//mSDPFeUejdaR7fkm7sUm17AlOkoF7ztshJe/mOf
 8IFVBGeg/BuE++//G/hRPcFJL9CzFNKrQEVK+HsZkR1ttRToojv4NA279yA2B6sAKXin Nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccmr0xd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 10:52:02 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B2F5E10002A;
 Wed, 28 Oct 2020 10:52:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A66412A4D97;
 Wed, 28 Oct 2020 10:52:01 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 28 Oct 2020 10:52:01
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 28 Oct 2020 10:51:57 +0100
Message-ID: <20201028095157.11327-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201028095157.11327-1-patrick.delaunay@st.com>
References: <20201028095157.11327-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_04:2020-10-26,
 2020-10-28 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/2] pinctrl: stmfx: update pin name
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

Update pin name to avoid duplicated name with SOC GPIO
gpio0...gpio15 / agpio0....agpio7: add a stmfx prefix.

This pin name can be used in pinmux command.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/pinctrl/pinctrl-stmfx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index b789f3686c..a62be44d2d 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -343,8 +343,8 @@ static int stmfx_pinctrl_get_pins_count(struct udevice *dev)
 }
 
 /*
- * STMFX pins[15:0] are called "gpio[15:0]"
- * and STMFX pins[23:16] are called "agpio[7:0]"
+ * STMFX pins[15:0] are called "stmfx_gpio[15:0]"
+ * and STMFX pins[23:16] are called "stmfx_agpio[7:0]"
  */
 #define MAX_PIN_NAME_LEN 7
 static char pin_name[MAX_PIN_NAME_LEN];
@@ -352,9 +352,9 @@ static const char *stmfx_pinctrl_get_pin_name(struct udevice *dev,
 					      unsigned int selector)
 {
 	if (selector < STMFX_MAX_GPIO)
-		snprintf(pin_name, MAX_PIN_NAME_LEN, "gpio%u", selector);
+		snprintf(pin_name, MAX_PIN_NAME_LEN, "stmfx_gpio%u", selector);
 	else
-		snprintf(pin_name, MAX_PIN_NAME_LEN, "agpio%u", selector - 16);
+		snprintf(pin_name, MAX_PIN_NAME_LEN, "stmfx_agpio%u", selector - 16);
 	return pin_name;
 }
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
