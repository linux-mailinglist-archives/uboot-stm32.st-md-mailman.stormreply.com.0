Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F2761528B
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Nov 2022 20:48:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F534C64104;
	Tue,  1 Nov 2022 19:48:39 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAAD5C64101
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Nov 2022 19:48:38 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id k4so7434693qkj.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Nov 2022 12:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LI5KlsqBq8EGgBbHncHgY9bHSbSD6QDwjNKUvYY2Jrs=;
 b=UGWIqktByKRY+grKftFto8DxIlyFjupwR9cpK0UxkbW1vHLCRhQI0xfV/dbZB+xlb2
 AvAMEAenSi0tnwCBK4q4zNdCI1C7gAhd633aP9mhcnNu9Lhw/foE5w0cDeBTt8OTHfH8
 ZKIT9YFohrB9LfucObk/Wtt+kl1HyWokmfzGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LI5KlsqBq8EGgBbHncHgY9bHSbSD6QDwjNKUvYY2Jrs=;
 b=qnJlfwa7LRoKH9rUMLYAXXq0pCnMPLr0UhftcQDEQwgIkGYH+uZNgZYJ4cqwrxq901
 jAB4YK/IYRNHEMHfSwkbu95QA/ezIciyj3aJx7UPcJPznl/Xw6HAMUvIQ62ecmPmM4wL
 DUQrD7G2lFuASW267hz53vf5PYKvxSgz9I/k9xGaCPNApfDrdJv/rj1JqfGMfOUvlOw6
 aH6P1CsvTSDA8f31U3P6N2Fq+twcEZ5r8Ii2w1XPCvF6ByoZO+WSRI0MxkrWCToeNDVH
 oNSZtRqZexJi63ygxi0K1GLl3yhpZp2S5tuLkwcOHxxQ2Tv85GEZR/KGpTMKGmH2txWQ
 gBRg==
X-Gm-Message-State: ACrzQf3bSwOxe6uEQ0KJ8vtwSl4MheikEox9nZn/cM4v+8bOSDuN3dUu
 /Xc4uqLcjPVrUT+QHBlavXFeoA==
X-Google-Smtp-Source: AMsMyM6ib3cof13N+xCdA+MDL/LsopFqetvoORYOcRpMcQwPrA5j7wkL8bIonJTPj5jyVJuY/avSgg==
X-Received: by 2002:a05:620a:211b:b0:6fa:319e:2eb with SMTP id
 l27-20020a05620a211b00b006fa319e02ebmr7729676qkl.451.1667332117641; 
 Tue, 01 Nov 2022 12:48:37 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-e15b-227c-17a8-c48a.res6.spectrum.com.
 [2603:6081:7b00:6400:e15b:227c:17a8:c48a])
 by smtp.gmail.com with ESMTPSA id
 cc8-20020a05622a410800b003a4cda52c95sm3697772qtb.63.2022.11.01.12.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 12:48:37 -0700 (PDT)
Date: Tue, 1 Nov 2022 15:48:34 -0400
From: Tom Rini <trini@konsulko.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Message-ID: <20221101194834.GK2116612@bill-the-cat>
References: <20221028161850.565610-1-max.oss.09@gmail.com>
 <20221028161850.565610-2-max.oss.09@gmail.com>
 <20221028164047.ljcy67r2itkkrkeb@pali>
 <CAEHkU3U_xmv6dHvtgSc8Eh0_x6zmdjRj3kVwaRaK2RYjqxST0A@mail.gmail.com>
 <20221101173504.25gdj4by7wqclvsv@pali>
MIME-Version: 1.0
In-Reply-To: <20221101173504.25gdj4by7wqclvsv@pali>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Max Krummenacher <max.oss.09@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, u-boot@lists.denx.de,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Adam Ford <aford173@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/1] Makefile: rework
	u-boot-initial-env target
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
Content-Type: multipart/mixed; boundary="===============7253941220288365131=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7253941220288365131==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JsZT+zyIIjunjBOn"
Content-Disposition: inline


--JsZT+zyIIjunjBOn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 01, 2022 at 06:35:04PM +0100, Pali Roh=E1r wrote:
> On Monday 31 October 2022 11:51:45 Max Krummenacher wrote:
> > On Fri, Oct 28, 2022 at 6:40 PM Pali Roh=E1r <pali@kernel.org> wrote:
> > > On Friday 28 October 2022 18:18:49 Max Krummenacher wrote:
> > > >  quiet_cmd_genenv =3D GENENV  $@
> > > > -cmd_genenv =3D $(OBJCOPY) --dump-section .rodata.default_environme=
nt=3D$@ env/common.o; \
> > > > -     sed --in-place -e 's/\x00/\x0A/g' $@; sed --in-place -e '/^\s=
*$$/d' $@; \
> > > > -     sort --field-separator=3D=3D -k1,1 --stable $@ -o $@
> > > > +cmd_genenv =3D \
> > > > +     scripts/printinitialenv | \
> > > > +     sed -e 's/\x00/\x0A/g' -e '/^\s*$$/d' | \
> > >
> > > I think that you do not need this sed anymore as you print newline in
> > > host tool.
> >=20
> > Missed that one, will change in a V3.
> >=20
> > >
> > > > +     sort --field-separator=3D=3D -k1,1 --stable -o $@
> > > >
> > > >  u-boot-initial-env: u-boot.bin
> > >
> > > It is needed to update dependencies for u-boot-initial-env target. Now
> > > it does not depend on u-boot.bin but rather on printinitialenv tool.
> >=20
> > I'm unsure if that is the best way forward. The initial solution would
> > also not need to depend on u-boot.bin but rather on env/common.o.
>=20
> Yea, it was wrong too.
>=20
> > I guess that the intention was that the U-Boot binary and the
> > u-boot-initial-env file should not be out of sync.
>=20
> This is not possible to achieve with Makefile build system and is
> probably also against the logic of make to achieve the best parallelism
> during build of the project.
>=20
> In _my_ opinion, Makefile targets should have correct dependencies, on
> which they depend. This will prevent circular dependences and also
> faster building as make tool can run in parallel as much jobs as
> possible -- and do not have to wait until main u-boot.bin is built and
> then call other jobs.
>=20
> Tom, or do you think something different?

Well, this tool has the same environment requirements as tools/env does,
so we should be able to use the same dependency info?

--=20
Tom

--JsZT+zyIIjunjBOn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmNheAUACgkQFHw5/5Y0
tyy1bQv9FDlD1vLhMA8uheAEDPXELd1PhC1fYBzgXTZkvmdjPVfYUW8TeCXjtAFP
5eUVWKjm7fdxHBbAk4K90ez1dEVtXC8I5V0F8TclWgE+RQyJ7XWJPL/96iCVcp3m
cqnKQkxprKhRq6verY+NHpaIYk+lm+1kJe+YcImQ0dGJ2xApzNloRBoRLVZlLlMC
UEF17l0zFOglzw5MI9vyhJ0uIjjrlym68Nwt9wRfN8QeIVxOUJrEP/HyOev1W0ae
Jcjo76urdHEjPgCzGwqFRmBXZ0u+SRlx5VdaJOfNHuY+UevqxTfXy+SAVZ1SdDFi
BeBE5/WY1KPeW1gGchvCqajC6MF8VeWKCJs7UKOP9gA//UJAvdbBCaC4BSnaaqkq
0xmaWkTKI8gWcRdNkH8awCLDzHhX6DTTg3eda1+lU2xxbCyj6yhR7H3ClgpQmYDT
LO8+L0xJtDhGDJvDQtbZGC4vPSQKHUb0nC74yoiQi07WroNT7Eg+V+FtK9ge129i
QO9yLwld
=aRuD
-----END PGP SIGNATURE-----

--JsZT+zyIIjunjBOn--

--===============7253941220288365131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7253941220288365131==--
