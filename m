Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B76F790DFA
	for <lists+uboot-stm32@lfdr.de>; Sun,  3 Sep 2023 22:49:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 656A4C6B459;
	Sun,  3 Sep 2023 20:49:05 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9AA1C6B455
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Sep 2023 20:49:03 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-99c3d3c3db9so124950966b.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Sep 2023 13:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693774143; x=1694378943;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4aQ/spxaSMEggXIYz8OYteRC3aFv4G+4nlQfhxgjoF8=;
 b=CAVkDevUU0ciw2bwTf0p7qcbhy+8HvSwSz/X8ZCXje9kJKeJDEnhXngxqOxtBT5436
 qFLnN4oM5X3Cinj1IxMYSAmL5dQO90rVoNTEYxm/gAVNOtnJjyEfioYtMIZUYSI18VsK
 HsyqJN94LO8o1h77o3zgQZrn0wXO8M2pxxbAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693774143; x=1694378943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4aQ/spxaSMEggXIYz8OYteRC3aFv4G+4nlQfhxgjoF8=;
 b=BZWKw2oNf5+/ALb3HbyMC7JFqfZyzhDz/Q2lhU/cPn1Mn3/cT5t/wKQNEX/cDdV7BB
 8mj03v7W+N6VVj2TJVZF29YhuVZB6PEec0I4PY7D6Xe8mUOcw1c1gcdBj4Y7EEIfzZRp
 lsEmqCYPUCzGuWWIXomKdvaL6JynV1/ehu77hzWuz2m5Z8PTKZi3z2hSPLuQKq02Mu7u
 6ODS9W6PGd+XZPCj3Tn5R522lkNkaoV9wuVlgi8OCADcoAkhYDfTNn8pP3h5blxd+cGd
 Brn+C2C+jCKo9Uy991hPT75wuiX4ZlCzwoDmb2CjRUa5lhSN9aqGR5Hs/UDTzE8JYSxl
 46NA==
X-Gm-Message-State: AOJu0YwYP15e46LP220IUq/9WbOD3HvlKfJRyNs8ds2CoOvEZGO9SiRk
 gFiq+qwEHWhlaB042yoLb20uSg==
X-Google-Smtp-Source: AGHT+IH1/+0FKlh06kDZ+9TResyYja01BpHYvmn6R2fuHTrTXBxxw8o+Hmm72gW6oTiMjjqgV9Ln6Q==
X-Received: by 2002:a17:906:2201:b0:9a5:cf23:de5a with SMTP id
 s1-20020a170906220100b009a5cf23de5amr4969382ejs.45.1693774143432; 
 Sun, 03 Sep 2023 13:49:03 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-71-141.retail.telecomitalia.it. [79.54.71.141])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a170906131600b0099d9b50d786sm5182466ejb.199.2023.09.03.13.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 13:49:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun,  3 Sep 2023 22:48:48 +0200
Message-Id: <20230903204849.660722-10-dario.binacchi@amarulasolutions.com>
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
Subject: [Uboot-stm32] [PATCH 09/10] ARM: dts: stm32: rename mmc_vcard to
	vcc-3v3 on stm32f746-disco
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

commit e4e724099f04072053cf411456e3e9aae48c4af1 Linux upstream.

In the schematics of document UM1907, the power supply for the micro SD
card is the same 3v3 voltage that is used to power other devices on the
board. By generalizing the name of the voltage regulator, it can be
referenced by other nodes in the device tree without creating
misunderstandings.

This patch is preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
---

 arch/arm/dts/stm32f746-disco.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/dts/stm32f746-disco.dts b/arch/arm/dts/stm32f746-disco.dts
index 9541f449fd0e..e1564d69f9f6 100644
--- a/arch/arm/dts/stm32f746-disco.dts
+++ b/arch/arm/dts/stm32f746-disco.dts
@@ -44,9 +44,9 @@
 		regulator-always-on;
 	};
 
-	mmc_vcard: mmc_vcard {
+	vcc_3v3: vcc-3v3 {
 		compatible = "regulator-fixed";
-		regulator-name = "mmc_vcard";
+		regulator-name = "vcc_3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
@@ -82,7 +82,7 @@
 
 &sdio1 {
 	status = "okay";
-	vmmc-supply = <&mmc_vcard>;
+	vmmc-supply = <&vcc_3v3>;
 	cd-gpios = <&gpioc 13 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default", "opendrain";
 	pinctrl-0 = <&sdio_pins_a>;
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
