Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD6FA6E1EC
	for <lists+uboot-stm32@lfdr.de>; Mon, 24 Mar 2025 19:00:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9EAFC78F68;
	Mon, 24 Mar 2025 18:00:54 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 058AAC78F68
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 18:00:54 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso33332775e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 11:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1742839253; x=1743444053;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UI4vo8J00xZLzvVavnwZoS3tsdfhwA4zMsaYhvBtlK0=;
 b=jdILYQv4ycf6Xa9/w24LGVmHIzFe1KxERJvBYRfFlRM5Dp3s29FPJCQiv8/hPDX/Zs
 jQryxLdhfnrMKBx5IlcZLGkdroN510Sq9y2Bm3eFeI+p4I0A6C6xaJt9yMCJ7usZGym4
 ADfRdFRqvPdr2aqeWZh3x5nLvB6SU9IM+C9O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742839253; x=1743444053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UI4vo8J00xZLzvVavnwZoS3tsdfhwA4zMsaYhvBtlK0=;
 b=rsYCVlIKhSm4gKVkALDWj4/En3w+Sx0A/FRRPWt+IIGIJB+DsGSql92Vrv3qR8mer7
 /r3V8KJfB7IhVTA9A8n8m6bDvoEpoyWOqdeHCgf8XWfEtvBrkN4OrMZG8pmls01Cl8pF
 m4+VX909YEi31SevWLFCI9xNGY3MpRI2JrXEFUTam6k9Y5Wcz4KvLzl3MdyR/IVrDMJW
 LbJ5JHrVhkSHaTrL0lJ9giBOpVDdn/SFlDMe3bkANMOeveNWAlJnqohH1P4A82QZuYuA
 P5O+VKRZ5DjuYB6fjuYjvmsODfTRjE6M7JhXQN26b2szdab5Z6l1JsuSTGHD9w7jDKGC
 Wo8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9PTnoEPy67xx7Ljz1ld0Gcwlt8dKWSmX1ExR9dgTdK3+tlcn8Feu1A2thLTflAt+PAy2U5b94lt9qUA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxK7ulZP3mOIf8i+5tzk/cdHnrbOZgnV5tpMCci4lrltpZ5AdU4
 PfrbqT3ildkAGC2XRsiTXGnpR7pDiM/mYiLGyc0aYhLa3xTeXpeLlIigjDvm0+g=
X-Gm-Gg: ASbGncvJUG5kkDw+oWv92GwISA+7fbw7qbZc+wP2wC1F6Ly/y1EfGHKvNetrs1Wvp6U
 hMfuiTSaLSRSqhkOp+7G/hfPHmh3Cty9dHz5luLVcIEL7oHzR15Byt2zesGbpSYwtCOV4yW4Qpy
 jhi/kCZxsByuTumupcG1D7zzX5D8BLeUdvT5ps0TO5pJo5pJDHWMjlqFgrkR4Z6sOQ1lP6YM7Q5
 /+LOjO/u1Nt2huqPMt3gg//7BBO560mfsSp31zDm3eXVYKKpwyjkcyu7wnDAOVg46COmtWlxFjn
 uVhBwj5MoA7V845htWDjL4S0TrDwvRb65cPnGzKVAic7a/kyhKE9iXIXrspgEyuByYkojKklJIM
 oBHOSEzTrld4lviv4/WJDTzt5GuM/HTKltpU=
X-Google-Smtp-Source: AGHT+IHTDAyMLIVPRQ6HaASxNC+PvQV4Gz5ujsztBt6JzwvIEusAdmBZtB+8GdVBXs/h9+RTcY4BMw==
X-Received: by 2002:a05:600c:3110:b0:43a:b8eb:9e5f with SMTP id
 5b1f17b1804b1-43d509e38e3mr125490415e9.3.1742839253415; 
 Mon, 24 Mar 2025 11:00:53 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.220])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f556a4sm178289285e9.22.2025.03.24.11.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 11:00:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Mon, 24 Mar 2025 19:00:26 +0100
Message-ID: <20250324180047.1571378-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324180047.1571378-1-dario.binacchi@amarulasolutions.com>
References: <20250324180047.1571378-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 2/6] ARM: dts: stm32: rename mmc_vcard to
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
---

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
