Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F646768DE9
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 Jul 2023 09:18:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45182C7129B;
	Mon, 31 Jul 2023 07:18:23 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CAAEC6B442
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 12:38:18 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-4fb761efa7aso1212903e87.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jul 2023 05:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689856697; x=1690461497;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0c24Dwtc4QJHe1d2fGFPU9+SeU9E66xsg6NnN1rLuXc=;
 b=nVFojwoxMWtfhAdoYVx9PFb5jTedkE/TMRQrBiDfmHY5k4V5GztKUEFWhmitnCvMGT
 dH3T9sJXOKrslKUcoAzf14f9AhPiD1ysC+yLGr9a0AHT6Zg2ii5da5VvHfRxyFFcrm0L
 aoLGvX6tElZp22k/2+n/JEguyTdt99ZMzSnnOQLa+SfQOjCl2Ksrk76Osk9+I2i7wi2o
 r06nZ+LV6/LoXfBKB6SCtN+68GDfUsAXTyd3KopMrvgjFcLYcVbnM31sg4MjTCo+lwOp
 KF6QpL/hwC4AzJbWm9a5xekwEJANeKNjEY3m4CAdH+Mt9bPT/M4y3qT1tQp1amor0WAX
 Kl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689856697; x=1690461497;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0c24Dwtc4QJHe1d2fGFPU9+SeU9E66xsg6NnN1rLuXc=;
 b=KLn5sYeV9sM6olPfME9SVnm+/YEXUYmjSKlYQzsdtbhuINW4v8h6N+lYueiL1NCrh3
 98n07E9yBdRwWKexLWpReFVE+4H2has/3TAIxBwb7ZMZyHOjd/Xznrlbuu50UXuxOnip
 4q1R4RzOmsNlJfmHlFMySKoSpfRhXD1pI3mrme2Td0t2HDdUNB63CUFWEW2eUJZYxgl4
 mqw+Cc+myQYlotYJt/rhNHYm7D25kbMY2SzAoX8IqJRAIsHstu8bPq+Lll2GNKh9fJaq
 4haxceJiZXvSvULQc63tbkWGm8hjGVmFVYb1tw5EG5xVW9n59aYlEr0l+f8063vS3meC
 4ErA==
X-Gm-Message-State: ABy/qLbk9PT7xH6yy2b+y5s855U6GZnyyBJAoi6jKHWsAMWm2zGi6kKm
 vqvG6SQVlUA6sBeop//MNDQ=
X-Google-Smtp-Source: APBJJlHoyqetL6da4H7kXJUkOlZtiTEHwe4iucVi8AnHEIjqhTwQiiXK/yy7dVI8m9cRrUskBaBJkQ==
X-Received: by 2002:a05:6512:234e:b0:4fb:9d61:db4d with SMTP id
 p14-20020a056512234e00b004fb9d61db4dmr2507356lfu.18.1689856697384; 
 Thu, 20 Jul 2023 05:38:17 -0700 (PDT)
Received: from xeon.. ([188.163.112.64]) by smtp.gmail.com with ESMTPSA id
 m25-20020ac24ad9000000b004fb9c625b4asm184401lfp.210.2023.07.20.05.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 05:38:17 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Simon Glass <sjg@chromium.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Kever Yang <kever.yang@rock-chips.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, Anatolij Gustschin <agust@denx.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>
Date: Thu, 20 Jul 2023 15:37:42 +0300
Message-Id: <20230720123744.26854-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230720123744.26854-1-clamor95@gmail.com>
References: <20230720123744.26854-1-clamor95@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:18:21 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 u-boot@dh-electronics.com, u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH v2 5/7] power: pmic-uclass: probe every child
	on pmic_post_probe
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

Main goal is to probe all regulator childrens for their
proper setup but if pmic has non regulator children they
should not suffer from this either.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/power/pmic/pmic-uclass.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/power/pmic/pmic-uclass.c b/drivers/power/pmic/pmic-uclass.c
index 0e2f5e1f41..8ca717bd5e 100644
--- a/drivers/power/pmic/pmic-uclass.c
+++ b/drivers/power/pmic/pmic-uclass.c
@@ -16,6 +16,7 @@
 #include <dm/device-internal.h>
 #include <dm/uclass-internal.h>
 #include <power/pmic.h>
+#include <power/regulator.h>
 #include <linux/ctype.h>
 
 #if CONFIG_IS_ENABLED(PMIC_CHILDREN)
@@ -198,9 +199,18 @@ static int pmic_pre_probe(struct udevice *dev)
 	return 0;
 }
 
+static int pmic_post_probe(struct udevice *dev)
+{
+	struct udevice *child;
+
+	device_foreach_child_probe(child, dev);
+	return 0;
+}
+
 UCLASS_DRIVER(pmic) = {
 	.id		= UCLASS_PMIC,
 	.name		= "pmic",
 	.pre_probe	= pmic_pre_probe,
+	.post_probe	= pmic_post_probe,
 	.per_device_auto	= sizeof(struct uc_pmic_priv),
 };
-- 
2.39.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
