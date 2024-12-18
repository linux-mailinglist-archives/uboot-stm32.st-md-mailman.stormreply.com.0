Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA439F6879
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2024 15:30:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3344C78011;
	Wed, 18 Dec 2024 14:30:44 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD7B7C5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 14:30:37 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-7b68e73188cso759757085a.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 06:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1734532237; x=1735137037;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z/zdZr+HirLKtcwhDkN6+4YEKvLd0cGxDnf+EivDRyQ=;
 b=MeO93MUlRFRB6K6G2fcGAYbJ+4UXDIYKLz9otqew1iDvikOLYqAb3nTad32WjLSqt9
 8aLDkl0drSoGBQtCb9eOoOFiCWUF9FwzLpoKNU3h+WpJv8PzqHd5PRhfnEISAo77GeBW
 xdUNhI4n8P3ZHppNQnTiWmIjhx//8euwRarXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734532237; x=1735137037;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z/zdZr+HirLKtcwhDkN6+4YEKvLd0cGxDnf+EivDRyQ=;
 b=oLJ505/ZEfVI3uTSZfPV6qLJkqBCV5olBGXBrw3AMarb20c+5uf3IDRcVDHlef41Jy
 vPUnlFyBU5iIj0lp/V9qgLwlowaAYWbmBft+ByP0nRLOivHW+pM7VT8lwtUQZPBQ9Rzx
 2fKYJnCFsNWXXV0Mgy8PwApw28+br77kz9f+Bgrihj4fFkaGLbxR+jYywfEinZ8RBid7
 dEmIyEOxOPTGmBu3g+25Uk/he1+SvsE5n3hOKZZmcv3iicCkdERE5K4ShsmxJXwLczZZ
 p06hYSKhJemRKPKfwyq13ryAgX5uuxD3MmIz0sPEpxBquR19DZ+/V/TKtT5CwL8x6gyN
 gyKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtmyAZSvtcUnachnuzcBXs4q9p3WlD9xuK5tMuf4UNfaIfQsyq2nqHf5nTpRHi1n0wGiM4O4/0zUph+Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywy7jVYcpRel5ttJYwQ+kH9gQc5684FlKkc+ykHIIFQM6L56UFv
 TPVxnGkWbqXc9KzBhs0id+74+1ZiKY5khs7DDGHytL4VNnf9YDQdN9kYX5ND6Is=
X-Gm-Gg: ASbGncuJRHp+bdlVKeJJj/hyc1BtQtUPX8hY542bCXYm6oEbD5rp0hXntPq/vxu0zO2
 FWB6zOPZIKcQG8RuxXj/bAoeWSsjBDBMVZXB4KKW5RLQqA55nv1w5xHCjfjhybM/7s8xNlu+SSx
 cGL524GZF2cwvLQ4MsaFtWeohVTIQ18H0MY0K05Ay0Z+I3wkD9+MY/escezGtmjtaxGG4hyOyYW
 E1CgWyDf2cgF5daGmHollQl85YvgvIa3Ffbt9GFXCOBH5QG2kSCJzBI
X-Google-Smtp-Source: AGHT+IEz6iNVqNpaRnsFC3bOzyyE8LeVChtrnj8bHSSFJn9YRtmxxDsF1w/dciYkowB3n2SLZPxJ1Q==
X-Received: by 2002:a05:620a:4005:b0:7b6:eed4:6957 with SMTP id
 af79cd13be357-7b8638c38d6mr434369785a.60.1734532236354; 
 Wed, 18 Dec 2024 06:30:36 -0800 (PST)
Received: from bill-the-cat ([187.144.29.192])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b7048d3a4esm429547885a.129.2024.12.18.06.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 06:30:35 -0800 (PST)
Date: Wed, 18 Dec 2024 08:30:28 -0600
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20241218143028.GX1505244@bill-the-cat>
References: <20241102174944.412088-1-sjg@chromium.org>
 <20241102174944.412088-2-sjg@chromium.org>
 <280e1d54-89ff-496f-93d3-0de7a9797bc9@foss.st.com>
 <CAFLszTjyxf9m4twDCQw6K99QXA5DmM9nAt-ryH5M3gb5bKyBzg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFLszTjyxf9m4twDCQw6K99QXA5DmM9nAt-ryH5M3gb5bKyBzg@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: David Feng <fenghua@phytium.com.cn>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Liviu Dudau <liviu.dudau@foss.arm.com>, Rick Chen <rick@andestech.com>,
 H Bell <dmoo_dv@protonmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Peng Fan <peng.fan@nxp.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Mark Kettenis <kettenis@openbsd.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Stefan Roese <sr@denx.de>, Janne Grunau <j@jannau.net>,
 Marek Vasut <marex@denx.de>, Randolph <randolph@andestech.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Yu Chien Peter Lin <peterlin@andestech.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, E Shattow <lucent@gmail.com>,
 Jerry Van Baren <vanbaren@cideas.com>, Peter Robinson <pbrobinson@gmail.com>,
 "Ivan T. Ivanov" <iivanov@suse.de>, Andre Przywara <andre.przywara@arm.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Sam Day <me@samcday.com>,
 William Zhang <william.zhang@broadcom.com>,
 Matthias Brugger <mbrugger@suse.com>, Francois Berder <fberder@outlook.fr>,
 Tim Harvey <tharvey@gateworks.com>, u-boot-qcom@groups.io,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Green Wan <green.wan@sifive.com>, Minda Chen <minda.chen@starfivetech.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Alexander Graf <agraf@csgraf.de>,
 =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Atish Patra <atishp@atishpatra.org>,
 Peter Hoyes <Peter.Hoyes@arm.com>, Michal Simek <michal.simek@amd.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Raymond Mao <raymond.mao@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Leo Yu-Chi Liang <ycliang@andestech.com>, Eric Curtin <ecurtin@redhat.com>,
 Igor Opaniuk <igor.opaniuk@foundries.io>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Aaron Williams <awilliams@marvell.com>,
 Padmarao Begari <padmarao.begari@amd.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Bin Meng <bmeng.cn@gmail.com>, Sumit Garg <sumit.garg@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v2 2/2] fdt: Swap the signature for
	board_fdt_blob_setup()
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
Content-Type: multipart/mixed; boundary="===============0017480412745205932=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0017480412745205932==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zuYnMXRIERmckC1I"
Content-Disposition: inline


--zuYnMXRIERmckC1I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 06:46:37PM -0700, Simon Glass wrote:
> On Tue, 26 Nov 2024 at 10:10, Patrice CHOTARD
> <patrice.chotard@foss.st.com> wrote:
> >
> >
> >
> > On 11/2/24 18:49, Simon Glass wrote:
> > > This returns a devicetree and updates a parameter with an error code.
> > > Swap it, since this fits better with the way U-Boot normally works. It
> > > also (more easily) allows leaving the existing pointer unchanged.
> > >
> > > No yaks were harmed in this change, but there is a very small code-si=
ze
> > > reduction.
> > >
> > > For sifive, the OF_BOARD option must be set for the function to be
> > > called, so there is no point in checking it again. Also OF_SEPARATE is
> > > defined always.
> > >
> > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > ---
> > >
> > > Changes in v2:
> > > - Set up the existing FDT in case the board wants to check it
> > > - Update snapdragon to return -EEXIST
> > > - Set the existing FDT before calling board_fd_blob_setup()
> > > - Update sandbox to return -EEXIST if an fdt comes from a bloblist
> > > - Update do_go_uboot() to set the existing FDT
> > > - Drop unnecessary setting of FDT in vexpress64
> > > - Tidy up redundant RISC-V code
> > >
> > >  arch/arm/mach-apple/board.c                   |  7 ++--
> > >  arch/arm/mach-snapdragon/board.c              |  9 ++---
> > >  arch/arm/mach-stm32mp/boot_params.c           | 19 ++++++-----
> > >  arch/sandbox/cpu/cpu.c                        | 34 +++++++++--------=
--
> > >  board/Marvell/octeontx/board-fdt.c            | 12 +++----
> > >  board/Marvell/octeontx2/board-fdt.c           | 12 +++----
> > >  board/Marvell/octeontx2/board.c               |  3 +-
> > >  board/andestech/ae350/ae350.c                 | 23 +++++++------
> > >  board/armltd/vexpress64/vexpress64.c          | 33 ++++++++----------
> > >  board/broadcom/bcmstb/bcmstb.c                |  7 ++--
> > >  board/emulation/qemu-arm/qemu-arm.c           |  7 ++--
> > >  board/emulation/qemu-ppce500/qemu-ppce500.c   | 12 +++----
> > >  board/emulation/qemu-riscv/qemu-riscv.c       |  7 ++--
> > >  board/highbank/highbank.c                     |  7 ++--
> > >  board/raspberrypi/rpi/rpi.c                   | 13 ++++---
> > >  board/sifive/unleashed/unleashed.c            | 12 +++----
> > >  board/sifive/unmatched/unmatched.c            | 11 +++---
> > >  .../visionfive2/starfive_visionfive2.c        | 11 +++---
> > >  board/xen/xenguest_arm64/xenguest_arm64.c     | 14 ++++----
> > >  board/xilinx/common/board.c                   | 26 ++++++++------
> > >  include/fdtdec.h                              |  9 ++---
> > >  lib/fdtdec.c                                  | 14 +++++---
> > >  22 files changed, 152 insertions(+), 150 deletions(-)
> > >
> > > diff --git a/arch/arm/mach-apple/board.c b/arch/arm/mach-apple/board.c
> > > index 0b6d290b8ac..2644a04a622 100644
> > > --- a/arch/arm/mach-apple/board.c
> > > +++ b/arch/arm/mach-apple/board.c
> > > @@ -691,11 +691,12 @@ int dram_init_banksize(void)
> > >
> > >  extern long fw_dtb_pointer;
> > >
> > > -void *board_fdt_blob_setup(int *err)
> > > +int board_fdt_blob_setup(void **fdtp)
> > >  {
> > >       /* Return DTB pointer passed by m1n1 */
> > > -     *err =3D 0;
> > > -     return (void *)fw_dtb_pointer;
> > > +     *fdtp =3D (void *)fw_dtb_pointer;
> > > +
> > > +     return 0;
> > >  }
> > >
> > >  void build_mem_map(void)
> > > diff --git a/arch/arm/mach-snapdragon/board.c b/arch/arm/mach-snapdra=
gon/board.c
> > > index 2ab2ceb5138..cd49de540f0 100644
> > > --- a/arch/arm/mach-snapdragon/board.c
> > > +++ b/arch/arm/mach-snapdragon/board.c
> > > @@ -147,12 +147,12 @@ static void show_psci_version(void)
> > >   * or for supporting quirky devices where it's easier to leave the d=
ownstream DT in place
> > >   * to improve ABL compatibility. Otherwise, we use the DT provided b=
y ABL.
> > >   */
> > > -void *board_fdt_blob_setup(int *err)
> > > +int board_fdt_blob_setup(void **fdtp)
> > >  {
> > >       struct fdt_header *fdt;
> > >       bool internal_valid, external_valid;
> > > +     int ret =3D 0;
> > >
> > > -     *err =3D 0;
> > >       fdt =3D (struct fdt_header *)get_prev_bl_fdt_addr();
> > >       external_valid =3D fdt && !fdt_check_header(fdt);
> > >       internal_valid =3D !fdt_check_header(gd->fdt_blob);
> > > @@ -167,10 +167,11 @@ void *board_fdt_blob_setup(int *err)
> > >
> > >       if (internal_valid) {
> > >               debug("Using built in FDT\n");
> > > +             ret =3D -EEXIST;
> > >       } else {
> > >               debug("Using external FDT\n");
> > >               /* So we can use it before returning */
> > > -             gd->fdt_blob =3D fdt;
> > > +             *fdtp =3D fdt;
> > >       }
> > >
> > >       /*
> > > @@ -179,7 +180,7 @@ void *board_fdt_blob_setup(int *err)
> > >        */
> > >       qcom_parse_memory();
> > >
> > > -     return (void *)gd->fdt_blob;
> > > +     return ret;
> > >  }
> > >
> > >  void reset_cpu(void)
> > > diff --git a/arch/arm/mach-stm32mp/boot_params.c b/arch/arm/mach-stm3=
2mp/boot_params.c
> > > index ebddf6a7dbc..2d058edc419 100644
> > > --- a/arch/arm/mach-stm32mp/boot_params.c
> > > +++ b/arch/arm/mach-stm32mp/boot_params.c
> > > @@ -6,6 +6,7 @@
> > >  #define LOG_CATEGORY LOGC_ARCH
> > >
> > >  #include <config.h>
> > > +#include <errno.h>
> > >  #include <log.h>
> > >  #include <linux/libfdt.h>
> > >  #include <asm/arch/sys_proto.h>
> > > @@ -16,20 +17,22 @@
> > >   * Use the saved FDT address provided by TF-A at boot time (NT_FW_CO=
NFIG =3D
> > >   * Non Trusted Firmware configuration file) when the pointer is valid
> > >   */
> > > -void *board_fdt_blob_setup(int *err)
> > > +int board_fdt_blob_setup(void **fdtp)
> > >  {
> > >       unsigned long nt_fw_dtb =3D get_stm32mp_bl2_dtb();
> > >
> > >       log_debug("%s: nt_fw_dtb=3D%lx\n", __func__, nt_fw_dtb);
> > >
> > > -     *err =3D 0;
> > >       /* use external device tree only if address is valid */
> > > -     if (nt_fw_dtb >=3D STM32_DDR_BASE) {
> > > -             if (fdt_magic(nt_fw_dtb) =3D=3D FDT_MAGIC)
> > > -                     return (void *)nt_fw_dtb;
> > > -             log_debug("%s: DTB not found.\n", __func__);
> > > +     if (nt_fw_dtb < STM32_DDR_BASE ||
> > > +         fdt_magic(nt_fw_dtb) !=3D FDT_MAGIC) {
> > > +             log_debug("DTB not found.\n");
> > > +             log_debug("fall back to builtin DTB, %p\n", _end);
> > > +
> > > +             return -EEXIST;
> > >       }
> > > -     log_debug("%s: fall back to builtin DTB, %p\n", __func__, _end);
> > >
> > > -     return (void *)_end;
> > > +     *fdtp =3D (void *)nt_fw_dtb;
> > > +
> > > +     return 0;
> > >  }
> >
> > For mach-stm32mp:
> > Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> >
> > Thanks
> >
>=20
> Applied to sjg/master, thanks!

It would be helpful for this to be a pull request from you, vs current
next. I hadn't applied it to next myself since I assigned it to you in
patchwork. I can take it to next directly instead if you prefer.

--=20
Tom

--zuYnMXRIERmckC1I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmdi3HwACgkQFHw5/5Y0
tyyOugwAjTWKpIeBKts6LQWDsK85DV7SzPVP1XlUHN/0s5yWu2LmI5k58t5AvAKa
6zOq7GNfde99sSJNXuwHLxgJy6mcEXxuCHV1LNFdM41/+SmMKxgxKKCdSeWgHTIw
a0hNnWj4N9fBOEZ9+QT3AkbizSbMYnrOaqlqW0fLnZuqvC9zgCjW5+Sl31f/Zsm4
Vt3uyTGd7aHVqH5IXE+tKfv/FVp8/wO8FlG1K7Y/KwlveHXROFRTaOqSkQRZj1mY
0+L10i+hXsx4uzoVciOmbv6wSFAjVNBJs7E9LfdKZ3MSrVelbo6O9v6oBpu/dhmH
lm85Ey4xI/v1mRoLZNoukziYZ6l3tteBN1z/xK/q9w2nh3UyZwrKzZm1WhTJ6yky
WBS3ynV08LLVyKf0Pv5CDyH8PexC7B7m4x8y5YBdNF/Ol3eY8wprloTHRrdfhrUN
2C9FzXqiYkJbZDBPBajE506R7duO/1t7vEdhCoaFJpOTZBtvYXFNoDgN10y217lc
FJE9JNRx
=yqBz
-----END PGP SIGNATURE-----

--zuYnMXRIERmckC1I--

--===============0017480412745205932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0017480412745205932==--
