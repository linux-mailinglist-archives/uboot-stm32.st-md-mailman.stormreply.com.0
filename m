Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0372ABEE5E1
	for <lists+uboot-stm32@lfdr.de>; Sun, 19 Oct 2025 15:05:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FE5FC57B70;
	Sun, 19 Oct 2025 13:05:49 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35C28C3FACB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Oct 2025 13:05:47 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b3d5088259eso530388366b.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Oct 2025 06:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1760879146; x=1761483946;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=61CUEQQ+hDuAvFz7ToNb7uwJIOWP7RK0Vt9mWw41tSg=;
 b=cwq74oX6CubMu8noW+8wHPKH1O/b5ccIqLMc5GdVI4tPDDVbzrXrRPUNSYopTB76/u
 NWQ9Uhu4RQQZAeVanRxIJFRbsOjhurwjUDwYFhuAG9zml9JyCl+vgvqAVWx3rUKMc2ts
 ILGnh91zXLr5LHpTxPQ/+IbDNsdwQHiCSl7Mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760879146; x=1761483946;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=61CUEQQ+hDuAvFz7ToNb7uwJIOWP7RK0Vt9mWw41tSg=;
 b=xEDqySedVOXiv+D7CcwyQdaC88/Sh6NbdD4QZeonVKozZp5i0Ta2KDW/Ht8dlaNqag
 IiWfDsHFxUMCOg4W7Gd4JGEqF+jz3IoyS2ZPbWlvGkRGpwkv/+N5lH5KAh0Ab4+oYmJX
 neGdWrvNKgfx1CbtYMmmN33UW+f/NCddjtHNrltLPtPmDgffHO5fQmwcOlrkCn3xVkl/
 1+7UfPX+M824gnHzi5hAcn604kTovUW984CFcUuY53MaHA89UVqygutF0t1RyqqzF7IT
 c7cAZYEKreIzRx/PJlSJbVY2GCNB1zVdS/JFInmXJ+QBuwBxQ8aIIixZzEPR0Y2fyttW
 i5tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6pMH5a96B9bBKDh2iO+6fHXWTEHbLMH13qb2Yjlr4mTgxgEKRAB8CPCDvHlt4doX75Mut0AgNT9gTqw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxi8xAI8bblIKD0yvpPLejBpwcMi5SIYUfcjFxBBG1yvhhap6II
 39kmFdcexqMUGrbxFflGpOYm6RrIbnlIoUkcrNKnDeuaHm8cF3biWcfrgqUaL6Y8xV0mDgBKpt0
 NTB87pchxHIDHc5UF5XsLAklDUEUrub+Tix+tZpsO
X-Gm-Gg: ASbGncvkEyXrbigXnTt2Q7bEkoDMKb3zODg6Bw8jdMUiWA5IbIRBYdKMVorW8z2umrm
 gufYFRVCkuWn5zhojLlZ3aqOxZMfuGBPVWSo/qklitNR1CL1UhSZY1YIOS/I4VOUo4mtN8FyK+y
 MpYEbdHD0+GWgUic/jvEy7iahsjioSXhcFTrHrD9FqxLSnZ0ylXgRwEiUwrAPYYH0xzVvMp+N2A
 l10sU/hMF6qcJKp2rfKyLWuB2mJNDmjAjtSL50eHs094e3WIKMjgswpJMA=
X-Google-Smtp-Source: AGHT+IFsPQ+2Lh7NL+SGdqd7kFMCRpqHA34otaYopaxB5tR/x/4rgBreQLI30q9f537j6YitG2fCgcTrfJ6qSET/20M=
X-Received: by 2002:a17:907:1b12:b0:b41:79ff:250c with SMTP id
 a640c23a62f3a-b64732441d6mr1030559866b.23.1760879146282; Sun, 19 Oct 2025
 06:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20251015-clk_ops-v1-0-5f80f827407e@linaro.org>
 <CAFLszTjnB5zji6JkCpKTHMRZYvcR9hS5rebxZ2_rHj77BWN2VQ@mail.gmail.com>
 <20251018140414.GN6688@bill-the-cat>
In-Reply-To: <20251018140414.GN6688@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Sun, 19 Oct 2025 14:05:33 +0100
X-Gm-Features: AS18NWDKwx3BAEstg0Q0vrzhEDXt43WpLd6lhHNT_8WYOBCzn-OAmN-tBv9jhtk
Message-ID: <CAFLszTjE5Gi8-UEjzAciasnWrBwanqDdDW2xX57ykrsYqAGFyQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
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
 Michal Simek <michal.simek@amd.com>,
 Andrew Goodbody <andrew.goodbody@linaro.org>,
 Greg Malysa <malysagreg@gmail.com>, Heiko Schocher <hs@nabladev.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
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

Hi Tom, Andrew,

On Sat, 18 Oct 2025 at 15:04, Tom Rini <trini@konsulko.com> wrote:
>
> On Sat, Oct 18, 2025 at 09:34:42AM +0100, Simon Glass wrote:
> > Hi Andrew,
> >
> > On Wed, 15 Oct 2025 at 15:32, Andrew Goodbody
> > <andrew.goodbody@linaro.org> wrote:
> > >
> > > This series removes the passing of negative errors through the .get_rate
> > > function in the clk_ops struct. This function returns an unsigned long.
> > > The only value guaranteed to not be a valid clock rate is 0. This will
> > > also bring the drivers more in sync with Linux to allow for easier code
> > > porting and other maintenance in the future.
> > > Another series will address the calling of clk_get_rate and associated
> > > error handling.
> >
> > Some indication of the problem you ran into would be useful here.
>
> The problem statement is in the paragraph you're quoting. The numerical
> value of -ENOENT is a valid clock rate.

No, I mean a problem with a board, or something like that. We are
talking here about not being able to return a valid clock rate between
4294967040 and 4294967295, which is only even a theoretical problem on
32-bit machines. So I think it is reasonable to include a motivation.


>
> > > Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> > > ---
> > > Andrew Goodbody (24):
> > >       clk: meson: Remove negative error returns from clk_get_rate
> > >       clk: sifive: Remove negative error returns from clk_get_rate
> > >       clk: armada-37xx: Remove negative error returns from clk_get_rate
> > >       clk: thead: th1520-ap: Remove negative error returns from clk_get_rate
> > >       clk: ccf: Remove negative error returns from clk_get_rate
> > >       clk: at91: Remove negative error returns from clk_get_rate
> > >       clk: renesas: Remove negative error returns from clk_get_rate
> > >       clk: rockchip: Remove negative error returns from clk_get_rate
> > >       clk: Remove negative error returns from clk_get_rate
> > >       clk: starfive: Remove negative error returns from clk_get_rate
> > >       clk: altera: Remove negative error returns from clk_get_rate
> > >       clk: uniphier: Remove negative error returns from clk_get_rate
> > >       clk: aspeed: Remove negative error returns from clk_get_rate
> > >       clk: nuvoton: Remove negative error returns from clk_get_rate
> > >       clk: exynos: Remove negative error returns from clk_get_rate
> > >       clk: imx: Remove negative error returns from clk_get_rate
> > >       clk: ti: Remove negative error returns from clk_get_rate
> > >       clk: mediatek: Remove negative error returns from clk_get_rate
> > >       clk: owl: Remove negative error returns from clk_get_rate
> > >       clk: tegra: Remove negative error returns from clk_get_rate
> > >       clk: adi: Remove negative error returns from clk_get_rate
> > >       clk: sophgo: Remove negative error returns from clk_get_rate
> > >       clk: stm32: Remove negative error returns from clk_get_rate
> > >       clk: x86: Remove negative error returns from clk_get_rate
> > >
> > >  drivers/clk/adi/clk-shared.c             |  2 +-
> > >  drivers/clk/altera/clk-agilex.c          |  2 +-
> > >  drivers/clk/altera/clk-agilex5.c         |  2 +-
> > >  drivers/clk/altera/clk-n5x.c             |  2 +-
> > >  drivers/clk/aspeed/clk_ast2500.c         |  2 +-
> > >  drivers/clk/aspeed/clk_ast2600.c         |  2 +-
> > >  drivers/clk/at91/compat.c                |  6 ++--
> > >  drivers/clk/clk-hsdk-cgu.c               |  2 +-
> > >  drivers/clk/clk-uclass.c                 |  4 +--
> > >  drivers/clk/clk.c                        |  2 +-
> > >  drivers/clk/clk_fixed_factor.c           |  4 +--
> > >  drivers/clk/clk_k210.c                   |  6 ++--
> > >  drivers/clk/clk_sandbox.c                |  4 +--
> > >  drivers/clk/clk_scmi.c                   |  4 +--
> > >  drivers/clk/clk_vexpress_osc.c           |  2 +-
> > >  drivers/clk/clk_zynq.c                   |  4 +--
> > >  drivers/clk/clk_zynqmp.c                 | 40 ++++++++++-----------
> > >  drivers/clk/exynos/clk-exynos7420.c      |  2 +-
> > >  drivers/clk/imx/clk-imx8qm.c             |  6 ++--
> > >  drivers/clk/imx/clk-imx8qxp.c            |  6 ++--
> > >  drivers/clk/imx/clk-imxrt1170.c          |  2 +-
> > >  drivers/clk/imx/clk-pllv3.c              |  2 +-
> > >  drivers/clk/intel/clk_intel.c            |  2 +-
> > >  drivers/clk/mediatek/clk-mtk.c           |  2 +-
> > >  drivers/clk/meson/a1.c                   | 10 +++---
> > >  drivers/clk/meson/axg.c                  | 10 +++---
> > >  drivers/clk/meson/g12a.c                 | 36 +++++++++----------
> > >  drivers/clk/meson/gxbb.c                 | 20 +++++------
> > >  drivers/clk/mvebu/armada-37xx-periph.c   |  2 +-
> > >  drivers/clk/mvebu/armada-37xx-tbg.c      |  2 +-
> > >  drivers/clk/nuvoton/clk_npcm.c           | 10 +++---
> > >  drivers/clk/owl/clk_owl.c                |  2 +-
> > >  drivers/clk/renesas/clk-rcar-gen2.c      |  8 ++---
> > >  drivers/clk/renesas/rzg2l-cpg.c          |  8 ++---
> > >  drivers/clk/rockchip/clk_px30.c          | 24 ++++++-------
> > >  drivers/clk/rockchip/clk_rk3036.c        |  2 +-
> > >  drivers/clk/rockchip/clk_rk3066.c        |  8 ++---
> > >  drivers/clk/rockchip/clk_rk3128.c        |  6 ++--
> > >  drivers/clk/rockchip/clk_rk3188.c        |  6 ++--
> > >  drivers/clk/rockchip/clk_rk322x.c        |  4 +--
> > >  drivers/clk/rockchip/clk_rk3288.c        |  6 ++--
> > >  drivers/clk/rockchip/clk_rk3308.c        | 26 +++++++-------
> > >  drivers/clk/rockchip/clk_rk3328.c        |  6 ++--
> > >  drivers/clk/rockchip/clk_rk3368.c        |  8 ++---
> > >  drivers/clk/rockchip/clk_rk3399.c        | 12 +++----
> > >  drivers/clk/rockchip/clk_rk3528.c        | 20 +++++------
> > >  drivers/clk/rockchip/clk_rk3568.c        | 62 ++++++++++++++++----------------
> > >  drivers/clk/rockchip/clk_rk3576.c        | 36 +++++++++----------
> > >  drivers/clk/rockchip/clk_rk3588.c        | 32 ++++++++---------
> > >  drivers/clk/rockchip/clk_rv1108.c        |  4 +--
> > >  drivers/clk/rockchip/clk_rv1126.c        | 52 +++++++++++++--------------
> > >  drivers/clk/sifive/sifive-prci.c         |  8 ++---
> > >  drivers/clk/sophgo/clk-cv1800b.c         |  2 +-
> > >  drivers/clk/starfive/clk-jh7110-pll.c    |  2 +-
> > >  drivers/clk/stm32/clk-stm32-core.c       |  4 +--
> > >  drivers/clk/stm32/clk-stm32f.c           |  6 ++--
> > >  drivers/clk/stm32/clk-stm32h7.c          |  4 +--
> > >  drivers/clk/tegra/tegra-car-clk.c        |  2 +-
> > >  drivers/clk/tegra/tegra186-clk.c         |  2 +-
> > >  drivers/clk/thead/clk-th1520-ap.c        |  2 +-
> > >  drivers/clk/ti/clk-am3-dpll-x2.c         |  4 +--
> > >  drivers/clk/ti/clk-divider.c             |  4 +--
> > >  drivers/clk/ti/clk-mux.c                 |  2 +-
> > >  drivers/clk/ti/clk-sci.c                 |  2 +-
> > >  drivers/clk/uniphier/clk-uniphier-core.c |  2 +-
> > >  65 files changed, 290 insertions(+), 290 deletions(-)
> > > ---
> > > base-commit: ecdc3872a767fb045be3296d4317ae978a14b022
> > > change-id: 20251010-clk_ops-3b7cc9ccd070
> > >
> > > Best regards,
> > > --
> > > Andrew Goodbody <andrew.goodbody@linaro.org>
> > >
> >
> > If you don't return an error, we cannot tell if the operation
> > succeeded, or not. U-Boot needs to be deterministic and we need to be
> > able to debug errors and detect them at runtime.
> >
> > We use ulong for the return value as a bit of a compromise, since it
> > is inefficient to use 64-bit on a 32-bit machine. Ideally it would be
> > long, but some clock rates are 3GHz and it would be confusing to cast
> > to ulong before using the value.
> >
> > An alternative we discussed was to return an integer error with the
> > clock rate returned in a parameter, but that seemed less efficient.
> >
> > With 64-bit machines, there really isn't a problem. Just checking for
> > a negative value is good enough, since the clock rate isn't going to
> > be 9 exahertz(?). Values between -CONFIG_ERR_PTR_OFFSET and 0 are
> > errors and are defined to be so.
> >
> > If you want clk_get_rate() to work like Linux (suppress / ignore
> > errors?), that's fine, but please create a clk_get_rate_err() (or
> > similar) which actually returns the correct error, and keep the error
> > return on the uclass interface. It is not uncommon to have the uclass
> > do some processing on values passed to/from driver. This allows people
> > who care to obtain the error.
>
> This is moving things in the right direction of having the error
> reporting and handling done where it can be done correctly. If there's
> further parts of the Linux kernel-like API we need, we can take those
> next.

Here is part of the patch:

--- a/drivers/clk/meson/a1.c
+++ b/drivers/clk/meson/a1.c
@@ -359,7 +359,7 @@ static ulong meson_div_get_rate(struct clk *clk,
unsigned long id)

        info = meson_clk_get_info(clk, id, MESON_CLK_DIV);
        if (IS_ERR(info))
-               return PTR_ERR(info);
+               return 0;

I don't see anything in that fragment other than just ignoring errors.

Please, put this handling in the uclass function.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
