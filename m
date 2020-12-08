Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 957892D2F43
	for <lists+uboot-stm32@lfdr.de>; Tue,  8 Dec 2020 17:16:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 585AFC3FADA;
	Tue,  8 Dec 2020 16:16:37 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D40AAC32E90
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Dec 2020 16:16:35 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id k4so12269936qtj.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Dec 2020 08:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2CSxA4kmAvULrwIlrAhF5oQePCz3wvlWO5DNCfS3wms=;
 b=BSZDynJcdTSNmRzM5o51VKLDaq+KieFQhaky98nD40OtuvK+TkZUIUHgrLRrHP0CQj
 PsEP4+ABCD35B1BfkGHtLCTptRvrCRAjP1YG1scZzoc59m9pQn1FGzP8mZlq7gVlsT9Y
 Cl0BrcooGwLUPBXer0aI8YapqXBMuV9AbG/t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2CSxA4kmAvULrwIlrAhF5oQePCz3wvlWO5DNCfS3wms=;
 b=g5/rB6Rer7hfGMghJaf/RJchPVgA6pQ5v+EyDOcOF16JFgCshYQF+rizjrn4eNXXXO
 raWiwgxxrurjI1vgnJWTZH/t8TLlCUDzUsdPmkjgcbQ9hqqUi5BIw2z5P9OBpkesN6ly
 REPrZSAmfUMnmp7snw5yOIjF7ba2x4dmsLA1fZXX4nGusg93lxyEcHTbY+wlVVj/Nawr
 fLm80rSNojm4xtoiPovHZgcd1cnc6OYVW1ryfsIVThR6dte0mMx0yVkYf9OxrUPVamnn
 YQZZOIwpqDmJKVs3SJ7kcjW8fdaKN1ABYiMI0w/OoKOgJ3cQoUhg/7bSbekeTLnpOegr
 +Mkg==
X-Gm-Message-State: AOAM531LzIAGzzT7TIL+wP/Vpb0tAqR97oNR+YzHt/n5XL/RWQUfAsD5
 d9lrHW7bCL2+cnvX6+j6eI2i4A==
X-Google-Smtp-Source: ABdhPJyCd8fxKiFUtPJTvp/UePlyTnkabA/8QbahgeHTWHBeG9E7YIo57B8DGMV9EIBA/cSBJxeb9Q==
X-Received: by 2002:ac8:c8c:: with SMTP id n12mr31191783qti.32.1607444194410; 
 Tue, 08 Dec 2020 08:16:34 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-135-175.ec.res.rr.com.
 [65.184.135.175])
 by smtp.gmail.com with ESMTPSA id 195sm2576712qke.108.2020.12.08.08.16.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 08 Dec 2020 08:16:32 -0800 (PST)
Date: Tue, 8 Dec 2020 11:16:30 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
Message-ID: <20201208161630.GP32272@bill-the-cat>
References: <20201203091549.7031-1-patrick.delaunay@st.com>
 <9d8e34fa-cd69-f2ac-7d63-0b2da2e382f5@web.de>
 <f0bd0043f95b4364bde19d21902e09bd@SFHDAG2NODE3.st.com>
 <27f75682-4527-ffeb-24d3-420e7ff3bd35@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <27f75682-4527-ffeb-24d3-420e7ff3bd35@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Akshay Saraswat <akshay.s@samsung.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Bin Meng <bmeng.cn@gmail.com>, Yannick FERTRE <yannick.fertre@st.com>,
 u-boot@lists.denx.de, smoch@web.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] FW: [PATCH 0/6] video: remove VIDCONSOLE_AS_LCD
 and VIDCONSOLE_AS_NAME
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
Content-Type: multipart/mixed; boundary="===============7612805491883206437=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7612805491883206437==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rCIj71hy7h+QuE/p"
Content-Disposition: inline


--rCIj71hy7h+QuE/p
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 08, 2020 at 03:30:43PM +0100, Patrick DELAUNAY wrote:
> Hi Soeren,
>=20
> > From: Soeren Moch <smoch@web.de> Sent: dimanche 6 d=E9cembre 2020 20:59=
 On
> > 03.12.20 10:15, Patrick Delaunay wrote:
> >=20
> > > I propose this serie to remove the vidconsole work-around, activated
> > > with the 2 options VIDCONSOLE_AS_LCD and VIDCONSOLE_AS_NAME and
> > > cleanup the associated code in console.c (under #ifdef
> > > CONFIG_VIDCONSOLE_AS_LCD) This options are now obsolete and they was
> > > planned to be removed around the end of 2020. I propose this
> > > patchset for v2021.04 even if I don't test this serie on real
> > > boards.
> > >=20
> > I really would like to keep this code for now.
> >=20
> I propose to remove these options because they are indicated obsolete in =
the
> config description
>=20
> in drivers/video/Kconfig (I see it during code review):
>=20
> "This option will be removed around the end of 2020"
>=20
> But I have no issue to kept it.
>=20
> > On the tbs2910 board this workaround was introduced in the last u-boot
> > release (v2020.10), so there was almost no time for end users to notice
> > the warning and to update there environment. Not every end user installs
> > every new u-boot release, so we really should give more time for this
> > change.
> >=20
> I agree that for your project, with migration to DM_VIDEO it is a really
> short notice.
>=20
> =A0=A0=A0 commit 645d39aea367064868dcdd30c411806f4403b67b
>=20
> =A0=A0=A0 board: tbs2910: Fix video output with existing environments
>=20
> =3D> only integrated in v2020.10-rc2, sorry to miss it
>=20
> > This workaround is self-contained, small, easy to maintain, and strictly
> > opt-in. So this workaround hurts nobody, but removing this will let
> > users alone without any HDMI output. So on this board (without included
> > serial console port), this will result in unhappy users, especially
> > since without any console output there is no chance to get any idea what
> > is going wrong.
> >=20
> Initially, I proposed this patch to cleanup the console.c code with 2 oth=
er
> series:
>=20
> 1) http://patchwork.ozlabs.org/project/uboot/list/?series=3D218309
>=20
> =A0=A0=A0 "console: remove #ifdef CONFIG when it is possible"
>=20
> 2) http://patchwork.ozlabs.org/project/uboot/list/?series=3D218089
>=20
> =A0=A0=A0 "console: cosmetics: remove #if 0"
>=20
>=20
> And I just want just to remove the remaining "#ifdef CONFIG_...."=A0 in
> console.c
>=20
>=20
> But I agree that I need to change my proposal to remove this workaround c=
ode
>=20
> (it is only use to help the DM VIDEO migration for existing board)
>=20
> and change the release target.
>=20
>=20
> I propose to :
>=20
> - remove patch 1/6 of the serie for your board
>=20
> - no more remove the options in 6/6 but add warning in Makefile when the
> option is activated
>=20
> =A0 and change target in config desciption
>=20
>=20
> ifeq ($(CONFIG_VIDCONSOLE_AS_LCD),y)
> =A0=A0=A0 @echo >&2 "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D WARNING =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D"
> =A0=A0=A0 @echo >&2 "This board does use CONFIG_VIDCONSOLE_AS_LCD workaro=
und."
> =A0=A0=A0 @echo >&2 "Please update the existing user defined environments=
 before "
> =A0=A0=A0 @echo >&2 "v2022.01 release."
> =A0=A0=A0 @echo >&2 "Failure to update by the deadline may result in video
> console"
>=20
> @echo >&2 "issue when this woarkaround will be removed."
> =A0=A0=A0 @echo >&2 "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
> endif
>=20
> =3D> open point: which acceptable target to remove this feature ? v2022.0=
1 ?

This sounds like a good plan and reasonable date to me.  Anatolij?
Thanks!

--=20
Tom

--rCIj71hy7h+QuE/p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl/Ppt4ACgkQFHw5/5Y0
tyyhDwv+MDlIykzEV23t7P8bg1+lzY+PHyggz/w5CSd0BD0m2hgu1wLnzLth/8xO
0yiZqTEIwc3B9uVIoUOuW1SOhuYTIqCKz8rvNyNQReMc7cZmaHAtvYNWQ5A0ldwD
OUdKptxdG7MJfnFkRAXiOhud+k7QK4U7VMGjxxafyGzky0EKQ3fIaXJA8dd8b4Zf
rHOBrMmwosjKG42OjfTs+4uUPJpGJyU93jISmWDfULXWI5W4v0XByp2ujMrufYVf
agft4LKCiflnC78rxmPIz07iKuZWi4RG85oDt2Ah1ksMxRcrAiE+P0Cb1vj7PoAA
y0cYQvgcITLUuQoYI49fXF5cK+zm8ozAu2AA7qEMtHUOvFgIJBR0QUJPzdHfgxBP
PXOC0WBns/ny7YxtvdSn8CFNJ3X7L8RJT/nrdbbPLoTWYF8jM14kCHzFauEsix/J
PkQaZLNknIme398kDwXXDHSXGNgfUxNXWAFytUU8pwkZXYRnnosSdw7rzwejYdoQ
+I2/ickS
=CDso
-----END PGP SIGNATURE-----

--rCIj71hy7h+QuE/p--

--===============7612805491883206437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7612805491883206437==--
