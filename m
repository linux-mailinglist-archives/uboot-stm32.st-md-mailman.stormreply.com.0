Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A8BE1D26
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 15:45:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D73FC36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 13:45:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28640C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 13:45:15 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9NDhVmh001279; Wed, 23 Oct 2019 15:45:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=LqOGApJTIRJKD4xJoFTin2Y6QsDChun2NEAdpw0brnU=;
 b=lmUsI5zD3OA4kh7dIPnySHJHkjcvUuKm9FA5bBNRdMtCvlXHFLRxJCwjvyv45F9DRlbv
 /dpibI+AlIaLpKmydI7Btk92MTd8mZ2sUQp+XqrSn7ctO9isTL0uudbnK7LXsPZCLJ8A
 BUS/jHtdzdECzzSkbr8TQ+JYSvNjJ4z541UbOMLDyrSicJCc1j7vpQuS1/pgaYeP4wgv
 l1R1JRfDaEoE5T8RbxXzx6BfdNeNRwkBsRoXrRy6sNg3+aee5getBzR2BiZSgRM17GH9
 lgVhCWQOp4pL92jbLGdMIszDnn8WJc0N4U7SqDaHm5rWW3//EaDOC/GpPyrGDM8l6Nrj tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vt9s43xkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 15:45:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 39AA2100042;
 Wed, 23 Oct 2019 15:45:09 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 308D22FF5FE;
 Wed, 23 Oct 2019 15:45:09 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct
 2019 15:45:09 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 15:45:08
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 23 Oct 2019 15:44:45 +0200
Message-ID: <20191023134448.20149-11-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023134448.20149-1-patrick.delaunay@st.com>
References: <20191023134448.20149-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_03:2019-10-23,2019-10-23 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 10/13] gpio: sandbox: cleanup flag support
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

Replace the GPIOF_ defines of gpio UCLASS (they are not bitfields but
enum gpio_func_t = State of a GPIO, as reported by get_function())
by GPIO_FLAG to access to the bitfield 'flags' of struct gpio_state.

This patch avoid confusion between sandbox and gpio UCLASS defines.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/gpio/sandbox.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/sandbox.c b/drivers/gpio/sandbox.c
index 2ef5c67ad5..b6c78cc46a 100644
--- a/drivers/gpio/sandbox.c
+++ b/drivers/gpio/sandbox.c
@@ -11,14 +11,14 @@
 #include <dm/of.h>
 #include <dt-bindings/gpio/gpio.h>
 
-/* Flags for each GPIO */
-#define GPIOF_OUTPUT	(1 << 0)	/* Currently set as an output */
-#define GPIOF_HIGH	(1 << 1)	/* Currently set high */
-#define GPIOF_ODR	(1 << 2)	/* Currently set to open drain mode */
+/* Internal flags for each GPIO : bitfield*/
+#define GPIO_FLAG_OUTPUT	BIT(0)	/* Currently set as an output */
+#define GPIO_FLAG_HIGH		BIT(1)	/* Currently set high */
+#define GPIO_FLAG_ODR		BIT(2)	/* Currently set to open drain mode */
 
 struct gpio_state {
 	const char *label;	/* label given by requester */
-	u8 flags;		/* flags (GPIOF_...) */
+	u8 flags;		/* bitfield flags (GPIO_FLAG_...) */
 };
 
 /* Access routines for GPIO state */
@@ -60,34 +60,34 @@ static int set_gpio_flag(struct udevice *dev, unsigned offset, int flag,
 
 int sandbox_gpio_get_value(struct udevice *dev, unsigned offset)
 {
-	if (get_gpio_flag(dev, offset, GPIOF_OUTPUT))
+	if (get_gpio_flag(dev, offset, GPIO_FLAG_OUTPUT))
 		debug("sandbox_gpio: get_value on output gpio %u\n", offset);
-	return get_gpio_flag(dev, offset, GPIOF_HIGH);
+	return get_gpio_flag(dev, offset, GPIO_FLAG_HIGH);
 }
 
 int sandbox_gpio_set_value(struct udevice *dev, unsigned offset, int value)
 {
-	return set_gpio_flag(dev, offset, GPIOF_HIGH, value);
+	return set_gpio_flag(dev, offset, GPIO_FLAG_HIGH, value);
 }
 
 int sandbox_gpio_get_open_drain(struct udevice *dev, unsigned offset)
 {
-	return get_gpio_flag(dev, offset, GPIOF_ODR);
+	return get_gpio_flag(dev, offset, GPIO_FLAG_ODR);
 }
 
 int sandbox_gpio_set_open_drain(struct udevice *dev, unsigned offset, int value)
 {
-	return set_gpio_flag(dev, offset, GPIOF_ODR, value);
+	return set_gpio_flag(dev, offset, GPIO_FLAG_ODR, value);
 }
 
 int sandbox_gpio_get_direction(struct udevice *dev, unsigned offset)
 {
-	return get_gpio_flag(dev, offset, GPIOF_OUTPUT);
+	return get_gpio_flag(dev, offset, GPIO_FLAG_OUTPUT);
 }
 
 int sandbox_gpio_set_direction(struct udevice *dev, unsigned offset, int output)
 {
-	return set_gpio_flag(dev, offset, GPIOF_OUTPUT, output);
+	return set_gpio_flag(dev, offset, GPIO_FLAG_OUTPUT, output);
 }
 
 /*
@@ -158,7 +158,7 @@ static int sb_gpio_set_open_drain(struct udevice *dev, unsigned offset, int valu
 
 static int sb_gpio_get_function(struct udevice *dev, unsigned offset)
 {
-	if (get_gpio_flag(dev, offset, GPIOF_OUTPUT))
+	if (get_gpio_flag(dev, offset, GPIO_FLAG_OUTPUT))
 		return GPIOF_OUTPUT;
 	return GPIOF_INPUT;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
