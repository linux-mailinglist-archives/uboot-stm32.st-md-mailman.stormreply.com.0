Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BE31EE46B
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Jun 2020 14:30:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0A74C36B23
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Jun 2020 12:30:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A412C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2020 12:30:41 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 054CDRxI023382; Thu, 4 Jun 2020 14:30:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ezc2b7Rz/pKa6pHJQY1fpr6P/vGm+FbGeO03iLsIHTw=;
 b=K9crBAI7w7g+xt0PaOrzROocRUI3ehGMNTaSaEQXePlA8Lxh+1hW7PMnCka2ZWI8jkQ/
 Yq1T7gRtBL5dKkNKi3AALzYI8YstlatGPY8Wes329FfA6bulqwHIGEJ9mzgZ5ClSuizn
 xHk2+5oEMsho+vzIpnSO58FpUKJmylQ+ZhB07z0eo+UNhYWdog2hYuZL30ZtzuC8B4So
 tzKQQN6XH+cpakhLYB0HRY25tU2MLMr2a9Z9jj8jJ4siJvtzGlsWNatUzKzt5hcK7sXr
 yMXgPVLO/v/8ZKA3V4WfEzeiH5S6r58ikQRUdtoCpw8OMKhx0eS0Ypi2+wgOvCAqHj8x Rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31bd8wa67m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jun 2020 14:30:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F0E1510002A;
 Thu,  4 Jun 2020 14:30:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E6AC92BE22C;
 Thu,  4 Jun 2020 14:30:39 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 4 Jun 2020 14:30:39 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 4 Jun 2020 14:30:28 +0200
Message-ID: <20200604123033.25499-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200604123033.25499-1-patrick.delaunay@st.com>
References: <20200604123033.25499-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-04_10:2020-06-02,
 2020-06-04 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 06/11] gpio: stmfx: rename function used to
	change pin configuration
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

Rename the two function used to change the pin configuration
from stmfx_pinctrl_.. stmfx_conf_... to clarify the function usage.

No functional change.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- NEW: split previous patch [5/5] gpio: stmfx: add set_config ops

 drivers/pinctrl/pinctrl-stmfx.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index d74121725c..657ca2e240 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -74,8 +74,7 @@ static int stmfx_write(struct udevice *dev, uint offset, unsigned int val)
 	return dm_i2c_reg_write(dev_get_parent(dev), offset, val);
 }
 
-static int stmfx_pinctrl_set_pupd(struct udevice *dev,
-				  unsigned int pin, u32 pupd)
+static int stmfx_conf_set_pupd(struct udevice *dev, unsigned int pin, u32 pupd)
 {
 	u8 reg = STMFX_REG_GPIO_PUPD + get_reg(pin);
 	u32 mask = get_mask(pin);
@@ -89,8 +88,7 @@ static int stmfx_pinctrl_set_pupd(struct udevice *dev,
 	return stmfx_write(dev, reg, ret);
 }
 
-static int stmfx_pinctrl_set_type(struct udevice *dev,
-				  unsigned int pin, u32 type)
+static int stmfx_conf_set_type(struct udevice *dev, unsigned int pin, u32 type)
 {
 	u8 reg = STMFX_REG_GPIO_TYPE + get_reg(pin);
 	u32 mask = get_mask(pin);
@@ -235,22 +233,22 @@ static int stmfx_pinctrl_conf_set(struct udevice *dev, unsigned int pin,
 	case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
 	case PIN_CONFIG_BIAS_DISABLE:
 	case PIN_CONFIG_DRIVE_PUSH_PULL:
-		ret = stmfx_pinctrl_set_type(dev, pin, 0);
+		ret = stmfx_conf_set_type(dev, pin, 0);
 		break;
 	case PIN_CONFIG_BIAS_PULL_DOWN:
-		ret = stmfx_pinctrl_set_type(dev, pin, 1);
+		ret = stmfx_conf_set_type(dev, pin, 1);
 		if (ret)
 			return ret;
-		ret = stmfx_pinctrl_set_pupd(dev, pin, 0);
+		ret = stmfx_conf_set_pupd(dev, pin, 0);
 		break;
 	case PIN_CONFIG_BIAS_PULL_UP:
-		ret = stmfx_pinctrl_set_type(dev, pin, 1);
+		ret = stmfx_conf_set_type(dev, pin, 1);
 		if (ret)
 			return ret;
-		ret = stmfx_pinctrl_set_pupd(dev, pin, 1);
+		ret = stmfx_conf_set_pupd(dev, pin, 1);
 		break;
 	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
-		ret = stmfx_pinctrl_set_type(dev, pin, 1);
+		ret = stmfx_conf_set_type(dev, pin, 1);
 		break;
 	case PIN_CONFIG_OUTPUT:
 		ret = stmfx_gpio_direction_output(plat->gpio, pin, arg);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
