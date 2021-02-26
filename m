Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF473267E2
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Feb 2021 21:10:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03A28C57189;
	Fri, 26 Feb 2021 20:10:56 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11DF1C3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 20:10:53 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id 136so4054945qkl.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 12:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PdXtvpBXU+mA0rYpZ8jdPIh6tFsXcObA1LUctk0XhuU=;
 b=mXPnHRL4HnmnIq7sAshMjUI4wO2LfudG4iHIKtyAGpFEMr0/IswY5I0PocJlHVd9fF
 W9P7L2txReXOQPcJNLNM2bsk3tQqUkxZoDEHaOQFsUfYSEe0q5lrE+Xtt1ZhgZBEeux0
 4kntUba+UWzP8PuahNAz1eRqvaFbugg+hr2XA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PdXtvpBXU+mA0rYpZ8jdPIh6tFsXcObA1LUctk0XhuU=;
 b=BCPFeY0hJl3XMcevu0cyrkSPKTLkZlq75i/rWf9wyIE6tPR/ZHd4X/+SjIILObmxyM
 Zy4NAcSk828tNeX7+zR0DJOcpXBNdIDlS7dr1iy6TzI38LZIlUcGcVN9me3YMpyzG2jL
 qWeCSUsuxb4cDsmCQLUVz5bC72b5VNKuwW+yxigifvJ0ylZEyIx0C4KSm0DPw0Ou3xf4
 dLZ3M8rOhHmQPFpARQ1EF+5aUNdz8lzNVzzKfqiqiIGqaxFOJWOrqjlw23e5yTrRmuMC
 8C5NC2Vm4gb1W16oH0o3VQzfKU9IzOvcvFpgVoyGQhUkkp3WQhRzxCWTYM9jbOQrLvHp
 8TOA==
X-Gm-Message-State: AOAM530P2r6NROk5AAVF6VNOGJoWUkWENB9aoPPqd4CpcuZzvH2ODsTL
 jPczYLP056lSgSFYgEMuVAiFkw==
X-Google-Smtp-Source: ABdhPJwmIs6PDrq9dWSouGqcV55Soh6rKIFRG+UvwZJKVmSNxxjneyynINT6/i33xrypomAW7kJ/aA==
X-Received: by 2002:a37:4a91:: with SMTP id x139mr4529395qka.102.1614370252317; 
 Fri, 26 Feb 2021 12:10:52 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b07-927a-9cc6-7e57-e413-2a3f.res6.spectrum.com.
 [2603:6081:7b07:927a:9cc6:7e57:e413:2a3f])
 by smtp.gmail.com with ESMTPSA id 15sm6251486qty.65.2021.02.26.12.10.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 26 Feb 2021 12:10:51 -0800 (PST)
Date: Fri, 26 Feb 2021 15:10:49 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <20210226201049.GQ10169@bill-the-cat>
References: <63f51866-2ee6-5206-8f07-02a266be123e@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <63f51866-2ee6-5206-8f07-02a266be123e@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [Uboot-stm32] [PULL] Pull request for u-boot master / v2021.04
 = u-boot-stm32-20210226
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
Content-Type: multipart/mixed; boundary="===============0909497768873639949=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0909497768873639949==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PPlfXqi3dv/X+Skb"
Content-Disposition: inline


--PPlfXqi3dv/X+Skb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2021 at 06:17:33PM +0100, Patrick DELAUNAY wrote:

>=20
> Hi Tom,
>=20
> Please pull the STM32 related patches for u-boot/master, v2021.04:
> u-boot-stm32-20210226
>=20
> - Add USB host boot support in stm32mp1 config
> - Enable uefi related commands for STMicroelectronics STM32MP15 boards
> - Remove duplicate uart nodes in stm32mp15 device tree
>=20
> CI status:
> https://gitlab.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/6533
>=20
> Thanks,
> Patrick
>=20
>=20
> git request-pull origin/master
> https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
> u-boot-stm32-20210226
>=20
> The following changes since commit c28d5d704d3347fcbe5e49ab561973c00bf933=
7f:
>=20
> =A0 Merge branch '2021-02-25-remove-platforms' (2021-02-25 13:18:27 -0500)
>=20
> are available in the Git repository at:
>=20
> =A0 https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
> u-boot-stm32-20210226
>=20
> for you to fetch changes up to 1b3db349c011e7905a03126d9a78e1fb9886efb7:
>=20
> =A0 configs: stm32mp1: enable uefi related commands (2021-02-26 15:45:22
> +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--PPlfXqi3dv/X+Skb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmA5VcYACgkQFHw5/5Y0
tyypEgv/aqGY1Z4gUstP57qoyfPCOkOZD0Pk2+G/6IOGxWxO3gu8utA8nptxuDA1
8vBaW5Z3wDD5d7ntOrVCm/5NmBHBK2m/PHovUffRzhfcvA4U93pSjPcOVwgYESiV
TGAFi+/E+OOn+4UEQ58INQy3PdpoKt+aIadfCYqgV7KZr+IWEaZAy8Z4UuodMuBe
GtCcdqwsp5XFtZw4jvg05YfI9/3kU+2fyflJd6uRh3qbQPemyaZ2/MlheZuPEDAo
9MIlOPnyuyMxPZkU7LFyDmE0Ql03IoRsKLWZS9zyOYenLzxR6xEI6zEq5wq0aSoB
aTIWMUQpWAOYH8kwbu+fqzEWR93/fh9cEONPHMi9YfzsN9MrDuX8MWu27YnWtl2Q
Z+jtDdEHPQKofBJ1+X3in+17pr0c4X7O7ZVncKyVt90gddQT0Rd+2qUrWpK11bNu
sgeXy/LHCwYJ+kFkRSJ1cvf6tTvzkNILYBuEYnL7atXzqmgr3+wNb3C14GHjzUwn
ZoLHss48
=lV1G
-----END PGP SIGNATURE-----

--PPlfXqi3dv/X+Skb--

--===============0909497768873639949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0909497768873639949==--
