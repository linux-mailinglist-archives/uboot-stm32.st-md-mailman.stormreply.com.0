Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B897660230
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Jan 2023 15:31:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 102D5C69060;
	Fri,  6 Jan 2023 14:31:53 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46936C6905D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Jan 2023 14:31:51 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-14455716674so1681779fac.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Jan 2023 06:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IWkpyc94ZEkziBc/CWJYTftsoBHYteNQowR2bp9dGFI=;
 b=iFPL3tp1WIz2pm9EgXpQcwgTf3sJSf9fwWWcklZCSIs90cfx62aJCqQSjCJwhckcrH
 9o3I3VhdyrYxHr16B/C1mi/m2UUEAf86if9vOPMDBF/s1K4RGosGwFala9Lc+m4dt039
 2aHZmwx0aUTVoK7UnrtkO2GEaj+D1zGzmeVjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IWkpyc94ZEkziBc/CWJYTftsoBHYteNQowR2bp9dGFI=;
 b=PwzSzktgb7ECBaZWFe+6k6HsHuqghldotXe+cU++glAdYSph13WQo3CDPAD72CIeze
 Ec0pjBjegoKYAHupVNl6o8bzfb1HHih6px4ek9X0ZXuHSyJUN+vu1S6ikT/bNqR2gOuA
 Qr+rxlTXBLOjVb2uq2ZHbr4Jx0WY0SMYVfQ3O8RJRYznDzPH+HI4ipuV19sLV6u4RKKx
 ffuBbpnKZoXLoqkwspTEL2shZe2DIJmU/0eO1LLFHZID7HX6aKFeVbfGpfrgjVJnafm0
 jwfvy76WN9iW+Sqln95nDu8vE6BtUqgdJYSkbAGyS4DNoIWXJ/8eKJ6x+z/j3pSaqIoS
 82YQ==
X-Gm-Message-State: AFqh2kpcbW0/WqTC5QsbqXxtFrl/ayedYBA+nDjg0sHH0SMzJnTGw39I
 AuhlBDwlnf53LIQHdgXSVGQW3Q==
X-Google-Smtp-Source: AMrXdXv2dqcBvpN8wKjQ2syEOZARh0kmcGHrWokytnjHKg2sYCbbHYdPCtl7zZV0aRduSX3NECvhEA==
X-Received: by 2002:a05:6870:cb89:b0:150:22c6:fd76 with SMTP id
 ov9-20020a056870cb8900b0015022c6fd76mr18319199oab.51.1673015510023; 
 Fri, 06 Jan 2023 06:31:50 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-9162-adb5-1773-34c0.res6.spectrum.com.
 [2603:6081:7b00:6400:9162:adb5:1773:34c0])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a05620a140f00b006fc92cf4703sm564149qkj.132.2023.01.06.06.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 06:31:49 -0800 (PST)
Date: Fri, 6 Jan 2023 09:31:47 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <20230106143147.GT3787616@bill-the-cat>
References: <20221215101547.1.Ic4654626494193d6dd4788d14fda0aae447783a5@changeid>
 <20230103203504.GM3787616@bill-the-cat>
 <89f414c5-306d-8a10-9a72-f32381ec593e@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <89f414c5-306d-8a10-9a72-f32381ec593e@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Simon Glass <sjg@chromium.org>,
 Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] fastboot: remove #ifdef CONFIG when it is
	possible
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
Content-Type: multipart/mixed; boundary="===============3743734942634888470=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3743734942634888470==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3htBo1rOA9RgrIkJ"
Content-Disposition: inline


--3htBo1rOA9RgrIkJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 05, 2023 at 12:37:58PM +0100, Patrick DELAUNAY wrote:
> Hi Tom,
>=20
> On 1/3/23 21:35, Tom Rini wrote:
> > On Thu, Dec 15, 2022 at 10:15:50AM +0100, Patrick Delaunay wrote:
> > > Much of the fastboot code predates the introduction of Kconfig and
> > > has quite a few #ifdefs in it which is unnecessary now that we can use
> > > IS_ENABLED() et al.
> > >=20
> > > Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> > > ---
> > >=20
> > >   cmd/fastboot.c                  |  35 +++++------
> > >   drivers/fastboot/fb_command.c   | 104 ++++++++++++-----------------=
---
> > >   drivers/fastboot/fb_common.c    |  11 ++--
> > >   drivers/fastboot/fb_getvar.c    |  49 ++++++---------
> > >   drivers/usb/gadget/f_fastboot.c |   7 +--
> > >   include/fastboot.h              |  13 ----
> > >   net/fastboot.c                  |   8 +--
> > >   7 files changed, 82 insertions(+), 145 deletions(-)
> > >=20
> > > diff --git a/cmd/fastboot.c b/cmd/fastboot.c
> > > index b498e4b22bb3..b94dbd548843 100644
> > > --- a/cmd/fastboot.c
> > > +++ b/cmd/fastboot.c
> > > @@ -19,8 +19,14 @@
> > >   static int do_fastboot_udp(int argc, char *const argv[],
> > >   			   uintptr_t buf_addr, size_t buf_size)
> > >   {
> > > -#if CONFIG_IS_ENABLED(UDP_FUNCTION_FASTBOOT)
> > > -	int err =3D net_loop(FASTBOOT);
> > > +	int err;
> > > +
> > > +	if (!CONFIG_IS_ENABLED(UDP_FUNCTION_FASTBOOT)) {
> > > +		pr_err("Fastboot UDP not enabled\n");
> > > +		return CMD_RET_FAILURE;
> > > +	}
> > > +
> > > +	err =3D net_loop(FASTBOOT);
> > >   	if (err < 0) {
> > >   		printf("fastboot udp error: %d\n", err);
> > > @@ -28,21 +34,21 @@ static int do_fastboot_udp(int argc, char *const =
argv[],
> > >   	}
> > >   	return CMD_RET_SUCCESS;
> > > -#else
> > > -	pr_err("Fastboot UDP not enabled\n");
> > > -	return CMD_RET_FAILURE;
> > > -#endif
> > >   }
> > This probably needs to become an if (CONFIG_IS_ENABLED(...)) { ... }
> > else { ... } in order to remain size-neutral.
>=20
>=20
> Are you sure ?
>=20
>=20
> {
> =A0=A0=A0 if (!CONFIG_IS_ENABLED(UDP_FUNCTION_FASTBOOT)) {
> =A0=A0=A0 =A0=A0=A0 ....
> =A0=A0=A0 =A0=A0=A0 return CMD_RET_FAILURE;
> =A0=A0=A0 }
>=20
> =A0=A0=A0 ....
>=20
> =A0=A0=A0 return CMD_RET_SUCCESS;
> }
>=20
>=20
> For me, it is exactly the same size after compiler/linker than :
>=20
>=20
> {
> =A0=A0=A0 if (!CONFIG_IS_ENABLED(UDP_FUNCTION_FASTBOOT)) {
> =A0=A0=A0 =A0=A0=A0 ....
> =A0=A0=A0 =A0=A0=A0 return CMD_RET_FAILURE;
> =A0=A0=A0 } else {
> =A0=A0=A0 ....
> =A0=A0=A0 =A0=A0=A0=A0=A0 return CMD_RET_SUCCESS;
>=20
> =A0=A0=A0 }
>=20
> }
>=20
>=20
> if UDP_FUNCTION_FASTBOOTis activated or not....
>=20
> or I forget something during the Christmas break.

If you've size-tested and it's the same, OK. I'm just worried about
strings not being discarded since that's sometimes an unexpected side
effect / bug.

--=20
Tom

--3htBo1rOA9RgrIkJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmO4MMwACgkQFHw5/5Y0
tyzjqQv/Yhx+gbFZeSa7hnAG8O7d22iEL4g0SBy7dZ8uBG1xUQGHJ2LTcKf65/FT
SJEqDofG69Bhb4x+Ag+oP8EpH4kPSip/HFjH/rSsO6RvD2QR+ljZh80Agoq62AdI
FtzZyfAs32ZsAP2uLcbCIWce4wqCB3j1pZfbR32ryoxHVqFvwQV+8GX6t0sOP7ML
O4UGU6JzDta0PLnlxV6jOxzIPJ/FuPXL1tBVf2GqC29z1HhKOyI/Foc5hRhQnbli
ShHSIOvQ7/5fG9kDwFTqwXhLFxv8ucQmNWaWzKckyv8AfwUS4EitOm1q/HTYfr+d
s9dl5CqkeIHkoiOnVL0v9U0SSzpQU5so5DAJJipoe4d9HeBvtTLvgmroh/bIgWuS
21GY1FjrHx/JinshhLjlylBR+og1aaXowLeBssfecM3AiUjhOLAJGXx/yJbYullA
16Qm57wciMlY01yk9433eU+HyaLnTWKOR48rOTeKjGfj3sIaAh3qg5FYffe5WA4O
1k6LEF8l
=tnvp
-----END PGP SIGNATURE-----

--3htBo1rOA9RgrIkJ--

--===============3743734942634888470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3743734942634888470==--
