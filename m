Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A07A2649A6
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 18:25:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE454C424B8
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 16:25:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79F81C424B7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 16:25:15 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08AGMhZK030448; Thu, 10 Sep 2020 18:25:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=mXrH9+3TXz6snlzqENdrrDUUsSfy/CGllFvzCArZmzw=;
 b=ZSgeg49t+dB27k3DBuzhqzZjRtByiWfbfOrwG1gU2ZKAnaBQJwD7NJI308mKUWkj9rHm
 u/srG/FAUAOedXOCRe02bji9Lqx6rCVuBB/pYG0fjDY3d89vVz4qwv7sgeB/wtj4CgL+
 vEorg7mDjLTAJDGb1zNhY7aZV88yQLlLuff8b7Ayao7x0knmSTfJ1o4C/MSGOjXDhgXe
 COmPGmlSPvwHIAKfzGheVrcEKiKFdd8gjtc6Lw5MN5ppEpJ3+rDGvALR8A1LXfUUeAAq
 B02Nyh7JZAoI8wp3jbX1BDo1Cq06/6Y+OogYfZRY4UpW61wgRKl1zfHnMZG41cWjowmc Qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c0ev4641-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 18:25:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 024EF10002A;
 Thu, 10 Sep 2020 18:25:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E42472BC7B3;
 Thu, 10 Sep 2020 18:25:11 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 10 Sep 2020 18:25:11 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 10 Sep 2020 18:25:09 +0200
Message-ID: <20200910162509.27997-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-10_05:2020-09-10,
 2020-09-10 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] i2c: i2c-gpio: Convert to use APIs which
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

 drivers/i2c/i2c-gpio.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-gpio.c b/drivers/i2c/i2c-gpio.c
index cfdeadc752..381938c956 100644
--- a/drivers/i2c/i2c-gpio.c
+++ b/drivers/i2c/i2c-gpio.c
@@ -18,8 +18,6 @@
 #define I2C_ACK		0
 #define I2C_NOACK	1
 
-DECLARE_GLOBAL_DATA_PTR;
-
 enum {
 	PIN_SDA = 0,
 	PIN_SCL,
@@ -334,8 +332,6 @@ static int i2c_gpio_drv_probe(struct udevice *dev)
 static int i2c_gpio_ofdata_to_platdata(struct udevice *dev)
 {
 	struct i2c_gpio_bus *bus = dev_get_priv(dev);
-	const void *blob = gd->fdt_blob;
-	int node = dev_of_offset(dev);
 	int ret;
 
 	ret = gpio_request_list_by_name(dev, "gpios", bus->gpios,
@@ -343,12 +339,12 @@ static int i2c_gpio_ofdata_to_platdata(struct udevice *dev)
 	if (ret < 0)
 		goto error;
 
-	bus->udelay = fdtdec_get_int(blob, node, "i2c-gpio,delay-us",
-				     DEFAULT_UDELAY);
+	bus->udelay = dev_read_u32_default(dev, "i2c-gpio,delay-us",
+					   DEFAULT_UDELAY);
 
 	bus->get_sda = i2c_gpio_sda_get;
 	bus->set_sda = i2c_gpio_sda_set;
-	if (fdtdec_get_bool(blob, node, "i2c-gpio,scl-output-only"))
+	if (dev_read_bool(dev, "i2c-gpio,scl-output-only"))
 		bus->set_scl = i2c_gpio_scl_set_output_only;
 	else
 		bus->set_scl = i2c_gpio_scl_set;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
