Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2B63C2762
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Jul 2021 18:15:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72E18C57B53;
	Fri,  9 Jul 2021 16:15:31 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9A3FC32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jul 2021 16:15:29 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id w26so1129209qto.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Jul 2021 09:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WZJRKGKWGL+iAFCHNNhsI2j5RW8SvCEl0O4HL2iX4JY=;
 b=PjfoomVuFjAvf3qsIr8LBOZclQm8XkpjfLRJyf2a+NvgSZgVegGIfTmHCVT6Sh/bfU
 gdcOHm/gvDNJ78quPsKBszGT7wxP2BqQFILkvITsDiedo8hFVPkMv7Ai4wLKbJHlRtxC
 kQbsPz5xsBNtUslrRzL/MRijN90Exq+SmJPek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WZJRKGKWGL+iAFCHNNhsI2j5RW8SvCEl0O4HL2iX4JY=;
 b=lQVTluCi7OUXr5AT2wWttX44mTENnAakzAADGzpIK+xe2P4pHR7Ea4b5eNeLvGPAok
 3xSa2MqJKYeBQybT/llB2HWLVweRzENWmn0AXfVNAJmTwG23LOERKd8pbiDfJXZ3PQrR
 J4IF+oMSkbicOEIQDn1DWTHaXrjdX6ed+/Tywe4BW+zTOPhmZU/XvRhp2p8NQ3G6y6x7
 R+DlDdYg3IS7faqof/8i0rX6hptJNGWPrGuPyjglMH1A7cPMhBd4QDV3RhxZ9sZWAZl+
 DhzG5Lqh6ZvJkOgFyTBHBFIQL98iLvy8f6VfDiKsulbl/hvp0UyMQa0zhTyeHOhvJwHM
 MfiA==
X-Gm-Message-State: AOAM533ev7w4V4F2+x29bGwnz5J6R/11ShmWcxPVrMvjYjeIQEBNOH+3
 t4PodcA5lY9U+3TMmZe+rC9MBw==
X-Google-Smtp-Source: ABdhPJwcwV5ZnCRhuGk7gzvAYgeLHDLfd5b3dmJBM939Xs+ZfEIOLlEsvV9A+wUyxuU7KD0XEy9Clw==
X-Received: by 2002:ac8:53d8:: with SMTP id c24mr34847480qtq.38.1625847328539; 
 Fri, 09 Jul 2021 09:15:28 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-1083-622a-b9ec-c6c6.res6.spectrum.com.
 [2603:6081:7b01:cbda:1083:622a:b9ec:c6c6])
 by smtp.gmail.com with ESMTPSA id z7sm2262743qta.92.2021.07.09.09.15.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 09 Jul 2021 09:15:27 -0700 (PDT)
Date: Fri, 9 Jul 2021 12:15:25 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20210709161525.GA7917@bill-the-cat>
References: <20210226124451.3799-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20210226124451.3799-1-patrice.chotard@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Simon Glass <sjg@chromium.org>, Suneel Garapati <sgarapati@marvell.com>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, mark.kettenis@xs4all.nl
Subject: Re: [Uboot-stm32] [PATCH] arm64: Update memcpy_{from,
	to}io() helpers
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
Content-Type: multipart/mixed; boundary="===============5666212376550070674=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5666212376550070674==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2021 at 01:44:51PM +0100, Patrice Chotard wrote:

> At early U-Boot stage, before relocation, MMU is not yet configured
> and disabled. DDR may not be configured with the correct memory
> attributes (can be configured in MT_DEVICE instead of MT_MEMORY).
>=20
> In this case, usage of memcpy_{from, to}io() may leads to synchronous
> abort in AARCH64 in case the normal memory address is not 64Bits aligned.
>=20
> To avoid such situation, forbid usage of normal memory cast to (u64 *) in
> case MMU is not enabled.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: mark.kettenis@xs4all.nl
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Sorry for the delay.  If this is still needed, you'll need to address
the build failures on platforms such as cgtqmx8:
+(cgtqmx8) board/congatec/cgtqmx8/cgtqmx8.c:377:6: error: conflicting types=
 for 'reset_cpu'
+(cgtqmx8)  void reset_cpu(ulong addr)
+(cgtqmx8)       ^~~~~~~~~
+(cgtqmx8) In file included from arch/arm/include/asm/io.h:341:0,
+(cgtqmx8)                  from board/congatec/cgtqmx8/cgtqmx8.c:12:
+(cgtqmx8) include/cpu_func.h:88:6: note: previous declaration of 'reset_cp=
u' was here
+(cgtqmx8)  void reset_cpu(void);

that are introduced with this patch.  Thanks.

--=20
Tom

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmDodhMACgkQFHw5/5Y0
tywKFgv+IfDignmGLHfIt1JkUgvqqzQ2LuL701Hn3iMZBJQFmi68Gy1iGj2AY5h3
6U74MJkj+glD/zi5vcRycS2oFM6ngEhReExBRxjqiLagkk3/MswqxHUsEnbm6nYp
w1ErIfEdpVUXOKdYeDvqfFv6hjdgWI9id0QDIwcRGQR6QQZj0h6KTOtwUM73gBHw
jydCZQT6g9S4lL63P8xHytm3N6Xk2IIZo5xCNQz+yrP4ArUFejIp+SQUUheiVNaj
8SfV7luhUZXnzDWukuhq1FsYoaUCAy7Y8VcSzVM3WPPfOwvJXgN50L5vmD9hN4+N
sv+TfEAwiEr0xMFEYsNTFLE1e6EvL3ulIHyzyyi518dQQpKk2oE+AYTGvZhTRUKj
Bw/7N9xrztiVblARudcWTWcktlnFRh5RNUMPVHTOuih61ntVNnU1NxuWS/WBhkZ/
TYOXpgqUaYg3d8hbJYpHlyYrYNedsSG5pMbPiuorbtdjsMuddHTBH3R6igbCFZSl
spFyhPGH
=TEUr
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--

--===============5666212376550070674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5666212376550070674==--
