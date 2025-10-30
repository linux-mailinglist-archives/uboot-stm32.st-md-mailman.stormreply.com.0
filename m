Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A644C1DF64
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Oct 2025 01:54:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B8B4C62D68;
	Thu, 30 Oct 2025 00:54:49 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DF3BC62D64
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 00:54:47 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-3d18422565eso402532fac.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Oct 2025 17:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1761785686; x=1762390486;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AFZWxiQqIQpjEd/WrOkiNjLJ8AvrcKUuOQkeH6VxkIQ=;
 b=Sx6zBARaZIGkUFpqnNoMU9HXnbqMYWn8sdi1L3ORjMce7DFlDoxp+WOTgOFOTvP9ag
 IOxn+GXtReZXEdCTlEKBgdeK09q/D/aYCOasAtUugDE1WNk8/1JDW+mxlRNSTfwzp9Mr
 Fo23hU6MHGrWKcHvWSs9BvLg0DDLTXIUxPc8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761785686; x=1762390486;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AFZWxiQqIQpjEd/WrOkiNjLJ8AvrcKUuOQkeH6VxkIQ=;
 b=oCDKdjAbYrJCb4CORTUbqJRcvq8z59+63qS5uFoc3u22lm3TdEbE5Hlw/y17CVSt3a
 3Wh0/TZH1QQBYIZBATc84fOs61RDWEs6PZl30nDDEVhd17nGr9gpny+7eZagF36GDGwM
 T4HRq1CswPIoAqsAsTok1PdzZx6b4+ytSH0ONYePJhCT6c7SsI9ps0Onfez5eUdXWzjL
 sNaQ6tsSTiJzadjsGE/kKXQeVrU0K0b1Nl5iJbBqEVWMFNSgMSPyevkRs1MaJ20RR+wk
 A4ZzMlZfX+d7HYiT1YdnOZg05zHRDXJgZQA3u2hVjBlxJuEz5vWf4RQj1CEOd+x9cK5N
 7kCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU81dHdsLgCeSIVHkKjCnEncBCQPFTELm+fCbT52IqrllYNYXrn4qbbCBkKIIUQO6Zipr9C5MXhhfMldQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxljUgmnq6WWbQUyy/yzONaODpkEqYpqoxXVvLgCfc9XsygkthQ
 MkfFcHlIpZQ5+C7vfuTP/XcxBni1HLnMs7jsXCiKCztVy/qbF68kam3I97ASSKzwwos=
X-Gm-Gg: ASbGncvdPcODZD+6KGGaNF7J0SNfTEv1GMtMNIBcNQTGQiEvldfNDPdVbg2FVvc3SpP
 Ob7KQt2HF/e5MAL+8i7NjBpdwyH8aNCLZzFz2Suwe4awF+AMn52ajiAvX7Hb2skN2vRJMc7D4zO
 qLOcQBW6UHFbLXzo6SklOlSDcu8nJbr3NdKFpbKH97vc0baiHBRo9+hjVBwx9Ukg+gxR5Rf8EkJ
 ebeTeSLqHWKtCG6+8+Cc52CeMCXqKoU+rnQT2VRjMjkLZx9bR+qXp26/BerNXA4tgslLsPkNRzH
 QRjXlpLYFnpUvl/BIJLfC95y7MHe97hyHc48no9lvWdbnaqQZ2fAKJFHOB5dsslYrQytW2U94mI
 F06gUIYWnZKoamLVSCySsw1vfL70cST7eES//Ca5impQ0RF46lFsMiB8AgKhv2KqfreI4Fxh+tp
 nayc9kzWxz68+OPl/JWxTvAMvuGNyQYO8BHiFbeno=
X-Google-Smtp-Source: AGHT+IHzB2QBKKr7rH//579VMBrvVvS49ZNb42s79MSOIrc+VhIiDfn/kIJL8gkk2LQJ5vogw6ipvg==
X-Received: by 2002:a05:6870:ac0e:b0:3d2:4f4a:9212 with SMTP id
 586e51a60fabf-3d745d95514mr2647373fac.3.1761785685711; 
 Wed, 29 Oct 2025 17:54:45 -0700 (PDT)
Received: from bill-the-cat (fixed-187-190-202-235.totalplay.net.
 [187.190.202.235]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3d1e20f1c0csm5321485fac.0.2025.10.29.17.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 17:54:44 -0700 (PDT)
Date: Wed, 29 Oct 2025 18:54:41 -0600
From: Tom Rini <trini@konsulko.com>
To: Peng Fan <peng.fan@nxp.com>
Message-ID: <20251030005441.GQ6688@bill-the-cat>
References: <20251022-imx-rproc-v3-v3-0-92273a82c5da@nxp.com>
 <CAOMZO5ASxBCdTQFfoUA7k5aXKwQZS+MC75kHw7uHoHsF1AgbcQ@mail.gmail.com>
 <20251028121607.GF9371@nxa18884-linux.ap.freescale.net>
 <PAXPR04MB84591B0C66FE17F3E0792BB988FBA@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PAXPR04MB84591B0C66FE17F3E0792BB988FBA@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Ye Li <ye.li@nxp.com>, "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>,
 Udit Kumar <u-kumar1@ti.com>, Alice Guo <alice.guo@nxp.com>,
 Ryan Eatmon <reatmon@ti.com>, Andrew Davis <afd@ti.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Beleswar Padhi <b-padhi@ti.com>,
 Judith Mendez <jm@ti.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 dl-uboot-imx <uboot-imx@nxp.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Hari Nagalla <hnagalla@ti.com>,
 Fabio Estevam <festevam@gmail.com>, Stefano Babic <sbabic@nabladev.com>
Subject: Re: [Uboot-stm32] [PATCH v3 00/12] remoteproc: Add support for
 i.MX8M[M/N/P/Q] and i.MX93
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
Content-Type: multipart/mixed; boundary="===============8747773949130111420=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8747773949130111420==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="usPbJs5tOB+I/q51"
Content-Disposition: inline


--usPbJs5tOB+I/q51
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 12:31:50AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH v3 00/12] remoteproc: Add support for
> > i.MX8M[M/N/P/Q] and i.MX93
> >=20
> > Hi Fabio,
> >=20
> > On Sun, Oct 26, 2025 at 08:28:50AM -0300, Fabio Estevam wrote:
> > >Hi Peng,
> > >
> > >On Tue, Oct 21, 2025 at 9:48=E2=80=AFPM Peng Fan <peng.fan@nxp.com>
> > wrote:
> > >>
> > >> CI: https://dev.azure.com/pengfan/uboot-
> > ci/_build/results?buildId=3D21
> > >>
> > >> This patch series introduces remoteproc support for NXP i.MX8M
> > and
> > >> i.MX93 platforms. Most of the i.MX-specific logic is ported from the
> > >> Linux kernel to ensure compatibility and maintainability.
> > >
> > >I'm getting the following ut_dm_dm_test_remoteproc_elf error in
> > Gitlab CI:
> > >
> > >https://source.denx.de/u-boot/custodians/u-boot-imx/-
> > /jobs/1274168#L276
> >=20
> > Not sure why it fails, my azure CI pass.
> > I build this with sandbox64_defconfig using my local PC and run ./u-
> > boot -d arch/sandbox/dts/sandbox64.dtb With command: ut dm
> > dm_test_remoteproc_elf I not see failures.
> >=20
> > Let me rebase to latest master, push to CI and retest.
>=20
> Still no clue why sandbox amd64 pass, but sandbox arm64 clang fail.
>=20
> More and more I am thinking this might be compiler or else caused
> the issue.
>=20
> I am not sure how to run the arm64 sandbox clang test at my local,
> I built sandox64 with aarch64 gcc and ran it on i.MX8MP-EVK, no
> issue.

How about with aarch64 clang on that device? I would hope you could grab
the official aarch64 binaries, but as a worst case, building an image
with OpenEmbedded that includes llvm, etc, should suffice.

--=20
Tom

--usPbJs5tOB+I/q51
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaQK3TgAKCRAr4qD1Cr/k
CrXqAQDSPtLkAZJNB6DPMxrhckZoa9XQlg8v+HFoASWPOS98cgEA5UvZCxjAZcqQ
su6SeoOetL29uGjJOFwo1P6cJf5IIgc=
=Gju9
-----END PGP SIGNATURE-----

--usPbJs5tOB+I/q51--

--===============8747773949130111420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8747773949130111420==--
