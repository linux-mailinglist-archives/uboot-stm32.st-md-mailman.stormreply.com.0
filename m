Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13321324209
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Feb 2021 17:26:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3BFDC57B58;
	Wed, 24 Feb 2021 16:26:06 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 291FDC57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 16:26:04 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id s3so1255841qvn.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 08:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tDwe3Yl6k5+04x7KxtqoO569MhHP6vT3sTwbUOb5hSI=;
 b=I9+wai1tIfCtGDscjHfgBvrdEgqDre8h/L8QJ8AS0/zlMFJ4Fa4CXhB7JgfiNHbHcx
 dns+ye35iuOIIsmudtCzSZDzcQUAbAkEVP4JX2+ocdh0/YrlEkU1qKwj/F7N1FrgaMD2
 0S3Wsx+sr7ml7W2STExDhTdmP9ek3ERF/GWUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tDwe3Yl6k5+04x7KxtqoO569MhHP6vT3sTwbUOb5hSI=;
 b=NfvxN9VZlABG+FXMEvvDt8PokUXlTaWQKLRJcFM4Fnz3erPGFR9LL1+BhLcoVOH3Yz
 NoNJHvarVX/AIFPtTiUaQCNcKAIEd8A1iHn3X8QRqhgp82/A7Tc3cpUUpyvKolLvZ1Y3
 3xj23SMN79Y0OOgE5WW07Ljw0LfweF69WkcUrcjgMESuJtDvw8S9p4NLZ4qDHUOjLKJQ
 fcyiPMYCGXwHjQG0sCLjGsg8oAnPf/MNXLS0SXgkV1FVgcell9/ijapNXP6tbs7uEKMh
 nSnwqaK2bBebmNZkFwW4yXPK7K2v23RM91SXUNcIudDZ2bztjIaqRIOFa3wFnxiKytQm
 RofA==
X-Gm-Message-State: AOAM530aLEQsAAiegV0TAD3j4eNGMFLYeK8xgM4KqfCqRqYn9otcp5YA
 MbHdK1cBm+YCb3FT4yZNK6faQQ==
X-Google-Smtp-Source: ABdhPJz+jKC0dDazqS+0tn6ji/x/aE3e3ulmpqtBCy4wYJVQ+HydsaQLOigrMiiUMZWuFr51t7W/vQ==
X-Received: by 2002:a0c:cc8d:: with SMTP id f13mr7446489qvl.8.1614183963771;
 Wed, 24 Feb 2021 08:26:03 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b07-927a-359f-2326-aa06-4d35.res6.spectrum.com.
 [2603:6081:7b07:927a:359f:2326:aa06:4d35])
 by smtp.gmail.com with ESMTPSA id u126sm1770971qkc.107.2021.02.24.08.26.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Feb 2021 08:26:03 -0800 (PST)
Date: Wed, 24 Feb 2021 11:26:00 -0500
From: Tom Rini <trini@konsulko.com>
To: Wolfgang Denk <wd@denx.de>
Message-ID: <20210224162600.GN10169@bill-the-cat>
References: <20210224121904.13927-1-xypron.glpk@gmx.de>
 <CAEUhbmV-ie_-G=jASQNDQ26VO78jQXX5D-wQUJPp3psWS67snQ@mail.gmail.com>
 <20210224134257.GJ10169@bill-the-cat>
 <633221.1614183196@gemini.denx.de>
MIME-Version: 1.0
In-Reply-To: <633221.1614183196@gemini.denx.de>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Bin Meng <bin.meng@windriver.com>,
 Sean Anderson <seanga2@gmail.com>, Stefan Bosch <stefan_b@posteo.net>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Naoki Hayama <naoki.hayama@lineo.co.jp>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Weijie Gao <weijie.gao@mediatek.com>,
 Marek Vasut <marek.vasut@gmail.com>, Ramon Fried <rfried.dev@gmail.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Robert Marko <robert.marko@sartura.hr>, Adam Ford <aford173@gmail.com>,
 Michal Simek <monstr@monstr.eu>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/1] Correct U-Boot upstream repository
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
Content-Type: multipart/mixed; boundary="===============4842389322006097579=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4842389322006097579==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HWZX0a4mpW+prPEs"
Content-Disposition: inline


--HWZX0a4mpW+prPEs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 05:13:16PM +0100, Wolfgang Denk wrote:
> Dear Tom,
>=20
> In message <20210224134257.GJ10169@bill-the-cat> you wrote:
> >=20
> > > Where is this information posted?
> >
> > https://lists.denx.de/pipermail/u-boot/2021-February/442175.html
> >
> > Which yes, we need to figure out how to get more widely seen most
> > likely.
>=20
> Well, I posted it on the U-Boot list, and on the Custodian and Board
> Mainteiner lists, too (plus on the Xenomai list).
>=20
> I also update the link on the web page.
>=20
> What else can be done?  If people don't even read messages flagged
> as important ?

I don't know.  I'm updating the #u-boot IRC topic as well.

--=20
Tom

--HWZX0a4mpW+prPEs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmA2fhUACgkQFHw5/5Y0
tyyCpgv/bzED+7VKOgTGacT+X6i9XdFgHdfyR/svbmb7yMXb3DTBrrlsvAjOgmJM
qlYz293ShBTOTatINz0R5qPKcCESTgv3/OSgKldjc5bFSflvR302nsvjOQyjwxSe
4Q1I1adiGR6vl5vjYPPSJovFW8kw2j625Vny6AwPu8uTJXRVgc3JkdabBEXM90UH
kkZEplKo/TJ5JBaab2Zt/1nFgBIJxvy/7HiKFHruVErNZD1GTP9PZT2LO4S14fkY
ONJ75P0M0J4TQ2zlA9w8DBQPCYChHvqhp2a594qSkPFDRZfHwwJ19KYCu4tdazGi
tjm0Skw1soTdItSFtIbSPw38XuaMW30yMUEmMGzJWnv9eRN/acLYiWt4bewQDiUA
Oc5xBspD1DCt3uRGHG4n9Gytj8uXUzxWzE6Lz4dXIkVANpe7/FWgTsEgDUfMed17
SxHmyHY4KK65TWw4J8uCZwdPs9xat1GHLYkHJCXNSla6bO0wrN+LaLuqH/ZKlRik
6IQQeKhf
=g+K3
-----END PGP SIGNATURE-----

--HWZX0a4mpW+prPEs--

--===============4842389322006097579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4842389322006097579==--
