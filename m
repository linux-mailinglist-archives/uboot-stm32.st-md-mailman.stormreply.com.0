Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E24BF23D2FE
	for <lists+uboot-stm32@lfdr.de>; Wed,  5 Aug 2020 22:27:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9342C36B38
	for <lists+uboot-stm32@lfdr.de>; Wed,  5 Aug 2020 20:27:25 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 419ACC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Aug 2020 20:27:23 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id m7so10801722qki.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Aug 2020 13:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+m64ruE3rdxf0fEc2grv6jwTtHe2xGCt0Jv7pN4TEG0=;
 b=EeBUJx9OvKtCZRM/7i8t3r+cr0hZaWKFIL9DiqvAkk+VpigBT/CFPoGRH84o2piRqp
 jxWEuB8sL0wJ+1nEZQUcuEebtjYWhw5wA+CYLhiA0qv7MdYS3itD5X0ZVazB5VsDBVon
 1OZB8g7H0ECsYTY5mPkiVmpu63reBw/tMTyoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+m64ruE3rdxf0fEc2grv6jwTtHe2xGCt0Jv7pN4TEG0=;
 b=kp0TU4FkGkMWO9jrcqjAX33aBz4tLkeE4v06aIvQIEEBBY588YitKLyeRiprHf9twO
 mnFxNtIo1wimm/Pwh1ytzDY8Turv+fa/PlleTVBepOEbNtn28357YV1klf5h9rxi5oMS
 ojY0I7iPKBy2fbuUZXYVoOTEy3FnwPG5OZNrCtep0vy3zQCKAOjCFmTvIDJjmGvdcigg
 y7IRQFmNypPSf5OIS5kOtD2bNSsR2/dK26jjqcKu1IPXE5tY5NrQkjjJ9nqfFRqd9tcx
 42VGQSgH8fywYQ+mHU3pXBZWY8/yeuc+r5Mfx0x3P66IkkGmfbRRr1jB5Z0Xa7Yv91h6
 Gh7g==
X-Gm-Message-State: AOAM530EcPo06mqyf90lpjnylDO7zmrWm8cti6/Uu156Bw9A6Gbru0uY
 pXLOW/GRDbNVxv9B9S79rlYVaQ==
X-Google-Smtp-Source: ABdhPJyIO57CkCJcE4aJ4J7Kx9I5Qn+hNt/xVKkyZB0XuxbUrIPkIGXZnJZjhHE5ej/dqiuwa39tDg==
X-Received: by 2002:a37:6211:: with SMTP id w17mr5121759qkb.14.1596659242101; 
 Wed, 05 Aug 2020 13:27:22 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-3826-99f0-e3e6-2490.inf6.spectrum.com.
 [2606:a000:1401:8c61:3826:99f0:e3e6:2490])
 by smtp.gmail.com with ESMTPSA id w44sm3068327qtj.86.2020.08.05.13.27.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Aug 2020 13:27:21 -0700 (PDT)
Date: Wed, 5 Aug 2020 16:27:19 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200805202719.GX6965@bill-the-cat>
References: <20200717142009.1.I33bddfcff61ece321e626b04e34f9b53d016d6f2@changeid>
MIME-Version: 1.0
In-Reply-To: <20200717142009.1.I33bddfcff61ece321e626b04e34f9b53d016d6f2@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [Uboot-stm32] [PATCH] psci: put psci_method in .data section if
 EFI_LOADER is not enabled
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
Content-Type: multipart/mixed; boundary="===============5474651221216379767=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5474651221216379767==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6gn/eZb/68GftVhn"
Content-Disposition: inline


--6gn/eZb/68GftVhn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2020 at 02:20:15PM +0200, Patrick Delaunay wrote:

> From: Yann Gautier <yann.gautier@st.com>
>=20
> Move the variable psci_method in .data section when EFI is not
> activated and the psci driver safely access it before relocation.
>=20
> Without this patch the variable is located in .bss section
> and the psci probe requested before relocation corrupts the device
> tree (probe is requested by board_f.c::print_resetinfo()).
>=20
> When EFI_LOADER is activated, this variable in already located in the
> .data.efi_runtime section by __efi_runtime_data.
>=20
> Signed-off-by: Yann Gautier <yann.gautier@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--6gn/eZb/68GftVhn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8rFicACgkQFHw5/5Y0
tyxBMwv/UrnRK+DoPe4J6GYX1EJPivOChdvvPynNCRfmE7SoVB1gOQI+/IBzTJFn
95iiIoEKjbNQzRmNr/21nhOzTZdQmc7sbwmOJwzlIjyyJpbcm33qHqshs1Rgw6pH
UA2/RX2nshPOs+efMDFun3jogUCJcyuGMzMxDKlHIbMF/5RBzz//+ISkv/OYYttz
aLbP83RSki4HDOwXcxq3c0AU0APo/fz3J8bWxyRLdQzrihM4yJWHlRw3oevlU9v+
X7Xc2Lergie2jiQb8XZEItfjA7UyxZD7xGoByLD93NE7gY9s5DFWJW+BgL3i63OI
oAvTuxAx/zCP4k7LaeTSv8sn2Sb5h06+Kq80UbAzXccqWmFnPelfq7LdiygyI1/j
jtoTp+2FpJph6bdvoy2SnYWfYtZaO/UOMEOt5vWydT3uIeRRgxWy2VVsREhre9Zq
3OYdqFe9OkBx65AmgbT4It6a8KSAvsCShT5GjkLumEBbJlGIQRjI4g+gpraZBBft
02NHc4IO
=ijs9
-----END PGP SIGNATURE-----

--6gn/eZb/68GftVhn--

--===============5474651221216379767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5474651221216379767==--
