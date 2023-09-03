Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 815C8790DF7
	for <lists+uboot-stm32@lfdr.de>; Sun,  3 Sep 2023 22:49:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44E70C6B455;
	Sun,  3 Sep 2023 20:49:02 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 455BFC6B44C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Sep 2023 20:49:00 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-52a23227567so996775a12.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Sep 2023 13:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693774140; x=1694378940;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0ssKd6q0X5n56FowY+d9EKZwYozJRtjcPdoih2L7vjU=;
 b=E0KZnCgPHHs6sGooRCB9cc0oMlq0DzAhWEmaOxMoMxfx68g4uKnQ9S4HcRVN2NSzo1
 N6lxcp47hXt9c2RjZWUGSZLcIYL7NT/ZF+G4fRxPWsUvYoIMQQDp1418D0e+5MerOT4k
 icCWOZuqV9cc9ZShHbGymm4zwSwoEPZg7rqTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693774140; x=1694378940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0ssKd6q0X5n56FowY+d9EKZwYozJRtjcPdoih2L7vjU=;
 b=UVTj9Jz+zq2ApQ9HBBmEZr1NJV8BRxqF6134hQFI6upziVr6sREP3vRGrGAPR1/OgL
 w0WQ0T2HYj0nU2n+1tqyN4IQ3JBODIMlp/JY87sLmB66YQOkpqgfAa6twKirkKlEpwgu
 nyIDJodYImlYrtkLnNKQpafpPkRR5OcOyjCEMAwFddkxi0kzBwcmxJyVEKj+tX9yjjzw
 wqc61W9bk0toqxn1n7BcM+9FsEkqIwvslJjFCLM9GnOHP4DEYNG6kvyePzZ4nnMtoqrd
 POXZHjtDDGekIqosguDsCQrfqeGuWMkD/81MtiD7zXKIstQ/GibJmsfk2aRTR8wWPvby
 EA8A==
X-Gm-Message-State: AOJu0YweFn+m+6AQvfwHv/h92Jo6GYRe0jSV81+baXTK8ZQ19bD+O/NK
 PfUJh9Cd+G6y2sdnQ8GyfDPWcg==
X-Google-Smtp-Source: AGHT+IHbfXj2W7sNM+0aoFqphGS9FupyiLPf1vxJxcAorb6CCtrX76CbVE4wDbxke5XCqAvQH6B8Iw==
X-Received: by 2002:a17:906:28d0:b0:9a2:1b05:24c6 with SMTP id
 p16-20020a17090628d000b009a21b0524c6mr4611028ejd.22.1693774139865; 
 Sun, 03 Sep 2023 13:48:59 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-71-141.retail.telecomitalia.it. [79.54.71.141])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a170906131600b0099d9b50d786sm5182466ejb.199.2023.09.03.13.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 13:48:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun,  3 Sep 2023 22:48:45 +0200
Message-Id: <20230903204849.660722-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230903204849.660722-1-dario.binacchi@amarulasolutions.com>
References: <20230903204849.660722-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 06/10] ARM: dts: stm32: add touchscreen on
	stm32f746-disco board
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

commit f0215440069c4fb12958d2d321e05faa2708a11d Linux upstream.

The patch adds support for touchscreen on the stm32f746-disco board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
---

 arch/arm/dts/stm32f746-disco.dts | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm/dts/stm32f746-disco.dts b/arch/arm/dts/stm32f746-disco.dts
index 1ed58f236149..9541f449fd0e 100644
--- a/arch/arm/dts/stm32f746-disco.dts
+++ b/arch/arm/dts/stm32f746-disco.dts
@@ -7,8 +7,9 @@
 /dts-v1/;
 #include "stm32f746.dtsi"
 #include "stm32f746-pinctrl.dtsi"
-#include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "STMicroelectronics STM32F746-DISCO board";
@@ -63,6 +64,22 @@
 	status = "okay";
 };
 
+&i2c3 {
+	pinctrl-0 = <&i2c3_pins_a>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5306";
+		reg = <0x38>;
+		interrupt-parent = <&gpioi>;
+		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <480>;
+		touchscreen-size-y = <272>;
+	};
+};
+
 &sdio1 {
 	status = "okay";
 	vmmc-supply = <&mmc_vcard>;
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
