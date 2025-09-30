Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CEABAD35F
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Sep 2025 16:37:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89CF0C3F951;
	Tue, 30 Sep 2025 14:37:38 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41E04C3F94D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 14:37:37 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-92cebee95a8so88390539f.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Sep 2025 07:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1759243056; x=1759847856;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UwSb2ENiAK5+8Lybc7cQ7NoUPbzmnnh+cD0b51e8auE=;
 b=fVGgDH5cXU29xvHfjMRZRt53AYMeGk/42uG3OjIbmSWICtIh7A/nUML7P7qBl040R3
 +wpmZ8cO7yEerkbS1Gp0eTOwJpMkfXtFjZ/IAieViQMmnI4ocmGiGYqX7NJwNq8MT7En
 T85GNWXYsvLti/YsEqftv9hU7hn28p59YsadI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759243056; x=1759847856;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UwSb2ENiAK5+8Lybc7cQ7NoUPbzmnnh+cD0b51e8auE=;
 b=u/DKoh6mzu2mNh4j4/UkawaN06RCFMPmmkqD11U5gHtRqAcIkeXZ+66QDv9IR2QwED
 Nrikwf63Ok7t/K6WIsvvjQOrhRMEdKDd4Innk4/JJGMGggCZ+l76rMFiYv8UilI4YnmB
 2XNq0SkOouGbC+vXEzHqRldN1BcpfwEt7cJ/toR0PFZPde7X440tTt8EyndTgvslc1CP
 FNuQbCs32L9QGUSGHmnSgsZo+z6xADQe/ORsw4VIgNRy9yxFNisj36Z0Zr7ukb32xso8
 kJ9KVTsnkuCukrYzrfUjDQvVyLH/7gTUUCzwR6Cwhb0Euzx3EK0YEu3T+6EOR4iSJxNs
 Dj5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzEA0B1ZcQ67A8tk+oeVCP3uwkMBLhgpM/i4udxXuJkdvEXv6ZvWGc65N3qbsSPqUZRAjjKWzkPzABBA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy0Sn7EmPOllAO90c9U9ttb24uxy3K696sChglrR25eMMBd7Vsm
 +oMQA4OYGeNpPoYMgKWvzxeG/7QRFHlfE6xWJZc5nv2lUhWhOzvWZYf7HLi+4isfq3U=
X-Gm-Gg: ASbGncsUHjGRt5+/2zHus0ZEzP0gDJOFCEMAR+CR9ndmvlEO2woOGE+6JXmRDWemKXZ
 XNaqwi3zEuz1KyU3DGSfKSK5arEbxsqEDfgkEY20aDIjR/C+12CgcZ/HaTgL9j+m8Xp6RwxyHtU
 H0vz/qcFiNVnBekzg/37RegVQeWoe7dcAMAWBrxmQ2jF3WWTKOpr72eBGnSpGQvxSt8hS9Lht34
 1ihrWCmg52BErKWdg5y//QHH/sb9J5arR05/2O3vVnxPWijO4RLnRYVnOUy7sc8zCA5kgYNJ0tS
 EkBcQ0tp4QpDSc0nuyY7N8lFqd/ePsFOqsuUBp2O6QeSLZIS/LIEODnDM1UhwtBGCgl4GlZyJoF
 KcyyiRPAClWoZgXCuKr6+wVcA+QuMVv+QQ4GPTDv2xXev3o0Eld5VYgypLvrdQ27czUYPgrrw4n
 KpwZg3ZCoLf6sI/14=
X-Google-Smtp-Source: AGHT+IEl1toifhRlohOWUiuqouAFdJdZCX0z9S+RQke/pCIIWhQ8hC1pEr1IDauFwAKRitf01M0Heg==
X-Received: by 2002:a05:6e02:19c6:b0:424:8b66:fbdc with SMTP id
 e9e14a558f8ab-42d8168039amr1228525ab.28.1759243055782; 
 Tue, 30 Sep 2025 07:37:35 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-97-42.totalplay.net.
 [189.203.97.42]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-56a69a1c5ebsm5914957173.43.2025.09.30.07.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 07:37:35 -0700 (PDT)
Date: Tue, 30 Sep 2025 08:37:32 -0600
From: Tom Rini <trini@konsulko.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <20250930143732.GU6093@bill-the-cat>
References: <20250917141736.59732-1-kory.maincent@bootlin.com>
 <55d0805b-dcb2-4277-a4da-f4c26b48a2dd@foss.st.com>
 <20250929170912.3bee3f9d@kmaincent-XPS-13-7390>
 <fd32f45e-a3c9-4170-8886-5a31dda0e4c9@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <fd32f45e-a3c9-4170-8886-5a31dda0e4c9@foss.st.com>
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
Content-Type: multipart/mixed; boundary="===============3022506207828233375=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3022506207828233375==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3K02xqPr25eT/Obv"
Content-Disposition: inline


--3K02xqPr25eT/Obv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 09:45:08AM +0200, Patrice CHOTARD wrote:
>=20
>=20
> On 9/29/25 17:09, Kory Maincent wrote:
> > On Thu, 18 Sep 2025 16:16:35 +0200
> > Patrice CHOTARD <patrice.chotard@foss.st.com> wrote:
> >=20
> >> On 9/17/25 16:17, Kory Maincent wrote:
> >>> This reverts commit d37641c61ba212241c38e3fd22f0335fc0bebc96.
> >>>
> >>> Restore support for environment storage in EXT4 filesystem on eMMC bo=
ot.
> >>> The previous cleanup incorrectly removed this fallback option which is
> >>> needed for boards that store their environment in an EXT4 partition.
> >>>
> >>> This configuration is OS-specific rather than board-dependent and sho=
uld
> >>> remain as it is configurable via menuconfig. Even if it is not descri=
bed
> >>> in ST defconfigs people may have enabled it in their defconfig.
> >>>
> >>> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> >=20
> >> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> >=20
> > Hello,
> >=20
> > Any news from the maintainers? Is there a reason for not being merge?
> >=20
> > Regards,
>=20
> Hi Kory
>=20
> I expect to send a pull request before end of this week for master branch=
 including your patch.

Since the release is Monday, I'd really prefer sooner this week to later
this week if possible, thanks!

--=20
Tom

--3K02xqPr25eT/Obv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaNvrKQAKCRAr4qD1Cr/k
Cg5XAP9aSZsmFO2kblqP+8LCAxIjq9pB3lyGI8mEE1mBhZwslAEAzsUusgbYzS6E
XFTWazQcB+pxAyiP2tgzWubUCIzLwgY=
=K278
-----END PGP SIGNATURE-----

--3K02xqPr25eT/Obv--

--===============3022506207828233375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3022506207828233375==--
