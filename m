Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E57B41506F
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Sep 2021 21:23:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06BDFC5A4CD;
	Wed, 22 Sep 2021 19:23:44 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B40A9C5A4CC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 19:23:41 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id bk29so13519041qkb.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 12:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2dr/Ljkob/Jh8HLfLB33lDGscFutIX+42pFYUhJU8zk=;
 b=jyQ4XW7Knl3V5HRSlFaJvLlS3+UlWnU2+fwgsWialIni+UFm8KKm+eW0CwSvhTdx8E
 ui1eHsgNSRexJQdN3KDx6oIn7fBNo8tKqCjtpwbjYiC2NfWb4QhP4Q7ODJMkf1+Gyy0Y
 Ik0iZ5RiB2HZxuVQXUXfVYHhZE7uGmM0/ZXAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2dr/Ljkob/Jh8HLfLB33lDGscFutIX+42pFYUhJU8zk=;
 b=Rub+qCCxKAPJ9Ppr0oNrlmiC5pTP2hbS490Dhl/YLZuDrzgIZYIyE0A96ygnyNSOmG
 lGdtujX6IVd1DAuT7YETaKepuyQQyTFthZo3ITGjkDjI4erOejZO7fUQw7FeUyGIBhyV
 Z9AORTIUu4h3aLfIfyihFL3X1FmvkvvDvXDBs+qJ/pexHJsblR7d0N5DqAkhA4gek5Hv
 F5rqLY3F87Cx39Z5jHsa1JL3qTTJ0BpYkLHJxa+9u9F7tiuzFBY1ZzVwbJ9dLZ2HGPfX
 wBW9pG/dOAYF0S2B257ZponkPDFNAvVBP/7Wt55veeRsTnD+zDc0bKV1U+0tOreZciZd
 Yu8Q==
X-Gm-Message-State: AOAM530hfF8LP6WBwNf9ALxdoRoXInPFmvtSMq3pwQyZ0L1CDMtmaaLj
 Zq8xnM+ReC4/6QZxqlqA18kLhQ==
X-Google-Smtp-Source: ABdhPJwTKue0xOkwuR31Ic8cXHpBtHV0pZSOfrOpTTK7X9kcq1IVsrGDX62SpLtBDWOUDXLIZjMnhg==
X-Received: by 2002:a37:8747:: with SMTP id j68mr941141qkd.165.1632338620598; 
 Wed, 22 Sep 2021 12:23:40 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-a58e-d475-4878-38e2.res6.spectrum.com.
 [2603:6081:7b01:cbda:a58e:d475:4878:38e2])
 by smtp.gmail.com with ESMTPSA id h14sm706103qtx.69.2021.09.22.12.23.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Sep 2021 12:23:39 -0700 (PDT)
Date: Wed, 22 Sep 2021 15:23:37 -0400
From: Tom Rini <trini@konsulko.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Message-ID: <20210922192337.GA31748@bill-the-cat>
References: <20210922162909.1857566-1-patrick.delaunay@foss.st.com>
 <20210922192925.723abcba@thinkpad>
 <a38d6126-2d09-34d4-0b08-0d1da94ed415@denx.de>
 <20210922210536.6c9c2f9e@thinkpad>
MIME-Version: 1.0
In-Reply-To: <20210922210536.6c9c2f9e@thinkpad>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
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
Content-Type: multipart/mixed; boundary="===============5164745002663749759=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5164745002663749759==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 09:05:36PM +0200, Marek Beh=FAn wrote:
> On Wed, 22 Sep 2021 20:24:18 +0200
> Marek Vasut <marex@denx.de> wrote:
>=20
> > On 9/22/21 7:29 PM, Marek Beh=FAn wrote:
> > > (Adding also Tom.)
> > >=20
> > > Hi Patrick, Marek,
> > >=20
> > > I find this either not complete or not needed:
> > >=20
> > > - either you need mtd names to be of this format so that old MTDPARTS
> > >    config definitions do not need to be changed, i.e. something like
> > >      CONFIG_MTDPARTS_DEFAULT=3D"nor0:1M(u-boot),0x1000@0xfff000(env)"
> > >    does not work currently, and you want to make it work.
> > >=20
> > >    I find your solution here incomplete because MTDPARTS can also be
> > >    used to be passed to Linux as mtdparts parameter, but there is no
> > >    guarantee that the "norN" numbering you are creating in U-Boot will
> > >    be the same as the one in kernel.
> > >=20
> > > - or it is not needed, because you can remove MTDPARTS definition from
> > >    the board config entirely and move the information into device tre=
e.
> > >    In fact this was the main idea behind making the series
> > >      Support SPI NORs and OF partitions in `mtd list`
> > >    The SPI-NOR MTDs after this series can have conflicting names,
> > >    because you can still choose between them via OF path with the `mt=
d`
> > >    command.
> > >=20
> > >    Tom and I were of the opinion that MTDPARTS should be deprecated a=
nd
> > >    removed in favor of OF. Marek Vasut says that this is not possible
> > >    for every board, and so needs to stay.
> > >=20
> > > BTW, I find it a little weird for Marek to defend old API which should
> > > be converted to DT, when in discussion about DM USB / Nokia N900
> > > USB TTY console [1] he was defending the opinion that we should be
> > > heading to DT in U-Boot.
> > >=20
> > > [1]
> > > https://patchwork.ozlabs.org/project/uboot/patch/20210618145724.2558-=
1-pali@kernel.org/ =20
> >=20
> > That USB discussion is completely unrelated to the problem here, the US=
B=20
> > discussion is about internal (i.e. not user facing) conversion to DM/DT=
=2E=20
> > The user-facing ABI does not change there. Also, that discussion was=20
> > about patching USB stack to permit new non-DM/DT operation, not fixing=
=20
> > existing one.
>=20
> This is not only about the user ABI (altough now I agree that you are
> correct there, see below). What I meant is this:
>   Should we push for converting to device-tree even if for some boards
>   it is not possible, and would mean removing them?
>=20
>   Because you are saying that MTDPARTS cannot be converted to DT for
>   some boards.
>=20
>   But N900 also cannot be reasonably converted because of space
>   issues, as far as I understood. Yes, it has gigabytes of eMMC storage,
>   and it was proposed to put SPL in MTD and U-Boot proper into eMMC on
>   VFAT/ext4, but this simply cannot be done reasonably, because:
>   - it would break Linux userspace (existing OS upgrade system would
>     have to be rewritten and backwords compatibility would be broken)
>   - it would make bootstrapping (booting newer version of U-Boot) while
>     developing U-Boot a pain in the ass or maybe even impossible
>   - I beleive there was some other reason Pali mentioned, but I cannot
>     remember anymore
>=20
> > This problem here is user facing ABI, the mtdparts/mtdids. That user=20
> > facing ABI got broken. Boards which do depend on it, even those=20
> > currently in tree, are broken. Not all boards can update their=20
> > environment, so some backward compatibility of the user facing ABI=20
> > should be in place, even though it might not be to the degree Linux=20
> > kernel does so. So far, it seems most of the U-Boot command line=20
> > interface has managed to retain backward compatibility, I don't see why=
=20
> > this here should be handled any differently.
>=20
> OK, I get that the if `mtd nor0` was working before, it should work also
> now. But the conversion from MTDPARTS to device tree could be probably
> done for lots of these, see below.
>=20
> > Note that there are not just a few boards that are broken, but hundreds=
=2E=20
> > I believe that itself justifies a fix, instead of just throwing all=20
> > those hundreds of boards overboard.
> >=20
> > u-boot$ git grep -l CONFIG_MTDIDS configs | wc -l
> > 203
>=20
> Only 96 of those also grep the substring "nor". But okay, that is still
> a lot. The question is how many of them could be rewritten to DT:
>=20
>   for cfg in $(git grep -l 'CONFIG_MTDIDS.*nor[0-9]' configs); do
>     fgrep CONFIG_DEFAULT_DEVICE_TREE "$cfg"
>   done | wc -l
>=20
> 92 of those 96 have CONFIG_DEFAULT_DEVICE_TREE defined.
>=20
> Of these, 65 contain CONFIG_DM_SPI_FLASH=3Dy, so at least these 65 could
> be converted. Of the rest 27, how many could also be converted to DM?
> How may use non-DM drivers?

I was thinking maybe we have problems with the platforms that "mtdparts
default", of which we have a handful and most of that handful also do it
to then make use of the partition table within U-Boot (dfu, or update
the on-flash U-Boot).  Of those, it might make most sense to poke the
maintainer directly on how to proceed.

--=20
Tom

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFLgrYACgkQFHw5/5Y0
tyy+cwwAqLXoK9RybAFofNToNaA2whDOcUqmfBrCTYfvT0jyQKeYoWbSoVrfNomc
oCSXUbxiNneBbdtK1HXi80FasbhYiJ0TSCg1l04yy4jUU43QGNIVywvbg3VUtQmf
FjWQrZ+PkLRYaS6F/XFqLT/oS2s616tvnqpKeLxZuJ1bLFV+SrhacbEbD2PQ20i8
vnq2fz+ISvQqCdj+E2gzFfG/UQi7aZaODbpIpSKXJVVgccSQw3fxkBr3YSudLT5a
GNYdxhA1pE8cTObDfgcHdzO0iBEb1MRTyk/Qo1K+c3FUR0iL0udAPDDpgwz92obZ
nuiiZohCgLWNBvfzfL924q9xF1FKMc0dHTuGINmDS0FGk2/jBkdzQ8q23HcT1IZ3
jT8kDmFwwj3ofSYYBDDo/GzlFFpuBHu8mAoBEL7v2d8O2mLmhXnXqXkW2dsphsCA
cHEQbkx3NF2JhWCa5JBrCBAAYSprono1VsQCXGuJnYkPmuyLomVjKES7XDtMkoBj
cdfdKdyf
=7EXa
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--

--===============5164745002663749759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5164745002663749759==--
