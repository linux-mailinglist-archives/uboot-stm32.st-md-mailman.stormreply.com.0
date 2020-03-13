Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A529184D95
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Mar 2020 18:26:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06330C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Mar 2020 17:26:08 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FABDC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2020 17:26:06 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id v15so8183848qto.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2020 10:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LhzCO1UlBvaMpB4JhdftWoFaEtsIq0scMosGyQtHXaw=;
 b=CAfcFwWD/vxJnzeqjy+l2gLTyURtcljVMYA1jHc3rN8oX6F3evyF+z8700kZONu/QE
 TvnEJhIWC6DwekHAcaEv2df4E9e4PafrQYTqSorrbuxaW2ekCJKOXyH2CNiGYJRPYlUc
 J5d6Xa08ywKGld6Fn38gYedE6legJTwU+tFJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LhzCO1UlBvaMpB4JhdftWoFaEtsIq0scMosGyQtHXaw=;
 b=VayN8zTwVZZG9yYrlLwStOdMehan/t4d0U/ASV/VLKpodDhXjsmF4noP11M0m3OOxE
 QDG3Mouq1L22U1COcdtWuRjs15Bqc7bRXMRi3xLsj79zH8fkobiHFLLsisqU4aWOtEJe
 suRqpgc3Z0Q5EZa4rQ16PpSZf0LbMX8of8NcYzVzRkNy79OZT+ww+AOlThr6Ejxx5pE4
 UR4ifMWAtUm4wSTfhEz/ecxNoiu7XCDVEB1ntMUGoQnA9CBgq4usZrtoYp/WnYQISSNo
 AZ2r1vjuhWyLPUwGUy03Fa/oOkpcPr+MItDWr1h1wcIv+PEFtGtx7PE4tm+xJ0Ks9JD5
 vYGQ==
X-Gm-Message-State: ANhLgQ0SkW8MpX2LoY6QodJcff9tCuaBp5r7OLO2ToZyV3plfKoWTfgD
 /oz4HcGEP3bMoRNvfnNZlC9MIQ==
X-Google-Smtp-Source: ADFU+vu+cQmmdtRjAKQ4lrfXHTORuvMjh+eegFrniCPk+zhCzIdbmfHQIB8L42BPxA3C3QJCtKY7wQ==
X-Received: by 2002:ac8:4e91:: with SMTP id 17mr13992029qtp.133.1584120364945; 
 Fri, 13 Mar 2020 10:26:04 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c31-2540-47b7-0a1a-2287.inf6.spectrum.com.
 [2606:a000:1401:8c31:2540:47b7:a1a:2287])
 by smtp.gmail.com with ESMTPSA id f13sm16483423qte.53.2020.03.13.10.26.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 13 Mar 2020 10:26:03 -0700 (PDT)
Date: Fri, 13 Mar 2020 13:26:01 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <20200313172601.GK12423@bill-the-cat>
References: <20200312111114.1.Ib3afa8c50c18f3d86fb39f535864476f697b8ba7@changeid>
MIME-Version: 1.0
In-Reply-To: <20200312111114.1.Ib3afa8c50c18f3d86fb39f535864476f697b8ba7@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, "Andrew F. Davis" <afd@ti.com>,
 u-boot@lists.denx.de, Jagan Teki <jagan@amarulasolutions.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] MAINTAINERS: update entry for ARM STI
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
Content-Type: multipart/mixed; boundary="===============2912918867649983340=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2912918867649983340==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4kf3ZaKr/mmDV0ZC"
Content-Disposition: inline


--4kf3ZaKr/mmDV0ZC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2020 at 11:11:18AM +0100, Patrice Chotard wrote:

> Add STi drivers/include files and git tree.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--4kf3ZaKr/mmDV0ZC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl5rwikACgkQFHw5/5Y0
tyyepQv+P3jnIzlAlTKfSdRSP4K81ALd7eaguF5oD6qv6AWALpyCdQiJCfWMS60t
x8cceCv6rXJ/yyPkt3qu678g++bKL7y2nlnECYxb975NeXEjvKMV3UibHtMVXSXC
pSOIXzRYrw3qVVvGQxRzLMoNtYOzAwlIVZWbTxowWAAg4KJ1ft5Af6FKzuSnf6YT
c7tUWQn4VbyIqsf4Z3RwX2TUGGejehqwvGvPu6OQsX6DmwCtpZCYrp7c3IGHEPAL
fKlULy/UbpGGHZxA99BEuOIVLae2DC3rKRhniVRl1GPQcLPK+RA0kLW+G+2DqTkp
cPrPHIONhO5bsPcbNP/Pa8ZoEzJKtOw9prm3hsr4EWBxcUSLVlggcnzh37R71onP
ZxIMkZQWGaxlL3TH3nbSyF6SPhheBzW+AP/veDxPzWY1PztYAmkYCFAiAgqjKN7R
eGGfDzp2jEMQ0KSQZFMMXPw/zjQ0lYiKILdlIE7AWvhsMsZyb6iv3mnX/aTWDNYB
z9T2HCKf
=QiCt
-----END PGP SIGNATURE-----

--4kf3ZaKr/mmDV0ZC--

--===============2912918867649983340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2912918867649983340==--
