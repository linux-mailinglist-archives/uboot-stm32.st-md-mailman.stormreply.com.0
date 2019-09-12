Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A798BB0ACB
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Sep 2019 11:03:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55130C36B3F
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Sep 2019 09:03:20 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0EE3C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Sep 2019 09:03:18 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46TXqR5RRgz1rJhZ;
 Thu, 12 Sep 2019 11:03:15 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46TXqR3jJ1z1qqkL;
 Thu, 12 Sep 2019 11:03:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 7Ye5bKH76x14; Thu, 12 Sep 2019 11:03:13 +0200 (CEST)
X-Auth-Info: LJUa+HiOUIFJjAEExhP6Z0LXjBqmzoFhddHwR4PYfAM=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 12 Sep 2019 11:03:13 +0200 (CEST)
Date: Thu, 12 Sep 2019 11:03:06 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Message-ID: <20190912110306.2fa14a94@jawa>
In-Reply-To: <91c1e945-1c66-9349-5b2c-253ea0dd8144@kontron.de>
References: <20190904221639.26469-1-lukma@denx.de>
 <20190905180904.GA26850@bill-the-cat>
 <e5d7e314-3cf9-687a-d638-19ebaef6279b@kontron.de>
 <20190909140020.5099a79f@jawa> <20190910122208.6565be76@jawa>
 <91c1e945-1c66-9349-5b2c-253ea0dd8144@kontron.de>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Feng Li <feng.li_2@nxp.com>, Tom Rini <trini@konsulko.com>,
 Tien Fong Chee <tien.fong.chee@intel.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Sumit Garg <sumit.garg@nxp.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Alison Wang <alison.wang@nxp.com>,
 Pankit Garg <pankit.garg@nxp.com>, Vinitha V Pillai <vinitha.pillai@nxp.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Yinbo Zhu <yinbo.zhu@nxp.com>,
 Stefan Roese <sr@denx.de>, York Sun <york.sun@nxp.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v3 0/3] spi: Split CONFIG_DM_SPI*
 to CONFIG_{SPL_TPL}DM_SPI*
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
Content-Type: multipart/mixed; boundary="===============4871326155045939866=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============4871326155045939866==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=Be627KVnErK0gk_fe45hCD"; protocol="application/pgp-signature"

--Sig_/=Be627KVnErK0gk_fe45hCD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Frieder,

> Hi Lukasz,
>=20
> On 10.09.19 12:22, Lukasz Majewski wrote:
> > Hi Frieder,
> >  =20
> >> On Mon, 9 Sep 2019 11:11:50 +0000
> >> Schrempf Frieder <frieder.schrempf@kontron.de> wrote:
> >> =20
> >>> Hi Lukasz,
> >>>
> >>> On 05.09.19 20:09, Tom Rini wrote: =20
> >>>> On Thu, Sep 05, 2019 at 12:16:36AM +0200, Lukasz Majewski wrote:
> >>>>     =20
> >>>>> This patch series introduces new SPL and TPL specific Kconfig
> >>>>> entries for DM_SPI* options. Such change allows using the spi
> >>>>> driver in SPL/TPL or U-Boot proper.
> >>>>>
> >>>>> First two patches - related to ls10{42}* NXP soc fix some issues
> >>>>> with defining the DM_SPI* defines in <board>.h file instead of
> >>>>> Kconfig.
> >>>>>
> >>>>> This series doesn't introduce build breaks, but board
> >>>>> maintainers are kindly asked to check if their boards still
> >>>>> boots.
> >>>>>
> >>>>> Buildman setup for binary size regression checking:
> >>>>>
> >>>>> ./tools/buildman/buildman.py -b HEAD --count=3D4 ls1043
> >>>>> --output-dir=3D../BUILD/ --force-build -CveE
> >>>>> ./tools/buildman/buildman.py -b HEAD --count=3D4 ls1043
> >>>>> --output-dir=3D../BUILD/ -Ssdel =20
> >>>>
> >>>> So you did fix the ls1043 problems but ls1046 is still a problem.
> >>>>      =20
> >>>
> >>> I was trying to clean up this config mess some weeks ago. I
> >>> stumbled over the same issues (size deltas below) when I tested
> >>> with buildman and finally gave up on it. This was my testing
> >>> branch for reference: [1].
> >>>
> >>> Thanks for your work and I hope you/we can get this sorted out
> >>> somehow... =20
> >>
> >> For now I've only posted the patch to introduce SPL_DM_SPI in
> >> Kconig: https://patchwork.ozlabs.org/patch/1159655/ =20
> >=20
> > However, I've looked on your patchset and IMHO this work could be
> > divided (as doing it at once is not feasible).
> >=20
> > For example the CONFIG_SPI_FLASH_MTD could be converted to
> > (SPL_TPL_)SPI_FLASH_MTD and then one could use
> >=20
> > #if CONFIG_IS_ENABLED(SPI_FLASH_MTD) in drivers/mtd/spi/sf_probe.c
> > (as it is only used there).
> >=20
> > Then we could avoid situations where code is added as you remove it
> > here [1]:
> > https://github.com/fschrempf/u-boot/commit/b6489fb5928c2b41d7e4cb39933f=
078659b4f10e#diff-9d3e174d033b8b9c9d380a22a81600aaL136
> >=20
> > What I'm afraid though, is that split of SPI_FLASH_MTD will require
> > adding unwillingly SPL_(TPL_)SPI_FLASH_MTD to all boards which
> > already define it (and only drop ones, which use in <config>.h file
> > pattern as [1]). =20
>=20
> Yes, this looks like what I've tried to do separately in this branch
> [1].
>=20
> The problem with some socfpga boards is, that they enable=20
> CONFIG_SPI_FLASH_MTD in socfpga_common.h, without enabling=20
> CONFIG_SPI_FLASH, which is probably wrong.

It looks to me like the code in:
https://github.com/fschrempf/u-boot/commit/059d67efa34da92aaf738758e596f436=
203c84c2#diff-9d3e174d033b8b9c9d380a22a81600aaL136

is to prevent ALL socfpgas from compiling in FLASH MTD support to SPL,
as it causes build breaks (as I do have such situation in one of my
boards - it uses tiny SPI in SPL to read data from SPI-NOR, without the
need to enable MTD there) .

In other words those boards only use FLASH MTD driver in U-Boot proper.
(and probably there shall not be any deltas in buildman build binaries
[*])

> So I tried to correct
> this, but looking at it again, this should be done separately.
>=20
> So if I remove the added "CONFIG_SPI_FLASH=3Dy" from my patches and=20
> rebase, this should be ok.

I think yes. I guess that ALL socfpgas shall have added
CONFIG_SPI_FLASH_MTD=3Dy to their _defconfigs


It may also happen that boards, which define CONFIG_SPI_FLASH_MTD would
require both CONFIG_SPI_FLASH_MTD and CONFIG_SPL_SPI_FLASH_MTD defined
(if they don't use socfpga style <config>.h code) to have the same
binaries build.

>=20
> For this set I have still one question: Should I split the patches as=20
> currently done in [1]? This would mean after the first patch some
> boards miss SPI_FLASH_MTD code and the subsequent board config
> patches correct it afterwards. Or should I merge all the changes to a
> single patch, to not break the boards in between.

I would opt for preparing one single patch with conversion (to avoid
build breaks). This would also allow easy buildman testing [*] to see
if there is any difference in sizes of binaries (elf sections to be
precise).

I would also add the patch to define CONFIG_SPL_SPI_FLASH_MTD in
Kconfig to show that such option is available for use after the
conversion (IMHO it shall be added before the conversion patch).

> Unfortunately I can't do it the other way round and apply the board=20
> config changes first, as this breaks the build.

The volume of changes is rather small - so single patch would be
optimal here.

>=20
> > Frieder, would you be able to work on this topic any time soon? =20
>=20
> I can try to find some time this weekend and try to get [1] ready.

Great, thanks :-)

> But I probably won't be able to spend serious amounts of time anytime
> soon on the remaining tasks.

I think that we shall do it step by step. As we both learned from the
experience - doing it at once is not feasible.

My comments to the patch set [1]:

1.=20
https://github.com/fschrempf/u-boot/commit/059d67efa34da92aaf738758e596f436=
203c84c2#diff-94a725bbe2cb8781105dab5153da9209R44

Is the CONFIG_SPI_FLASH =3D y necessary?




[*] - Buildman setup for testing (shared with me by Tom):

Set date:
export SOURCE_DATE_EPOCH=3D`date +%s`

Build the code:

./tools/buildman/buildman.py -b HEAD --count=3D1 socfpga dh_imx6 <other>
--output-dir=3D../BUILD/ --force-build -CveE

Check build results (including binary deltas):

./tools/buildman/buildman.py -b HEAD --count=3D1 socfpga dh_imx6 <other>
--output-dir=3D../BUILD/ -SsdelB


And you shall see the build results (with binary deltas).

>=20
> Thanks,
> Frieder
>=20
> [1]: https://github.com/fschrempf/u-boot/commits/spi_flash_mtd_cleanup


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/=Be627KVnErK0gk_fe45hCD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl16CcoACgkQAR8vZIA0
zr3Towf+Lc4C5oP02MLsyIz4/LmVVnISksn2vAG8E7IPiwfJDd5heIv/sPvikh4y
zvnQhpu3itQz/OVG8rbsEWTh4g0z0MYeQITUEgfZ7z54HjqmeMm2AQDuDi1NFQVh
GqKC12a6ZkV6V/zjHtRgHLw1NX/ouxilEzmlJ3g27c0RJc+FDRR119K6TmUaF2Uh
Pq/EjxldFSXI8IGeYXZFAy754j1OvHJiEZFRnp2iH+SPDZ0LG+Nkg4XqV0WGEzUg
wxqbz2SihDCUTxPOCi8dlo6tWjfgneANuK5sC7wC0TGYKOmdbTlLnJfW+pgH5zEw
iajdhN6NNj44yMhhw0RZGXjFbRuB2w==
=Pzbz
-----END PGP SIGNATURE-----

--Sig_/=Be627KVnErK0gk_fe45hCD--

--===============4871326155045939866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4871326155045939866==--
