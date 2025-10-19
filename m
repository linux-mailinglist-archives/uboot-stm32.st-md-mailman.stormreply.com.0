Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC2CBEE9BE
	for <lists+uboot-stm32@lfdr.de>; Sun, 19 Oct 2025 18:21:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02705C57B72;
	Sun, 19 Oct 2025 16:21:18 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D2D2C06934
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Oct 2025 16:21:16 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-443cef59836so442738b6e.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Oct 2025 09:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1760890875; x=1761495675;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6IN2Hs0lFKnvBGPVYYKjrKyfNuOWDyrrkzUtPxragA8=;
 b=JAxzhcRl3rsng344Mibqq4NcC+QfvF43JZ1MhWc5jQ9GdrAP4tUmkVKd5H8M5YZM9G
 Lla/+cPEpLCkjuhfZjODbc6pt72w2MgryF5aag93+e12/W6SIsi5QuK5jmJcfbPrvP6R
 uwDqUIs7Anl03bGnSjnqk2LVyEu5D30ZTNQvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760890875; x=1761495675;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6IN2Hs0lFKnvBGPVYYKjrKyfNuOWDyrrkzUtPxragA8=;
 b=A4H1/00ZmaQCmujChtJUQZa2D2kNnH6vKZGzmOw5CRqiuQ1aoOUiTsKqmvP315Zygh
 T8v06X+hxHJ4nquJmiLS0K7ou/MbU2RZ/YSMxo97anqC2S7soXnhyYpJnTfERL6S3x1V
 OFlH2RsyC5erxTsWD4eWwDSufYKRRChAIsWoZH0zxMi9A6aOU3x5OhPyy6S88DAU/WKh
 bL+APkcx1FU0xZjfoBVUxLkKXD9cmQS87oln1oLdkfF1LlEcxQFF8AQ8iEYQM6FTM1do
 kj+2TwFYt49ky4VBQeym78bQ/LeP4LRFkmfjE81+aXyHtKfUauXsdPgR0qkXz487u8IX
 iW9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+8UjKuJTXk50I6e0Npe1LPHEllEWIwKpFbdvs3gJ2OUrgbKDbhd2Z8CaS59TVbWEWg+L5ItFpTCBWvA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz2czwFaxL+pemvyfj6IPLFmnnw1/v2zw5gfqpSg7kH0EUQ7SIn
 kIeAS1SNYoErWabSywtvnUpnReKYN8N765jwF/hlDSnlkFJKkDZif6HaFC7HMe0pyKU=
X-Gm-Gg: ASbGnctZpGfvHmV5JtJw59C+cUjh4S8OMYuDnoTqCPGNpRiz98An19O6U2MbpZUXkxO
 JlkDv7mvUIOXv7nMFWHbR38ovK7I1ZvGa9nfxNqkfdnKDW6+7UDgIdcJmSqJgkYPKDFZ2l3iXxu
 weLqF6VLlKTJUHN2y3kAPMbyqarHoO3s4IzHXkICSO+GrhmJ0OwtENZ3kMbeW8Y2ebffhxMLtw3
 U//BbzXXtOuqNzAq+DditR7lbPkaiwK+ANJStF3JoQZMB0QLDkoWJjS1CGm6tDsBplyvar5iE2W
 VBXlLubBnX7Z+0FiNdMoxIy29MmDeuULkJ+RIzk48UNsShiZyWENCvwawK3VuDm5R20eX/rUZYH
 gsXQ2ZkK5UqgETh3BXSCWkhMoDqZrYNj+lkjMCZKQT2CnMPlkP1eSHtIyEolPLCNKhfDaDw3CUc
 luZezxzfKpcJrqYLJJDAXy1IH8FQKkUXagsvb7QB8=
X-Google-Smtp-Source: AGHT+IH6+h06Ez5dYGOMMqLhD3Qwz/f8vkfBfeU32QVDe0Ndd8W7J6+MUOAX3I1kjHoFFYSvI9rrIw==
X-Received: by 2002:a05:6808:320a:b0:441:fa58:12c5 with SMTP id
 5614622812f47-443a2e6ae92mr4396070b6e.4.1760890874854; 
 Sun, 19 Oct 2025 09:21:14 -0700 (PDT)
Received: from bill-the-cat (fixed-187-190-202-235.totalplay.net.
 [187.190.202.235]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-651d3f892e7sm1332460eaf.18.2025.10.19.09.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Oct 2025 09:21:13 -0700 (PDT)
Date: Sun, 19 Oct 2025 10:21:04 -0600
From: Tom Rini <trini@konsulko.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Message-ID: <20251019162104.GP6688@bill-the-cat>
References: <20251015-clk_ops-v1-0-5f80f827407e@linaro.org>
 <CAFLszTjnB5zji6JkCpKTHMRZYvcR9hS5rebxZ2_rHj77BWN2VQ@mail.gmail.com>
 <20251018140414.GN6688@bill-the-cat>
 <CAFLszTjE5Gi8-UEjzAciasnWrBwanqDdDW2xX57ykrsYqAGFyQ@mail.gmail.com>
 <CAPVz0n2seuNyeJzhYgintpj0OR9qzutYER8LxxLDkssPtQbevg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPVz0n2seuNyeJzhYgintpj0OR9qzutYER8LxxLDkssPtQbevg@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: adsp-linux@analog.com, Peng Fan <peng.fan@nxp.com>,
 Valentin Caron <valentin.caron@foss.st.com>, Heiko Stuebner <heiko@sntech.de>,
 Liviu Dudau <liviu.dudau@foss.arm.com>, Alice Guo <alice.guo@nxp.com>,
 Stefan Roese <stefan.roese@mailbox.org>,
 Alif Zakuan Yuslaimi <alif.zakuan.yuslaimi@altera.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
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
 Utsav Agarwal <utsav.agarwal@analog.com>, Heiko Schocher <hs@nabladev.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Tingting Meng <tingting.meng@altera.com>,
 Ian Roberts <ian.roberts@timesys.com>, Simon Glass <sjg@chromium.org>,
 Greg Malysa <malysagreg@gmail.com>,
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
Content-Type: multipart/mixed; boundary="===============0901742134417793555=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0901742134417793555==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MVDYA0qyRDr5Hc90"
Content-Disposition: inline


--MVDYA0qyRDr5Hc90
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 19, 2025 at 04:45:24PM +0300, Svyatoslav Ryhel wrote:
> =D0=BD=D0=B4, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 16=
:05 Simon Glass <sjg@chromium.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Hi Tom, Andrew,
> >
> > On Sat, 18 Oct 2025 at 15:04, Tom Rini <trini@konsulko.com> wrote:
> > >
> > > On Sat, Oct 18, 2025 at 09:34:42AM +0100, Simon Glass wrote:
> > > > Hi Andrew,
> > > >
> > > > On Wed, 15 Oct 2025 at 15:32, Andrew Goodbody
> > > > <andrew.goodbody@linaro.org> wrote:
> > > > >
> > > > > This series removes the passing of negative errors through the .g=
et_rate
> > > > > function in the clk_ops struct. This function returns an unsigned=
 long.
> > > > > The only value guaranteed to not be a valid clock rate is 0. This=
 will
> > > > > also bring the drivers more in sync with Linux to allow for easie=
r code
> > > > > porting and other maintenance in the future.
> > > > > Another series will address the calling of clk_get_rate and assoc=
iated
> > > > > error handling.
> > > >
> > > > Some indication of the problem you ran into would be useful here.
> > >
> > > The problem statement is in the paragraph you're quoting. The numeric=
al
> > > value of -ENOENT is a valid clock rate.
> >
> > No, I mean a problem with a board, or something like that. We are
> > talking here about not being able to return a valid clock rate between
> > 4294967040 and 4294967295, which is only even a theoretical problem on
> > 32-bit machines. So I think it is reasonable to include a motivation.
> >
> >
> > >
> > > > > Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> > > > > ---
> > > > > Andrew Goodbody (24):
> > > > >       clk: meson: Remove negative error returns from clk_get_rate
> > > > >       clk: sifive: Remove negative error returns from clk_get_rate
> > > > >       clk: armada-37xx: Remove negative error returns from clk_ge=
t_rate
> > > > >       clk: thead: th1520-ap: Remove negative error returns from c=
lk_get_rate
> > > > >       clk: ccf: Remove negative error returns from clk_get_rate
> > > > >       clk: at91: Remove negative error returns from clk_get_rate
> > > > >       clk: renesas: Remove negative error returns from clk_get_ra=
te
> > > > >       clk: rockchip: Remove negative error returns from clk_get_r=
ate
> > > > >       clk: Remove negative error returns from clk_get_rate
> > > > >       clk: starfive: Remove negative error returns from clk_get_r=
ate
> > > > >       clk: altera: Remove negative error returns from clk_get_rate
> > > > >       clk: uniphier: Remove negative error returns from clk_get_r=
ate
> > > > >       clk: aspeed: Remove negative error returns from clk_get_rate
> > > > >       clk: nuvoton: Remove negative error returns from clk_get_ra=
te
> > > > >       clk: exynos: Remove negative error returns from clk_get_rate
> > > > >       clk: imx: Remove negative error returns from clk_get_rate
> > > > >       clk: ti: Remove negative error returns from clk_get_rate
> > > > >       clk: mediatek: Remove negative error returns from clk_get_r=
ate
> > > > >       clk: owl: Remove negative error returns from clk_get_rate
> > > > >       clk: tegra: Remove negative error returns from clk_get_rate
> > > > >       clk: adi: Remove negative error returns from clk_get_rate
> > > > >       clk: sophgo: Remove negative error returns from clk_get_rate
> > > > >       clk: stm32: Remove negative error returns from clk_get_rate
> > > > >       clk: x86: Remove negative error returns from clk_get_rate
> > > > >
> > > > >  drivers/clk/adi/clk-shared.c             |  2 +-
> > > > >  drivers/clk/altera/clk-agilex.c          |  2 +-
> > > > >  drivers/clk/altera/clk-agilex5.c         |  2 +-
> > > > >  drivers/clk/altera/clk-n5x.c             |  2 +-
> > > > >  drivers/clk/aspeed/clk_ast2500.c         |  2 +-
> > > > >  drivers/clk/aspeed/clk_ast2600.c         |  2 +-
> > > > >  drivers/clk/at91/compat.c                |  6 ++--
> > > > >  drivers/clk/clk-hsdk-cgu.c               |  2 +-
> > > > >  drivers/clk/clk-uclass.c                 |  4 +--
> > > > >  drivers/clk/clk.c                        |  2 +-
> > > > >  drivers/clk/clk_fixed_factor.c           |  4 +--
> > > > >  drivers/clk/clk_k210.c                   |  6 ++--
> > > > >  drivers/clk/clk_sandbox.c                |  4 +--
> > > > >  drivers/clk/clk_scmi.c                   |  4 +--
> > > > >  drivers/clk/clk_vexpress_osc.c           |  2 +-
> > > > >  drivers/clk/clk_zynq.c                   |  4 +--
> > > > >  drivers/clk/clk_zynqmp.c                 | 40 ++++++++++--------=
---
> > > > >  drivers/clk/exynos/clk-exynos7420.c      |  2 +-
> > > > >  drivers/clk/imx/clk-imx8qm.c             |  6 ++--
> > > > >  drivers/clk/imx/clk-imx8qxp.c            |  6 ++--
> > > > >  drivers/clk/imx/clk-imxrt1170.c          |  2 +-
> > > > >  drivers/clk/imx/clk-pllv3.c              |  2 +-
> > > > >  drivers/clk/intel/clk_intel.c            |  2 +-
> > > > >  drivers/clk/mediatek/clk-mtk.c           |  2 +-
> > > > >  drivers/clk/meson/a1.c                   | 10 +++---
> > > > >  drivers/clk/meson/axg.c                  | 10 +++---
> > > > >  drivers/clk/meson/g12a.c                 | 36 +++++++++----------
> > > > >  drivers/clk/meson/gxbb.c                 | 20 +++++------
> > > > >  drivers/clk/mvebu/armada-37xx-periph.c   |  2 +-
> > > > >  drivers/clk/mvebu/armada-37xx-tbg.c      |  2 +-
> > > > >  drivers/clk/nuvoton/clk_npcm.c           | 10 +++---
> > > > >  drivers/clk/owl/clk_owl.c                |  2 +-
> > > > >  drivers/clk/renesas/clk-rcar-gen2.c      |  8 ++---
> > > > >  drivers/clk/renesas/rzg2l-cpg.c          |  8 ++---
> > > > >  drivers/clk/rockchip/clk_px30.c          | 24 ++++++-------
> > > > >  drivers/clk/rockchip/clk_rk3036.c        |  2 +-
> > > > >  drivers/clk/rockchip/clk_rk3066.c        |  8 ++---
> > > > >  drivers/clk/rockchip/clk_rk3128.c        |  6 ++--
> > > > >  drivers/clk/rockchip/clk_rk3188.c        |  6 ++--
> > > > >  drivers/clk/rockchip/clk_rk322x.c        |  4 +--
> > > > >  drivers/clk/rockchip/clk_rk3288.c        |  6 ++--
> > > > >  drivers/clk/rockchip/clk_rk3308.c        | 26 +++++++-------
> > > > >  drivers/clk/rockchip/clk_rk3328.c        |  6 ++--
> > > > >  drivers/clk/rockchip/clk_rk3368.c        |  8 ++---
> > > > >  drivers/clk/rockchip/clk_rk3399.c        | 12 +++----
> > > > >  drivers/clk/rockchip/clk_rk3528.c        | 20 +++++------
> > > > >  drivers/clk/rockchip/clk_rk3568.c        | 62 ++++++++++++++++--=
--------------
> > > > >  drivers/clk/rockchip/clk_rk3576.c        | 36 +++++++++----------
> > > > >  drivers/clk/rockchip/clk_rk3588.c        | 32 ++++++++---------
> > > > >  drivers/clk/rockchip/clk_rv1108.c        |  4 +--
> > > > >  drivers/clk/rockchip/clk_rv1126.c        | 52 +++++++++++++-----=
---------
> > > > >  drivers/clk/sifive/sifive-prci.c         |  8 ++---
> > > > >  drivers/clk/sophgo/clk-cv1800b.c         |  2 +-
> > > > >  drivers/clk/starfive/clk-jh7110-pll.c    |  2 +-
> > > > >  drivers/clk/stm32/clk-stm32-core.c       |  4 +--
> > > > >  drivers/clk/stm32/clk-stm32f.c           |  6 ++--
> > > > >  drivers/clk/stm32/clk-stm32h7.c          |  4 +--
> > > > >  drivers/clk/tegra/tegra-car-clk.c        |  2 +-
> > > > >  drivers/clk/tegra/tegra186-clk.c         |  2 +-
> > > > >  drivers/clk/thead/clk-th1520-ap.c        |  2 +-
> > > > >  drivers/clk/ti/clk-am3-dpll-x2.c         |  4 +--
> > > > >  drivers/clk/ti/clk-divider.c             |  4 +--
> > > > >  drivers/clk/ti/clk-mux.c                 |  2 +-
> > > > >  drivers/clk/ti/clk-sci.c                 |  2 +-
> > > > >  drivers/clk/uniphier/clk-uniphier-core.c |  2 +-
> > > > >  65 files changed, 290 insertions(+), 290 deletions(-)
> > > > > ---
> > > > > base-commit: ecdc3872a767fb045be3296d4317ae978a14b022
> > > > > change-id: 20251010-clk_ops-3b7cc9ccd070
> > > > >
> > > > > Best regards,
> > > > > --
> > > > > Andrew Goodbody <andrew.goodbody@linaro.org>
> > > > >
> > > >
> > > > If you don't return an error, we cannot tell if the operation
> > > > succeeded, or not. U-Boot needs to be deterministic and we need to =
be
> > > > able to debug errors and detect them at runtime.
> > > >
> > > > We use ulong for the return value as a bit of a compromise, since it
> > > > is inefficient to use 64-bit on a 32-bit machine. Ideally it would =
be
> > > > long, but some clock rates are 3GHz and it would be confusing to ca=
st
> > > > to ulong before using the value.
> > > >
> > > > An alternative we discussed was to return an integer error with the
> > > > clock rate returned in a parameter, but that seemed less efficient.
> > > >
> > > > With 64-bit machines, there really isn't a problem. Just checking f=
or
> > > > a negative value is good enough, since the clock rate isn't going to
> > > > be 9 exahertz(?). Values between -CONFIG_ERR_PTR_OFFSET and 0 are
> > > > errors and are defined to be so.
> > > >
> > > > If you want clk_get_rate() to work like Linux (suppress / ignore
> > > > errors?), that's fine, but please create a clk_get_rate_err() (or
> > > > similar) which actually returns the correct error, and keep the err=
or
> > > > return on the uclass interface. It is not uncommon to have the ucla=
ss
> > > > do some processing on values passed to/from driver. This allows peo=
ple
> > > > who care to obtain the error.
> > >
> > > This is moving things in the right direction of having the error
> > > reporting and handling done where it can be done correctly. If there's
> > > further parts of the Linux kernel-like API we need, we can take those
> > > next.
> >
> > Here is part of the patch:
> >
> > --- a/drivers/clk/meson/a1.c
> > +++ b/drivers/clk/meson/a1.c
> > @@ -359,7 +359,7 @@ static ulong meson_div_get_rate(struct clk *clk,
> > unsigned long id)
> >
> >         info =3D meson_clk_get_info(clk, id, MESON_CLK_DIV);
> >         if (IS_ERR(info))
> > -               return PTR_ERR(info);
> > +               return 0;
> >
> > I don't see anything in that fragment other than just ignoring errors.
> >
>=20
> I agree with Simon. This patchset may cause a lot of problems for all
> boards it changes in case clk ops fail, since it silences all error
> returns. Any clock error will be untrackable unless you know where and
> what to look specifically.

I think it's worth going back to the original thread:
https://lore.kernel.org/u-boot/f5c94319-8ef8-459d-88b2-836702779cfb@linaro.=
org/

As part of the problem is that what we have today does not work. This is
why I'm think it's OK to first return 0, always, as the invalid clock
rate and then re-introduce error checking that can work.

--=20
Tom

--MVDYA0qyRDr5Hc90
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaPUP7AAKCRAr4qD1Cr/k
CnUJAQC4Y1/4HLaZ2gerYnoDoBy4GATgqJ2oHDuwnFTZ/wPg2wD/fSjy4/nx6hPG
6bms6gFDId9Ib/qy2x70pibfmRgFDAg=
=eTzR
-----END PGP SIGNATURE-----

--MVDYA0qyRDr5Hc90--

--===============0901742134417793555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0901742134417793555==--
