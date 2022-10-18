Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DA6603229
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Oct 2022 20:17:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15431C64104;
	Tue, 18 Oct 2022 18:17:29 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80889C64101
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Oct 2022 18:17:27 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id a24so10192362qto.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Oct 2022 11:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Awl1lDvF/+oKlVlyXni3Wsyx9JuLpWQrSv+/b/lt68Y=;
 b=YG4ygijfaPsYLHvWelC339Zd8CrSH86dXHHdf1tdw0pHcedZzhqwwxVT1wfBZPsoU3
 CX8N66X19+Vq9CbWRDo4qT244K7up3Bo+AiOORIk/GAA7QLk1+jcVFFjbr2fqFeJKwDP
 VXe7XbTWgndMZCIbjyZLQV4meQd02y9L0Jo14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Awl1lDvF/+oKlVlyXni3Wsyx9JuLpWQrSv+/b/lt68Y=;
 b=K97/hKSIFbG5cSm6XWTRKedylQcAlDZ9BuadryyT48gByralsF7BlzioFkmLIEbIjG
 mbfUIuQlBZieq0Vt//PaJKXLluwKPMMemszbHNR6Q82DEX6PvYrJ/+tEjRD40njbLGU3
 vSk/sXcEY2RNAy7SKym+06bcl7vT0wDKVT7/TCJKdwmtLv8MfHKh/AJFy+slIwy8Lys3
 jbAhtxbvl67Ed7PMzVowasf4iU3jU7f6z97rfWHai0Cwsgr6QanuiZT57uC5JBzIp43X
 9jJguvX/gxN/5CRPLzJpeC+eX1M+3/DWu+aIJrG1eG3uQCEWpipM28fhmA0nGyP1sc3A
 hrhA==
X-Gm-Message-State: ACrzQf3ziDhAnubAjHw0KWnhztcEo8lHa/8k3G/CTOfsjAkVrXhXXRdr
 uw1RxSBWPATeQAkLpn8lYvoNVg==
X-Google-Smtp-Source: AMsMyM7U7YwtZJUzbunaa3hFKlH80hHjxNEA5FLh4gXF9be+GwmQKFAwVjB/Tf0uqjkOt4S1g3KrHA==
X-Received: by 2002:ac8:4e53:0:b0:39c:eec4:373f with SMTP id
 e19-20020ac84e53000000b0039ceec4373fmr3087534qtw.617.1666117046380; 
 Tue, 18 Oct 2022 11:17:26 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-9c58-0588-a5a5-a6b0.res6.spectrum.com.
 [2603:6081:7b00:6400:9c58:588:a5a5:a6b0])
 by smtp.gmail.com with ESMTPSA id
 5-20020a370805000000b006ec09d7d357sm2798947qki.47.2022.10.18.11.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 11:17:25 -0700 (PDT)
Date: Tue, 18 Oct 2022 14:17:23 -0400
From: Tom Rini <trini@konsulko.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Message-ID: <20221018181723.GQ2020586@bill-the-cat>
References: <20221018174827.1393211-1-max.oss.09@gmail.com>
 <20221018180331.sgsufsip2p2544ip@pali>
 <20221018180446.GP2020586@bill-the-cat>
 <20221018180627.eezooyqb2yyhyodu@pali>
MIME-Version: 1.0
In-Reply-To: <20221018180627.eezooyqb2yyhyodu@pali>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Max Krummenacher <max.oss.09@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, u-boot@lists.denx.de,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Adam Ford <aford173@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] Makefile: fix u-boot-initial-env target
	if lto is enabled
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
Content-Type: multipart/mixed; boundary="===============7317400004623769039=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7317400004623769039==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="93p3Mfsbf6DTJ78q"
Content-Disposition: inline


--93p3Mfsbf6DTJ78q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2022 at 08:06:27PM +0200, Pali Roh=E1r wrote:
> On Tuesday 18 October 2022 14:04:46 Tom Rini wrote:
> > On Tue, Oct 18, 2022 at 08:03:31PM +0200, Pali Roh=E1r wrote:
> > > On Tuesday 18 October 2022 19:48:27 Max Krummenacher wrote:
> > > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > > >=20
> > > > With LTO enabled the U-Boot initial environment is no longer stored
> > > > in an easy accessible section in env/common.o. I.e. the section name
> > > > changes from build to build, its content maybe compressed and it is
> > > > annotated with additional data.
> > > >=20
> > > > For GCC adding the option '-ffat-lto-objects' when compiling common=
=2Eo
> > > > adds additionally the traditional sections in the object file and
> > > > 'make u-boot-initial-env' would work also for the LTO enabled case.
> > > > However clang doesn't have that option.
> > > >=20
> > > > Fix this by recompiling common.o into a object file only used for
> > > > the creation of u-boot-initial-env if LTO is enabled.
> > > >=20
> > > > See also:
> > > > https://lore.kernel.org/all/927b122e-1f62-e790-f5ca-30bae4332c77@fo=
ss.st.com/
> > > >=20
> > > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > >=20
> > > > ---
> > > >=20
> > > >  Makefile | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >=20
> > > > diff --git a/Makefile b/Makefile
> > > > index 3866cc62f9a..cd45c720d23 100644
> > > > --- a/Makefile
> > > > +++ b/Makefile
> > > > @@ -2451,9 +2451,17 @@ endif
> > > >  	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
> > > > =20
> > > >  quiet_cmd_genenv =3D GENENV  $@
> > > > +ifeq ($(LTO_ENABLE),y)
> > > > +cmd_genenv =3D $(CC) $(filter-out $(LTO_CFLAGS),$(c_flags)) -c -o =
env/initial_env.o env/common.c; \
> > > > +	$(OBJCOPY) --dump-section .rodata.default_environment=3D$@ env/in=
itial_env.o; \
> > > > +	sed --in-place -e 's/\x00/\x0A/g' $@; sed --in-place -e '/^\s*$$/=
d' $@; \
> > > > +	sort --field-separator=3D=3D -k1,1 --stable $@ -o $@; \
> > > > +	rm -f env/initial_env.o env/initial_env.su
> > > > +else
> > > >  cmd_genenv =3D $(OBJCOPY) --dump-section .rodata.default_environme=
nt=3D$@ env/common.o; \
> > >=20
> > > This code is still broken because in some cases section name is not R=
O.
> >=20
> > Wait, when does that happen?
>=20
> E.g. for mvebu_espressobin-88f3720_defconfig

Erm, ugh. I see 44be835d25ba ("arm: mvebu: Espressobin: Set default
value for $ethNaddr env variable") and c4df0f6f315c ("arm: mvebu:
Espressobin: Set default value for $fdtfile env variable") I guess we
couldn't solve this any other way? The platforms aren't unique in
needing / wanting to set MAC or fdtfile variables.

--=20
Tom

--93p3Mfsbf6DTJ78q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmNO7agACgkQFHw5/5Y0
tyxRNwv+P1ogdMEM3a0cSecDzjQfPN+QWAT4+ivm301c+jZC89Rj+ft4m5bzD2vw
uUGSGuVN4JHnPTmJI6qpWe9/dpj0+aIzKCkEiTTsGgfIQJgNBlK/S9Uor/uiZNy8
xOoJiaKDXPKD27Gid2Lnb+4k5Qa7xbBO3pafSRXXMZi1+EeAUhGbmsm4m7WseHR7
dsA7tjv4mx2eHAcYrpCEs2o+Yqf2BTL8pYA0aPaT4OJgVovJZDRTPLcEtV3MiFVR
kf4tSp5m35a9Ou24eTVWy8q4HqRqvSD20dB+j4vejHzH4xFdTO/OL/6DjdLoXNP5
h7oiUoHkS/ZTaKxXlDVdSWMgrHxgkKUel+IqORATiORXsd5hpJ6nUyKVHg8+JJFN
vrfn1yS3FDs/2lPYHBlIA5zietQ/C1uF4F+t0/yMR7TYhD//ksZ7cp3UiBDIjUzc
GMoDpg/OOjpcBW9rFgsjqS8iAN8PGcGE8dlynJvFNLmVRiRzBT7LrvmxQF8IkRxU
ndMUxgRg
=JR11
-----END PGP SIGNATURE-----

--93p3Mfsbf6DTJ78q--

--===============7317400004623769039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7317400004623769039==--
