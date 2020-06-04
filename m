Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBF11EE46A
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Jun 2020 14:30:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95473C36B0D
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Jun 2020 12:30:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 795BCC36B26
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2020 12:30:40 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 054CDRxH023382; Thu, 4 Jun 2020 14:30:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ncWXX1woh781ZpPSCrR7IYN4qHkMOUu0iscbVXqDunc=;
 b=0c5DPmlGZmDpxiqzgYk5PBa2qnlYwEx663wsXXmkxn4oQB91Yu5kcc/1sQzvZo6NCuyA
 97c4fCbMcqDgtAyY+JnFQIAqmDvpHLyS1sYZvUv+552kwVdzN5y2VzlT8GQfvbrqg3Op
 xszJiPeKVJUhFureN4/tWvPfN3m+gEuUAknNTSzacH3odVMcpManWHAN+3pnihGhNYAV
 mNRwMiFT2VJEgQBW6aPYzq8o23qYocAfTuiusaaXF9CBuom75UJj8yCcn+lgq6H6yx3Q
 0UmKFpbqTSeiGnyYL+VsAcdVIO6oVGXtjfsFBDXqR1GcSpLSEW0JQ6zaA56zuiaLHxKi YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31bd8wa67k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jun 2020 14:30:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1699410002A;
 Thu,  4 Jun 2020 14:30:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0CBEA2BE22C;
 Thu,  4 Jun 2020 14:30:39 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 4 Jun 2020 14:30:38 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 4 Jun 2020 14:30:27 +0200
Message-ID: <20200604123033.25499-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200604123033.25499-1-patrick.delaunay@st.com>
References: <20200604123033.25499-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-04_10:2020-06-02,
 2020-06-04 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 05/11] gpio: stmfx: move function to
	prepare new ops introduction
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

Move the functions stmfx_pinctrl_set_pupd and stmfx_pinctrl_set_type;
they can be used by the new ops get_dir_flags and set_dir_flags introduced
by next patch.

No functional change.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- NEW: split previous patch [5/5] gpio: stmfx: add set_config ops

 drivers/pinctrl/pinctrl-stmfx.c | 60 ++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index a3240ccd5a..d74121725c 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -74,6 +74,36 @@ static int stmfx_write(struct udevice *dev, uint offset, unsigned int val)
 	return dm_i2c_reg_write(dev_get_parent(dev), offset, val);
 }
 
+static int stmfx_pinctrl_set_pupd(struct udevice *dev,
+				  unsigned int pin, u32 pupd)
+{
+	u8 reg = STMFX_REG_GPIO_PUPD + get_reg(pin);
+	u32 mask = get_mask(pin);
+	int ret;
+
+	ret = stmfx_read(dev, reg);
+	if (ret < 0)
+		return ret;
+	ret = (ret & ~mask) | (pupd ? mask : 0);
+
+	return stmfx_write(dev, reg, ret);
+}
+
+static int stmfx_pinctrl_set_type(struct udevice *dev,
+				  unsigned int pin, u32 type)
+{
+	u8 reg = STMFX_REG_GPIO_TYPE + get_reg(pin);
+	u32 mask = get_mask(pin);
+	int ret;
+
+	ret = stmfx_read(dev, reg);
+	if (ret < 0)
+		return ret;
+	ret = (ret & ~mask) | (type ? mask : 0);
+
+	return stmfx_write(dev, reg, ret);
+}
+
 static int stmfx_gpio_get(struct udevice *dev, unsigned int offset)
 {
 	u32 reg = STMFX_REG_GPIO_STATE + get_reg(offset);
@@ -190,36 +220,6 @@ static const struct pinconf_param stmfx_pinctrl_conf_params[] = {
 	{ "output-low", PIN_CONFIG_OUTPUT, 0 },
 };
 
-static int stmfx_pinctrl_set_pupd(struct udevice *dev,
-				  unsigned int pin, u32 pupd)
-{
-	u8 reg = STMFX_REG_GPIO_PUPD + get_reg(pin);
-	u32 mask = get_mask(pin);
-	int ret;
-
-	ret = stmfx_read(dev, reg);
-	if (ret < 0)
-		return ret;
-	ret = (ret & ~mask) | (pupd ? mask : 0);
-
-	return stmfx_write(dev, reg, ret);
-}
-
-static int stmfx_pinctrl_set_type(struct udevice *dev,
-				  unsigned int pin, u32 type)
-{
-	u8 reg = STMFX_REG_GPIO_TYPE + get_reg(pin);
-	u32 mask = get_mask(pin);
-	int ret;
-
-	ret = stmfx_read(dev, reg);
-	if (ret < 0)
-		return ret;
-	ret = (ret & ~mask) | (type ? mask : 0);
-
-	return stmfx_write(dev, reg, ret);
-}
-
 static int stmfx_pinctrl_conf_set(struct udevice *dev, unsigned int pin,
 				  unsigned int param, unsigned int arg)
 {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
