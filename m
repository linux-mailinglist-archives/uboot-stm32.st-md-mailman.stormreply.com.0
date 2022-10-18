Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 898206031F3
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Oct 2022 20:04:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F5E5C64104;
	Tue, 18 Oct 2022 18:04:51 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51733C64101
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Oct 2022 18:04:50 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id l28so10183592qtv.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Oct 2022 11:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VzsYmiql7pS464nKxjAU7gMi/YTHzywjx7vQzn8BvgE=;
 b=ID6wpETtVZc86ZCELoNspA57pcdA2uqOj17CJy9ZNpF3tazi+KOXi4COy8cmjgE2YN
 ZG41jDoZwpiavksoFY4VzpX9iXvdMSBa2SxYlNXZcopY6uVdEuDhoreTtvpH3xuuQnrD
 VJG8b2F/h55cS5y4irrAERoaG3gDQx3T12SBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VzsYmiql7pS464nKxjAU7gMi/YTHzywjx7vQzn8BvgE=;
 b=H3P9N5B/+GxgYGljyANFcPlOilQVObRwmMeJU2Aa/gnLTPBcWb8eR0Avyp5VAH9sa/
 zQWIMM0U+T+d0qHgG5yiFt6XfcpOuoLfyWx9vLawQmKTD4d8UliCf3veVNlXvdkSwNs9
 5rj8Put8SywBfWYTg5v0AMMmiDfBB9z7k349JnhwddLgKZJAjFj8InVX65xWQLinY2l+
 kOE7qtMXtMWHhgXKynVoc9pz/XWDll8vMDwv+yb9Ob7g490QOyvOWx7Oeki4LB6PXmCl
 GqzD2cwVAKHH0vBQDWm13SF+9koOc80JFUVJRi6lyL5evLeglMpu8SL9GvVnhQ9u8CXE
 o5Nw==
X-Gm-Message-State: ACrzQf3dgomrSIcq9pUJQHOCz7RcxkFMztfDhc8ljOiEqXzIN7xEREgQ
 ZiDVSbQeYz5zrKcBhKWqszIoDg==
X-Google-Smtp-Source: AMsMyM6Ql6+TzYo416rBAyJbR3xaFq2CNr8NcLc5IICoftsDNx1x2JTBl2nBixGbxEsQQs0NRhpUIg==
X-Received: by 2002:ac8:5dd3:0:b0:393:44ed:f9e6 with SMTP id
 e19-20020ac85dd3000000b0039344edf9e6mr3178970qtx.651.1666116289280; 
 Tue, 18 Oct 2022 11:04:49 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-9c58-0588-a5a5-a6b0.res6.spectrum.com.
 [2603:6081:7b00:6400:9c58:588:a5a5:a6b0])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a05620a405100b006cec8001bf4sm2943594qko.26.2022.10.18.11.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 11:04:48 -0700 (PDT)
Date: Tue, 18 Oct 2022 14:04:46 -0400
From: Tom Rini <trini@konsulko.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Message-ID: <20221018180446.GP2020586@bill-the-cat>
References: <20221018174827.1393211-1-max.oss.09@gmail.com>
 <20221018180331.sgsufsip2p2544ip@pali>
MIME-Version: 1.0
In-Reply-To: <20221018180331.sgsufsip2p2544ip@pali>
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
Content-Type: multipart/mixed; boundary="===============5538450792423584306=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5538450792423584306==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CpRwOJvrTIYkeTuO"
Content-Disposition: inline


--CpRwOJvrTIYkeTuO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2022 at 08:03:31PM +0200, Pali Roh=E1r wrote:
> On Tuesday 18 October 2022 19:48:27 Max Krummenacher wrote:
> > From: Max Krummenacher <max.krummenacher@toradex.com>
> >=20
> > With LTO enabled the U-Boot initial environment is no longer stored
> > in an easy accessible section in env/common.o. I.e. the section name
> > changes from build to build, its content maybe compressed and it is
> > annotated with additional data.
> >=20
> > For GCC adding the option '-ffat-lto-objects' when compiling common.o
> > adds additionally the traditional sections in the object file and
> > 'make u-boot-initial-env' would work also for the LTO enabled case.
> > However clang doesn't have that option.
> >=20
> > Fix this by recompiling common.o into a object file only used for
> > the creation of u-boot-initial-env if LTO is enabled.
> >=20
> > See also:
> > https://lore.kernel.org/all/927b122e-1f62-e790-f5ca-30bae4332c77@foss.s=
t.com/
> >=20
> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> >=20
> > ---
> >=20
> >  Makefile | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >=20
> > diff --git a/Makefile b/Makefile
> > index 3866cc62f9a..cd45c720d23 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -2451,9 +2451,17 @@ endif
> >  	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
> > =20
> >  quiet_cmd_genenv =3D GENENV  $@
> > +ifeq ($(LTO_ENABLE),y)
> > +cmd_genenv =3D $(CC) $(filter-out $(LTO_CFLAGS),$(c_flags)) -c -o env/=
initial_env.o env/common.c; \
> > +	$(OBJCOPY) --dump-section .rodata.default_environment=3D$@ env/initia=
l_env.o; \
> > +	sed --in-place -e 's/\x00/\x0A/g' $@; sed --in-place -e '/^\s*$$/d' $=
@; \
> > +	sort --field-separator=3D=3D -k1,1 --stable $@ -o $@; \
> > +	rm -f env/initial_env.o env/initial_env.su
> > +else
> >  cmd_genenv =3D $(OBJCOPY) --dump-section .rodata.default_environment=
=3D$@ env/common.o; \
>=20
> This code is still broken because in some cases section name is not RO.

Wait, when does that happen?

--=20
Tom

--CpRwOJvrTIYkeTuO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmNO6r4ACgkQFHw5/5Y0
tyzPxwv+PiyOgXnp3haLml9RB2ABFnc4M3hVuMpvK6S3WkL77r840QZT1cmjnYCy
QNSqPsuHJ2JzFbOZNLTSY3Qd6noJCWba7XDZeI+fARVbE5r2UHEFEQfIWs4YTk7V
Ez1Sr4YnVpvWJyoVGpjJyAUy6dyKPSm1i9edQR824revj7oPM9bDp2Asl0rm4ewo
oHikEpE/mEQ7BAdmkO7CiYrBI17/LfNGIZvV+fSIWZ9ie1uI/kKTqB+4md0/RPRJ
O2XH2OqyA3In/J/ztiy689B30O30goZvBphXvO1kn0Szzmn4BBjyI5aAw2I0DpmI
OZ5lyHjEBWIsGOj0lV9VGGK5n+vUfoP7B75Z9FHeJCbirb5UlMD/XBqiY4eYAfqQ
6vDO9ZiU7g7BOxoXjQaEFQ4DDl7yDvnXUK439rssdifyfPFF17clDe7UbgaXm7iO
UF9VGMH6O0QiNuCd8yIL5/saNNNcm1JciYJwTnyA0F1uY7s9g+YxVG7vzvd/L63U
0/+bIzFi
=Hn/R
-----END PGP SIGNATURE-----

--CpRwOJvrTIYkeTuO--

--===============5538450792423584306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5538450792423584306==--
