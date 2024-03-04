Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B17FF8707A5
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Mar 2024 17:52:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 799AFC6DD75;
	Mon,  4 Mar 2024 16:52:05 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F8A6C6DD69
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Mar 2024 16:52:04 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-412e7fe4497so4794055e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Mar 2024 08:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709571124; x=1710175924;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5pCWnqR2w3MK2Z9hkofhscjBJ0Hj19Lc+xpshC15mCg=;
 b=Ae2Q4jyqtJ2MC/8KWDkVOA/KB5kaaU2zvYFr4q7fD6h8yGHzwr1IWjcnUg0JJOZsZM
 qwt/ZYljS2W0jLzfvX9ZcpSajJBt59RFSL/JRIXhBSvBVpm6zN554asCASLW8mr3EdgJ
 UM1lJfILxH4Z9mNfVHzSxrvKzrkBSXmuXYGxc/go6yIeZ9qyr7QbO53Q/NuOMQvbvxGY
 xmgLe8tB1ZedF1USWU+Cq+3XnppCJPf8OzKjVrzoyf1JucDiZxTVmm9BAqYfb4dq44RU
 jL+h2rZWagahpfieeVd4znzgHVnSRgZ4o4MutOfvZq6ZIHcW5QZmlnh2HfZd06r35FsO
 5Wqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709571124; x=1710175924;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5pCWnqR2w3MK2Z9hkofhscjBJ0Hj19Lc+xpshC15mCg=;
 b=GsaGEDhoRAlrlFuio/c0plOJigAfnygg6odEzlmAXkj2dcrMTQ9V6VfkyItZYbaQhT
 BSuvccROe7ndGthdtV424kgQpi2bZKrIUah8muHcyMKDncnFKvtyDIq6JFifI9J2qkzP
 2EPZL5Yu5DkPaCHbRGbZdeC3rdg+jn13n+1sZ8JNLtefuULBfbwR9p5MR9QcjBu3qJgs
 ACnHm3CPdpQvhPxe5Cd9Gko73dhMUA3RQUpdprvQ99vuMMmXxQCZZmpMYLjRCCKjYNa0
 q0V3aSW+Ars5V/4GqzOMK2ptHHvHSQOJC4eRBymeJZoVRJnggjZK7OF3qJFVCBKFRju5
 6A5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKMrcQ8mrGZA6Fthykmeuv07LUpPxvY4nXc54zU2Q66pB+yN7N2hW3FflsHcp98d25oJG4NR+9DpnYxk2+KEQOhGZTeoYNkw7NI25pfULA1dgYjuXvNQqi
X-Gm-Message-State: AOJu0YwjwP+thIxtnRM+ES34v9SBWEpG/LqHxDAtTgMba/JQLjScF8tP
 y7cGX5aa0OWkNgiGuwfbCRiPVTiG1GnwXAxs65x/5JzqhMsc6rKjeSU3aCCHhHk=
X-Google-Smtp-Source: AGHT+IEjhPNnOmvxE//lUchMMMtq5k9u+YYlSzW/hTU5ohirwvcPfzQHUgu607vQs5iIsLuuIPMRVQ==
X-Received: by 2002:a05:600c:1c9c:b0:412:e580:2dbc with SMTP id
 k28-20020a05600c1c9c00b00412e5802dbcmr1575430wms.19.1709571123950; 
 Mon, 04 Mar 2024 08:52:03 -0800 (PST)
Received: from lion.localdomain (host-92-17-96-232.as13285.net. [92.17.96.232])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0a5500b00412cb0961fasm10598517wmq.6.2024.03.04.08.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 08:52:03 -0800 (PST)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Mon, 04 Mar 2024 16:51:34 +0000
MIME-Version: 1.0
Message-Id: <20240304-b4-upstream-dt-headers-v1-26-b7ff41925f92@linaro.org>
References: <20240304-b4-upstream-dt-headers-v1-0-b7ff41925f92@linaro.org>
In-Reply-To: <20240304-b4-upstream-dt-headers-v1-0-b7ff41925f92@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2654;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=EI2CDzUz7yZMpQs2UznMDgZqFxlWcF+fQMMDPec6VAA=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhtSnfzjZbFzqomcFzWZeWP/p0l6fZTdzdJim2HT2/J9QI
 97Z+Syvo5SFQZCDQVZMkUX8xDLLprWX7TW2L7gAM4eVCWQIAxenAEzk0TJGhoXmeT1fj8vPurep
 9Q7bLMMl2cdYfhQcNPokvMWK8dNF0X5GhmluS6/N3bfIY5Kaq0mF0cmI6Iyp/PNehy++Fn40UJb
 P6CAA
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 uboot-snps-arc@synopsys.com, Caleb Connolly <caleb.connolly@linaro.org>,
 u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH RFC 26/26] dts: support building all dtb files
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
 scripts/Makefile.dts | 17 ++++++++++++++++-
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/dts/Kconfig b/dts/Kconfig
index b9b6367154ef..67d9dc489856 100644
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
+	default "marvell" if ARCH_MVEBU
+	default "xilinx" if ARCH_VERSAL || ARCH_ZYNQ
+	default "nvidia" if ARCH_TEGRA
+	help
+	  Select the vendor to build all devicetree files for.
+
 choice
 	prompt "Provider of DTB for DT control"
 	depends on OF_CONTROL
 
diff --git a/scripts/Makefile.dts b/scripts/Makefile.dts
index 5e2429c6170c..8005527f3df7 100644
--- a/scripts/Makefile.dts
+++ b/scripts/Makefile.dts
@@ -1,3 +1,18 @@
 # SPDX-License-Identifier: GPL-2.0+
 
-dtb-y += $(patsubst %,%.dtb,$(subst ",,$(CONFIG_DEFAULT_DEVICE_TREE) $(CONFIG_OF_LIST) $(CONFIG_SPL_OF_LIST)))
+dtb-y += $(patsubst %,%.dtb,\
+	$(subst ",,$(CONFIG_DEFAULT_DEVICE_TREE) $(CONFIG_OF_LIST) $(CONFIG_SPL_OF_LIST)))
+
+ifeq ($(CONFIG_OF_UPSTREAM_BUILD_VENDOR),y)
+ifeq ($(CONFIG_ARM64),y)
+dt_dir := $(srctree)/dts/upstream/src/arm64
+else
+dt_dir := $(srctree)/dts/upstream/src/$(ARCH)
+endif
+
+dtb-vendor_dts := $(patsubst %.dts,%.dtb, \
+	$(wildcard $(dt_dir)/$(subst ",,$(CONFIG_OF_UPSTREAM_VENDOR))/*.dts))
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
