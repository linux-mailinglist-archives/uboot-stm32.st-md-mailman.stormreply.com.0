Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D5777BC4F
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Aug 2023 17:04:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54C21C6B45F;
	Mon, 14 Aug 2023 15:04:21 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FF2BC6A5EF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 15:04:19 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-583fe10bb3cso49836887b3.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 08:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1692025458; x=1692630258;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ct0jvH+8Gvxg1sA+/OlRKEc4mpLILIDjPe/r9iV9isg=;
 b=CBFbumL7zQUk9UxvqE9LBe0XseupyQUUzKZdbPb2fraxAwnfeIyDOkAp93ZlgZnHwo
 d3OP4w6xmbFqxwg+DFbV8g+OStPEu5Ui9TgqERL+G4W1bW+pWGuztsi5wdnBjqwcB2bd
 +OJ2ADubS/NBLC/EPPrPzOekNQW2d7YcTs3Cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692025458; x=1692630258;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ct0jvH+8Gvxg1sA+/OlRKEc4mpLILIDjPe/r9iV9isg=;
 b=Ts98schqV0fLjWmFLFZrtGTwz+ZBIi1jRI8eQgoIHeZl8AL668qaF5k7tzEha/93eZ
 EhjXBMLP3JUQ9qq3DumYEmC4IghJ4KGs/wm5j8+TJTRtnwk39OCK4Ti+twWxyjjZ4fer
 hlmnQ2rCD3VXjP1RW3sCkqDpihnsVwRvAit3kBeftnwW9zK1grNf4svmr+xHVagvPgO2
 7I6BoefwcI0oiwJ8P08SnCPhIHYr53AU9v48U1tXpmeQ21VEIjNHeaX8Z9srCl8VYzNE
 PAhGLWtVhuuArBYJU48WjwK4eEUH3RkWj73k6l3lQA3IoT8DAt4htulMqnc8Rchvn7Es
 gd4w==
X-Gm-Message-State: AOJu0Yw4XjY1ImJLzk0ead7PYHrUf6LbH0OGT0dB3jJaUdlqeQfWM5jV
 NmU4r0QCm3xp2MMP0hdiWWbHcQ==
X-Google-Smtp-Source: AGHT+IE1nHRfhbsl57DqQH74Xg3Km1xau8Oe+nKjIPOHyP9n5vEAJ3vyNX7KFmS4L9VtqtinJhPzhw==
X-Received: by 2002:a25:c014:0:b0:c76:173c:6718 with SMTP id
 c20-20020a25c014000000b00c76173c6718mr11864079ybf.1.1692025458251; 
 Mon, 14 Aug 2023 08:04:18 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-1d1b-2873-dbaa-7ea0.res6.spectrum.com.
 [2603:6081:7b00:6400:1d1b:2873:dbaa:7ea0])
 by smtp.gmail.com with ESMTPSA id
 c201-20020a25c0d2000000b00d679ae188a6sm1676891ybf.37.2023.08.14.08.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 08:04:16 -0700 (PDT)
Date: Mon, 14 Aug 2023 11:04:13 -0400
From: Tom Rini <trini@konsulko.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Message-ID: <20230814150413.GU3630934@bill-the-cat>
References: <20230813050011.9345-1-heinrich.schuchardt@canonical.com>
 <CAPnjgZ1fxfxUT2g8wfi9YoJt4K2EDgCzy10Tv_D5p3T2yB-dVg@mail.gmail.com>
 <ff12490d-3ef8-dc66-2716-4b85ad5dbfea@canonical.com>
MIME-Version: 1.0
In-Reply-To: <ff12490d-3ef8-dc66-2716-4b85ad5dbfea@canonical.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Peng Fan <peng.fan@nxp.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Kever Yang <kever.yang@rock-chips.com>, Fedor Ross <fedor.ross@ifm.com>,
 u-boot@lists.denx.de, "NXP i . MX U-Boot Team" <uboot-imx@nxp.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
 Yanhong Wang <yanhong.wang@starfivetech.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Michal Simek <michal.simek@amd.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Liu <jason.hui.liu@nxp.com>,
 Michal Suchanek <msuchanek@suse.de>, Peter Robinson <pbrobinson@gmail.com>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Andre Przywara <andre.przywara@arm.com>, Ovidiu Panait <ovpanait@gmail.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Rick Chen <rick@andestech.com>,
 Nikhil M Jain <n-jain1@ti.com>, Aswath Govindraju <a-govindraju@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, Stefano Babic <sbabic@denx.de>,
 Olaf Mandel <o.mandel@menlosystems.com>, Matthias Brugger <mbrugger@suse.com>,
 Leo <ycliang@andestech.com>, Simon Glass <sjg@chromium.org>,
 Aaron Williams <awilliams@marvell.com>, Paul Burton <paul.burton@mips.com>,
 Tom Warren <twarren@nvidia.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/1] common: return type
	board_get_usable_ram_top
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
Content-Type: multipart/mixed; boundary="===============5731140440328313760=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5731140440328313760==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Axb0kZV6kblCVZ8F"
Content-Disposition: inline


--Axb0kZV6kblCVZ8F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 08:31:31AM +0200, Heinrich Schuchardt wrote:
>=20
>=20
> On 8/13/23 15:36, Simon Glass wrote:
> > Hi Heinrich,
> >=20
> > On Sat, 12 Aug 2023 at 23:01, Heinrich Schuchardt
> > <heinrich.schuchardt@canonical.com> wrote:
> > >=20
> > > board_get_usable_ram_top() returns a physical address that is stored =
in
> > > gd->ram_top. The return type of the function should be phys_addr_t li=
ke the
> > > current type of gd->ram_top.
> > >=20
> > > Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> > > ---
> > >   arch/arm/mach-imx/imx8m/soc.c           | 2 +-
> > >   arch/arm/mach-mvebu/arm64-common.c      | 2 +-
> > >   arch/arm/mach-rockchip/sdram.c          | 2 +-
> > >   arch/arm/mach-stm32mp/dram_init.c       | 2 +-
> > >   arch/arm/mach-sunxi/board.c             | 2 +-
> > >   arch/arm/mach-tegra/board2.c            | 2 +-
> > >   arch/mips/mach-jz47xx/jz4780/jz4780.c   | 2 +-
> > >   arch/mips/mach-octeon/dram.c            | 2 +-
> > >   arch/riscv/cpu/fu540/dram.c             | 2 +-
> > >   arch/riscv/cpu/fu740/dram.c             | 2 +-
> > >   arch/riscv/cpu/generic/dram.c           | 2 +-
> > >   arch/riscv/cpu/jh7110/dram.c            | 2 +-
> > >   arch/x86/cpu/broadwell/sdram.c          | 2 +-
> > >   arch/x86/cpu/coreboot/sdram.c           | 2 +-
> > >   arch/x86/cpu/efi/payload.c              | 2 +-
> > >   arch/x86/cpu/efi/sdram.c                | 2 +-
> > >   arch/x86/cpu/ivybridge/sdram.c          | 2 +-
> > >   arch/x86/cpu/qemu/dram.c                | 2 +-
> > >   arch/x86/cpu/quark/dram.c               | 2 +-
> > >   arch/x86/cpu/slimbootloader/sdram.c     | 2 +-
> > >   arch/x86/cpu/tangier/sdram.c            | 2 +-
> > >   arch/x86/include/asm/u-boot-x86.h       | 2 +-
> > >   arch/x86/lib/fsp1/fsp_dram.c            | 2 +-
> > >   arch/x86/lib/fsp2/fsp_dram.c            | 2 +-
> > >   board/broadcom/bcmns3/ns3.c             | 2 +-
> > >   board/imgtec/boston/ddr.c               | 2 +-
> > >   board/menlo/m53menlo/m53menlo.c         | 2 +-
> > >   board/raspberrypi/rpi/rpi.c             | 2 +-
> > >   board/ti/am65x/evm.c                    | 2 +-
> > >   board/ti/j721e/evm.c                    | 2 +-
> > >   board/ti/j721s2/evm.c                   | 2 +-
> > >   board/toradex/verdin-am62/verdin-am62.c | 2 +-
> > >   board/xilinx/common/board.c             | 2 +-
> > >   common/board_f.c                        | 2 +-
> > >   include/init.h                          | 2 +-
> > >   35 files changed, 35 insertions(+), 35 deletions(-)
> >=20
> > While you are here, could you please fix the function comment?
> >=20
> > [..]
> >=20
> > > diff --git a/include/init.h b/include/init.h
> > > index 8873081685..b1e1451166 100644
> > > --- a/include/init.h
> > > +++ b/include/init.h
> > > @@ -304,7 +304,7 @@ int show_board_info(void);
> > >    *
> > >    * @param total_size   Size of U-Boot (unused?)
> >=20
> > It seems confused about the param, and we should have a return value.
>=20
> The parameter with the monitor length (size of U-Boot code) is not used
> anywhere (though it is passed on to functions like
> mrc_common_board_get_usable_ram_top() where it isn't used either).
>=20
> We should try to eliminate the parameter in further patches.
>=20
> >=20
> > Also should explain what this function is used for.
>=20
> That explanation exists.
>=20
> I will put the documentation fix into a separate patch so we can apply it=
 to
> 2023.10. I don't know if Tom wants to apply this patch to next or to
> 2023.10.

I'm thinking we should take this for v2023.10.

--=20
Tom

--Axb0kZV6kblCVZ8F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmTaQm0ACgkQFHw5/5Y0
tyxp1Av+IdIhoW4Gywx2lQF/fQlXcQV4jXdC6wSU4v/NtsXT7FOPZ6jhdnFB/ugz
nXus7fUZGQMX+IsM79O0PFhbJGx5+QD/cE01Rgip/pEi+cQTz7aIGWRc50FsTh6X
t7vDTpsGPSkcAeV+YqXE67K6nqFlUPwrJ4Rj1NLaB76FQx9kMmEeWbA2C1UUVCPG
MH3siCB4FDUdMcSdi4VWmkLAY62rjfVTuEYQBJQdtvFrJ66deV4VRoPGiVRwLdJ5
SJyo3dSgzcy5JlHT0wVSecIVjK7hqlGIqX3xlV7dxT6eRg9Rwc/BIQHox49BlFIE
IhnDu7ltuPNmoh5dhDOtoYwAOyo7EAAFul3Flhpq2YgUDv9aYc8DoHEimL4VanMS
nNNmh4YtzxSts7ZFHeKI8JdVRLBVi5eB/NwfKPAYsF/96Fk0zKiuEaAETPVvzJBv
GPn53a+kM++Huz19PHDgFEM/BgMsCgOYkojMawvk5hovBFhvMCXpUyT4M9g5Vw9N
boOK9FB+
=q5bH
-----END PGP SIGNATURE-----

--Axb0kZV6kblCVZ8F--

--===============5731140440328313760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5731140440328313760==--
