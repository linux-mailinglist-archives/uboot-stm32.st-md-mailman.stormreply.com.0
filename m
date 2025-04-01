Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0618AA774E1
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Apr 2025 09:01:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEB1DC78F98;
	Tue,  1 Apr 2025 07:01:33 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F72CCFAC50
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Apr 2025 07:01:32 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso57244945e9.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Apr 2025 00:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1743490892; x=1744095692;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aKT0Cu/By76Hhujbb5ado8LtBC72J3w7y5Yed87n07U=;
 b=BOjbPFR2C60tHf8dxiBFTXldWp6Ye4t2eTfpcVgnSHk1QMvLGPZSkvG25A/3zArXwz
 BPLEtJQiJvKPYpxb0KptgMJ76yAUxk5AVhHE3uoLmnLMFYJdWCFcnAa7FmwDAHrpzbJu
 wCh7ABrDAAhLAZCjwcys5VvYHUgk0RdtgtNPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743490892; x=1744095692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aKT0Cu/By76Hhujbb5ado8LtBC72J3w7y5Yed87n07U=;
 b=JWLFyhnpSawX3PfzZpRe26Pivrcp4MzvJlRCelTNdG+/0XNcE/OyHbQ4xROki6sAVo
 j79fAuli7lmBxKfAycbMoY/k1WpQJM9gqvm6sspX5EkSsx6FQcV4GyzDrujj1Eg3bN18
 igASjtlDcVmkd+gqxoGiUOueNV9yMQ4ZCa6uI0nGD55bCNMsC/W0NNARrVY+xVjBFdcX
 KG4X/OlAAEN0V2NeDk0d0Nb2rxgJuu1v6ybWd8HoAeM4yFKueyCFExmstkW4qf8mkm+E
 5m7evihpnJAApS0lp8Uq+Jn2GaLJpLeK3gpYjyt9ZTzL02D3BhKsDFqyxh1Lt1SaKb+M
 kNRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqEzZSQs4T4BCiOmYYkJzt0vKpx7PdPofdPcPYyTkt7UcJ2dWTrUyZ6RQ3CKYk9xeejczRI6QKEjGAAQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwRKao/4sieShfw4Uj/aM6aXZC4Kgy2xX0XNcA6JJQkCoMrKAh4
 Hm4MnTSyFKt/6qX5j8Hgs2Qu4el6a2xgXZDsi4bwiL7UXh3xHLcO5z3Lk5Q5jXk=
X-Gm-Gg: ASbGnctqURvPgFw3bYBN6jJ1X6kPC+sgdzwVPUVdSFsNgz5Z8Y1YKv+MMKszTAyApRr
 2Eb68cw2cf4QnZotRPEYaoNlWrERBEq7CljtjQPKDc5npkcKzjClS4k7SN+ATJm4YUWk2wWodYm
 zHFDfT/KChRVGw0ysJDywir8SVdneyvF4aLOnF75yzsJ20ryLGGKhOId19TRJdcSH24xfkTPiBs
 3jAHq+UysCwmB25L3aeG1pu0QLpOonXfOYbQRm0eG0p+vtKfg1fX791jtF/QzcBR8yBwvlzHG9z
 G8z0SJFNQjsrHhOSqoXDuELgAln7kaX0keCWcq3t2SJSoEtYRrgHO/ShtC0JCWpNPc9Zw9g/N0Q
 vPchu08lsew==
X-Google-Smtp-Source: AGHT+IFdnn8EQSDn46OyHfX9Qy22z2Hd5nmFYeddCRXTwn1pwVyy62D0yBEh1wYjy7TP2xYW1M8fuQ==
X-Received: by 2002:a5d:64ee:0:b0:391:2fe4:de0a with SMTP id
 ffacd0b85a97d-39c120ccabfmr10167645f8f.2.1743490891794; 
 Tue, 01 Apr 2025 00:01:31 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b66b015sm13701760f8f.54.2025.04.01.00.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 00:01:31 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Tue,  1 Apr 2025 09:00:53 +0200
Message-ID: <20250401070125.3705126-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250401070125.3705126-1-dario.binacchi@amarulasolutions.com>
References: <20250401070125.3705126-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH v2 2/6] ARM: dts: stm32: rename mmc_vcard to
	vcc-3v3 on stm32f769-disco
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

[backport from Linux commit f1317928fa03203929665af61e6d9ac0e29ea84d]

In the schematics of document UM2033, the power supply for the micro SD
card is the same 3v3 voltage that is used to power other devices on the
board. By generalizing the name of the voltage regulator, it can be
referenced by other nodes in the device tree without creating
misunderstandings.

This patch is preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

Changes in v2:
- Add Reviewed-by tag of Patrice Chotard

 arch/arm/dts/stm32f769-disco.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/dts/stm32f769-disco.dts b/arch/arm/dts/stm32f769-disco.dts
index ad1b442055e1..b4e240a8e3eb 100644
--- a/arch/arm/dts/stm32f769-disco.dts
+++ b/arch/arm/dts/stm32f769-disco.dts
@@ -56,9 +56,9 @@
 		clock-names = "main_clk";
 	};
 
-	mmc_vcard: mmc_vcard {
+	vcc_3v3: vcc-3v3 {
 		compatible = "regulator-fixed";
-		regulator-name = "mmc_vcard";
+		regulator-name = "vcc_3v3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
@@ -96,7 +96,7 @@
 
 &sdio2 {
 	status = "okay";
-	vmmc-supply = <&mmc_vcard>;
+	vmmc-supply = <&vcc_3v3>;
 	cd-gpios = <&gpioi 15 GPIO_ACTIVE_LOW>;
 	broken-cd;
 	pinctrl-names = "default", "opendrain";
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
