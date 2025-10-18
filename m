Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD52BEC9FB
	for <lists+uboot-stm32@lfdr.de>; Sat, 18 Oct 2025 10:34:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96163C5A4CA;
	Sat, 18 Oct 2025 08:34:56 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8929FC5A4C9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Oct 2025 08:34:55 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-63bad3cd668so5118284a12.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Oct 2025 01:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1760776495; x=1761381295;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3TN8v39CEynpSs/RWE9EK++GbCKZy07kiS6n5uZksZs=;
 b=J3fHAebNnbA80LSigpLk82iobDvUz4ikt/O+Vqk4A1lQSuFNoaw7l2MS9eTCLFq/r9
 JiOI/9TSH4C1tcs0lZ2HnIMJjgpaVvV8pV5DnMHXB/KwvcYjzPPrdLuFciDJ21Ao8Nlv
 kYvaljkPZlhNGJ0K0DHH7HToQwfA6EczgJo4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760776495; x=1761381295;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3TN8v39CEynpSs/RWE9EK++GbCKZy07kiS6n5uZksZs=;
 b=uPJ+ZxNi8Ylb1BjHMUys06XApCuTQ5UDBwcb9BVbM8prKJCchm0aG65NR/eIyW3/Vf
 +PGYw66k8i/qU3IAKKGDSehKkADmdJicXf1oX65cdkvJEHf3QNuO8nqmDQP+ApLc8pc8
 8ft26sfz+77+JAxumToaBsi1Plep8HEZOmDqVsC0j28g4moKbAaVSz+BcPHGRHeVsXTS
 YX9cCUxOSQOx5pmWEck/E8oBctdDoBiNH9HsPVjLAROdPCXrDTN353+8+fO6mL6PURI3
 plcbuykCuGSVloKSmfV8UIe+40RdgnHfOVQqxCsXBbR8KHbfBd3Mr63o3feuUZQJBE0Y
 ilgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8VbT6zELdrwb6VHZ9EtOwD0F1jzngC02FJdcRqkOiofTL3VojQg33F6IDG+lqoFwknQyUprtoanZmkw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwD8mr6r99zBcYmdBLUw0fl3PAjSRiy1zFINUV97iV+afAsZsXc
 L/E3CJxo2hWl/5+new/DAQgnRxyFixB4SSkL7aRqFATOwnCEKC0CtxG36ClVSnb63IMNnU2J9Bx
 byCETv4RWGk8S8lMM4cGowPlz3469kHuo8qUPUbcj
X-Gm-Gg: ASbGncvafT5l3Ofxqxe3bvUn5CRJ2isb7kS7nSP0O6OUd/IDkZCElqyOyiy8bfa7Y6+
 3w/G0z1cYQaAjA0vMl/KHmvDLr0kIXJIqYtXQpnIikx3SR8emJQfoX5wY/XXny62UzTCNR6Jc3h
 ThBMSI+5Oya6NkCfmcizM6xrQrPM6iEFvlOgSG+Q8LJQMxogrXjo5RVjmnKDejhGqO3AHQKLprz
 0V3jH6WkWjX6WpOzIUtcMJL7zx/nhfm2any27X+vT8JogwWWg9iONy51A5R8BUOeRSzIE8=
X-Google-Smtp-Source: AGHT+IEf23NULiuEGhtcXMtzNBMWc1d84uqfm3ZdB4X16YC7xYdHfBCBwbKFKif0s2eGpp3LILi6dEHZ238jYHmtZro=
X-Received: by 2002:a05:6402:2551:b0:63c:295a:d516 with SMTP id
 4fb4d7f45d1cf-63c295ad6f1mr5158309a12.27.1760776494770; Sat, 18 Oct 2025
 01:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20251015-clk_ops-v1-0-5f80f827407e@linaro.org>
In-Reply-To: <20251015-clk_ops-v1-0-5f80f827407e@linaro.org>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 18 Oct 2025 09:34:42 +0100
X-Gm-Features: AS18NWCEjgecNko4UjK5__lepbWi8gcDzElH8_F1VwD5CWAa6U0WFzGQfP0xzNQ
Message-ID: <CAFLszTjnB5zji6JkCpKTHMRZYvcR9hS5rebxZ2_rHj77BWN2VQ@mail.gmail.com>
To: Andrew Goodbody <andrew.goodbody@linaro.org>
Cc: adsp-linux@analog.com, Peng Fan <peng.fan@nxp.com>,
 Valentin Caron <valentin.caron@foss.st.com>, Heiko Stuebner <heiko@sntech.de>,
 Liviu Dudau <liviu.dudau@foss.arm.com>, Alice Guo <alice.guo@nxp.com>,
 Stefan Roese <stefan.roese@mailbox.org>,
 Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@altera.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Utsav Agarwal <utsav.agarwal@analog.com>, Sean Anderson <seanga2@gmail.com>,
 u-boot@lists.denx.de,
 Naresh Kumar Ravulapalli <nareshkumar.ravulapalli@altera.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Minkyu Kang <mk7.kang@samsung.com>,
 Hal Feng <hal.feng@starfivetech.com>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>,
 Muhammad Hazim Izzat Zamri <muhammad.hazim.izzat.zamri@altera.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Marek Vasut <marek.vasut@mailbox.org>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Jonas Karlman <jonas@kwiboo.se>,
 Weijie Gao <weijie.gao@mediatek.com>, Lukasz Majewski <lukma@denx.de>,
 u-boot-amlogic@groups.io,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Joel Stanley <joel@jms.id.au>, Quentin Schulz <quentin.schulz@cherry.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Thierry Reding <treding@nvidia.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Arturs Artamonovs <arturs.artamonovs@analog.com>,
 Joseph Chen <chenjh@rock-chips.com>, Dai Okamura <okamura.dai@socionext.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Ye Li <ye.li@nxp.com>,
 Tien Fong Chee <tien.fong.chee@altera.com>, Yao Zi <ziyao@disroot.org>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Shih <sam.shih@mediatek.com>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Minda Chen <minda.chen@starfivetech.com>, Paul Barker <paul@pbarker.dev>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Jonathan Currier <dullfire@yahoo.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, uboot-snps-arc@synopsys.com,
 Michal Simek <michal.simek@amd.com>, Greg Malysa <malysagreg@gmail.com>,
 Heiko Schocher <hs@nabladev.com>, Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Tingting Meng <tingting.meng@altera.com>,
 Ian Roberts <ian.roberts@timesys.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Padmarao Begari <padmarao.begari@amd.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Sumit Garg <sumit.garg@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH 00/24] clk: Remove passing of negative
 errors through unsigned return
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

Hi Andrew,

On Wed, 15 Oct 2025 at 15:32, Andrew Goodbody
<andrew.goodbody@linaro.org> wrote:
>
> This series removes the passing of negative errors through the .get_rate
> function in the clk_ops struct. This function returns an unsigned long.
> The only value guaranteed to not be a valid clock rate is 0. This will
> also bring the drivers more in sync with Linux to allow for easier code
> porting and other maintenance in the future.
> Another series will address the calling of clk_get_rate and associated
> error handling.

Some indication of the problem you ran into would be useful here.

>
> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> ---
> Andrew Goodbody (24):
>       clk: meson: Remove negative error returns from clk_get_rate
>       clk: sifive: Remove negative error returns from clk_get_rate
>       clk: armada-37xx: Remove negative error returns from clk_get_rate
>       clk: thead: th1520-ap: Remove negative error returns from clk_get_rate
>       clk: ccf: Remove negative error returns from clk_get_rate
>       clk: at91: Remove negative error returns from clk_get_rate
>       clk: renesas: Remove negative error returns from clk_get_rate
>       clk: rockchip: Remove negative error returns from clk_get_rate
>       clk: Remove negative error returns from clk_get_rate
>       clk: starfive: Remove negative error returns from clk_get_rate
>       clk: altera: Remove negative error returns from clk_get_rate
>       clk: uniphier: Remove negative error returns from clk_get_rate
>       clk: aspeed: Remove negative error returns from clk_get_rate
>       clk: nuvoton: Remove negative error returns from clk_get_rate
>       clk: exynos: Remove negative error returns from clk_get_rate
>       clk: imx: Remove negative error returns from clk_get_rate
>       clk: ti: Remove negative error returns from clk_get_rate
>       clk: mediatek: Remove negative error returns from clk_get_rate
>       clk: owl: Remove negative error returns from clk_get_rate
>       clk: tegra: Remove negative error returns from clk_get_rate
>       clk: adi: Remove negative error returns from clk_get_rate
>       clk: sophgo: Remove negative error returns from clk_get_rate
>       clk: stm32: Remove negative error returns from clk_get_rate
>       clk: x86: Remove negative error returns from clk_get_rate
>
>  drivers/clk/adi/clk-shared.c             |  2 +-
>  drivers/clk/altera/clk-agilex.c          |  2 +-
>  drivers/clk/altera/clk-agilex5.c         |  2 +-
>  drivers/clk/altera/clk-n5x.c             |  2 +-
>  drivers/clk/aspeed/clk_ast2500.c         |  2 +-
>  drivers/clk/aspeed/clk_ast2600.c         |  2 +-
>  drivers/clk/at91/compat.c                |  6 ++--
>  drivers/clk/clk-hsdk-cgu.c               |  2 +-
>  drivers/clk/clk-uclass.c                 |  4 +--
>  drivers/clk/clk.c                        |  2 +-
>  drivers/clk/clk_fixed_factor.c           |  4 +--
>  drivers/clk/clk_k210.c                   |  6 ++--
>  drivers/clk/clk_sandbox.c                |  4 +--
>  drivers/clk/clk_scmi.c                   |  4 +--
>  drivers/clk/clk_vexpress_osc.c           |  2 +-
>  drivers/clk/clk_zynq.c                   |  4 +--
>  drivers/clk/clk_zynqmp.c                 | 40 ++++++++++-----------
>  drivers/clk/exynos/clk-exynos7420.c      |  2 +-
>  drivers/clk/imx/clk-imx8qm.c             |  6 ++--
>  drivers/clk/imx/clk-imx8qxp.c            |  6 ++--
>  drivers/clk/imx/clk-imxrt1170.c          |  2 +-
>  drivers/clk/imx/clk-pllv3.c              |  2 +-
>  drivers/clk/intel/clk_intel.c            |  2 +-
>  drivers/clk/mediatek/clk-mtk.c           |  2 +-
>  drivers/clk/meson/a1.c                   | 10 +++---
>  drivers/clk/meson/axg.c                  | 10 +++---
>  drivers/clk/meson/g12a.c                 | 36 +++++++++----------
>  drivers/clk/meson/gxbb.c                 | 20 +++++------
>  drivers/clk/mvebu/armada-37xx-periph.c   |  2 +-
>  drivers/clk/mvebu/armada-37xx-tbg.c      |  2 +-
>  drivers/clk/nuvoton/clk_npcm.c           | 10 +++---
>  drivers/clk/owl/clk_owl.c                |  2 +-
>  drivers/clk/renesas/clk-rcar-gen2.c      |  8 ++---
>  drivers/clk/renesas/rzg2l-cpg.c          |  8 ++---
>  drivers/clk/rockchip/clk_px30.c          | 24 ++++++-------
>  drivers/clk/rockchip/clk_rk3036.c        |  2 +-
>  drivers/clk/rockchip/clk_rk3066.c        |  8 ++---
>  drivers/clk/rockchip/clk_rk3128.c        |  6 ++--
>  drivers/clk/rockchip/clk_rk3188.c        |  6 ++--
>  drivers/clk/rockchip/clk_rk322x.c        |  4 +--
>  drivers/clk/rockchip/clk_rk3288.c        |  6 ++--
>  drivers/clk/rockchip/clk_rk3308.c        | 26 +++++++-------
>  drivers/clk/rockchip/clk_rk3328.c        |  6 ++--
>  drivers/clk/rockchip/clk_rk3368.c        |  8 ++---
>  drivers/clk/rockchip/clk_rk3399.c        | 12 +++----
>  drivers/clk/rockchip/clk_rk3528.c        | 20 +++++------
>  drivers/clk/rockchip/clk_rk3568.c        | 62 ++++++++++++++++----------------
>  drivers/clk/rockchip/clk_rk3576.c        | 36 +++++++++----------
>  drivers/clk/rockchip/clk_rk3588.c        | 32 ++++++++---------
>  drivers/clk/rockchip/clk_rv1108.c        |  4 +--
>  drivers/clk/rockchip/clk_rv1126.c        | 52 +++++++++++++--------------
>  drivers/clk/sifive/sifive-prci.c         |  8 ++---
>  drivers/clk/sophgo/clk-cv1800b.c         |  2 +-
>  drivers/clk/starfive/clk-jh7110-pll.c    |  2 +-
>  drivers/clk/stm32/clk-stm32-core.c       |  4 +--
>  drivers/clk/stm32/clk-stm32f.c           |  6 ++--
>  drivers/clk/stm32/clk-stm32h7.c          |  4 +--
>  drivers/clk/tegra/tegra-car-clk.c        |  2 +-
>  drivers/clk/tegra/tegra186-clk.c         |  2 +-
>  drivers/clk/thead/clk-th1520-ap.c        |  2 +-
>  drivers/clk/ti/clk-am3-dpll-x2.c         |  4 +--
>  drivers/clk/ti/clk-divider.c             |  4 +--
>  drivers/clk/ti/clk-mux.c                 |  2 +-
>  drivers/clk/ti/clk-sci.c                 |  2 +-
>  drivers/clk/uniphier/clk-uniphier-core.c |  2 +-
>  65 files changed, 290 insertions(+), 290 deletions(-)
> ---
> base-commit: ecdc3872a767fb045be3296d4317ae978a14b022
> change-id: 20251010-clk_ops-3b7cc9ccd070
>
> Best regards,
> --
> Andrew Goodbody <andrew.goodbody@linaro.org>
>

If you don't return an error, we cannot tell if the operation
succeeded, or not. U-Boot needs to be deterministic and we need to be
able to debug errors and detect them at runtime.

We use ulong for the return value as a bit of a compromise, since it
is inefficient to use 64-bit on a 32-bit machine. Ideally it would be
long, but some clock rates are 3GHz and it would be confusing to cast
to ulong before using the value.

An alternative we discussed was to return an integer error with the
clock rate returned in a parameter, but that seemed less efficient.

With 64-bit machines, there really isn't a problem. Just checking for
a negative value is good enough, since the clock rate isn't going to
be 9 exahertz(?). Values between -CONFIG_ERR_PTR_OFFSET and 0 are
errors and are defined to be so.

If you want clk_get_rate() to work like Linux (suppress / ignore
errors?), that's fine, but please create a clk_get_rate_err() (or
similar) which actually returns the correct error, and keep the error
return on the uclass interface. It is not uncommon to have the uclass
do some processing on values passed to/from driver. This allows people
who care to obtain the error.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
