Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B07373C64
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Jul 2019 22:09:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12B08CFAC6C
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Jul 2019 20:09:03 +0000 (UTC)
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
 [209.85.219.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CA12C424A1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jul 2019 20:09:01 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id c202so16387530ybf.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jul 2019 13:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=w6ikImIphjXONuvay0aNwUADOWQObHXE8vSzUpSK0w8=;
 b=Z4PWa7f76SBbIp6V1BLPLpqFTp0oylfMCgRn+SaAk+MSVF+sksSaqc8kzwUWmCbQUv
 NCGF9qUJtYER3VqRXMAQNVjX9m8OZc4RpbjrrJJ36MWz+jJdWb2ZwIqAnVMRVwo9wjnN
 a1GKk87rUlLWCqFzo24lKf+NGWVv0OCSu+1h8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=w6ikImIphjXONuvay0aNwUADOWQObHXE8vSzUpSK0w8=;
 b=qA3Dpiq8ihIXZ8WYlEkwLJJrp0lqUa6hdBPYXUubly5w2Q6yzdcpqrpdKDHT/weWoG
 G/0H+z9IDVdL9The/Be3hj3kN59iWifVjKIosXDJfVLPlMMTkhvmxrOmNEwWzXcAZTmr
 vcfmOzvab7M+kbGvKP2DC9y1TfQif2L6oLZQ06x0MPBjCOy32hX6+qUKFcyyTYnJUk0s
 4q75mhEAxMcG/HLjOgSR2iXdpa9TUxTRAFs8ci5mmiQH2Et2uDS6IDgPmzBOo3U479wd
 qDsL0xRcJsfUCIqVsCTkahj2BzgqM2B2dBy/KQzfrXUgJiocErNWwQDIsniCAz6ZbBz8
 9dZA==
X-Gm-Message-State: APjAAAXIV1Jxctjh4soXFwI7bqILCdYx0K87khUXkiE8rNEmnOs09tgY
 KRJXysJ0M+565sTYEJi0n2o=
X-Google-Smtp-Source: APXvYqzGDbrduVRYr7yvTo0+UU4sXRH4L+EDY4mUijC9GfeCHE61XLdx4YnrDfa2wys/5DYNiWVDSw==
X-Received: by 2002:a25:6586:: with SMTP id z128mr50195657ybb.5.1563998939894; 
 Wed, 24 Jul 2019 13:08:59 -0700 (PDT)
Received: from bill-the-cat
 (cpe-2606-A000-1401-82DE-282E-AD99-F2D1-527E.dyn6.twc.com.
 [2606:a000:1401:82de:282e:ad99:f2d1:527e])
 by smtp.gmail.com with ESMTPSA id t63sm11400708ywf.92.2019.07.24.13.08.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 13:08:59 -0700 (PDT)
Date: Wed, 24 Jul 2019 16:08:50 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20190724200850.GD20116@bill-the-cat>
References: <1563797960-23176-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <1563797960-23176-1-git-send-email-patrick.delaunay@st.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Stefan Agner <stefan.agner@toradex.com>, Anson Huang <Anson.Huang@nxp.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, u-boot@lists.denx.de,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Chee Hong Ang <chee.hong.ang@intel.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v2] psci: Fix warnings when
	compiling with W=1
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
Content-Type: multipart/mixed; boundary="===============3360235149286658670=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3360235149286658670==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J98ULPTjftBCYvyN"
Content-Disposition: inline


--J98ULPTjftBCYvyN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2019 at 02:19:20PM +0200, Patrick Delaunay wrote:

> This patch solves the following warnings:
> arch/arm/mach-stm32mp/psci.c:
>=20
> warning: no previous prototype for =E2=80=98psci_set_state=E2=80=99 [-Wmi=
ssing-prototypes]
> warning: no previous prototype for =E2=80=98psci_arch_cpu_entry=E2=80=99 =
[-Wmissing-prototypes]
> warning: no previous prototype for =E2=80=98psci_features=E2=80=99 [-Wmis=
sing-prototypes]
> warning: no previous prototype for =E2=80=98psci_version=E2=80=99 [-Wmiss=
ing-prototypes]
> warning: no previous prototype for =E2=80=98psci_affinity_info=E2=80=99 [=
-Wmissing-prototypes]
> warning: no previous prototype for =E2=80=98psci_migrate_info_type=E2=80=
=99 [-Wmissing-prototypes]
> warning: no previous prototype for =E2=80=98psci_cpu_on=E2=80=99 [-Wmissi=
ng-prototypes]
> warning: no previous prototype for =E2=80=98psci_cpu_off=E2=80=99 [-Wmiss=
ing-prototypes]
> warning: no previous prototype for =E2=80=98psci_system_reset=E2=80=99 [-=
Wmissing-prototypes]
> warning: no previous prototype for =E2=80=98psci_system_off=E2=80=99 [-Wm=
issing-prototypes]
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--J98ULPTjftBCYvyN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJdOLrSAAoJEIf59jXTHXZSb0wQALmhpVfKY1Sa+vmkwCpr89Hw
BzXgYQ3L7dwCiSDG6mfTlDp3dk3jvJHGsV+e0gVQ3gGAMy8Mdf8IGjLGV3Rdtttv
MIVEi/GAhT4nUpgldyQKhJmCY0ITVOHCCPKN4sUSTIfDi8Hugb4zmr1JwuvR+bRd
cpcQg8PQsBNAGzmVTdiy9pQbCVveg18yImPKsZiNHpmaF+IDgsq712Lq3LoJbNW8
mGjhD1vrCaVEIA3aX3qB7a+Kbtuy1ygFgc+w2d8CIqyBcHDAkBHcTgthzX8f4glF
SssZRcILvowkIRhFHtXe5TQKnY3yzKMiW3bMk7jTrimo26hf8HS0tMuJHVIcQDpI
BlIFWnldZvRkiA5ZcqqJ0Z7fSvjajk9sKB+Plhan/cXGVSGJSnpvbH3f83aMP5bV
1yW/m5ruHpd9SbzpbI6fKnVwjXF16i1fEiIvteQGCqDJSaVLVzdbO/WKNpMaBUZ3
I8mfJZ2gu4GONfzIz95Aj+IRxcUeEVlT1RygZfP1KMLbchpT8igZsAOebFd8kP5d
MOKcfeAWTgf0T2c1BbwK89vkBBfIB2Df5pH+wRDmt+S1CNKK0heikzFw3MNvgeaQ
vrrMOWXlZNbLxwlF/C5c7WHHkVdqxFOmidPviICGV9L7i1oMCxlqXF02I9do8gJE
UetN2fnmzalEBP/njKaX
=xpGJ
-----END PGP SIGNATURE-----

--J98ULPTjftBCYvyN--

--===============3360235149286658670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3360235149286658670==--
