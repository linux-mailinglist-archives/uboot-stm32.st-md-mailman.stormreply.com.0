Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE32BED0D2
	for <lists+uboot-stm32@lfdr.de>; Sat, 18 Oct 2025 16:04:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47762C5A4C9;
	Sat, 18 Oct 2025 14:04:24 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC77DC5978D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Oct 2025 14:04:22 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-43f935f7d14so1156653b6e.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Oct 2025 07:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1760796261; x=1761401061;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wuAbPfZKcdHeCJ+R2lg8Vyr8AvZf5RRjqFEw3QtM6Hs=;
 b=S1jFHozZkirtSXjE54TW88JYa2C1pkdzEf+syzdGSA1zKAtt2uYFOE/OiuO+RI/cyp
 qXTcuyIE1N1M1fTyHD8stFtBvnKfBAUvghVX7HgtHY9Fwr92qbu34/cOlwooD0+pMZkv
 JTkuOf+aLOKPrETfIQM0EN+jU3aoh2QJI7qFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760796261; x=1761401061;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wuAbPfZKcdHeCJ+R2lg8Vyr8AvZf5RRjqFEw3QtM6Hs=;
 b=ddJmID6cLbtDPNV/F987zbDAqWMnKdc9N8WZaRT0xvT0Gc45Qc34D5qmRV6K7FRPkT
 6L3c+GU5ucrP2t8SFk91jPneZONnG00VAFSq+nbIeIQw/bx9LJ8LTEAlbKvP9AAedM65
 91iHdnjwm6qUR0641tLB3Aip6r3zLeFh00xO6pw56PyXiLziQk1KLEiurbXwzsU/xxZV
 53N5pItIKdwM/+H4fE5aN1FvQEOYzxmkkG3e/NVTdlAdjCxoqy2zDZRB64MEsBLClCJR
 fjUr6W5yQA3g0YIT5tU1hnM6vbp1vGHYXsqNr/SCzIAyOYexUfP5jjkRw4wwszqCJ0gj
 YGIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6tT9ep/BzjyErLisjnmn+MfVpsFr+gVH5fTbyWj/FS///ne06ALQ9NGou445iBSMQLn5ECzoxsvKPtQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YymxC8zuA30SLrO5EHUnikIrYZ8LhTXLztbLVRus1nH6tG4qib4
 oz+Te0BF0yx0GyFe0JdasP/mqoOOeHjQ0aEFFZeHnIlwyht3fm7wI4zaHKkU2KJ8lFc=
X-Gm-Gg: ASbGncs80fgM0CR+M3WSkmnLvXBCkUW4vR+wch3qrAVD4Wasqzg8b8GwJVY6aJAMm0Y
 ixtpAU5RO/G03KkGlLwvs+eKsL6G2raKfC1CGboO6pyd6sU0zC4smMOX5VnNFZ2WaS4vQSKpEAU
 OPyfz+HBKVhzS1c8wEgK8xtDC77aZaP6o5INKuVo7npysxR7orVal3BRJp+8hM1mNzMv8ksixAV
 6/PVVShZ0r3Juej+WAFRAVpqXADSek68d/jUAdaxdzEel2h/c7BaXmXS9YMhaVTjUjRQOWUp3TE
 +rlf+hvu7V6DESvWyM/Dp95OaoN+ZFPHJNDiGLz2cC1mG3gYfkS5hGxF2paDXuZmJP1ipyxvUEd
 Dhue1pQflj+E4cBsrL9YYXjBtsK43V4+uKCjS5DA/uHOuyORUxENqGNm9yySt7LVhZR28sOmf+w
 XRzyS0j0c+bT0lmhc8lpGtdTKRIorzjxuWmznxr/U=
X-Google-Smtp-Source: AGHT+IGDFAnvW7ZjRMItT+YnltVJd/d4c1KbPS9EnXXz00WLnmPEfQ4m59x5GEtaMfHLyzXx7cfQKw==
X-Received: by 2002:a05:6808:4f50:b0:441:d679:efa1 with SMTP id
 5614622812f47-443a2fecd71mr2701484b6e.32.1760796261212; 
 Sat, 18 Oct 2025 07:04:21 -0700 (PDT)
Received: from bill-the-cat (fixed-187-190-202-235.totalplay.net.
 [187.190.202.235]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-443dc4d5460sm554862b6e.4.2025.10.18.07.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 07:04:19 -0700 (PDT)
Date: Sat, 18 Oct 2025 08:04:14 -0600
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20251018140414.GN6688@bill-the-cat>
References: <20251015-clk_ops-v1-0-5f80f827407e@linaro.org>
 <CAFLszTjnB5zji6JkCpKTHMRZYvcR9hS5rebxZ2_rHj77BWN2VQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFLszTjnB5zji6JkCpKTHMRZYvcR9hS5rebxZ2_rHj77BWN2VQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
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
Content-Type: multipart/mixed; boundary="===============3794189898532303360=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3794189898532303360==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l8GSp1oDBcWYb4IP"
Content-Disposition: inline


--l8GSp1oDBcWYb4IP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 18, 2025 at 09:34:42AM +0100, Simon Glass wrote:
> Hi Andrew,
>=20
> On Wed, 15 Oct 2025 at 15:32, Andrew Goodbody
> <andrew.goodbody@linaro.org> wrote:
> >
> > This series removes the passing of negative errors through the .get_rate
> > function in the clk_ops struct. This function returns an unsigned long.
> > The only value guaranteed to not be a valid clock rate is 0. This will
> > also bring the drivers more in sync with Linux to allow for easier code
> > porting and other maintenance in the future.
> > Another series will address the calling of clk_get_rate and associated
> > error handling.
>=20
> Some indication of the problem you ran into would be useful here.

The problem statement is in the paragraph you're quoting. The numerical
value of -ENOENT is a valid clock rate.

> > Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> > ---
> > Andrew Goodbody (24):
> >       clk: meson: Remove negative error returns from clk_get_rate
> >       clk: sifive: Remove negative error returns from clk_get_rate
> >       clk: armada-37xx: Remove negative error returns from clk_get_rate
> >       clk: thead: th1520-ap: Remove negative error returns from clk_get=
_rate
> >       clk: ccf: Remove negative error returns from clk_get_rate
> >       clk: at91: Remove negative error returns from clk_get_rate
> >       clk: renesas: Remove negative error returns from clk_get_rate
> >       clk: rockchip: Remove negative error returns from clk_get_rate
> >       clk: Remove negative error returns from clk_get_rate
> >       clk: starfive: Remove negative error returns from clk_get_rate
> >       clk: altera: Remove negative error returns from clk_get_rate
> >       clk: uniphier: Remove negative error returns from clk_get_rate
> >       clk: aspeed: Remove negative error returns from clk_get_rate
> >       clk: nuvoton: Remove negative error returns from clk_get_rate
> >       clk: exynos: Remove negative error returns from clk_get_rate
> >       clk: imx: Remove negative error returns from clk_get_rate
> >       clk: ti: Remove negative error returns from clk_get_rate
> >       clk: mediatek: Remove negative error returns from clk_get_rate
> >       clk: owl: Remove negative error returns from clk_get_rate
> >       clk: tegra: Remove negative error returns from clk_get_rate
> >       clk: adi: Remove negative error returns from clk_get_rate
> >       clk: sophgo: Remove negative error returns from clk_get_rate
> >       clk: stm32: Remove negative error returns from clk_get_rate
> >       clk: x86: Remove negative error returns from clk_get_rate
> >
> >  drivers/clk/adi/clk-shared.c             |  2 +-
> >  drivers/clk/altera/clk-agilex.c          |  2 +-
> >  drivers/clk/altera/clk-agilex5.c         |  2 +-
> >  drivers/clk/altera/clk-n5x.c             |  2 +-
> >  drivers/clk/aspeed/clk_ast2500.c         |  2 +-
> >  drivers/clk/aspeed/clk_ast2600.c         |  2 +-
> >  drivers/clk/at91/compat.c                |  6 ++--
> >  drivers/clk/clk-hsdk-cgu.c               |  2 +-
> >  drivers/clk/clk-uclass.c                 |  4 +--
> >  drivers/clk/clk.c                        |  2 +-
> >  drivers/clk/clk_fixed_factor.c           |  4 +--
> >  drivers/clk/clk_k210.c                   |  6 ++--
> >  drivers/clk/clk_sandbox.c                |  4 +--
> >  drivers/clk/clk_scmi.c                   |  4 +--
> >  drivers/clk/clk_vexpress_osc.c           |  2 +-
> >  drivers/clk/clk_zynq.c                   |  4 +--
> >  drivers/clk/clk_zynqmp.c                 | 40 ++++++++++-----------
> >  drivers/clk/exynos/clk-exynos7420.c      |  2 +-
> >  drivers/clk/imx/clk-imx8qm.c             |  6 ++--
> >  drivers/clk/imx/clk-imx8qxp.c            |  6 ++--
> >  drivers/clk/imx/clk-imxrt1170.c          |  2 +-
> >  drivers/clk/imx/clk-pllv3.c              |  2 +-
> >  drivers/clk/intel/clk_intel.c            |  2 +-
> >  drivers/clk/mediatek/clk-mtk.c           |  2 +-
> >  drivers/clk/meson/a1.c                   | 10 +++---
> >  drivers/clk/meson/axg.c                  | 10 +++---
> >  drivers/clk/meson/g12a.c                 | 36 +++++++++----------
> >  drivers/clk/meson/gxbb.c                 | 20 +++++------
> >  drivers/clk/mvebu/armada-37xx-periph.c   |  2 +-
> >  drivers/clk/mvebu/armada-37xx-tbg.c      |  2 +-
> >  drivers/clk/nuvoton/clk_npcm.c           | 10 +++---
> >  drivers/clk/owl/clk_owl.c                |  2 +-
> >  drivers/clk/renesas/clk-rcar-gen2.c      |  8 ++---
> >  drivers/clk/renesas/rzg2l-cpg.c          |  8 ++---
> >  drivers/clk/rockchip/clk_px30.c          | 24 ++++++-------
> >  drivers/clk/rockchip/clk_rk3036.c        |  2 +-
> >  drivers/clk/rockchip/clk_rk3066.c        |  8 ++---
> >  drivers/clk/rockchip/clk_rk3128.c        |  6 ++--
> >  drivers/clk/rockchip/clk_rk3188.c        |  6 ++--
> >  drivers/clk/rockchip/clk_rk322x.c        |  4 +--
> >  drivers/clk/rockchip/clk_rk3288.c        |  6 ++--
> >  drivers/clk/rockchip/clk_rk3308.c        | 26 +++++++-------
> >  drivers/clk/rockchip/clk_rk3328.c        |  6 ++--
> >  drivers/clk/rockchip/clk_rk3368.c        |  8 ++---
> >  drivers/clk/rockchip/clk_rk3399.c        | 12 +++----
> >  drivers/clk/rockchip/clk_rk3528.c        | 20 +++++------
> >  drivers/clk/rockchip/clk_rk3568.c        | 62 ++++++++++++++++--------=
--------
> >  drivers/clk/rockchip/clk_rk3576.c        | 36 +++++++++----------
> >  drivers/clk/rockchip/clk_rk3588.c        | 32 ++++++++---------
> >  drivers/clk/rockchip/clk_rv1108.c        |  4 +--
> >  drivers/clk/rockchip/clk_rv1126.c        | 52 +++++++++++++-----------=
---
> >  drivers/clk/sifive/sifive-prci.c         |  8 ++---
> >  drivers/clk/sophgo/clk-cv1800b.c         |  2 +-
> >  drivers/clk/starfive/clk-jh7110-pll.c    |  2 +-
> >  drivers/clk/stm32/clk-stm32-core.c       |  4 +--
> >  drivers/clk/stm32/clk-stm32f.c           |  6 ++--
> >  drivers/clk/stm32/clk-stm32h7.c          |  4 +--
> >  drivers/clk/tegra/tegra-car-clk.c        |  2 +-
> >  drivers/clk/tegra/tegra186-clk.c         |  2 +-
> >  drivers/clk/thead/clk-th1520-ap.c        |  2 +-
> >  drivers/clk/ti/clk-am3-dpll-x2.c         |  4 +--
> >  drivers/clk/ti/clk-divider.c             |  4 +--
> >  drivers/clk/ti/clk-mux.c                 |  2 +-
> >  drivers/clk/ti/clk-sci.c                 |  2 +-
> >  drivers/clk/uniphier/clk-uniphier-core.c |  2 +-
> >  65 files changed, 290 insertions(+), 290 deletions(-)
> > ---
> > base-commit: ecdc3872a767fb045be3296d4317ae978a14b022
> > change-id: 20251010-clk_ops-3b7cc9ccd070
> >
> > Best regards,
> > --
> > Andrew Goodbody <andrew.goodbody@linaro.org>
> >
>=20
> If you don't return an error, we cannot tell if the operation
> succeeded, or not. U-Boot needs to be deterministic and we need to be
> able to debug errors and detect them at runtime.
>=20
> We use ulong for the return value as a bit of a compromise, since it
> is inefficient to use 64-bit on a 32-bit machine. Ideally it would be
> long, but some clock rates are 3GHz and it would be confusing to cast
> to ulong before using the value.
>=20
> An alternative we discussed was to return an integer error with the
> clock rate returned in a parameter, but that seemed less efficient.
>=20
> With 64-bit machines, there really isn't a problem. Just checking for
> a negative value is good enough, since the clock rate isn't going to
> be 9 exahertz(?). Values between -CONFIG_ERR_PTR_OFFSET and 0 are
> errors and are defined to be so.
>=20
> If you want clk_get_rate() to work like Linux (suppress / ignore
> errors?), that's fine, but please create a clk_get_rate_err() (or
> similar) which actually returns the correct error, and keep the error
> return on the uclass interface. It is not uncommon to have the uclass
> do some processing on values passed to/from driver. This allows people
> who care to obtain the error.

This is moving things in the right direction of having the error
reporting and handling done where it can be done correctly. If there's
further parts of the Linux kernel-like API we need, we can take those
next.

--=20
Tom

--l8GSp1oDBcWYb4IP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaPOeWgAKCRAr4qD1Cr/k
ChTiAP9bd9AcnF9YQPEbhXRUDcVTsqeEjIS15V3Bf0DUt+edXgEAxdcXEmTx0HeV
5KJkZx1hXeGto6NJRTJUtcv/Yan48A0=
=I5dp
-----END PGP SIGNATURE-----

--l8GSp1oDBcWYb4IP--

--===============3794189898532303360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3794189898532303360==--
