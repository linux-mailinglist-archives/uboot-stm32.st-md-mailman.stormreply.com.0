Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF64FB1D567
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Aug 2025 12:04:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9198EC3F953;
	Thu,  7 Aug 2025 10:04:11 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 176D4C3F957
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Aug 2025 10:04:10 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3b78310b296so366594f8f.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Aug 2025 03:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754561049; x=1755165849;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZOGMX37/3+cIXMQNcUF+yNX4VyOJQeQmLKWoRlFI+jA=;
 b=Tn8Dr0X2hmTI1XGxhyZ+But1/3lDHPgJiigbycmYJq/YEY+PSFgfOZypidfv18ht5F
 voK4N9uRJn3QzSbcz3HKubs5tLwNrqRsa+Wm9FI9TosvXX8TYb2CbHAOlrsarIhIDX6/
 DQmZdtY8kOymKF9fwSbPik4LSmyVSXs3ESO+Ut9T3PD9BSKBFlr9dxLgfHkY67AuDsHG
 S080DtfepwFNbT9wPYuwhWW4jzw+JEtoffZYpkDAEm4UQdx2aOHtTkwOG2iUBT3bj1no
 B1XCesNKEXvML4Eq+OXJAWQfn0eVIc//JEN3FLBmqKInEY/6ZaxDbj7R5RD4USGOVRFS
 sHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754561049; x=1755165849;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZOGMX37/3+cIXMQNcUF+yNX4VyOJQeQmLKWoRlFI+jA=;
 b=wgTtZfr33YoeQSmHgZiGBl38bU8KJatAXF8nNU96iyTU2/7TzJETWQs8uaXMuhLpbV
 /U36zCyaoTynAlJ+rAlorbOjzBn3kVXygWKoHX0wfOktOCGM2B1ku2SDHyL3tb5KxRWV
 tPv2DDmwa2Ufd1+iEC8Sz0x7eI7ku9UTr7KH5DAhqdB3yIQCWwJN0pY6DHtFRZmawU4U
 S4uKdGPZNDYtbehrrJ9EF7yc+VRX3BG4+9bRxFrfJHtxPDs70rLUhGQGkvo3L8rPKFtI
 qARkGzp6AEasOfqTlSeC/Y5sEOvDq5MGCPhufKycAi0Nx1EE1dRkOKJnSTkpEnWfLyM+
 K7QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfNpiMCQJ9syPGZYa99KM0l5xMXBXLgQPMyBWRcKACZ88STegsOqTBhspILiDZrevCxXVYsWbdYAX3/w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzvsq/lw3bh6ekGjBz1xKJf2WX81zgdaBzoNwdv5h/VJ3ApKTr5
 rGcEyrXUveUBRoLvSgt9+Zavw9J00nm+iacgyWMnIXE2DGiWYHFvDvelo+JV4Ai8B9U=
X-Gm-Gg: ASbGncuIz+Wu9VCE71EqYbYLn2b0vXWMWJG47Bvx8Bb1PZ2efYZOBo3d+GKHqF+Xz1M
 SpatoFx41vfGYzCjApnmaNC0gxr0//XvygRCoISTyAVwHSrL563tt98YLGI4Qo4N8CaX+Hieb7f
 XWrUmX5aTtdkWE2b6HrSjqYGPuWHCL9z0Pr+Ftkay44i2LL/5DGf5tYC5yevTL/sBiJgiDQner1
 yFVHxMWgRz0IWib8/yJZvv0aKSvUXNgQLLmHCd3XO7L8CiGjFuCoRxBkswpypZSAGQgAjXvjIe3
 fZ9yJ2Jp0dqUDZ68ib4ZcENfbG1g6WcRVbpeLfcW/57Hhx2r5+oeClq4v7uEhA3mR6uLaR9GE8i
 42mMDBZQRn5KJTeLDxXG+pPTbrzUogHhIrBSIhh7h0c4+mIMJs8U=
X-Google-Smtp-Source: AGHT+IG3jRXg+SP673penIjizLmPcQdg6VoyPg8eiaAeGSAmpYeopvOy5fzTqnAYUsRMAAESiUTDDA==
X-Received: by 2002:a5d:5d8a:0:b0:3a4:f70e:abda with SMTP id
 ffacd0b85a97d-3b8f9f20ff9mr1771361f8f.10.1754561049489; 
 Thu, 07 Aug 2025 03:04:09 -0700 (PDT)
Received: from artemis2.elfringham.co.uk
 ([2a0a:ef40:f9e:3c01:377e:cf4f:d0ff:80bf])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953eaeeesm358481575e9.25.2025.08.07.03.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 03:04:09 -0700 (PDT)
From: Andrew Goodbody <andrew.goodbody@linaro.org>
Date: Thu, 07 Aug 2025 11:04:05 +0100
MIME-Version: 1.0
Message-Id: <20250807-pinctrl_misc-v1-4-eeb564a1b032@linaro.org>
References: <20250807-pinctrl_misc-v1-0-eeb564a1b032@linaro.org>
In-Reply-To: <20250807-pinctrl_misc-v1-0-eeb564a1b032@linaro.org>
To: Tom Rini <trini@konsulko.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Michal Simek <michal.simek@amd.com>
X-Mailer: b4 0.12.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Andrew Goodbody <andrew.goodbody@linaro.org>
Subject: [Uboot-stm32] [PATCH 4/4] pinctrl: zynqmp: Avoid using
	uninitialised variable
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

In zynqmp_pinconf_set if param is PIN_CFG_IOSTANDARD or
PIN_CONFIG_POWER_SOURCE and zynqmp_pm_pinctrl_get_config returns an
error then value will not be assigned to when its value is tested to be
not equal to arg. Add code to only test value not equal to arg if ret is
false.

This issue was found by Smatch.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
---
 drivers/pinctrl/pinctrl-zynqmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
index 27dadbff8ca..665b76a7d4d 100644
--- a/drivers/pinctrl/pinctrl-zynqmp.c
+++ b/drivers/pinctrl/pinctrl-zynqmp.c
@@ -460,14 +460,14 @@ static int zynqmp_pinconf_set(struct udevice *dev, unsigned int pin,
 	case PIN_CFG_IOSTANDARD:
 		param = PM_PINCTRL_CONFIG_VOLTAGE_STATUS;
 		ret = zynqmp_pm_pinctrl_get_config(pin, param, &value);
-		if (arg != value)
+		if (!ret && arg != value)
 			dev_warn(dev, "Invalid IO Standard requested for pin %d\n",
 				 pin);
 		break;
 	case PIN_CONFIG_POWER_SOURCE:
 		param = PM_PINCTRL_CONFIG_VOLTAGE_STATUS;
 		ret = zynqmp_pm_pinctrl_get_config(pin, param, &value);
-		if (arg != value)
+		if (!ret && arg != value)
 			dev_warn(dev, "Invalid IO Standard requested for pin %d\n",
 				 pin);
 		break;

-- 
2.39.5

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
