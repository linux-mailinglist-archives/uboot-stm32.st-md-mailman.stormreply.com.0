Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0E8BADD0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Sep 2025 17:26:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 932FBC3F951;
	Tue, 30 Sep 2025 15:26:29 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F37DC3F94D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 15:26:27 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-42861442ec5so33860505ab.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 08:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1759245987; x=1759850787;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=alGarZWuDMLtcai34ZKxkI49E7qNRL/yeKPkoSFtwfc=;
 b=fHWXxjaEPJIv5dzFoE+FizASZVi7CoE5zidJBQ1NbptuKh78NhIuDZmT0FxLw2Q3gw
 i9xVjOcWYSz13Rgaic3ivSx5AUQo1b9bb0lznYHXThgPPSaCAe2upWkynGpoHRyGxjtY
 4b5Z+8RnNvhHpBfpbsPRIqJJnGY41VEC7h8O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759245987; x=1759850787;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=alGarZWuDMLtcai34ZKxkI49E7qNRL/yeKPkoSFtwfc=;
 b=V4pph09Tyys+fC2vsAQx+th/0UCEv8PJoB2hsNglQz4ls9BASqxW3sWFCeFlFSNetA
 Wpe8dab/JKJvdFi2bIXKDIvsZjD2M1Hr1GrL2e+B4iKnH9kc1nw22gRZDsOSccCvabQ7
 aI+4DKjbz2UUeCJ3TScg+rLCFet1KsS8A4EuYGARFSHXyasCKCXOmTpbXgUL2jOCEj7B
 nBQFlIwRcq7meCApsouXjoj2OTQZr7iqNiwz8DOVf+aEKtOXObKcb046hz5WmgfSWpkx
 /LToFdhM6l6PFDVVqN6Vp0GOF6puHmypsO7ZwgVIidkLvEkWM2m6RZO6Z3K8nreFKlz2
 yHUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQbCGshOEK4SOqfaTJ4O05XPQPNmWTKiqc5KZ3vdQb7+4YSoPFE+kD9DLlziTERk91DtskAvVH4KcbTw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxHLRZVeeQ0g4Kgq/vVDnX0yaoaz6jGh2hlSPsydgYuqgNA38nX
 cT3Xc24VM5tKwdUp4BEZRV8pyLZJOWsw8K5+FKZSaSfORuVig1cZNKutp+bBprzJFiYf5TMGDE1
 T1xcTHaA=
X-Gm-Gg: ASbGncuwFR5q6QnkqI0SUMZUAZJlpxnp2j4RECqD8qROGMkYAQLsIlQKJ2NWmn0yTiz
 9v+533hVk3H20iaLlbvI0NjGY1lBCAhfpIAYnH+NgvLygjxZL0ZvhDF9Y9Ol2Zohk6YdYu79tEK
 TyaYJCaI8fyzJbltMdg2tav8GV/UeuMNIu0wpK87OBUhWxwpLrpCn2ZgxnyXC8I43qPtcfgJMoZ
 TovR0OIqTKuoYtWRerZBDZQkKBb/etdzl4UuRjMPNRBbaNjola6prE6bXVw9g3vepVD7tyzeD8h
 LFCV3ZsucXFr61a4BWbr+IrKPDsZNYkuMFAKBdCQ03j/9EMcRkesxmRfThN5eBPoDrffhEeS7YE
 NkpcirPPlHiF5X4TlVT4PpK7dcF2e61S+dH1KqTSqCla4hsS889MHxqc5ukVGcB9i1YgMN73yxG
 WOq8WZ
X-Google-Smtp-Source: AGHT+IFY6U2o89gQfcScBJOX+puTML17x5zNNVm2h22uwC2hSxcJu3HPWMVbzyAt4fksci+HOeUkUA==
X-Received: by 2002:a05:6e02:1d8e:b0:426:790e:5cfc with SMTP id
 e9e14a558f8ab-42d815c6315mr5189595ab.13.1759245986613; 
 Tue, 30 Sep 2025 08:26:26 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-97-42.totalplay.net.
 [189.203.97.42]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-42781e5eb90sm53207795ab.6.2025.09.30.08.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 08:26:25 -0700 (PDT)
Date: Tue, 30 Sep 2025 09:26:23 -0600
From: Tom Rini <trini@konsulko.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <20250930152623.GA6093@bill-the-cat>
References: <20250917141736.59732-1-kory.maincent@bootlin.com>
 <55d0805b-dcb2-4277-a4da-f4c26b48a2dd@foss.st.com>
 <20250929170912.3bee3f9d@kmaincent-XPS-13-7390>
 <fd32f45e-a3c9-4170-8886-5a31dda0e4c9@foss.st.com>
 <20250930143732.GU6093@bill-the-cat>
 <0b7c0f03-37ec-4aec-80e7-e26de4091560@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <0b7c0f03-37ec-4aec-80e7-e26de4091560@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, u-boot@lists.denx.de,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, thomas.petazzoni@bootlin.com,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] Revert "board: st: stm32mp1: Clean
	env_get_location()"
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
Content-Type: multipart/mixed; boundary="===============0938554317559227595=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0938554317559227595==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2YU+vvlERECRjbnT"
Content-Disposition: inline


--2YU+vvlERECRjbnT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 05:09:26PM +0200, Patrice CHOTARD wrote:
>=20
>=20
> On 9/30/25 16:37, Tom Rini wrote:
> > On Tue, Sep 30, 2025 at 09:45:08AM +0200, Patrice CHOTARD wrote:
> >>
> >>
> >> On 9/29/25 17:09, Kory Maincent wrote:
> >>> On Thu, 18 Sep 2025 16:16:35 +0200
> >>> Patrice CHOTARD <patrice.chotard@foss.st.com> wrote:
> >>>
> >>>> On 9/17/25 16:17, Kory Maincent wrote:
> >>>>> This reverts commit d37641c61ba212241c38e3fd22f0335fc0bebc96.
> >>>>>
> >>>>> Restore support for environment storage in EXT4 filesystem on eMMC =
boot.
> >>>>> The previous cleanup incorrectly removed this fallback option which=
 is
> >>>>> needed for boards that store their environment in an EXT4 partition.
> >>>>>
> >>>>> This configuration is OS-specific rather than board-dependent and s=
hould
> >>>>> remain as it is configurable via menuconfig. Even if it is not desc=
ribed
> >>>>> in ST defconfigs people may have enabled it in their defconfig.
> >>>>>
> >>>>> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> >>>
> >>>> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> >>>
> >>> Hello,
> >>>
> >>> Any news from the maintainers? Is there a reason for not being merge?
> >>>
> >>> Regards,
> >>
> >> Hi Kory
> >>
> >> I expect to send a pull request before end of this week for master bra=
nch including your patch.
> >=20
> > Since the release is Monday, I'd really prefer sooner this week to later
> > this week if possible, thanks!
> >=20
> Hi Tom
>=20
> I am preparing the PR, it will be send today.

Great, thanks, I appreciate it.

--=20
Tom

--2YU+vvlERECRjbnT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaNv2mwAKCRAr4qD1Cr/k
Cqo6AP9Y57qXKwHwsm2+S+6/kuWMSsUoGJepwWE8nlxPed7RdwEA1+B/ihqA+ECO
85kZZTzJ+UlW+jKytXuWyWKJD3RZiQ4=
=X/lv
-----END PGP SIGNATURE-----

--2YU+vvlERECRjbnT--

--===============0938554317559227595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0938554317559227595==--
