Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC15AED11
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Sep 2019 16:33:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46498C36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Sep 2019 14:33:21 +0000 (UTC)
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
 [209.85.161.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57CE5C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2019 14:33:20 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id u65so809922ywe.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2019 07:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3hFqcJTe1INjtW22MD4YgTzpiwkYU3W9pr8yvYM2Grc=;
 b=WO1SvPijKvmjIOz3+KyvdPeUlkx7A9qT7N+856y/oZh9sHi1aUW/7se6xThH6Ngfn1
 iCSinyR58DisPyYgujv3MGpMjX9pT+XBBUGb3cicYFEeTx8dIgeANW2n8DzpbpcZVAf/
 avBr7FB9fxK/am+BcQSSQNStqMGTI/8P1rrUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3hFqcJTe1INjtW22MD4YgTzpiwkYU3W9pr8yvYM2Grc=;
 b=JuPmYmKIrUJ5fuT5jZIWZ8aUZ2c4NGq84QOFarl2hfrkbA7+AwSwDp95cKjF5l24o7
 UeU+XIc7z5TPd2XfV92PGGeZcgdWTTXladhgqI8tGcbvnYDafnuzJhEXBIsDlmyHSZtU
 ZkrBBU0l3k9qreySWRLgy6JFSIyM3UOtk4FeS8cGkaOxvPltfZHm+5AQNjm35FloZyX9
 OjVXpEDxhfoFtV1PHIo5VMUrqGb4P0yzkzLk0AOeG0gQhbvBlPk4p+GUobWcPbv4e8au
 zbMctEZJMBYKFQvQ4+c67WhF/myTmI//ekpF5xAfSR05vu+abxUI5N4RfmR9cXu7ffED
 UD5Q==
X-Gm-Message-State: APjAAAXX4OfhEmB/kF9HWfZvhP2n6ldXl7Y4b/FLEXTQv+YM9E6mrMnK
 +tjmONtKs1lTnoQ0k0+ffvkW+Q==
X-Google-Smtp-Source: APXvYqw8VlMJIDpsOOLNH/sSqAHjXSMga3ABxdAOSGsTcG0nPkxAx9aX5VaWrtXDNj0+eJuxjU0Jhw==
X-Received: by 2002:a81:2953:: with SMTP id p80mr21805536ywp.249.1568125998818; 
 Tue, 10 Sep 2019 07:33:18 -0700 (PDT)
Received: from bill-the-cat
 (cpe-2606-A000-1401-87B6-2482-2E2E-22DC-AB6F.dyn6.twc.com.
 [2606:a000:1401:87b6:2482:2e2e:22dc:ab6f])
 by smtp.gmail.com with ESMTPSA id a130sm3848948ywc.81.2019.09.10.07.33.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Sep 2019 07:33:16 -0700 (PDT)
Date: Tue, 10 Sep 2019 10:33:14 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20190910143314.GW6927@bill-the-cat>
References: <1567530547-14331-1-git-send-email-patrick.delaunay@st.com>
 <20190907115149.42B2624009F@gemini.denx.de>
 <9c7801afb8c94c638933cf33746ae300@SFHDAG6NODE3.st.com>
MIME-Version: 1.0
In-Reply-To: <9c7801afb8c94c638933cf33746ae300@SFHDAG6NODE3.st.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Hamish Guthrie <hamish.guthrie@kistler.com>, Wolfgang Denk <wd@denx.de>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>, Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH] env: Add CONFIG_ENV_SUPPORT
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
Content-Type: multipart/mixed; boundary="===============5989806294136709658=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5989806294136709658==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GGxZz/e2pmGePzrA"
Content-Disposition: inline


--GGxZz/e2pmGePzrA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2019 at 11:01:18AM +0000, Patrick DELAUNAY wrote:
> Hi,
>=20
> > From: Wolfgang Denk <wd@denx.de>
> > Sent: samedi 7 septembre 2019 13:52
> >=20
> > Dear Patrick,
> >=20
> > In message <1567530547-14331-1-git-send-email-patrick.delaunay@st.com> =
you
> > wrote:
> > > Add a new flag CONFIG_ENV_SUPPORT to compile all the environment
> > > features in U-Boot (attributes, callbacks and flags). It is the
> > > equivalent of the 2 existing flags
> >=20
> > I think this is a bda name, as it is misleading.  It sounds as if it is=
 used to enable
> > the support of environment vaiables at all, which it does not - instead=
 it only
> > enables / disables a few specific extended features.  This must be refl=
ected in the
> > name.
>=20
> Yes, I use the name than SPL/TPL to use the macro CONFIG_IS_ENABLED(...)
>=20
> And I agree the name seens not perfect.
>=20
> > > - CONFIG_SPL_ENV_SUPPORT for SPL
> > > - CONFIG_TPL_ENV_SUPPORT for TPL
>=20
> These pre-existing name are defined in common/spl/Kconfig
>=20
> With the same issue (env/common.o env/env.o are always compiled for SPL/T=
PL
> so it is alo bad names)
>=20
> > This scares me.  Why are there different settings for SPL, TPL and U-Bo=
ot
> > proper?  This looks conceptually broken to me - if a system is configur=
ed to use a
> > specific set of environment features and extensions, then the exact sam=
e settings
> > must be use in all of SPL, TPL and U-Boot proper.
> >=20
> > I understand that it may be desirable for example to reduce the size of=
 the SPL by
> > omitting some environment extensions, but provide these in U-Boot prope=
r, but
> > this is broken and dangerous.  For example, U-Boot flags are often used=
 to
> > enforce a certain level of security (say, by making environment variabl=
es read-
> > only or such).
>=20
> I agree, that scare me also.
> For me also ENV_SUPPORT should be always enable for U-Boot.
>=20
> My preferred proposal was only to solve the regression introduced by my i=
nitial patch and=20
> always set change_ok for U-Boot proper (when CONFIG_SPL_BUILD is not defi=
ned):
>=20
> struct hsearch_data env_htab =3D {
> - #if CONFIG_IS_ENABLED(ENV_SUPPORT)
> -        /* defined in flags.c, only compile with ENV_SUPPORT */
> +#if !defined(CONFIG_SPL_BUILD) || CONFIG_IS_ENABLED(ENV_SUPPORT)
> +        /* defined in flags.c, only compile with ENV_SUPPORT for SPL / T=
PL */
>          .change_ok =3D env_flags_validate,
>  #endif
>  };
>=20
> http://u-boot.10912.n7.nabble.com/U-Boot-Environment-flags-broken-for-U-B=
oot-tt382673.html#a382688
>=20
> The same test is already done in:
>=20
> drivers/reset/reset-socfpga.c:47:#if !defined(CONFIG_SPL_BUILD) || CONFIG=
_IS_ENABLED(ENV_SUPPORT)
> drivers/input/input.c:656:#if !defined(CONFIG_SPL_BUILD) || CONFIG_IS_ENA=
BLED(ENV_SUPPORT)
>=20
> > The same level of handling and protection must also be maintained in SP=
L and
> > TPL.
>=20
> if I understood correctly the proposed dependency is :
> 	TPL ENV_SUPPORT select SPL_ENV_SUPPORT
> 	SPL ENV_SUPPORT select ENV_SUPPORT
>=20
> > So please reconsider this whole implementation, and make sure that only=
 a single
> > macro ise used everywhere to enable these features.
>=20
> But, if I use the same CONFIG for the 3 binary SPL,TPL and U-Boot,
> l increase the size of TPL/SPL for all the platforms when these additiona=
l features are not needed.
>=20
> And I am not the sure of the correct dependency for ENV between binary.
>=20
> Heiko what is you feedback on Wolfgang remarks....
>=20
> Do you think that I need to come back to the first/simple proposal ?

My two cents is that I would like to see a regression fix "soon" and for
this release, and some corrections / updates to names, what is/isn't
possible to enable (keeping in mind what is desirable to allow) for the
next release.  Thanks all!

--=20
Tom

--GGxZz/e2pmGePzrA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJdd7QpAAoJEIf59jXTHXZSgWAP/ik/DaE69FfbeF4cXgpx3w+9
LQESKsi3nXeQFzyLqlaY47LS72eYj+IR2eNOeU123tXvok36wL8RQx3WNQ9dUe+D
i23bpk1+JEGGkSl6uWkb7YP40lp+x8bRokqVk30SJxZOisvL2twHdx/tNFdeBdEj
kRf5Iv3S3Q0tPVdZsjInxlII5zAgeoeBLsEI1tLpv82/LYJBkrDcI+bWzIMDhxKI
N+cwiD3gsjzgr4TZCPEiLDnPCjHHU3drk5Z+Low0Tv3bRMAW4+veueHb2tqMCZvG
tI2Jcy9ogOkCgkKYKN7cInyNCWCqEeuTCLxPQCaC/RfYGah4XQcpYV8NjACsKIdr
byJ0yc3hUFNtfp0lwfmzOovBRsD7wzAYkM36S9zxcHNd5Ir++EQS2jfBVJZ9jMZn
umV8HAQGl/55K87dKxQtiBDMtULjgEKIkem7Ts4FV6pRRkZjA9PgynuJEgRUfH09
lFkE0RRIhDLPhBRs0YBrmhQnTHdzlddQIful+0yCwjbaXosBFEsj+Ttx9oMg9BXc
z2mwz/6XysBssdHsFaBuNe5TupLUaujzbokeayK+0HlBgMj3tAbSiO3mgM0EqrUl
KgZJSVpEH4c2Vc5faify7MjLkdvsT7vI3BHeffcTsN5CYoStnrQ4bxx+9YgL40FW
9qkDDBI1EnaVL4b96xqF
=OgPe
-----END PGP SIGNATURE-----

--GGxZz/e2pmGePzrA--

--===============5989806294136709658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5989806294136709658==--
