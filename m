Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C93871FBD
	for <lists+uboot-stm32@lfdr.de>; Tue,  5 Mar 2024 14:02:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7626FC6DD69;
	Tue,  5 Mar 2024 13:02:40 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0ABFC62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Mar 2024 12:36:04 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-472751180f6so96204137.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Mar 2024 04:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709642163; x=1710246963;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5+8zuP3MJOUgNNdP4KHvSrZTKRgDcPIgl7A75TCaYSM=;
 b=VrgU/TOKKts7bukfcHhjUBVJGdDXilTBNkag5supzkbVZmrp6PS8WU/NRM6ji+4EdT
 bBPt4VOm23Z+diKRIKiTTUPmCprIdBfX6H8fiCzlZAjWqynTODkbvXKJ37hB2/4sTGva
 mcizrAg1Qch5536/9Pf2yfO89QINppHwn0rH0NTae2BLEOF4X4O8EeCXVnLQF6+zlSOJ
 iUXitckLIxUyjhVZ1FIJnbdfY0D+S6EB87Xh0S2aAPP8FT+XALhm0jK09vpYwkK9xMJ+
 tZbpBsKqk3DjpvRFv+IVu2fGUVvRXSrvHFmY65aTlxNR9fx6824ODSgSr0+V//ZE7HzN
 nylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709642163; x=1710246963;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5+8zuP3MJOUgNNdP4KHvSrZTKRgDcPIgl7A75TCaYSM=;
 b=W7ihpiI2cygLabNHgc76cChsBHROz1cp6zBHTfGhXWUxKKXXm/8kJlgjlIOma1m8Pf
 ++nmSKnpz1fpxw1CGy+R6ptXgIWpdeNXnXvFmDwU1VDGWw/BaZmc/WdBGLPtLoKAIx9h
 dghdo8pjH1n4Sb4nRY9h27XAJMiQMMa3OVfWIEmyVYaXmGNGZTFhdqsgmYUl8kP5J48b
 RAcRPfmRwF/xUgPtpQ6t6UtB7H3Di3WhHgQ8jFbvsoa2Nz+7fOG+1/RMC0joNXZXsym1
 iBoq7QFvCsUlFr5F5CinZtPznBBJ5KMgnOixrAjRvjJLtrsCEsqZf39qr0TYZrhc9EVb
 2Wwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs8oufx+eCn0OfOCC8MTq2dSMA277Gcih2zfZFyWNIH+woxgAtWiRxXmjUQKdBY9splTBoMjBgelGz17cC1kZDUp4I0zJDO6AnFagvu9w6FVXl7782hIFA
X-Gm-Message-State: AOJu0Ywz07/aD9JeZ6yV9GYCyuk0tvI8kd6Nz/w7vringcrBODMmZdwK
 Q4ybHONZZSaJqBJpGzUSvbZ14wBxSQwHwklhAxbBNdIh55OGwYgdMUgTE1lEFDtPN2f/IdrNxcG
 rgJ6rRl4aJLCEx0EbHcDhrUV6bH5I1K4dUibLuA==
X-Google-Smtp-Source: AGHT+IEwMDMMamjJ87TRwA/Z5ITzuuzQra31/JT775CsgmZ3IqQ4Wso6CDXn3XaKxI0La0T2Rnw7aEBpJ2oUyzIWrgk=
X-Received: by 2002:a05:6102:1608:b0:471:fc99:519f with SMTP id
 cu8-20020a056102160800b00471fc99519fmr1835998vsb.2.1709642163569; Tue, 05 Mar
 2024 04:36:03 -0800 (PST)
MIME-Version: 1.0
References: <20240304-b4-upstream-dt-headers-v1-0-b7ff41925f92@linaro.org>
 <20240304-b4-upstream-dt-headers-v1-26-b7ff41925f92@linaro.org>
In-Reply-To: <20240304-b4-upstream-dt-headers-v1-26-b7ff41925f92@linaro.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 5 Mar 2024 18:05:52 +0530
Message-ID: <CAFA6WYM6sTEdw+VphKidUqjQW61eW8ZVq+oO35CJVM=5wPoniA@mail.gmail.com>
To: Caleb Connolly <caleb.connolly@linaro.org>
X-Mailman-Approved-At: Tue, 05 Mar 2024 13:02:39 +0000
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Sam Protsenko <semen.protsenko@linaro.org>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Lukasz Majewski <lukma@denx.de>,
 u-boot-amlogic@groups.io, Ramon Fried <rfried.dev@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Thierry Reding <treding@nvidia.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, Dai Okamura <okamura.dai@socionext.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Rick Chen <rick@andestech.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, uboot-snps-arc@synopsys.com,
 Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <mbrugger@suse.com>, Leo <ycliang@andestech.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>
Subject: Re: [Uboot-stm32] [PATCH RFC 26/26] dts: support building all dtb
 files for a specific vendor
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

Hi Caleb,

On Mon, 4 Mar 2024 at 22:22, Caleb Connolly <caleb.connolly@linaro.org> wrote:
>
> This adjusts OF_UPSTREAM to behave more like the kernel by allowing for
> all the devicetree files for a given vendor to be compiled. This is
> useful for Qualcomm in particular as most boards are supported by a
> single U-Boot build just provided with a different DT.
>
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  dts/Kconfig          | 24 ++++++++++++++++++++++++
>  scripts/Makefile.dts | 17 ++++++++++++++++-
>  2 files changed, 40 insertions(+), 1 deletion(-)
>
> diff --git a/dts/Kconfig b/dts/Kconfig
> index b9b6367154ef..67d9dc489856 100644
> --- a/dts/Kconfig
> +++ b/dts/Kconfig
> @@ -100,8 +100,32 @@ config OF_UPSTREAM
>           However, newer boards whose devicetree source files haven't landed in
>           the dts/upstream subtree, they can override this option to have the
>           DT build from existing U-Boot tree location instead.
>
> +config OF_UPSTREAM_BUILD_VENDOR
> +       bool "Build all devicetree files for a particular vendor"
> +       depends on OF_UPSTREAM
> +       help
> +         Enable building all devicetree files for a particular vendor. This

Do we really want to build all the DTBs even if many of those aren't
supported by U-Boot at all? I would have rather added Makefile targets
for boards which really supports a single defconfig eg.
qcom_defconfig.

-Sumit

> +         is useful for generic U-Boot configurations where many boards can
> +         be supported with a single binary.
> +
> +         This is only available for platforms using upstream devicetree.
> +
> +config OF_UPSTREAM_VENDOR
> +       string "Vendor to build all upstream devicetree files for"
> +       depends on OF_UPSTREAM_BUILD_VENDOR
> +       default "qcom" if ARCH_SNAPDRAGON
> +       default "rockchip" if ARCH_ROCKCHIP
> +       default "amlogic" if ARCH_MESON
> +       default "allwinner" if ARCH_SUNXI
> +       default "mediatek" if ARCH_MEDIATEK
> +       default "marvell" if ARCH_MVEBU
> +       default "xilinx" if ARCH_VERSAL || ARCH_ZYNQ
> +       default "nvidia" if ARCH_TEGRA
> +       help
> +         Select the vendor to build all devicetree files for.
> +
>  choice
>         prompt "Provider of DTB for DT control"
>         depends on OF_CONTROL
>
> diff --git a/scripts/Makefile.dts b/scripts/Makefile.dts
> index 5e2429c6170c..8005527f3df7 100644
> --- a/scripts/Makefile.dts
> +++ b/scripts/Makefile.dts
> @@ -1,3 +1,18 @@
>  # SPDX-License-Identifier: GPL-2.0+
>
> -dtb-y += $(patsubst %,%.dtb,$(subst ",,$(CONFIG_DEFAULT_DEVICE_TREE) $(CONFIG_OF_LIST) $(CONFIG_SPL_OF_LIST)))
> +dtb-y += $(patsubst %,%.dtb,\
> +       $(subst ",,$(CONFIG_DEFAULT_DEVICE_TREE) $(CONFIG_OF_LIST) $(CONFIG_SPL_OF_LIST)))
> +
> +ifeq ($(CONFIG_OF_UPSTREAM_BUILD_VENDOR),y)
> +ifeq ($(CONFIG_ARM64),y)
> +dt_dir := $(srctree)/dts/upstream/src/arm64
> +else
> +dt_dir := $(srctree)/dts/upstream/src/$(ARCH)
> +endif
> +
> +dtb-vendor_dts := $(patsubst %.dts,%.dtb, \
> +       $(wildcard $(dt_dir)/$(subst ",,$(CONFIG_OF_UPSTREAM_VENDOR))/*.dts))
> +
> +dtb-y += $(subst $(dt_dir)/,,$(dtb-vendor_dts))
> +
> +endif
>
> --
> 2.44.0
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
