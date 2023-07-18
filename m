Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F62768DE0
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 Jul 2023 09:18:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AF20C71288;
	Mon, 31 Jul 2023 07:18:22 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BC65C6A603
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 07:05:19 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2b946602d64so22547821fa.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 00:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689663918; x=1692255918;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0c24Dwtc4QJHe1d2fGFPU9+SeU9E66xsg6NnN1rLuXc=;
 b=UwiyJdDnNRLdUsQQeVdFBglP1lM8qQQD7d+hUUWVvwX1r2VJm+Ae46TNTcLHxgE5ro
 +0prXdsnDEDQljX4ZXeLOdFO370L4m9rQ1Klo/hkI43vveAhOAl/2aIjiWkGOScSaSv7
 sgcyMYoXLtbMc8IEpnTfaymfWLqbP5W3khG2eazQnZQ7W8ODQ8yEG6yDMQEb1BluPN2M
 weZpbnjn/ZAWfHc7jprqyRxirB6Pnqcwk7Ai94RVu+6JkhG7hwdBxz3qE5zucsD4iRJc
 eY+tS9CaKBwV5zbr/TJaluWlvm30cSMtaAimDNxyNdM4uhJ32F3MO2HTXtA8sL16h/5P
 IK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689663918; x=1692255918;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0c24Dwtc4QJHe1d2fGFPU9+SeU9E66xsg6NnN1rLuXc=;
 b=PhNuAnAQccnSYPwvubdAYaLHh1+CSyy58k4frdgpLHZ7kyXlLZLpY3/fmXg+bN3PdJ
 TNikkQNtoaDy4QmOLwefAuzqhGso2eDFgM8UkInAXhjD9l/NA0TqXDLbxDvikTk3espb
 h982MD6ON8wHhLOMU48OMXudAJe0t9UMofBbEUtmGCZ5Hyhvf1m+iyaY2eyy+77gaPri
 Kr8YzyEMa1FRYl0Jog/CUlL8Do1SPop0zhAj/orSyYGIf53cnsf5t5FePvFOL07CndGk
 aV52jCZwLmQS1iX2aSA6EnR3PTRxDYvxHiJuF5fTNlyHbJmNvF2kHgPEPsCO/iLxiKpG
 dxrg==
X-Gm-Message-State: ABy/qLa1/33owasWrKeR8EmMv4H2q15C7/hVA5WQo11UmtOWJzCmfkmT
 15uaUOdzRE1X3sSofl02mM8=
X-Google-Smtp-Source: APBJJlHXB8DgdPeboYIJOqGmDpkQ+hgeUqeCnw4N+3mnB1Cf7/Wuv1nKKLBGs2Dw6isUcopgWVhRfQ==
X-Received: by 2002:a2e:7e06:0:b0:2b6:fa3f:9230 with SMTP id
 z6-20020a2e7e06000000b002b6fa3f9230mr9182452ljc.46.1689663917737; 
 Tue, 18 Jul 2023 00:05:17 -0700 (PDT)
Received: from xeon.. ([188.163.112.64]) by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c220a00b003fbfea1afffsm1343644wml.27.2023.07.18.00.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 00:05:17 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Simon Glass <sjg@chromium.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Kever Yang <kever.yang@rock-chips.com>,
 Kostya Porotchkin <kostap@marvell.com>,
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
Date: Tue, 18 Jul 2023 10:05:03 +0300
Message-Id: <20230718070504.19810-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718070504.19810-1-clamor95@gmail.com>
References: <20230718070504.19810-1-clamor95@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:18:21 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 u-boot@dh-electronics.com, u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH v1 3/4] power: pmic-uclass: probe every child
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
