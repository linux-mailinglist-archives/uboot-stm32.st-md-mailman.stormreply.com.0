Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCA8109A77
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 09:49:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86FCDC36B0E
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 08:49:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2F4FC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2019 08:49:20 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQ8lfXX029177; Tue, 26 Nov 2019 09:49:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ibNbF7VPEqhTLqDe6rukiLIuvViA08xuSz/HdsPXwf4=;
 b=l/iw/iCkzijNSTXYNDLHVPFDO/yFk/ZxV8hCMGy5BPXR3W4tqBWKIR7sXdxY1nmc5v7p
 nPMI9FbwYgOsMbA3XxjWMh+ELIC844L1eMYFK/Y1g1BgACru5AIpejb4UI+QDdJT2rTO
 zPwCt/GHYPEXnRh2a6C3tkJkQubPDWWs9XngI8lRlTeJKiR0MXC2+fMJf85sm5pqSvu6
 i2tajblnJF4IIk/XfZ4apR2a3ydq2yE7PuiY3UU49fNW8mEk8sHGgEZXdi17d5phRP2+
 hiaORPNhuUt9RQGQ6zPp1T+2HqzRdbzm6UhEPfKMimR8jrGP1cCrP9hJWWgH+ePKOCvc fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2weu42dx5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 09:49:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1DE40100038;
 Tue, 26 Nov 2019 09:49:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 10BD52ACE57;
 Tue, 26 Nov 2019 09:49:19 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 26 Nov 2019 09:49:18 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 26 Nov 2019 09:49:04 +0100
Message-ID: <20191126084911.19761-8-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191126084911.19761-1-patrick.delaunay@st.com>
References: <20191126084911.19761-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_01:2019-11-21,2019-11-26 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Bin Meng <bmeng.cn@gmail.com>,
 Heiko Schocher <hs@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 07/14] gpio: add gpio descriptor
	initialization helper
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

Add a helper function gpio_desc_init() to initialize the gpio descriptor;
with this function the flags will be always set to 0.

It wasn't the case before this patch in dm_gpio_lookup_name.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- add gpio descriptor initialization helper

 drivers/gpio/gpio-uclass.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
index eb599cbcfd..0870458e96 100644
--- a/drivers/gpio/gpio-uclass.c
+++ b/drivers/gpio/gpio-uclass.c
@@ -18,6 +18,22 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
+/**
+ * gpio_desc_init() - Initialize the GPIO descriptor
+ *
+ * @desc:	GPIO descriptor to initialize
+ * @dev:	GPIO device
+ * @offset:	Offset of device GPIO
+ */
+static void gpio_desc_init(struct gpio_desc *desc,
+			   struct udevice *dev,
+			   uint offset)
+{
+	desc->dev = dev;
+	desc->offset = offset;
+	desc->flags = 0;
+}
+
 /**
  * gpio_to_device() - Convert global GPIO number to device, number
  *
@@ -41,9 +57,7 @@ static int gpio_to_device(unsigned int gpio, struct gpio_desc *desc)
 		uc_priv = dev_get_uclass_priv(dev);
 		if (gpio >= uc_priv->gpio_base &&
 		    gpio < uc_priv->gpio_base + uc_priv->gpio_count) {
-			desc->dev = dev;
-			desc->offset = gpio - uc_priv->gpio_base;
-			desc->flags = 0;
+			gpio_desc_init(desc, dev, gpio - uc_priv->gpio_base);
 			return 0;
 		}
 	}
@@ -85,8 +99,7 @@ int dm_gpio_lookup_name(const char *name, struct gpio_desc *desc)
 	if (!dev)
 		return ret ? ret : -EINVAL;
 
-	desc->dev = dev;
-	desc->offset = offset;
+	gpio_desc_init(desc, dev, offset);
 
 	return 0;
 }
@@ -772,9 +785,7 @@ static int gpio_request_tail(int ret, const char *nodename,
 			     struct gpio_desc *desc, int flags,
 			     bool add_index, struct udevice *gpio_dev)
 {
-	desc->dev = gpio_dev;
-	desc->offset = 0;
-	desc->flags = 0;
+	gpio_desc_init(desc, gpio_dev, 0);
 	if (ret)
 		goto err;
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
