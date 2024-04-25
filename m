Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D88A68B262D
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Apr 2024 18:19:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 812A7C71292;
	Thu, 25 Apr 2024 16:19:02 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1294CC71291
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 16:19:01 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-69b50b8239fso12247276d6.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 09:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1714061940; x=1714666740;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kcFNSSZ6s/GorfRVkg5u1OcWOHiH5uJiX3tVvcPnHj8=;
 b=mOVxX0DtHQhBMpekYgjlHIeOz9wiY+T6wJi/Itxq/yDR+mlFxVHq0Uf10OHwCe1ix6
 o9x4i3AUrpKlwtxfWPIFSOz9tciaJYq5aDyvDjL3O5ErYDMlQ+F0gHOOlE+RMMZVMXK4
 wKmcdGkNAbMef6Uh+t9DLxFubgPp7+1PEwjdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714061940; x=1714666740;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kcFNSSZ6s/GorfRVkg5u1OcWOHiH5uJiX3tVvcPnHj8=;
 b=PZsWQtS2Bx5QzRNM68WE2sMPt+7DD9IZ+MfwkxR7+uE+Et3CY5xnRa/fjZfSy/LRpN
 qIXOty37u4bVA1mL/vh7xp80MbJ2aY7Lo5J0EUhw0l+xWTJiswfwBcthHNnh1QJLcJOm
 ItU8pNij9BvDflS3mkHUrXqT+IK0E+8igxeQPxqz7npqKKpD4Tdjs9I1U0dp+AFQDMLf
 LOy6Qi7zc0JjBXKyO7p8w92ZrumHg31n1Mj9Bko9dseHoT0Z0fN4vtF6vwuEEUmfH88E
 jMuvfbUXLaa1kzOVMYjYCzrRWeKF0STxsNCzqJUcPsWAnUGbYE+OEtHoQIA7XNIHtsfM
 klRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeUAE6lY4TN4Tjyz6RF4oPgC2jmsJO6nNuERqb0mMM7wEJRoGYS2B4i6eh9MItkahQaYOvQdWxNvd8Ayg5Ei+lS+FlSYhbiR9yj7XSB8Ezhc0wqkqskZw6
X-Gm-Message-State: AOJu0YzxMcjbYuwz7Tna90KknkSrjkC9AvmZSjIx99QhQ4a8bSIM0M+b
 ZRNNKCAV1cwO939lZ+Hfbt3YvnDkJije65GXVa9D+mTOR0jxY+Hm2fqXzsJgah0=
X-Google-Smtp-Source: AGHT+IELjarAr248+h3gk+AVenGUc0O97kzE2SpsdLMoKvk1ahEYrZ87bGhaU1JFoT4kkosSnOEeWQ==
X-Received: by 2002:a05:6214:c28:b0:6a0:9645:526e with SMTP id
 a8-20020a0562140c2800b006a09645526emr304420qvd.15.1714061939933; 
 Thu, 25 Apr 2024 09:18:59 -0700 (PDT)
Received: from bill-the-cat ([187.144.98.216])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a0cdf02000000b0069b447066bbsm7055108qvl.78.2024.04.25.09.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 09:18:59 -0700 (PDT)
Date: Thu, 25 Apr 2024 10:18:55 -0600
From: Tom Rini <trini@konsulko.com>
To: Richard Hughes <hughsient@gmail.com>
Message-ID: <20240425161855.GG1054907@bill-the-cat>
References: <CAC_iWjJNHa4gMF897MqYZNdbgjFG8K4kwGsTXWuy72WkYLizrw@mail.gmail.com>
 <CAD2FfiGuFaC=r+TGfq9auzWJbyzVNbug8zR9RzSwM2+Uk52d+Q@mail.gmail.com>
 <CAC_iWj+BonsVbA5Bw3Kck2k4b8SXru0U_Y2kAmx5=_t6SozotA@mail.gmail.com>
 <cd5ca19b-befe-47cf-9a84-f610ae7f04c9@linaro.org>
 <CAD2FfiELXfvc9jEDpKVx44BnK5yDpVViARkB0QrHkpMRrdsVEA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD2FfiELXfvc9jEDpKVx44BnK5yDpVViARkB0QrHkpMRrdsVEA@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Caleb Connolly <caleb.connolly@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Michael Walle <michael@walle.cc>,
 FUKAUMI Naoki <naoki@radxa.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Masahisa Kojima <kojima.masahisa@socionext.com>,
 Paul Liu <paul.liu@linaro.org>, Michal Simek <michal.simek@amd.com>,
 chris.obbard@collabora.com, Heiko Thiery <heiko.thiery@gmail.com>
Subject: Re: [Uboot-stm32] Capsule GUIDs and LVFS
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
Content-Type: multipart/mixed; boundary="===============5203551242227720686=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5203551242227720686==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rnPWU/ama7Q77LoA"
Content-Disposition: inline


--rnPWU/ama7Q77LoA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 05:13:21PM +0100, Richard Hughes wrote:
> On Thu, 25 Apr 2024 at 16:16, Caleb Connolly <caleb.connolly@linaro.org> =
wrote:
> > I discussed an idea with Ilias to generate GUIDs dynamically based on
> > the board compatible/model, which seem to essentially just an
> > abstraction on this..
>=20
> Yup, that works too -- on the assumption the compatible string is unique =
enough.

This is where things are a little fun. In previous discussions, yes, the
machine compatible string should be unique. But it's not. Is it unique
enough for this case, today? No, since mechanism could be what's passing
the correct device tree to the OS. Might this in turn be what drives
people to fix the case? Maybe.

--=20
Tom

--rnPWU/ama7Q77LoA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmYqgmkACgkQFHw5/5Y0
tyyMtgwAmusJdeqjNMlyvhQgdGYqd3XH0A9NJHo3dP1ZmJL94LfCvexDT+HGEMOS
P08OwcXxaxklV1x2BkbA1d3e+BVd7C7vJtrlAvhX8f7M5cw27jp75KGh7qPzgHuL
eRLpksRzXa3ATDrjQ5FdPctAAZLmoS221z15uruROPrKM2AkhHKYjBabgC1ZM2KY
x4RwcoSfUC83LtclvibPC316Jdc3iqmpYdhQCGujkuqGrBIY596mKsUrDr1UafHf
LybDgqebPWJ9dz7Bh8N0lU80zLdOnvYVDRI/6cQYJ+zDj/o+XxUAJZOmGRncP4uH
HIPMdW9OGiP+jvI+hK5qfYjPK3kc68LXn4B3kK0KOntmnmKqPJ20nJzYr/rRyt6R
T2SHhTfSyriTebMLoN5pDq89uC4lrPKY80WtHuBXRguIf9BBJM9WbmVersGRkY6i
CUBT7C23frFT9n85ZquledjegZqBdZT8pT4WfvhoymFMXmO1h1AdAumf7wzEr1jz
hxA+r44x
=RsVw
-----END PGP SIGNATURE-----

--rnPWU/ama7Q77LoA--

--===============5203551242227720686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5203551242227720686==--
