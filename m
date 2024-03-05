Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF7B871FBE
	for <lists+uboot-stm32@lfdr.de>; Tue,  5 Mar 2024 14:02:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F8CEC6DD6E;
	Tue,  5 Mar 2024 13:02:40 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FF96C62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Mar 2024 12:41:48 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id
 a1e0cc1a2514c-7d5c40f874aso3258455241.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Mar 2024 04:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709642507; x=1710247307;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mI9b4O/bqfXtPe6ebuYbBESnH4J1XVcH6JCAxc+iWHY=;
 b=U5ZaXNlDWdRXLc2K/9pY6RrbModFW6uAz//fAxFSNdnDqG/bzdKG8sg6OZ+YIpVIGO
 IXIkG3gdvwm1lUCJ5XBaxkfdwQ8fGb85wRl+lz/3CjJoaTWeme9WvLqYBPocXMCwrDOx
 bA/LbE2JUUmgTY/gfhSNDj0wQz++txyyT6nWTEKLuAHeCA4VEWm8oK2DCOikUS/ILGhD
 vATzQBKbbWsDj9u+2/Prm8/VEJumMbr784t3QAFuHmm6QMlbydiJ09eqPb+BnMnfUtI6
 tpS4MKj/fDJwXa6mbNd7fozHGxxNXXV5JiozZUiatHKJo353cxpvpqGtO3rILg+KE9Zo
 uHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709642507; x=1710247307;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mI9b4O/bqfXtPe6ebuYbBESnH4J1XVcH6JCAxc+iWHY=;
 b=gxsvo1+VI6hO0hVJMfvqS6E9hAF8HSshy2P1Vv32QyjSIXDhe6c2wHscpwxaHCovDs
 DTXojE5h60jk3BYF7iGXm/sj74s8cGhn3PZLX2KmvkdrN7bcnPcwc0KZy6RBvZE4DoJx
 JTmPrUgNbO4SPv9fnhSy0iRHX8suovf0WwvqwSyujhdPTsEZmLb0hivGFaRM2HXdNZjT
 axBaaScEvkgbSMJJr1NsQWYecg+0Z9eeb+mxAuPAR6vsTTOp/JCwxXLdntxtbIU3FQw2
 vloexnYGPL3zNBstwMhrWkh4QEzA8/9SihOGE93xMahw+J/ZUqUvrCZ/WnhZsx+ljvna
 tiJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFBLjnms0gZLpN4KYfimKTnjo2k6vGSL6HGmZeEeTg1BsNZ8Offi2cmb7ANHM9tYv1Mmc+RJHs2S6p8TZWAHHQWZIAcNS6GQ5IAv6jEDD0sJCdoUSldho6
X-Gm-Message-State: AOJu0Yx4q5Ue3GGrKit9u9OVSHHuLv8AKM4YXeOR0RFbiXfRlVbJ24E6
 fIPpynRTWl+/6nDnaBxWiX+kmNxAGUiK+cf+xkOWWH5g1EnjC7FgZlQlXsacNER2MNV2aBwD4eO
 DY6BGocat8NfX81cdXhWxjquSMJV6FhBqnUe4/g==
X-Google-Smtp-Source: AGHT+IEFRcTKV3bKTafZy91f/lZ+LQJJjpB1kJ8epViwXrA+xK3pX9lq8SkgorIC2RbSdDCV2BVuW+oujvElX8V71Rc=
X-Received: by 2002:a05:6102:54a5:b0:470:4093:7008 with SMTP id
 bk37-20020a05610254a500b0047040937008mr1790124vsb.21.1709642506886; Tue, 05
 Mar 2024 04:41:46 -0800 (PST)
MIME-Version: 1.0
References: <20240304-b4-upstream-dt-headers-v1-0-b7ff41925f92@linaro.org>
In-Reply-To: <20240304-b4-upstream-dt-headers-v1-0-b7ff41925f92@linaro.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 5 Mar 2024 18:11:35 +0530
Message-ID: <CAFA6WYOBHc680uzcWMMtQVupYji4qE6Jpf8AqavqXGEfB1PWtg@mail.gmail.com>
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
Subject: Re: [Uboot-stm32] [PATCH RFC 00/26] Drop DT upstream compatible
	dt-binding headers
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

On Mon, 4 Mar 2024 at 22:21, Caleb Connolly <caleb.connolly@linaro.org> wrote:
>
> Many of the dt-binding headers in U-Boot are based on the upstream ones
> from Linux, occasionally with minor changes. Although some have
> additional things defined or are totally different.
>
> This series attempts to drop as many of these headers as is easily
> possible. Those with differing APIs were left as-is.
>
> Most of this work was done with a script, with some manual fixing at the
> end.
>
> All-in, we're dropping 393 of the 489 headers from include/dt-bindings.

Glad to see that you have taken up this task. I would suggest you to
run this through CI to be sure.

>
> Due to how the include paths are configured, U-Boot headers override
> upstream ones by the same name, resulting in some upstream DTBs failing
> to compile (e.g. those that use newer linux-event-codes.h). Swapping the
> include order would conversely break a bunch of U-Boot DTS files and
> drivers.

The include paths ordering was done on purpose to avoid any breakages
for U-Boot platforms.

>
> Hopefully this makes a good dent, and future efforts to align more
> architectures with upstream DT will help drop the remaining headers.
>

+1

> In addition, the final patch in this series adds support for compiling
> all upstream DTS files for a given vendor. This is useful in cases where
> a single U-Boot binary can support many boards, and maintaining a list
> of supported DTB files would quickly become arduous (as is the case with
> Qualcomm).

I have shared my concern on this patch.

-Sumit

>
> To: Tom Rini <trini@konsulko.com>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Sumit Garg <sumit.garg@linaro.org>
> To: Patrice Chotard <patrice.chotard@foss.st.com>
> To: Patrick Delaunay <patrick.delaunay@foss.st.com>
> To: Jagan Teki <jagan@amarulasolutions.com>
> To: Simon Glass <sjg@chromium.org>
> To: Philipp Tomsich <philipp.tomsich@vrull.eu>
> To: Kever Yang <kever.yang@rock-chips.com>
> To: Lukasz Majewski <lukma@denx.de>
> To: Sean Anderson <seanga2@gmail.com>
> To: Sam Protsenko <semen.protsenko@linaro.org>
> To: Matthias Brugger <mbrugger@suse.com>
> To: Peter Robinson <pbrobinson@gmail.com>
> To: Joe Hershberger <joe.hershberger@ni.com>
> To: Ramon Fried <rfried.dev@gmail.com>
> To: Thierry Reding <treding@nvidia.com>
> To: Svyatoslav Ryhel <clamor95@gmail.com>
> To: Michal Simek <michal.simek@amd.com>
> To: Paul Barker <paul.barker.ct@bp.renesas.com>
> To: Weijie Gao <weijie.gao@mediatek.com>
> To: GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>
> To: Ryder Lee <ryder.lee@mediatek.com>
> To: Chunfeng Yun <chunfeng.yun@mediatek.com>
> To: Eugen Hristev <eugen.hristev@collabora.com>
> To: Rick Chen <rick@andestech.com>
> To: Leo <ycliang@andestech.com>
> To: Ryan Chen <ryan_chen@aspeedtech.com>
> To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> To: Aspeed BMC SW team <BMC-SW@aspeedtech.com>
> To: Joel Stanley <joel@jms.id.au>
> To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> To: Dai Okamura <okamura.dai@socionext.com>
> To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> Cc: u-boot@lists.denx.de
> Cc: u-boot-amlogic@groups.io
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> Cc: uboot-snps-arc@synopsys.com
>
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
> Caleb Connolly (26):
>       qcom: drop clock dt-binding headers
>       qcom: drop remaining dt-binding headers
>       sunxi: drop clock dt-binding headers
>       sunxi: drop remaining dt-binding headers
>       imx: drop clock dt-binding headers
>       imx: drop dt-binding headers
>       amlogic: drop dt-binding headers
>       stm: drop dt-binding headers
>       rockchip: drop clock dt-binding headers
>       rockchip: drop remaining dt-binding headers
>       exynos: drop dt-binding headers
>       bcm: drop dt-binding headers
>       ti: drop dt-binding headers
>       tegra: drop clock dt-binding headers
>       tegra: drop dt-binding headers
>       xlnx: drop dt-binding headers
>       renesas: drop clock dt-binding headers
>       renesas: drop remaining dt-binding headers
>       mtk: drop dt-binding headers
>       microchip: drop dt-binding headers
>       hisi: drop dt-binding headers
>       sifive: drop clock headers
>       dt-bindings: drop clock headers
>       dt-bindings: drop remaining device headers
>       dt-bindings: drop generic headers
>       dts: support building all dtb files for a specific vendor
>
>  arch/arm/dts/exynos7420.dtsi                       |   2 +-
>  arch/arm/dts/rk3399-u-boot.dtsi                    |   2 +-
>  arch/arm/dts/tegra186.dtsi                         |   2 +-
>  arch/riscv/dts/fu540-c000-u-boot.dtsi              |  26 +-
>  drivers/clk/exynos/clk-exynos7420.c                |   2 +-
>  drivers/clk/rockchip/clk_rk3399.c                  |   2 +-
>  drivers/clk/sifive/fu540-prci.c                    |   8 +-
>  drivers/mailbox/tegra-hsp.c                        |   2 +-
>  drivers/net/phy/dp83869.c                          |   2 +
>  drivers/pinctrl/rockchip/pinctrl-rk3568.c          |  15 +
>  dts/Kconfig                                        |  24 +
>  include/dt-bindings/arm/coresight-cti-dt.h         |  37 -
>  include/dt-bindings/arm/ux500_pm_domains.h         |  15 -
>  include/dt-bindings/ata/ahci.h                     |  20 -
>  include/dt-bindings/bus/moxtet.h                   |  16 -
>  include/dt-bindings/bus/ti-sysc.h                  |  28 -
>  include/dt-bindings/clk/ti-dra7-atl.h              |  40 -
>  include/dt-bindings/clock/actions,s700-cmu.h       | 118 ---
>  include/dt-bindings/clock/actions,s900-cmu.h       | 129 ---
>  include/dt-bindings/clock/agilex-clock.h           |  71 --
>  include/dt-bindings/clock/am3.h                    | 227 -----
>  .../clock/amlogic,a1-peripherals-clkc.h            | 168 ----
>  include/dt-bindings/clock/amlogic,a1-pll-clkc.h    |  25 -
>  include/dt-bindings/clock/ast2600-clock.h          |  62 --
>  include/dt-bindings/clock/at91.h                   |  23 -
>  include/dt-bindings/clock/axg-aoclkc.h             |  31 -
>  include/dt-bindings/clock/axg-audio-clkc.h         |  94 ---
>  include/dt-bindings/clock/axg-clkc.h               | 100 ---
>  include/dt-bindings/clock/bcm-nsp.h                |  51 --
>  include/dt-bindings/clock/bcm2835-aux.h            |   9 -
>  include/dt-bindings/clock/bcm2835.h                |  62 --
>  include/dt-bindings/clock/bcm6318-clock.h          |  47 --
>  include/dt-bindings/clock/bcm63268-clock.h         |  51 --
>  include/dt-bindings/clock/bcm6328-clock.h          |  24 -
>  include/dt-bindings/clock/bcm6358-clock.h          |  23 -
>  include/dt-bindings/clock/bcm6362-clock.h          |  32 -
>  include/dt-bindings/clock/bcm6368-clock.h          |  30 -
>  include/dt-bindings/clock/boston-clock.h           |  12 -
>  include/dt-bindings/clock/exynos7420-clk.h         | 207 -----
>  include/dt-bindings/clock/exynos850.h              | 337 --------
>  include/dt-bindings/clock/fsl,qoriq-clockgen.h     |  15 -
>  include/dt-bindings/clock/g12a-aoclkc.h            |  36 -
>  include/dt-bindings/clock/g12a-clkc.h              | 153 ----
>  include/dt-bindings/clock/gxbb-aoclkc.h            |  74 --
>  include/dt-bindings/clock/gxbb-clkc.h              | 151 ----
>  include/dt-bindings/clock/hi3660-clock.h           | 214 -----
>  include/dt-bindings/clock/hi6220-clock.h           | 173 ----
>  include/dt-bindings/clock/imx5-clock.h             | 219 -----
>  include/dt-bindings/clock/imx6qdl-clock.h          | 278 ------
>  include/dt-bindings/clock/imx6sl-clock.h           | 178 ----
>  include/dt-bindings/clock/imx6sll-clock.h          | 210 -----
>  include/dt-bindings/clock/imx6sx-clock.h           | 281 ------
>  include/dt-bindings/clock/imx6ul-clock.h           | 262 ------
>  include/dt-bindings/clock/imx7d-clock.h            | 456 ----------
>  include/dt-bindings/clock/imx7ulp-clock.h          | 119 ---
>  include/dt-bindings/clock/imx8mm-clock.h           | 286 -------
>  include/dt-bindings/clock/imx8mn-clock.h           | 262 ------
>  include/dt-bindings/clock/imx8mp-clock.h           | 401 ---------
>  include/dt-bindings/clock/imx8mq-clock.h           | 431 ----------
>  include/dt-bindings/clock/imx8ulp-clock.h          | 258 ------
>  include/dt-bindings/clock/imx93-clock.h            | 208 -----
>  include/dt-bindings/clock/imxrt1050-clock.h        |  72 --
>  include/dt-bindings/clock/lpc32xx-clock.h          |  58 --
>  include/dt-bindings/clock/maxim,max77802.h         |  22 -
>  include/dt-bindings/clock/microchip-mpfs-clock.h   |  71 --
>  include/dt-bindings/clock/mt7621-clk.h             |  46 -
>  include/dt-bindings/clock/mt7622-clk.h             | 270 ------
>  include/dt-bindings/clock/mt7629-clk.h             | 206 -----
>  include/dt-bindings/clock/mt8183-clk.h             | 329 --------
>  include/dt-bindings/clock/nuvoton,npcm7xx-clock.h  |  46 -
>  include/dt-bindings/clock/omap4.h                  | 149 ----
>  include/dt-bindings/clock/omap5.h                  | 129 ---
>  include/dt-bindings/clock/px30-cru.h               | 389 ---------
>  include/dt-bindings/clock/qcom,camcc-sdm845.h      | 116 ---
>  include/dt-bindings/clock/qcom,dispcc-sdm845.h     |  56 --
>  include/dt-bindings/clock/qcom,gcc-ipq4019.h       | 169 ----
>  include/dt-bindings/clock/qcom,gcc-msm8916.h       | 179 ----
>  include/dt-bindings/clock/qcom,gcc-msm8996.h       | 362 --------
>  include/dt-bindings/clock/qcom,gcc-qcs404.h        | 180 ----
>  include/dt-bindings/clock/qcom,gcc-sdm845.h        | 246 ------
>  include/dt-bindings/clock/qcom,gpucc-sdm845.h      |  24 -
>  include/dt-bindings/clock/qcom,lpass-sdm845.h      |  15 -
>  include/dt-bindings/clock/qcom,mmcc-msm8996.h      | 295 -------
>  include/dt-bindings/clock/qcom,rpmcc.h             | 174 ----
>  include/dt-bindings/clock/qcom,rpmh.h              |  37 -
>  include/dt-bindings/clock/qcom,turingcc-qcs404.h   |  15 -
>  include/dt-bindings/clock/qcom,videocc-sdm845.h    |  35 -
>  include/dt-bindings/clock/r7s72100-clock.h         | 112 ---
>  include/dt-bindings/clock/r8a774a1-cpg-mssr.h      |  59 --
>  include/dt-bindings/clock/r8a774b1-cpg-mssr.h      |  57 --
>  include/dt-bindings/clock/r8a774c0-cpg-mssr.h      |  61 --
>  include/dt-bindings/clock/r8a774e1-cpg-mssr.h      |  59 --
>  include/dt-bindings/clock/r8a7790-clock.h          | 158 ----
>  include/dt-bindings/clock/r8a7790-cpg-mssr.h       |  48 --
>  include/dt-bindings/clock/r8a7791-clock.h          | 161 ----
>  include/dt-bindings/clock/r8a7791-cpg-mssr.h       |  44 -
>  include/dt-bindings/clock/r8a7792-clock.h          |  98 ---
>  include/dt-bindings/clock/r8a7792-cpg-mssr.h       |  39 -
>  include/dt-bindings/clock/r8a7793-clock.h          | 159 ----
>  include/dt-bindings/clock/r8a7793-cpg-mssr.h       |  44 -
>  include/dt-bindings/clock/r8a7794-clock.h          | 137 ---
>  include/dt-bindings/clock/r8a7794-cpg-mssr.h       |  43 -
>  include/dt-bindings/clock/r8a7795-cpg-mssr.h       |  66 --
>  include/dt-bindings/clock/r8a7796-cpg-mssr.h       |  65 --
>  include/dt-bindings/clock/r8a77961-cpg-mssr.h      |  65 --
>  include/dt-bindings/clock/r8a77965-cpg-mssr.h      |  62 --
>  include/dt-bindings/clock/r8a77970-cpg-mssr.h      |  44 -
>  include/dt-bindings/clock/r8a77980-cpg-mssr.h      |  51 --
>  include/dt-bindings/clock/r8a77990-cpg-mssr.h      |  62 --
>  include/dt-bindings/clock/r8a77995-cpg-mssr.h      |  54 --
>  include/dt-bindings/clock/r8a779a0-cpg-mssr.h      |  55 --
>  include/dt-bindings/clock/r8a779f0-cpg-mssr.h      |  64 --
>  include/dt-bindings/clock/r8a779g0-cpg-mssr.h      |  90 --
>  include/dt-bindings/clock/r9a06g032-sysctrl.h      | 149 ----
>  include/dt-bindings/clock/r9a07g044-cpg.h          | 220 -----
>  include/dt-bindings/clock/renesas-cpg-mssr.h       |  15 -
>  include/dt-bindings/clock/rk3036-cru.h             | 185 ----
>  include/dt-bindings/clock/rk3066a-cru.h            |  31 -
>  include/dt-bindings/clock/rk3128-cru.h             | 273 ------
>  include/dt-bindings/clock/rk3188-cru-common.h      | 261 ------
>  include/dt-bindings/clock/rk3188-cru.h             |  47 --
>  include/dt-bindings/clock/rk3228-cru.h             | 287 -------
>  include/dt-bindings/clock/rk3288-cru.h             | 381 ---------
>  include/dt-bindings/clock/rk3308-cru.h             | 387 ---------
>  include/dt-bindings/clock/rk3328-cru.h             | 393 ---------
>  include/dt-bindings/clock/rk3368-cru.h             | 381 ---------
>  include/dt-bindings/clock/rk3399-cru.h             | 749 ----------------
>  include/dt-bindings/clock/rk3568-cru.h             | 926 --------------------
>  include/dt-bindings/clock/rockchip,rk3588-cru.h    | 766 -----------------
>  include/dt-bindings/clock/rockchip,rk808.h         |  11 -
>  include/dt-bindings/clock/rockchip,rv1126-cru.h    | 632 --------------
>  include/dt-bindings/clock/rv1108-cru.h             | 356 --------
>  include/dt-bindings/clock/sifive-fu540-prci.h      |  18 -
>  include/dt-bindings/clock/sifive-fu740-prci.h      |  24 -
>  include/dt-bindings/clock/starfive,jh7110-crg.h    | 258 ------
>  include/dt-bindings/clock/ste-ab8500.h             |  12 -
>  include/dt-bindings/clock/stih407-clks.h           |  90 --
>  include/dt-bindings/clock/stih410-clks.h           |  25 -
>  include/dt-bindings/clock/stm32fx-clock.h          |  63 --
>  include/dt-bindings/clock/stm32h7-clks.h           | 167 ----
>  include/dt-bindings/clock/stm32mp1-clks.h          | 274 ------
>  include/dt-bindings/clock/stm32mp13-clks.h         | 229 -----
>  include/dt-bindings/clock/sun20i-d1-ccu.h          | 158 ----
>  include/dt-bindings/clock/sun20i-d1-r-ccu.h        |  19 -
>  include/dt-bindings/clock/sun4i-a10-ccu.h          | 202 -----
>  include/dt-bindings/clock/sun4i-a10-pll2.h         |  53 --
>  include/dt-bindings/clock/sun50i-a64-ccu.h         | 138 ---
>  include/dt-bindings/clock/sun50i-h6-ccu.h          | 125 ---
>  include/dt-bindings/clock/sun50i-h6-r-ccu.h        |  27 -
>  include/dt-bindings/clock/sun50i-h616-ccu.h        | 116 ---
>  include/dt-bindings/clock/sun5i-ccu.h              |  97 ---
>  include/dt-bindings/clock/sun6i-a31-ccu.h          | 193 -----
>  include/dt-bindings/clock/sun6i-rtc.h              |  10 -
>  include/dt-bindings/clock/sun7i-a20-ccu.h          |  53 --
>  include/dt-bindings/clock/sun8i-a23-a33-ccu.h      | 129 ---
>  include/dt-bindings/clock/sun8i-a83t-ccu.h         | 140 ---
>  include/dt-bindings/clock/sun8i-de2.h              |  21 -
>  include/dt-bindings/clock/sun8i-h3-ccu.h           | 152 ----
>  include/dt-bindings/clock/sun8i-r-ccu.h            |  59 --
>  include/dt-bindings/clock/sun8i-r40-ccu.h          | 191 -----
>  include/dt-bindings/clock/sun8i-tcon-top.h         |  11 -
>  include/dt-bindings/clock/sun8i-v3s-ccu.h          | 111 ---
>  include/dt-bindings/clock/sun9i-a80-ccu.h          | 162 ----
>  include/dt-bindings/clock/sun9i-a80-de.h           |  80 --
>  include/dt-bindings/clock/sun9i-a80-usb.h          |  59 --
>  include/dt-bindings/clock/suniv-ccu-f1c100s.h      |  72 --
>  include/dt-bindings/clock/tegra114-car.h           | 343 --------
>  include/dt-bindings/clock/tegra124-car-common.h    | 345 --------
>  include/dt-bindings/clock/tegra124-car.h           |  19 -
>  include/dt-bindings/clock/tegra186-clock.h         | 940 ---------------------
>  include/dt-bindings/clock/tegra20-car.h            | 158 ----
>  include/dt-bindings/clock/tegra210-car.h           | 401 ---------
>  include/dt-bindings/clock/tegra30-car.h            | 273 ------
>  include/dt-bindings/clock/versaclock.h             |  13 -
>  include/dt-bindings/clock/vf610-clock.h            | 202 -----
>  include/dt-bindings/clock/xlnx-versal-clk.h        | 123 ---
>  include/dt-bindings/clock/xlnx-zynqmp-clk.h        | 126 ---
>  include/dt-bindings/display/tda998x.h              |   8 -
>  include/dt-bindings/dma/at91.h                     |  52 --
>  include/dt-bindings/dma/qcom-gpi.h                 |  11 -
>  include/dt-bindings/dma/sun4i-a10.h                |  56 --
>  include/dt-bindings/dma/xlnx-zynqmp-dpdma.h        |  16 -
>  include/dt-bindings/firmware/qcom,scm.h            |  39 -
>  include/dt-bindings/gpio/aspeed-gpio.h             |  51 --
>  include/dt-bindings/gpio/gpio.h                    |  42 -
>  include/dt-bindings/gpio/meson-a1-gpio.h           |  73 --
>  include/dt-bindings/gpio/meson-axg-gpio.h          | 116 ---
>  include/dt-bindings/gpio/meson-g12a-gpio.h         | 114 ---
>  include/dt-bindings/gpio/meson-gxbb-gpio.h         | 148 ----
>  include/dt-bindings/gpio/meson-gxl-gpio.h          | 125 ---
>  include/dt-bindings/gpio/tegra-gpio.h              |  51 --
>  include/dt-bindings/gpio/uniphier-gpio.h           |  18 -
>  include/dt-bindings/iio/qcom,spmi-vadc.h           | 300 -------
>  include/dt-bindings/input/gpio-keys.h              |  13 -
>  include/dt-bindings/input/input.h                  |  17 -
>  include/dt-bindings/input/linux-event-codes.h      | 806 ------------------
>  include/dt-bindings/interconnect/fsl,imx8mp.h      |  59 --
>  include/dt-bindings/interconnect/imx8mm.h          |  50 --
>  include/dt-bindings/interconnect/imx8mn.h          |  41 -
>  include/dt-bindings/interconnect/imx8mq.h          |  48 --
>  include/dt-bindings/interconnect/qcom,msm8916.h    | 100 ---
>  .../dt-bindings/interconnect/qcom,msm8996-cbf.h    |  12 -
>  include/dt-bindings/interconnect/qcom,msm8996.h    | 163 ----
>  include/dt-bindings/interconnect/qcom,osm-l3.h     |  15 -
>  include/dt-bindings/interconnect/qcom,sdm845.h     | 150 ----
>  .../dt-bindings/interrupt-controller/apple-aic.h   |  15 -
>  include/dt-bindings/interrupt-controller/arm-gic.h |  23 -
>  include/dt-bindings/interrupt-controller/irq-st.h  |  30 -
>  include/dt-bindings/interrupt-controller/irq.h     |  19 -
>  .../dt-bindings/interrupt-controller/irqc-rzg2l.h  |  25 -
>  .../dt-bindings/interrupt-controller/mips-gic.h    |   9 -
>  include/dt-bindings/leds/common.h                  | 106 ---
>  include/dt-bindings/leds/leds-netxbig.h            |  18 -
>  include/dt-bindings/leds/leds-ns2.h                |   9 -
>  include/dt-bindings/leds/leds-pca9532.h            |  18 -
>  include/dt-bindings/mailbox/tegra186-hsp.h         |  19 -
>  include/dt-bindings/media/omap3-isp.h              |  22 -
>  include/dt-bindings/media/tda1997x.h               |  74 --
>  include/dt-bindings/media/video-interfaces.h       |  16 -
>  include/dt-bindings/memory/tegra114-mc.h           |  25 -
>  include/dt-bindings/memory/tegra124-mc.h           |  31 -
>  include/dt-bindings/memory/tegra210-mc.h           |  36 -
>  include/dt-bindings/memory/tegra30-mc.h            |  24 -
>  include/dt-bindings/mfd/at91-usart.h               |  17 -
>  include/dt-bindings/mfd/atmel-flexcom.h            |  15 -
>  include/dt-bindings/mfd/dbx500-prcmu.h             |  84 --
>  include/dt-bindings/mfd/st,stpmic1.h               |  50 --
>  include/dt-bindings/mfd/st-lpc.h                   |  16 -
>  include/dt-bindings/mfd/stm32f4-rcc.h              | 108 ---
>  include/dt-bindings/mfd/stm32f7-rcc.h              | 116 ---
>  include/dt-bindings/mfd/stm32h7-rcc.h              | 138 ---
>  include/dt-bindings/mux/mux.h                      |  17 -
>  include/dt-bindings/mux/ti-serdes.h                | 190 -----
>  include/dt-bindings/net/microchip-lan78xx.h        |  21 -
>  include/dt-bindings/net/mscc-phy-vsc8531.h         |  31 -
>  include/dt-bindings/net/qca-ar803x.h               |  13 -
>  include/dt-bindings/net/ti-dp83867.h               |  53 --
>  include/dt-bindings/net/ti-dp83869.h               |  60 --
>  include/dt-bindings/phy/phy-am654-serdes.h         |  13 -
>  include/dt-bindings/phy/phy-cadence.h              |  24 -
>  include/dt-bindings/phy/phy-imx8-pcie.h            |  14 -
>  include/dt-bindings/phy/phy-qcom-qmp.h             |  20 -
>  include/dt-bindings/phy/phy-qcom-qusb2.h           |  37 -
>  include/dt-bindings/phy/phy-ti.h                   |  21 -
>  include/dt-bindings/phy/phy.h                      |  26 -
>  include/dt-bindings/pinctrl/am33xx.h               | 172 ----
>  include/dt-bindings/pinctrl/am43xx.h               |  39 -
>  include/dt-bindings/pinctrl/apple.h                |  13 -
>  include/dt-bindings/pinctrl/at91.h                 |  49 --
>  include/dt-bindings/pinctrl/bcm2835.h              |  26 -
>  include/dt-bindings/pinctrl/dra.h                  |  79 --
>  include/dt-bindings/pinctrl/hisi.h                 |  74 --
>  include/dt-bindings/pinctrl/mt65xx.h               |  41 -
>  include/dt-bindings/pinctrl/mt8365-pinfunc.h       | 858 -------------------
>  include/dt-bindings/pinctrl/omap.h                 |  91 --
>  include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h   |   7 -
>  include/dt-bindings/pinctrl/pinctrl-tegra.h        |  37 -
>  include/dt-bindings/pinctrl/pinctrl-zynqmp.h       |  19 -
>  include/dt-bindings/pinctrl/qcom,pmic-gpio.h       | 164 ----
>  include/dt-bindings/pinctrl/qcom,pmic-mpp.h        | 106 ---
>  include/dt-bindings/pinctrl/r7s72100-pinctrl.h     |  18 -
>  include/dt-bindings/pinctrl/rockchip.h             |  60 --
>  include/dt-bindings/pinctrl/rzg2l-pinctrl.h        |  23 -
>  include/dt-bindings/pinctrl/rzn1-pinctrl.h         | 141 ----
>  include/dt-bindings/pinctrl/stm32-pinfunc.h        |  45 -
>  include/dt-bindings/pinctrl/sun4i-a10.h            |  62 --
>  include/dt-bindings/power/fsl,imx93-power.h        |  15 -
>  include/dt-bindings/power/imx7-power.h             |  13 -
>  include/dt-bindings/power/imx8mm-power.h           |  31 -
>  include/dt-bindings/power/imx8mn-power.h           |  20 -
>  include/dt-bindings/power/imx8mp-power.h           |  59 --
>  include/dt-bindings/power/imx8mq-power.h           |  24 -
>  include/dt-bindings/power/imx8ulp-power.h          |  26 -
>  include/dt-bindings/power/mediatek,mt8365-power.h  |  19 -
>  include/dt-bindings/power/meson-a1-power.h         |  32 -
>  include/dt-bindings/power/meson-axg-power.h        |  14 -
>  include/dt-bindings/power/meson-g12a-power.h       |  13 -
>  include/dt-bindings/power/meson-gxbb-power.h       |  13 -
>  include/dt-bindings/power/meson-sm1-power.h        |  18 -
>  include/dt-bindings/power/owl-s700-powergate.h     |  19 -
>  include/dt-bindings/power/px30-power.h             |  27 -
>  include/dt-bindings/power/qcom-rpmpd.h             | 412 ---------
>  include/dt-bindings/power/r8a774a1-sysc.h          |  31 -
>  include/dt-bindings/power/r8a774b1-sysc.h          |  26 -
>  include/dt-bindings/power/r8a774c0-sysc.h          |  25 -
>  include/dt-bindings/power/r8a774e1-sysc.h          |  36 -
>  include/dt-bindings/power/r8a7790-sysc.h           |  31 -
>  include/dt-bindings/power/r8a7791-sysc.h           |  23 -
>  include/dt-bindings/power/r8a7792-sysc.h           |  23 -
>  include/dt-bindings/power/r8a7793-sysc.h           |  25 -
>  include/dt-bindings/power/r8a7794-sysc.h           |  23 -
>  include/dt-bindings/power/r8a7795-sysc.h           |  38 -
>  include/dt-bindings/power/r8a7796-sysc.h           |  33 -
>  include/dt-bindings/power/r8a77961-sysc.h          |  32 -
>  include/dt-bindings/power/r8a77965-sysc.h          |  29 -
>  include/dt-bindings/power/r8a77970-sysc.h          |  28 -
>  include/dt-bindings/power/r8a77980-sysc.h          |  43 -
>  include/dt-bindings/power/r8a77990-sysc.h          |  26 -
>  include/dt-bindings/power/r8a77995-sysc.h          |  20 -
>  include/dt-bindings/power/r8a779a0-sysc.h          |  59 --
>  include/dt-bindings/power/r8a779f0-sysc.h          |  30 -
>  include/dt-bindings/power/r8a779g0-sysc.h          |  46 -
>  include/dt-bindings/power/raspberrypi-power.h      |  41 -
>  include/dt-bindings/power/rk3066-power.h           |  22 -
>  include/dt-bindings/power/rk3188-power.h           |  24 -
>  include/dt-bindings/power/rk3228-power.h           |  21 -
>  include/dt-bindings/power/rk3288-power.h           |  32 -
>  include/dt-bindings/power/rk3328-power.h           |  19 -
>  include/dt-bindings/power/rk3399-power.h           |  53 --
>  include/dt-bindings/power/rk3568-power.h           |  32 -
>  include/dt-bindings/power/rk3588-power.h           |  69 --
>  include/dt-bindings/power/rockchip,rv1126-power.h  |  35 -
>  include/dt-bindings/power/tegra186-powergate.h     |  28 -
>  include/dt-bindings/power/xlnx-zynqmp-power.h      |  50 --
>  include/dt-bindings/pwm/pwm.h                      |  14 -
>  .../dt-bindings/regulator/dlg,da9063-regulator.h   |  16 -
>  include/dt-bindings/regulator/maxim,max77802.h     |  18 -
>  .../dt-bindings/regulator/qcom,rpmh-regulator.h    |  36 -
>  .../dt-bindings/regulator/st,stm32mp13-regulator.h |  42 -
>  include/dt-bindings/reset/actions,s700-reset.h     |  34 -
>  include/dt-bindings/reset/actions,s900-reset.h     |  65 --
>  include/dt-bindings/reset/altr,rst-mgr-a10.h       | 110 ---
>  include/dt-bindings/reset/altr,rst-mgr-s10.h       |  96 ---
>  include/dt-bindings/reset/altr,rst-mgr.h           |  82 --
>  include/dt-bindings/reset/amlogic,meson-a1-reset.h |  76 --
>  .../reset/amlogic,meson-axg-audio-arb.h            |  19 -
>  .../dt-bindings/reset/amlogic,meson-axg-reset.h    | 123 ---
>  .../reset/amlogic,meson-g12a-audio-reset.h         |  53 --
>  .../dt-bindings/reset/amlogic,meson-g12a-reset.h   | 137 ---
>  .../dt-bindings/reset/amlogic,meson-gxbb-reset.h   | 161 ----
>  include/dt-bindings/reset/axg-aoclkc.h             |  20 -
>  include/dt-bindings/reset/bcm6318-reset.h          |  25 -
>  include/dt-bindings/reset/bcm63268-reset.h         |  31 -
>  include/dt-bindings/reset/bcm6328-reset.h          |  23 -
>  include/dt-bindings/reset/bcm6358-reset.h          |  20 -
>  include/dt-bindings/reset/bcm6362-reset.h          |  27 -
>  include/dt-bindings/reset/bcm6368-reset.h          |  21 -
>  include/dt-bindings/reset/g12a-aoclkc.h            |  18 -
>  include/dt-bindings/reset/gxbb-aoclkc.h            |  66 --
>  include/dt-bindings/reset/imx7-reset.h             |  52 --
>  include/dt-bindings/reset/imx8mp-reset.h           |  50 --
>  include/dt-bindings/reset/imx8mq-reset.h           |  67 --
>  include/dt-bindings/reset/imx8ulp-pcc-reset.h      |  59 --
>  include/dt-bindings/reset/mt7621-reset.h           |  38 -
>  include/dt-bindings/reset/nuvoton,npcm7xx-reset.h  |  91 --
>  include/dt-bindings/reset/qcom,gcc-msm8916.h       | 100 ---
>  include/dt-bindings/reset/qcom,sdm845-aoss.h       |  17 -
>  include/dt-bindings/reset/qcom,sdm845-pdc.h        |  22 -
>  .../dt-bindings/reset/raspberrypi,firmware-reset.h |  13 -
>  include/dt-bindings/reset/rockchip,rk3588-cru.h    | 754 -----------------
>  include/dt-bindings/reset/sama7g5-reset.h          |  10 -
>  include/dt-bindings/reset/snps,hsdk-reset.h        |  17 -
>  include/dt-bindings/reset/starfive,jh7110-crg.h    | 183 ----
>  include/dt-bindings/reset/stih407-resets.h         |  65 --
>  include/dt-bindings/reset/stm32mp1-resets.h        | 123 ---
>  include/dt-bindings/reset/stm32mp13-resets.h       | 100 ---
>  include/dt-bindings/reset/sun20i-d1-ccu.h          |  79 --
>  include/dt-bindings/reset/sun20i-d1-r-ccu.h        |  16 -
>  include/dt-bindings/reset/sun4i-a10-ccu.h          |  69 --
>  include/dt-bindings/reset/sun50i-a64-ccu.h         |  98 ---
>  include/dt-bindings/reset/sun50i-h6-ccu.h          |  73 --
>  include/dt-bindings/reset/sun50i-h6-r-ccu.h        |  18 -
>  include/dt-bindings/reset/sun50i-h616-ccu.h        |  70 --
>  include/dt-bindings/reset/sun5i-ccu.h              |  23 -
>  include/dt-bindings/reset/sun6i-a31-ccu.h          | 106 ---
>  include/dt-bindings/reset/sun8i-a23-a33-ccu.h      |  87 --
>  include/dt-bindings/reset/sun8i-a83t-ccu.h         |  98 ---
>  include/dt-bindings/reset/sun8i-de2.h              |  15 -
>  include/dt-bindings/reset/sun8i-h3-ccu.h           | 106 ---
>  include/dt-bindings/reset/sun8i-r-ccu.h            |  53 --
>  include/dt-bindings/reset/sun8i-r40-ccu.h          | 130 ---
>  include/dt-bindings/reset/sun8i-v3s-ccu.h          |  81 --
>  include/dt-bindings/reset/sun9i-a80-ccu.h          | 102 ---
>  include/dt-bindings/reset/sun9i-a80-de.h           |  58 --
>  include/dt-bindings/reset/sun9i-a80-usb.h          |  56 --
>  include/dt-bindings/reset/suniv-ccu-f1c100s.h      |  38 -
>  include/dt-bindings/reset/tegra124-car.h           |  12 -
>  include/dt-bindings/reset/tegra186-reset.h         | 205 -----
>  include/dt-bindings/reset/ti-syscon.h              |  38 -
>  include/dt-bindings/reset/xlnx-versal-resets.h     | 105 ---
>  include/dt-bindings/reset/xlnx-zynqmp-resets.h     | 130 ---
>  include/dt-bindings/soc/bcm2835-pm.h               |  28 -
>  include/dt-bindings/soc/qcom,apr.h                 |  28 -
>  include/dt-bindings/soc/qcom,rpmh-rsc.h            |  14 -
>  include/dt-bindings/soc/rockchip,boot-mode.h       |  16 -
>  include/dt-bindings/soc/rockchip,vop2.h            |  18 -
>  include/dt-bindings/soc/samsung,exynos-usi.h       |  17 -
>  include/dt-bindings/soc/ti,sci_pm_domain.h         |   9 -
>  include/dt-bindings/sound/apq8016-lpass.h          |   9 -
>  include/dt-bindings/sound/fsl-imx-audmux.h         |  64 --
>  include/dt-bindings/sound/meson-aiu.h              |  18 -
>  include/dt-bindings/sound/meson-g12a-toacodec.h    |  10 -
>  include/dt-bindings/sound/meson-g12a-tohdmitx.h    |  13 -
>  include/dt-bindings/sound/microchip,pdmc.h         |  13 -
>  include/dt-bindings/sound/qcom,lpass.h             |  46 -
>  include/dt-bindings/sound/qcom,q6afe.h             |   9 -
>  include/dt-bindings/sound/qcom,q6asm.h             |  26 -
>  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 234 -----
>  include/dt-bindings/sound/qcom,wcd9335.h           |  15 -
>  include/dt-bindings/sound/tlv320aic31xx.h          |  14 -
>  include/dt-bindings/spmi/spmi.h                    |  10 -
>  include/dt-bindings/thermal/tegra124-soctherm.h    |  14 -
>  include/dt-bindings/thermal/thermal.h              |  15 -
>  include/dt-bindings/usb/pd.h                       |  88 --
>  scripts/Makefile.dts                               |  17 +-
>  405 files changed, 80 insertions(+), 39273 deletions(-)
> ---
> base-commit: bd465ada0e1172910f64feac6035f2344449c381
>
> // Caleb (they/them)
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
