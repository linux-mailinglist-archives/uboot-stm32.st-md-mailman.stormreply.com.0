Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC1939E9FA
	for <lists+uboot-stm32@lfdr.de>; Tue,  8 Jun 2021 01:16:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8C49C58D79;
	Mon,  7 Jun 2021 23:16:55 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44811C3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Jun 2021 23:16:54 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id t17so13911763qta.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Jun 2021 16:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vBu8sENPWC4x7vYD7NB0ca++uVZTVDtahsKfAEov+uk=;
 b=M4Y7vbNvk65kcJ5vTr2cVBkxhSEBJuDdopzqSrAg1+DUeM81TUhd41cQibQ9emJUtR
 PCmBC4mOG1FKjEpzUR3sPnAdp3uOIAINXaobYXcWTFlfXrNzg4uq5YHjun75+aOYVTTo
 T/7fPvWomtQwvA0/rK0U5fmv+otk42ShPOaVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vBu8sENPWC4x7vYD7NB0ca++uVZTVDtahsKfAEov+uk=;
 b=AwSSYtdD58qAiGwxTPv5+rTrKGFsE8RnyqZtNDrIPYf+GGMRDIUGmRGSFmwMkvr4Ex
 Q8RO+GqvTJvGPb3LMx96eo9q3Z+0cTCrCZUf6b7Fg/FlO51djoR28HcVxbsjDTaJ3d70
 YMOB37HT+mikTRGvXVZK7B+uNbgWg8dUPiAJ5AcDA9PmZpnoQe79xrTeOwaAdnN/Bi0R
 mwo9ROERw01Lw5usoVqap3FPdYxilJrCIt5QqaznBuT0mzy22BU6K70C6v0Dwoun0rjP
 4ss58JPJwhumzz5/f5ejngR9KpmsHMd299u6nHaoTOpEJB0X2qE87sMY37im2WOEMcR8
 6nQg==
X-Gm-Message-State: AOAM533mrTgh5ihTHjTg/pZZmbLnuHV9avlvHh/bLmaMsAPvl6dVjmH/
 5+eF1Vsf18G/aFgKeaF1S0O9Jg==
X-Google-Smtp-Source: ABdhPJyPdT9VwjC4RL6TGtv+ffSe8VA1N5psek9zNB8o/hHnchGiJexOTVhGbRv3wULTHX8SzEMPuA==
X-Received: by 2002:a05:622a:392:: with SMTP id
 j18mr18670589qtx.6.1623107812960; 
 Mon, 07 Jun 2021 16:16:52 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-a887-7949-d39f-5384.res6.spectrum.com.
 [2603:6081:7b01:cbda:a887:7949:d39f:5384])
 by smtp.gmail.com with ESMTPSA id y1sm11168803qkp.21.2021.06.07.16.16.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 07 Jun 2021 16:16:52 -0700 (PDT)
Date: Mon, 7 Jun 2021 19:16:50 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210607231650.GA4481@bill-the-cat>
References: <20210507125035.1594-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20210507125035.1594-1-patrick.delaunay@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: chenshuo <chenshuo@eswin.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>, Tero Kristo <t-kristo@ti.com>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wasim Khan <wasim.khan@nxp.com>, Stefan Roese <sr@denx.de>,
 Simon Glass <sjg@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v4 0/7] arm: cache: cp15: don't map
 reserved region with no-map property
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
Content-Type: multipart/mixed; boundary="===============0856481465068888379=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0856481465068888379==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 07, 2021 at 02:50:28PM +0200, Patrick Delaunay wrote:

> Hi,
>=20
> It it the v4 serie of [1].
>=20
> This v4 serie is rebased on top of master branch with update after Simon
> Glass review and added tags.
>=20
> On STM32MP15x platform we can use OP-TEE, loaded in DDR in a region
> protected by a firewall. This region is reserved in the device with
> the "no-map" property as defined in the binding file
> doc/device-tree-bindings/reserved-memory/reserved-memory.txt.
>=20
> Sometime the platform boot failed in U-Boot on a Cortex A7 access to
> this region (depending of the binary and the issue can change with compil=
er
> version or with code alignment), then the firewall raise an error,
> for example:
>=20
> E/TC:0   tzc_it_handler:19 TZC permission failure
> E/TC:0   dump_fail_filter:420 Permission violation on filter 0
> E/TC:0   dump_fail_filter:425 Violation @0xde5c6bf0, non-secure privilege=
d read,
>          AXI ID 5c0
> E/TC:0   Panic
>=20
> After investigation, the forbidden access is a speculative request perfor=
med
> by the Cortex A7 because all the DDR is mapped as MEMORY with CACHEABLE
> property.
>=20
> The issue is solved only when the region reserved by OP-TEE is no more
> mapped in U-Boot as it is already done in Linux kernel.
>=20
> Tested on DK2 board with OP-TEE 3.12 / TF-A 2.4:
>=20
> With hard-coded address for OP-TEE reserved memory,
> the error doesn't occur.
>=20
>  void dram_bank_mmu_setup(int bank)
>  {
>  ....
>=20
>     	for (i =3D start >> MMU_SECTION_SHIFT;
>  	     i < (start >> MMU_SECTION_SHIFT) + (size >> MMU_SECTION_SHIFT);
>  	     i++) {
>  		option =3D DCACHE_DEFAULT_OPTION;
>  		if (i >=3D 0xde0)
>  			option =3D INVALID_ENTRY;
>  		set_section_dcache(i, option);
>  	}
>  }
>=20
> Just by modifying the test on 0xde0 to 0xdf0, the OP-TEE memory protected
> by firewall is mapped cacheable and the error occurs.
>=20
> I think that it can be a general issue for ARM architecture: the "no-map"=
 tag
> of reserved memory in device should be respected by U-Boot if firewall
> is configured before U-Boot execution.
>=20
> But I don't propose a generic solution in
> arm/lib/cache-cp15.c:dram_bank_mmu_setup()
> because the device tree parsing done in lmb_init_and_reserve() takes a
> long time when it is executed without data cache.
>=20
> =3D> the previous path 7/7 of v2 series is dropped to avoid
>   performance issue on other ARM target.
>=20
> To avoid this performance issue on stm32mp32mp platform, the lmb
> initialization is done in enable_caches() when dcache is still enable.
>=20
> This v3 series is composed by 7 patches
> - 1..3/7: preliminary steps to support flags in library in lmb
>   (as it is done in memblock.c in Linux)
> - 4/7: unitary test on the added feature in lmb lib
> - 5/7: save the no-map flags in lmb when the device tree is parsed
> - 6/7: solve issue for the size of cacheable area in pre-reloc case
> - 7/7: update the stm32mp mmu support
>=20
> See also [2] which handle same speculative access on armv8 for area
> with Executable attribute.
>=20
> [1] http://patchwork.ozlabs.org/project/uboot/list/?series=3D241122&state=
=3D*
> [2] http://patchwork.ozlabs.org/project/uboot/patch/20200903000106.5016-1=
-marek.bykowski@gmail.com/

For the series, applied to u-boot/next, and I've taken the above and
reworked it slightly to use as the merge commit message.  Thanks!

--=20
Tom

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmC+qNYACgkQFHw5/5Y0
tyxYXAv/b475dhqXlmy0IGUBLe31Sgl3zDACvw9wWN/wE+RjKDbf/BB3Lx66J0Cr
gz1CKlN99SyG/uYGnjYyFw9FKkZEtaaAGjnWOS/VYEb9r2NHnZENA50LOg7DteKT
G4M2HtWhiPweqeanehGN91KaHL+j71MVHa91NJkdggOSWNMBcvRlzQEv9Ak8w1Xk
nSrgDl+lM/eHhwCh+btf1f+4YA7z+sh0DLsKMh5CEAFLM9RoOJNdVHMOO6cnDz08
LcqGUDBlTgzi2mcljNJba72iwmZ9TdKi/msEgLv78JMxezFVTUxwjN2XYRcX1rk+
okIZLNF8nvVAWfL8eCy1QZ4NYJh9iRIbdeSil/LbyuqJ3h8dc4mK9Sbt3Zu89VIM
XUNyP0aUjNmml/eJOzQFUU5CuTUZSk18wrUWqoXNqI0kyZJUVK6hOhAVnhhXWGs4
iSl5+w7JlO1QynOHVx4GUjpqcWFugYntZsIBYGZs9er+AkKHaqf8EmhT/E/sSqzW
tqoD+dud
=svFm
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--

--===============0856481465068888379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0856481465068888379==--
