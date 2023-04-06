Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1634E6D9C31
	for <lists+uboot-stm32@lfdr.de>; Thu,  6 Apr 2023 17:25:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0F0EC6A61E;
	Thu,  6 Apr 2023 15:25:32 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DF1CC6A603
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Apr 2023 15:25:31 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-536af432ee5so746689887b3.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Apr 2023 08:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1680794730;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HhTs7N8sBzxLOXhVGwsHS39gB8Hr41VLLqKhNtKOqJk=;
 b=iuMwPg/XeJRvxhq7R8aaP3Xyi98wRChLtnvzVfTvT9kAIKrZVN5WzjWiStWQPNJhQc
 O5d3Ry7cx8qRexJro/JHmR1ugf4Ov/04mNR17pJRoqYUGkO8ycLMYKPAUOhZ3wqzQsQT
 cdJu0POa6gJyqFb/sp/azKcqzgGm8XKfKamyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680794730;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HhTs7N8sBzxLOXhVGwsHS39gB8Hr41VLLqKhNtKOqJk=;
 b=kNcHUt6Zo9HXH6/jfXD9HgSspg+Ewz+pDWRNzzeOwkuHApVNWZFap8yEKIPfnCxmZu
 CWXY3VVrcs8A6uP4wXUFgIE9QVVIHSXpcaOjHP40Z+0lUoRqQWNaESoUGwKa3/tNMAOk
 s1H1HbhUilA4ENiepAKuqY7ti3s+z4hjBM5tAatAxlLDttqnqq16aLw1DnBXcc99bJ4g
 qvf7y16p9V/ncqryNZmLVtSOD5a7PsHmA0GsUdM3vtQdmbKJFsnQxsQsRGbJFlibaVTT
 i0HODCxLTsMzh0bVAnyJJIZxZ1fH/3buj79VyHfgzxbEkmoTGiJXS05MeIWG88o9fYc9
 lM2w==
X-Gm-Message-State: AAQBX9dzJLQdZHF9XphzCt0vyOpLeYZHU6mlCWbzAz2ndsS3ouXuSdpe
 U3DEUli9QW28WQDLn5Dbj/zVWw==
X-Google-Smtp-Source: AKy350YJcQIIpek4HurXXvrqP8DWJox6DtNKVGjqGjzvtOCavotr/U+fHWGe+bIldy3Fmcx1kKa/IA==
X-Received: by 2002:a81:8004:0:b0:54c:18c0:1810 with SMTP id
 q4-20020a818004000000b0054c18c01810mr1223618ywf.29.1680794729911; 
 Thu, 06 Apr 2023 08:25:29 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-acff-1005-f218-7c24.res6.spectrum.com.
 [2603:6081:7b00:6400:acff:1005:f218:7c24])
 by smtp.gmail.com with ESMTPSA id
 72-20020a810b4b000000b00545a08184bdsm368321ywl.77.2023.04.06.08.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 08:25:29 -0700 (PDT)
Date: Thu, 6 Apr 2023 11:25:27 -0400
From: Tom Rini <trini@konsulko.com>
To: Francesco Dolcini <francesco@dolcini.it>
Message-ID: <20230406152527.GE1134230@bill-the-cat>
References: <20230206224838.75963-1-francesco@dolcini.it>
 <20230206224838.75963-2-francesco@dolcini.it>
 <Y+GKi9MlruCvNZLZ@bill-the-cat>
 <ZCxNuw72/CrWSn6z@francesco-nb.int.toradex.com>
MIME-Version: 1.0
In-Reply-To: <ZCxNuw72/CrWSn6z@francesco-nb.int.toradex.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marex@denx.de>, Parthiban Nallathambi <parthiban@linumiz.com>,
 Nikita Kiryanov <nikita@compulab.co.il>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Simon Glass <sjg@chromium.org>,
 Niel Fourie <lusus@denx.de>, Enric Balletbo i Serra <eballetbo@gmail.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Javier =?iso-8859-1?Q?Mart=EDnez?= Canillas <javier@dowhile0.org>,
 Tim Harvey <tharvey@gateworks.com>, sbabic@denx.de
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] fdt: validate/fix cells count on
	mtdpart fixup
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
Content-Type: multipart/mixed; boundary="===============8072570734375466301=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8072570734375466301==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1J7vi1QPkFHP11/2"
Content-Disposition: inline


--1J7vi1QPkFHP11/2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2023 at 06:18:03PM +0200, Francesco Dolcini wrote:
> +Stefano
>=20
> On Mon, Feb 06, 2023 at 06:17:31PM -0500, Tom Rini wrote:
> > On Mon, Feb 06, 2023 at 11:48:36PM +0100, Francesco Dolcini wrote:
> >=20
> > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > >=20
> > > Fixup #size-cells value when updating the MTD partitions, this is
> > > required to prevent issues in case the MTD parent set #size-cells to
> > > zero.
> > > This could happen for example in the legacy case in which the partiti=
ons
> > > are created as direct child of the mtd node and that specific node has
> > > no children. Recent clean-up on Linux device tree files created a boot
> > > regression on colibri-imx7 [0].
> > >=20
> > > This fixup has the limitation to assume 32-bit (#size-cells=3D1)
> > > addressing, therefore it will not work with device bigger than 4GiB.
> > >=20
> > > This change also enforce #address-cells to be the same as #size-cells,
> > > this was already silently enforced by fdt_node_set_part_info(), now t=
his
> > > is checked explicitly and partition fixup will just fail in such case.
> > >=20
> > > When the partition list is static the preferred way to pass the mtd
> > > partition list to the kernel is to either define those in the source =
DTS
> > > file or use mtdparts=3D in the command line.
> > > Tweaking the DT from U-Boot should be avoided, unless some dynamic
> > > changes are required, since it proved to be problematic when not
> > > following the evolution of the "standard".
> > >=20
> > > Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.t=
oradex.com/
> > > Link: https://lore.kernel.org/all/20221202071900.1143950-1-francesco@=
dolcini.it/
> > > Cc: Marek Vasut <marex@denx.de>
> > > Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > ---
> > > v2: improved commit message
> > > ---
> > >  common/fdt_support.c | 45 ++++++++++++++++++++++++++++++++++--------=
--
> > >  1 file changed, 35 insertions(+), 10 deletions(-)
> >=20
> > I'm dropping the linux-mtd list here and adding a bunch more platform
> > maintainers. In general, calling fdt_fixup_mtdparts is the wrong choice.
> > I see we do have a few cases in U-Boot where we're clearly doing
> > something dynamic to the partition table, but it looks like at first
> > glance most callers are using this hook when they should either be
> > having the partition map in the device tree properly (and using one of
> > the appropriate bindings) or passing the map in via the kernel command
> > line. I would like to ask everyone I've added to the list here to
> > please audit your platform and update it as needed. Thanks!
>=20
> Hello Tom,
> what should we do with this patch? No feedback so far, apart this email
> from you.
>=20
> Stefano: maybe you can pick patches 2 and 3 ?

I thought someone chimed in for the STM32 side? But yes, patches 2 and 3
should get picked up for sure.

--=20
Tom

--1J7vi1QPkFHP11/2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmQu5GAACgkQFHw5/5Y0
tyxl9wv/RdbAl/IU8Xdnni6thKpgWKgmy9G8fZoj/ubm5mhKqBETIbCNmtu/y5+s
jmhLWV9RBULIU9Xfz2vF/iRtOdVbHVpPAPzJWXYjuQS1Jey74PAkSXc0kHIF1NuL
kVZnmhml1CD3HofdPatzBYwwul4M5xlQF5CY49VZLeC3srTbxoadb0xviS1dGUZ2
HrAIpQsKMmLq7YjeYhUX6oR+dO7o6Ktk7kEcz9eNJfgYmGgzfBYs5GnOECaSdp6E
mdFtnAoWwninyOe8wJ4SndSqDBV9bXwfMVOX4QQiLZzpyN3/eH2UyM0laty4fB+/
5s6kmsl+cFlG2flTBy7/+Gu2cMstRCPMRbvcvj8N4rXLmKk6bJTRe4BZhuLj+VpN
0uKysBOkYfy8Kr0UHK8JE/l5pkwAiBJLOtSvpoIqwylZhzecnxtHUCPBrSRvlXRc
kH1D437Gdw+gGYB+13EI5nKWwYB2uvtYzuqfTrpIufau8sMozqIsK9iqy5glA7NK
SNGs0Iip
=0EhG
-----END PGP SIGNATURE-----

--1J7vi1QPkFHP11/2--

--===============8072570734375466301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8072570734375466301==--
