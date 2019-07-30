Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4217AF74
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:17:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1004FC35E01
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:17:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7ED0AC35E05
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:17:05 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHGGjB012718; Tue, 30 Jul 2019 19:17:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=soz7AsYR9IiSA3HxNtyXQjJW9EYKGDKdUeQOimdkBJ8=;
 b=rAoQTneNgMwWdS6gfKKb86yLCHML5cgSNbeZHpfTst9HJhQORHBKDklPa8ZfKbqZ+RGh
 D2kpgwrjxj1MgCNNg1rKy74ttwXz0TsNDXvckWUiFezOchsxFGtckpVI2+3Q455RWtaQ
 NhRgI203xk54RDfiwqxsiHKBx0jrk0SC0rmBJEPiJqbLt6+YVx1cRp6i/S5gKZeqg8BJ
 8IWwQd8YHSHiF7OPuv4BkIpYrN2a0/d8lD9h67vVfJbxVhn2YXmJ+Fi/EgVrRfDJERW7
 s0nzrfe4EfQ2McHqlaQ7CehhupGMI4Jbf6fHmgi9HLSN49ZcRXa28SD/M2s2I4fPxOId 3Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u0c2ybj13-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:03 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5A7B731;
 Tue, 30 Jul 2019 17:17:02 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4A2B329B3;
 Tue, 30 Jul 2019 17:17:02 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:17:02 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:17:01
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:11 +0200
Message-ID: <1564507016-16570-4-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
References: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 03/48] pinctrl: stmfx: update pinconf settings
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

Alignment with kernel driver.

According to the following tab (coming from STMFX datasheet), updates
have to done in stmfx_pinctrl_conf_set function:

-"type" has to be set when "bias" is configured as "pull-up or pull-down"
-PIN_CONFIG_DRIVE_PUSH_PULL should only be used when gpio is configured as
 output. There is so no need to check direction.

  DIR | TYPE | PUPD | MFX GPIO configuration
  ----|------|------|---------------------------------------------------
  1   | 1    | 1    | OUTPUT open drain with internal pull-up resistor
  ----|------|------|---------------------------------------------------
  1   | 1    | 0    | OUTPUT open drain with internal pull-down resistor
  ----|------|------|---------------------------------------------------
  1   | 0    | 0/1  | OUTPUT push pull no pull
  ----|------|------|---------------------------------------------------
  0   | 1    | 1    | INPUT with internal pull-up resistor
  ----|------|------|---------------------------------------------------
  0   | 1    | 0    | INPUT with internal pull-down resistor
  ----|------|------|---------------------------------------------------
  0   | 0    | 1    | INPUT floating
  ----|------|------|---------------------------------------------------
  0   | 0    | 0    | analog (GPIO not used, default setting)

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/pinctrl/pinctrl-stmfx.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 5431df9..0b5a043 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -231,23 +231,23 @@ static int stmfx_pinctrl_conf_set(struct udevice *dev, unsigned int pin,
 	switch (param) {
 	case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
 	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		ret = stmfx_pinctrl_set_type(dev, pin, 0);
+		break;
 	case PIN_CONFIG_BIAS_PULL_DOWN:
+		ret = stmfx_pinctrl_set_type(dev, pin, 1);
+		if (ret)
+			return ret;
 		ret = stmfx_pinctrl_set_pupd(dev, pin, 0);
 		break;
 	case PIN_CONFIG_BIAS_PULL_UP:
+		ret = stmfx_pinctrl_set_type(dev, pin, 1);
+		if (ret)
+			return ret;
 		ret = stmfx_pinctrl_set_pupd(dev, pin, 1);
 		break;
 	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
-		if (dir == GPIOF_OUTPUT)
-			ret = stmfx_pinctrl_set_type(dev, pin, 1);
-		else
-			ret = stmfx_pinctrl_set_type(dev, pin, 0);
-		break;
-	case PIN_CONFIG_DRIVE_PUSH_PULL:
-		if (dir == GPIOF_OUTPUT)
-			ret = stmfx_pinctrl_set_type(dev, pin, 0);
-		else
-			ret = stmfx_pinctrl_set_type(dev, pin, 1);
+		ret = stmfx_pinctrl_set_type(dev, pin, 1);
 		break;
 	case PIN_CONFIG_OUTPUT:
 		ret = stmfx_gpio_direction_output(plat->gpio, pin, arg);
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
