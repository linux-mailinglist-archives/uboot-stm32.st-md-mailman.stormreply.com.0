Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CAE415010
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Sep 2021 20:42:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7541C5A4CD;
	Wed, 22 Sep 2021 18:42:35 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B014AC5A4CC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 18:42:34 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id 72so13039370qkk.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 11:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8X713hAGWPU0IAn7qtjOrBr0pOwgMecsKg8SuRNiFgQ=;
 b=hSDETth9YuAyau3NPTE9uJ4JTnd8Mi6Az6PPDCoEFTqDePWeOCgUfxmo1M8M3Cy4Dm
 +u7ZJEryZEjYFN1NWt9Xoe9H8KXUAPWtS4EcvpxAPw3pj+0RkAjg5eLvlqZ0YIbrhK1x
 9x4U8Xg9ixqQdyCW3ZX5otXDNZuxVOH5Q+l7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8X713hAGWPU0IAn7qtjOrBr0pOwgMecsKg8SuRNiFgQ=;
 b=S1MbHuauxX8YHo9iCr/cK7eq1dyt+p93pbu6tApv/PIUr/RgXAjMk0kAiNTbQKtOu9
 3lpYzB5t/rvmyYm84qkjfKy+4aHbQdBb11OMQqlzTAKczbDDlDJW1ujBjO5u4mANJpjJ
 Et+1RzN7TkRvxKi6UejhiKR1MU1MF34zNmO5/OT9LbRDYSI+6TRUih43KVSrmPlpW0/h
 /uiYchoTnH3xKTiBRLEC2Myi6CebofFAGlM01s6Y2J9gv3p19vfh+PHhEKiuTa59p1px
 dSww52v5C1tK/bL/7VCs0eIojQwTPCmBE8FJ0b3pieF1iohpG70hufJmXqPrgbY/zX7A
 I1Fg==
X-Gm-Message-State: AOAM530ep82Z+A9iM0ughzt76Pu6hwsU0FX3KCQHmihz4buo5DbW98nh
 L+GDCi9c2wMnz2zRDP/Kgs8g0g==
X-Google-Smtp-Source: ABdhPJyr5lJULqEN17tfuDHEuhVr47wZJsBpeEehJhEUmPLGm+FjMtCjIN+mi3UXZyu70U7W34Dw9w==
X-Received: by 2002:a37:34a:: with SMTP id 71mr765864qkd.109.1632336153600;
 Wed, 22 Sep 2021 11:42:33 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-01ae-c37f-f577-ef41.res6.spectrum.com.
 [2603:6081:7b01:cbda:1ae:c37f:f577:ef41])
 by smtp.gmail.com with ESMTPSA id o23sm1898014qtl.74.2021.09.22.11.42.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Sep 2021 11:42:32 -0700 (PDT)
Date: Wed, 22 Sep 2021 14:42:30 -0400
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20210922184230.GN8579@bill-the-cat>
References: <20210922162909.1857566-1-patrick.delaunay@foss.st.com>
 <20210922192925.723abcba@thinkpad>
 <a38d6126-2d09-34d4-0b08-0d1da94ed415@denx.de>
MIME-Version: 1.0
In-Reply-To: <a38d6126-2d09-34d4-0b08-0d1da94ed415@denx.de>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Heiko Schocher <hs@denx.de>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v4 0/2] mtd: spi: nor: force mtd name to
	"nor%d"
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
Content-Type: multipart/mixed; boundary="===============8517416747588868735=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8517416747588868735==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BWpbUxt7sU2t3mXs"
Content-Disposition: inline


--BWpbUxt7sU2t3mXs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 08:24:18PM +0200, Marek Vasut wrote:
> On 9/22/21 7:29 PM, Marek Beh=FAn wrote:
> > (Adding also Tom.)
> >=20
> > Hi Patrick, Marek,
> >=20
> > I find this either not complete or not needed:
> >=20
> > - either you need mtd names to be of this format so that old MTDPARTS
> >    config definitions do not need to be changed, i.e. something like
> >      CONFIG_MTDPARTS_DEFAULT=3D"nor0:1M(u-boot),0x1000@0xfff000(env)"
> >    does not work currently, and you want to make it work.
> >=20
> >    I find your solution here incomplete because MTDPARTS can also be
> >    used to be passed to Linux as mtdparts parameter, but there is no
> >    guarantee that the "norN" numbering you are creating in U-Boot will
> >    be the same as the one in kernel.
> >=20
> > - or it is not needed, because you can remove MTDPARTS definition from
> >    the board config entirely and move the information into device tree.
> >    In fact this was the main idea behind making the series
> >      Support SPI NORs and OF partitions in `mtd list`
> >    The SPI-NOR MTDs after this series can have conflicting names,
> >    because you can still choose between them via OF path with the `mtd`
> >    command.
> >=20
> >    Tom and I were of the opinion that MTDPARTS should be deprecated and
> >    removed in favor of OF. Marek Vasut says that this is not possible
> >    for every board, and so needs to stay.
> >=20
> > BTW, I find it a little weird for Marek to defend old API which should
> > be converted to DT, when in discussion about DM USB / Nokia N900
> > USB TTY console [1] he was defending the opinion that we should be
> > heading to DT in U-Boot.
> >=20
> > [1]
> > https://patchwork.ozlabs.org/project/uboot/patch/20210618145724.2558-1-=
pali@kernel.org/
>=20
> That USB discussion is completely unrelated to the problem here, the USB
> discussion is about internal (i.e. not user facing) conversion to DM/DT. =
The
> user-facing ABI does not change there. Also, that discussion was about
> patching USB stack to permit new non-DM/DT operation, not fixing existing
> one.
>=20
> This problem here is user facing ABI, the mtdparts/mtdids. That user faci=
ng
> ABI got broken. Boards which do depend on it, even those currently in tre=
e,
> are broken. Not all boards can update their environment, so some backward
> compatibility of the user facing ABI should be in place, even though it
> might not be to the degree Linux kernel does so. So far, it seems most of
> the U-Boot command line interface has managed to retain backward
> compatibility, I don't see why this here should be handled any differentl=
y.
>=20
> Note that there are not just a few boards that are broken, but hundreds. I
> believe that itself justifies a fix, instead of just throwing all those
> hundreds of boards overboard.
>=20
> u-boot$ git grep -l CONFIG_MTDIDS configs | wc -l
> 203
>=20
> Hopefully that clarifies the difference.

It doesn't quite, sorry.  If you have "mtdparts=3D... mtdids=3D..." in your
cmdline that you pass to Linux, U-Boot doesn't care.  That's one of the
main users of CONFIG_MTDIDS/MTDPARTS today, which could in some good
number of cases be removed (take am335x_evm_defconfig for example, the
table has been defined in the upstream DT for forever).  Taking a look
at:
commit 938db6fe5da3581ed2c17d64c7e016a7a8df5237
Author: Miquel Raynal <miquel.raynal@bootlin.com>
Date:   Sat Sep 29 12:58:30 2018 +0200

    cmd: mtdparts: describe as legacy
   =20
    The 'mtdparts' command is not needed anymore. While the environment
    variable is still valid (and useful, along with the 'mtdids' one), the
    command has been replaced by 'mtd' which is much more close to the MTD
    stack and do not add its own specific glue.
   =20
    Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
    Reviewed-by: Stefan Roese <sr@denx.de>
    Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

Is when "mtdparts" in U-Boot was noted as legacy.  So what exactly are
we fixing with this series?  Nothing changed about hard-coded values
being passed along.  What may have broken was some progmatic way to set
those, but I think that's both fragile and deprecated in favor of the
table being in the DT.

--=20
Tom

--BWpbUxt7sU2t3mXs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFLeRMACgkQFHw5/5Y0
tyxSEwv9GKD/+/Dea4rzyZ+tGZ+gf6BKIZwbMPxZIngu2leQ/hGMWhGwGfGiIy0Z
9F1u3SaW/8VM/tKMzKG268hQyGLEZv9gTBZv8VJ9PkusBL2xZOSrhfD1VXjCBF7V
zc1gbNWGpwrIyZ9NkyJ7h4P3ZCRhm98uPmRJowKEx4DuVOUsxHRAWYjybn1V89gy
6xGE9m4nmHarpY9u1BvKy2H0T8kPFt0UIapaVnV0IzySAgz4zGXmGA02VV0moO9c
I/dn6O2+jFbjxu79O8qj8cg2Sy/TwHQ43RM8jvOojBskW67YrzzKoV0YHNxewkbD
yi8YFMbkSBRqbG0DHPmmpfFCUonwJdpvJCZmyjZzP8hHJ6hiOoBqvgRzkg1hdPGM
gfAG9RwCiAE9U9YvijE8P4Asy0G7KolsuRQ40ki8dHHxJ54DX4tW+49lJusfCIvy
0YV0ZwrTxNsVmUwwNK5WAEBu5ACYUtILZJ8x1rnKlLcJ1CUdgejaDtaZJudUK9GX
glZSoH4H
=Smcn
-----END PGP SIGNATURE-----

--BWpbUxt7sU2t3mXs--

--===============8517416747588868735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8517416747588868735==--
