Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CD2194E90
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Mar 2020 02:39:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4DF7C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Mar 2020 01:39:17 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FD02C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Mar 2020 01:39:16 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id e11so9284788qkg.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Mar 2020 18:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mbZnnngqgRiNiLtxBzos5Ft9/NaSVWLaLGxNPl4MIzU=;
 b=XoF8vvjSr6j0C8AEwQluevHdD52MGqaWbftT8b6vmDRCCIfGtNo8eRjRUDU0pbQNPI
 pgcmobw8hq/yLI90KX7KNQ7rT+2yhDCeXans1c6kvaB8YOCsQ1ZhLvF+I9mGumFJ9ddb
 QE8a+yNIm0TG/XNbAV6mxHbNaAeLruRXdS/iQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mbZnnngqgRiNiLtxBzos5Ft9/NaSVWLaLGxNPl4MIzU=;
 b=aPzguuEQxdLGQ9kdumYdm7nUOk2nk/XBj5RC26PdsvohpNR8nt6U8DSGhXdbUkNePR
 c0l+qnjhdzV6qC1yjHRzFKviCYE13pN+ZXToDDxxIkUny6pjDClgyCmqklGDUFn2fQh8
 htqwShr8WVmO0uvp8trw2yuc+6vml/7bUIDVlK4DzkI+ddaxliwTjughJHNunVicCBay
 RmDpyXVJlCVyYyzzuXKp1TJj+xnrKFJlC1oEnipgZ3q5qx7j1RdBcq12G3ngaoN8BYMN
 i46Ea7FrjhY+f40jCCX1xYUUXRuDikNw+0VNVIcLovZuehPMA2ntL6ExcbnAifEe9X37
 p2zA==
X-Gm-Message-State: ANhLgQ16e0i15DRZ1L7HxeJnzhnSpkdQ9nbVWMIQZcuAzwcsG5R8aKlD
 tupgHJK+6xkFcDoLpH7IY8IWyw==
X-Google-Smtp-Source: ADFU+vtXrEg/mTF8xwNlA4UI43LUPzYCyFXqcUnvx8uuehI3BmwenUAr3EzqTGHJ5hCTya36Eq1VhA==
X-Received: by 2002:a37:db0a:: with SMTP id e10mr11770709qki.273.1585273154827; 
 Thu, 26 Mar 2020 18:39:14 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-a0df-d6c4-f243-f771.inf6.spectrum.com.
 [2606:a000:1401:826f:a0df:d6c4:f243:f771])
 by smtp.gmail.com with ESMTPSA id j15sm2669124qtr.40.2020.03.26.18.39.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 26 Mar 2020 18:39:13 -0700 (PDT)
Date: Thu, 26 Mar 2020 21:39:11 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20200327013911.GB5793@bill-the-cat>
References: <10b180027227416a83b4e1a0461d0914@SFHDAG6NODE3.st.com>
MIME-Version: 1.0
In-Reply-To: <10b180027227416a83b4e1a0461d0914@SFHDAG6NODE3.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Marek Vasut <marex@denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request: u-boot-stm/next
	=u-boot-stm32-20200324
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
Content-Type: multipart/mixed; boundary="===============6672334272453303824=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6672334272453303824==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BxNWZcw0TMazIwHZ"
Content-Disposition: inline


--BxNWZcw0TMazIwHZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2020 at 08:15:01AM +0000, Patrick DELAUNAY wrote:

> Hi Tom,
>=20
> Please pull the STM32 next related fixes for v2020.07 =3D u-boot-stm32-20=
200324
>=20
> With the following changes:
> - stm32mp: fix command stboard
> - stm32mp: update kernel device tree according the part number
> - stm32mp: add 800 MHz profile support =3D stm32mp15xd and stm32mp15xf
> - stm32mp: set cp15 frequency in psci cpu on
> - stm32mp: DT alignment with Linux 5.6-rc1
> - stm32mp: clk: add SPI5 support and correct CKSELR masks
> - stm32mp: ram: fixes on LPDDR2/LPDDR3 support and on tuning
> - stm32: i2c: allows for any bus frequency
> - sti: timer: livetree and clk API conversion
>=20
> CI status:
>      https://gitlab.denx.de/u-boot/custodians/u-boot-stm/pipelines/2510
>=20
> Thanks,
> Patrick
>=20
> The following changes since commit 2738f0edea7d19960d692284d1f378b1a2b4c4=
a5:
>=20
>   Merge tag 'ti-v2020.07-next' of https://gitlab.denx.de/u-boot/custodian=
s/u-boot-ti into next (2020-03-17 11:59:58 -0400)
>=20
> are available in the Git repository at:
>=20
>   https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm=
32-20200324
>=20
> for you to fetch changes up to 5b5699cdc97122e08e7fd0886a9e4474ca3ccb35:
>=20
>   timer: sti: use clk API to get timer clock rate (2020-03-24 14:23:35 +0=
100)
>=20

Applied to u-boot/next, thanks!

--=20
Tom

--BxNWZcw0TMazIwHZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl59WTUACgkQFHw5/5Y0
tyzrOgwAnx43x7jD23OaMzD0sHBvfvzu/tgnbGM0sKWuR7BYcsALXBKqioADgm60
NQLVjQdMPPU35MLRbyzGAvWtqqozC86Q5H4lGKdzDU5+yLGK+/VVIu6Exw942Nv3
T4lFhEBNm5C4BsyfuumusNY5QSgFiQt0+6KGmkehTomhmY9jQsWvgpuAWIKpgFlr
NKrmYSaQ5vQYCJKirSdbQePPPLB7Pi/46bag86ctUQfgn97W2VW9go+wC5LhVi9b
gZwvs4cdhkJaw9e9yVq5vP5YwJwNcbJTsMxCYLiuJutqmftwpMnPB1hzq+BLJuM6
5vUHzRdPB1g5EoRS2AAYITCok5Xhdiv/wet7HMimjgJnBB1Bj+bhtqZNZv66tKCb
lJ5dQAl1D5tB2cI69V3Ghq59lej8Ctir8GwotiYVRFdXqhI130FSLxr9NfH/pMdG
Bi4r/5GTBh8OOVMxHBSu2n0ZjhOt83qCIv2zipJBz8MQCN2nZYYHjPxLVYtdkU+n
i0zz769h
=R0Ym
-----END PGP SIGNATURE-----

--BxNWZcw0TMazIwHZ--

--===============6672334272453303824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6672334272453303824==--
