Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9FD88623B
	for <lists+uboot-stm32@lfdr.de>; Thu, 21 Mar 2024 22:04:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7815DC6DD69;
	Thu, 21 Mar 2024 21:04:43 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65867C6DD69
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 21:04:42 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2d68651e253so23983641fa.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 14:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711055082; x=1711659882;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zKs4JT+m2KCkJOqgG6C5kt9r4QRZhsfdeXlX04Y/UsA=;
 b=hYmgReCt87K3mfxvt8npNrbiVOImNe/ZEajy/r0AX91INy0uxkAVoGiRGXDJUJAKgO
 cis2hkTemLLN1PpxCJ5lUMBs40hsWpJlR0g87NA+xckXXJKi3qU+tzZEeV+DYaUuhQZ7
 WnboyNhPro7lWZ+N3xVHavZ95umeeSXqencNhyeLsSMHImbmeXPB1q/BQbcTjkKWRPDn
 Rb76TTcDq6Lz/mIEHbXnqKlDH3X/538jyJMgubPs0XlbQQz/Prip/2FpHd0vIIHoW4Nw
 nSS/bykMYrdTaf32xsYLpr9lLd5NhorzELLXD66LftBnQ8W9K5TN61yv8ePlE4gXlw4p
 kYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711055082; x=1711659882;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zKs4JT+m2KCkJOqgG6C5kt9r4QRZhsfdeXlX04Y/UsA=;
 b=pqeQc98bKp+UikxIcRYEPKPxtQhuIl0wJf2SQ7jUwPHKbPgl56KC4qvMNvCeY9yFVA
 pBZO3aADm8Sa6hL2ZVYXUwB0LAHiV0zoELjuGhlFwKYxIu6O6qUeos0eWnyXKv9xAuJv
 O+90xZ/33wPOLgb79dn9DHR6qnr9om2raXnt02QHJK3fnU4S6ea6JSWUKKjTY8cd2q2G
 MYabevraZwCNBzJ1vYxo68ErW3Jpx74BZsrO8bdyP8CCnCtJJGoLlhY2KgmrWuvgTOuA
 mHJxGZOrGoKsSQ4fiDHBKT9YSXCpjs9PVWHpkJcsEjnJ0rMe/zzYaHTpUvc3e75hwMaD
 WZwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr195IMimrhXxrw40PUSK6QdNPFy6dtQRPwazh3PwTdRZpvmlGQ8b0lp2LjsMDlS6udmlXNx7KYilreU56WPUZpsohQs5zUrisgt5vEa2c5szVM+epTLf/
X-Gm-Message-State: AOJu0YxkgGApbYRfWCWCtxoE21IN8L3ZKz/8O/ebOSJcTDnGfakOdV35
 Z41NNqfOb8hMjabgQA7NnM2JcLjUlFnRSz5zFXKF8/AspScaIppH1Dujj48AhD0=
X-Google-Smtp-Source: AGHT+IFFuvGX1KeE0xUnbwTd6d6Uw1dPsPNmpoGg9We3tzgWW/Q7FxS2QdQR61+vqdh3E1i/uipa9Q==
X-Received: by 2002:a2e:9582:0:b0:2d4:6814:7c98 with SMTP id
 w2-20020a2e9582000000b002d468147c98mr413187ljh.43.1711055081771; 
 Thu, 21 Mar 2024 14:04:41 -0700 (PDT)
Received: from lion.localdomain (host-92-17-96-232.as13285.net. [92.17.96.232])
 by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b004146f728906sm925462wmb.7.2024.03.21.14.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 14:04:41 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Thu, 21 Mar 2024 21:04:07 +0000
MIME-Version: 1.0
Message-Id: <20240321-b4-upstream-dt-headers-v2-24-1eac0df875fe@linaro.org>
References: <20240321-b4-upstream-dt-headers-v2-0-1eac0df875fe@linaro.org>
In-Reply-To: <20240321-b4-upstream-dt-headers-v2-0-1eac0df875fe@linaro.org>
To: Tom Rini <trini@konsulko.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Sumit Garg <sumit.garg@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, 
 Kever Yang <kever.yang@rock-chips.com>, Lukasz Majewski <lukma@denx.de>, 
 Sean Anderson <seanga2@gmail.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Matthias Brugger <mbrugger@suse.com>, Peter Robinson <pbrobinson@gmail.com>, 
 Joe Hershberger <joe.hershberger@ni.com>, 
 Ramon Fried <rfried.dev@gmail.com>, Thierry Reding <treding@nvidia.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, Michal Simek <michal.simek@amd.com>, 
 Paul Barker <paul.barker.ct@bp.renesas.com>, 
 Weijie Gao <weijie.gao@mediatek.com>, 
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Eugen Hristev <eugen.hristev@collabora.com>, Rick Chen <rick@andestech.com>, 
 Leo <ycliang@andestech.com>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, 
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Dai Okamura <okamura.dai@socionext.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2528;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=lFINIkt3mPUDg930k4h55ttVmUyWegfEw9o+thWATTw=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhtQ/C/ZqBxVkeS9oVp1n6Lqgdkngu4YNyp9k1v/acWpTz
 c6ZgTuaOkpZGAQ5GGTFFFnETyyzbFp72V5j+4ILMHNYmUCGMHBxCsBEousY/inx+2//rjnNqe7L
 /+1/Wsrz2EvdLZpT7r+a9q4qLfrqQQmGPzxZnnNDHkjNeeKrO+fhLJWnd9/M2a30pFlC9vSLFdy
 BXx4DAA==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 uboot-snps-arc@synopsys.com, Caleb Connolly <caleb.connolly@linaro.org>,
 u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH v2 24/24] dts: support building all dtb files
 for a specific vendor
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

This adjusts OF_UPSTREAM to behave more like the kernel by allowing for
all the devicetree files for a given vendor to be compiled. This is
useful for Qualcomm in particular as most boards are supported by a
single U-Boot build just provided with a different DT.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 dts/Kconfig          | 24 ++++++++++++++++++++++++
 scripts/Makefile.dts | 13 +++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/dts/Kconfig b/dts/Kconfig
index b9b6367154ef..6883a000a052 100644
--- a/dts/Kconfig
+++ b/dts/Kconfig
@@ -100,8 +100,32 @@ config OF_UPSTREAM
 	  However, newer boards whose devicetree source files haven't landed in
 	  the dts/upstream subtree, they can override this option to have the
 	  DT build from existing U-Boot tree location instead.
 
+config OF_UPSTREAM_BUILD_VENDOR
+	bool "Build all devicetree files for a particular vendor"
+	depends on OF_UPSTREAM
+	help
+	  Enable building all devicetree files for a particular vendor. This
+	  is useful for generic U-Boot configurations where many boards can
+	  be supported with a single binary.
+
+	  This is only available for platforms using upstream devicetree.
+
+config OF_UPSTREAM_VENDOR
+	string "Vendor to build all upstream devicetree files for"
+	depends on OF_UPSTREAM_BUILD_VENDOR
+	default "qcom" if ARCH_SNAPDRAGON
+	default "rockchip" if ARCH_ROCKCHIP
+	default "amlogic" if ARCH_MESON
+	default "allwinner" if ARCH_SUNXI
+	default "mediatek" if ARCH_MEDIATEK
+	default "marvell" if ARCH_MVEBU || ARCH_KIRKWOOD
+	default "xilinx" if ARCH_VERSAL || ARCH_ZYNQ
+	default "nvidia" if ARCH_TEGRA
+	help
+	  Select the vendor to build all devicetree files for.
+
 choice
 	prompt "Provider of DTB for DT control"
 	depends on OF_CONTROL
 
diff --git a/scripts/Makefile.dts b/scripts/Makefile.dts
index 5e2429c6170c..790f3c508f19 100644
--- a/scripts/Makefile.dts
+++ b/scripts/Makefile.dts
@@ -1,3 +1,16 @@
 # SPDX-License-Identifier: GPL-2.0+
 
 dtb-y += $(patsubst %,%.dtb,$(subst ",,$(CONFIG_DEFAULT_DEVICE_TREE) $(CONFIG_OF_LIST) $(CONFIG_SPL_OF_LIST)))
+
+ifeq ($(CONFIG_OF_UPSTREAM_BUILD_VENDOR),y)
+ifeq ($(CONFIG_ARM64),y)
+dt_dir := $(srctree)/dts/upstream/src/arm64
+else
+dt_dir := $(srctree)/dts/upstream/src/$(ARCH)
+endif
+
+dtb-vendor_dts := $(patsubst %.dts,%.dtb,$(wildcard $(dt_dir)/$(subst ",,$(CONFIG_OF_UPSTREAM_VENDOR))/*.dts))
+
+dtb-y += $(subst $(dt_dir)/,,$(dtb-vendor_dts))
+
+endif

-- 
2.44.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
