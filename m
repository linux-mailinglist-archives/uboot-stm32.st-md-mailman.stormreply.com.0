Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D774219AD17
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 15:47:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92941C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 13:47:20 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DDC4C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 13:47:19 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id ca9so12786004qvb.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Apr 2020 06:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=37WNEUsgjy8i8gQnp5CJlNM3l70fOtaIxzy5IfbSpx8=;
 b=iN5vXVblGzppl6b2nSCDoZts+SaHpCLnQuyHdhvCJh2RcJwj9psYBx8siWtJLtSa6u
 4osgtJ2jOjNDWCUjUnUFFuibIYQqorYCU5tD3ZmtAmdtYW67B3fYytNsueN+Sz6NAvwi
 bBFsUERrZkm08K6pL1Bl6pvunTj+1YHUXk2TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=37WNEUsgjy8i8gQnp5CJlNM3l70fOtaIxzy5IfbSpx8=;
 b=rEVOS0yFv8yldassx/Y1/mDPcZSHZ3j9o8DITf3iFfEwEfFDy9ozZYTJDZ6mV31UrN
 kOpr9lRproQZg426TpgEG60JnJXjYAFNhjZkpTU3mujLvTOZ3HEXHRE6bVSWVJp2sA7E
 cl/9xBkTOyHiIMhhnwa/4MHucWLJ/uqo0kttg3lBQWELaAcDiCNK9aWeAOfjJqL8R/k6
 ApwbpDLvMAYwzdY2NAM+DHHADriXV+hKKqgL/HsxfdxNbs1nruagRcO/neByvH2LEGBV
 AWszhI56CnXGbXL6HxeEXG3qQzb6eJvI7fZcLM8KvJX/pzrrV4+/tDDgAFcZdqlGsZFS
 lQow==
X-Gm-Message-State: ANhLgQ1+3S2wCVjprIj/aCQVUsJI/afe6CP1g8psY9i6JU75VYcdHYJ1
 h+ivQJFgX5KVQqFpHRz45lIl4A==
X-Google-Smtp-Source: ADFU+vuBAN6ct/bwa7ItQEUjIxTbyQs17CQWxCZb8vrTVhub3X7KpQV0SsPrQOgn3SinsWLy1uIiBg==
X-Received: by 2002:a05:6214:14a:: with SMTP id
 x10mr22133949qvs.158.1585748837805; 
 Wed, 01 Apr 2020 06:47:17 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4518-0223-1e7c-39c9.inf6.spectrum.com.
 [2606:a000:1401:826f:4518:223:1e7c:39c9])
 by smtp.gmail.com with ESMTPSA id j15sm1433037qtr.40.2020.04.01.06.47.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 01 Apr 2020 06:47:15 -0700 (PDT)
Date: Wed, 1 Apr 2020 09:47:13 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Linus Walleij <linus.walleij@linaro.org>
Message-ID: <20200401134713.GN27133@bill-the-cat>
References: <500b672581d74a37b23de7a9c35125c9@SFHDAG6NODE3.st.com>
MIME-Version: 1.0
In-Reply-To: <500b672581d74a37b23de7a9c35125c9@SFHDAG6NODE3.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Marek Vasut <marex@denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request: u-boot-stm/master
	=u-boot-stm32-20200401
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
Content-Type: multipart/mixed; boundary="===============4759979906669080298=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4759979906669080298==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2mn5I12kNrrJqSvn"
Content-Disposition: inline


--2mn5I12kNrrJqSvn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 01, 2020 at 12:43:44PM +0000, Patrick DELAUNAY wrote:
> Hi Tom,
>=20
> Please pull the latest STM32 master bugfix for v2020.04 =3D u-boot-stm32-=
20200401
>=20
> With the following changes:
> - Fix device tree of Avenger96 board from Arrow Electronics and add
>   compatibility with stm32mp15_dhcom_basic_defconfig
>=20
> CI status: Failed for vexpress_ca9x4 test.py
>      https://gitlab.denx.de/u-boot/custodians/u-boot-stm/pipelines/2592

So, this failed because we tried, again, to run a test that we're
supposed to be skipping.  I both want to know _why_ this keeps happening
but also think we really need to update the vexpress config such that
EFI tests are not skipped and we have the device tree available (via
fdt_addr or fdtcontroladdr environment variable).  Thanks!

--=20
Tom

--2mn5I12kNrrJqSvn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6Em2EACgkQFHw5/5Y0
tyzPVAv/QUCXXaq+nUs+zdwW6BjrguKnZ9/Mg5DmVaCpj9N0XBxuhu0NQzWsBCiy
F8asYnE3tsP+hoopGfOZHoeQl8Hn3KjI0+cwFf4BU/lIE/OC5bzKPtoK1jwVN0U7
ZsODoJPukTy+pbbjv5Gmm/LUUpwUzI18s+lke608QWd/hvTib4852IPRVT+JVy1v
5KQ7J68ny/NSA3gMGjCeRryPPEsfRdS9/q6ukwZl2KaZiOLk++HtQTsL7RvLSD/d
PxbbBJprHV/wsNWPX+DG5Qxt6cSmaX4XuOg6W8k3I8jKOsid6y6HYnERro43qlgO
46fVB0GUcLl8GRBAXBEmk7UiEWmnqA8ADyJuysSu6aHbraS1qT3+n8zrQMfoY1Eu
q7PYrloCcq/d+Z3xBll7rJM9lBF1lwfGnmA2j9+aUe84kBZZhk+7RdPafj7l6yuM
wgkrpyVpfmKBjnNy1Yxa/nvsnnwcXQxFXkLnvrTgJb0V2brbnia8FoWEU6ItGq0u
GwFq8Fc+
=QCuv
-----END PGP SIGNATURE-----

--2mn5I12kNrrJqSvn--

--===============4759979906669080298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4759979906669080298==--
