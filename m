Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8E136354A
	for <lists+uboot-stm32@lfdr.de>; Sun, 18 Apr 2021 14:45:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF532C5719E;
	Sun, 18 Apr 2021 12:45:48 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 837EAC57196
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Apr 2021 12:45:47 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id y12so24240239qtx.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Apr 2021 05:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XKuEEgR63zno4kvC/9onoo8axUSfKHhSmuq1KeAZMKc=;
 b=mmMR11K0ebZYl2I9FfA8CzmXaAfQ20v7VHxqEOmWTPhNuCQPFkyQxGYhSuvkB0laC5
 DMO9HAVnNU34yT9syCnDvPxAV67ddaA9qVg/6wj6QFFkhlY/55q+1Wj86SQUHHV0xdNQ
 qM1yVpK938bltNMJqO6CkcsMNfcaC/noTo3Zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XKuEEgR63zno4kvC/9onoo8axUSfKHhSmuq1KeAZMKc=;
 b=J7OZqPUf2cvbgMNQ4SOiS414XA9IKq0c+vhE+Z/V3Vo6SGZQgDkvxB2cimtfBr8AIN
 OKmXfAmWJo0wiT+ZARQWy7s+GBHfu41qZatzWklWmJl2T5wyi4imq26SqyFdd8ER/tiq
 jpnkvhu/VZldT9jItbZtzI1aKQY8zyWwPacGpwMdLsXGTtuSZzU54pVVWf7FU4IDgwCB
 lViGeoEbFDxVaxp08BcjLH/RTR7seFuL42n1BddiixRXLgF5d5vlMjkY9QkJQJMXAOFS
 cJciDeRTG9PLUIO5sc9bz0G6quXn7o9SrRT2qdu0YCJjZYpc4+641m1MHqBJzDspkqnR
 m7cg==
X-Gm-Message-State: AOAM531jQhDqmH37RQM2zwSyHAG/tRcvRNm1nRlLig3eNQx9AEmR3RSX
 N6RFpGh+FTfPleJwBipSA+gNhg==
X-Google-Smtp-Source: ABdhPJwbpN+L82IoG4xHpBLaTvNcVdlA2Cb6lboPLlsdt4Gz3KrvKCkjWy4XtFKaKBLWqPPztPoyRQ==
X-Received: by 2002:a05:622a:2c4:: with SMTP id
 a4mr7556018qtx.145.1618749946422; 
 Sun, 18 Apr 2021 05:45:46 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-140-239.ec.res.rr.com.
 [65.184.140.239])
 by smtp.gmail.com with ESMTPSA id o189sm7836519qka.86.2021.04.18.05.45.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 18 Apr 2021 05:45:45 -0700 (PDT)
Date: Sun, 18 Apr 2021 08:45:44 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210418124544.GP1310@bill-the-cat>
References: <20210209104852.1293-1-patrick.delaunay@foss.st.com>
 <20210209114849.2.I108ef0bb214bf9eabfb9a39438381a9be6ba4b6a@changeid>
MIME-Version: 1.0
In-Reply-To: <20210209114849.2.I108ef0bb214bf9eabfb9a39438381a9be6ba4b6a@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] env: sf: update the use of macro
	ENV_SAVE_PTR
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
Content-Type: multipart/mixed; boundary="===============7627233979801009530=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7627233979801009530==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eAE5ThZ7s6ID3J6L"
Content-Disposition: inline


--eAE5ThZ7s6ID3J6L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 11:48:51AM +0100, Patrick Delaunay wrote:

> Remove CONFIG_IS_ENABLED(SAVEENV) as it is already tested in
> the ENV_SAVE_PTR macro.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--eAE5ThZ7s6ID3J6L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmB8KfgACgkQFHw5/5Y0
tyzR2wv/eWqxbGnqnVDUBMMIpo2RVir3lF3re1IiJr56XTlAmo9peJq9SmZoWjv5
dKvoq+/FiHW1L3ZWYB8Y71wp/YJBnsrPt9P8/oDpIdSIgn/cmtIRlSLGgsAdmvK3
bCg/AMNjca1jptA3dvrMdrTsQ3sI6UMTy2UNTPCUrg3lchnWqSqTa+EYxOHTbpoV
fYNhqSYRff5ws6iNwYYrPSjIQlNgoKNPI0s0QEFNsh18RohPcCu7c3saEwPFkW4b
uxADZQNYBd8LIBvjAMBYeshjLNsLfO43o3Md/57C4zwSjL0N4l/27Li8ge2aEprv
JAPU5PP/arU2b2ROY6MltpohHXK/HK7NeEQNhXZ8eWUp5FX7dw+9f0hkHkHxOS7U
kJxlhYJxsNmVxdWPhXNrRgSuBGX/+rvp7N3NWXYBPEER/EWmfsOD2rDqmbb6HA4I
Y219y97vwp/G1LXX5v+bZ5lJzHhjnczscJzLF6b03JZ9olEv4scC3UkLvCWD5Ulv
pAJ1//3p
=Pbpz
-----END PGP SIGNATURE-----

--eAE5ThZ7s6ID3J6L--

--===============7627233979801009530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7627233979801009530==--
