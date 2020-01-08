Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B2A134CDF
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Jan 2020 21:11:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2CA2C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Jan 2020 20:11:51 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69778C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2020 20:11:49 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id w30so2664189qtd.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Jan 2020 12:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TZwUG1IPVziKm6RA+tvAxZ4zrKsDevybi+Z+aUCIvfE=;
 b=jaoDdAo8hp2pbzcGpt20EfGS6hKHjVwM3ULcyckKTM2eLkBtICKwsiM9HOvunfwMua
 gQ5liavF87Be/C4sHSSaxGD9GzxM+QWa7Dz6dm/VNycJz624UuBJHjEPhs3lVZtMS3FL
 ocNM97IE3gZLyi6jbFVsIvuuDjoR+PnFrm0Wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TZwUG1IPVziKm6RA+tvAxZ4zrKsDevybi+Z+aUCIvfE=;
 b=PY0nEEEngP7VCDR3WGwhv7CvwhZKXHyW6Lrp37vvTf1jpHXjc3e7bR3vK5Zme0xzgS
 nbkbYKigAq5c0OUnofbCUGlnkLTo5wpGpErDTBE3MolsZCNvi4KT6GOvvwtwOrzyukks
 gSYO9DQ9OQt65mg0/Xc0dnlNUq8swnGOgp4Rl0KNdF02+JDwCoQhCJYzynlj936r006N
 ONXW3gieD9OAyEmg11EkXGZaYv+yyQa9rH1NrSKAVmUHehOILEMbUuv3pIKN6u17Vnqg
 s/KU6jz/+X++eSKCL7HzDM+uWveBXVMhzc96bNdsQ0ucafOFqidrcegT5/m9qsTfNLqw
 lD2A==
X-Gm-Message-State: APjAAAW+AnS+4bh5X/qyEE6AkCjVIao42SC6wBlD7fg1j5Wc7Nk4F1rM
 STXGWjtBCDZoLZfyBZJw5Ulp+Q==
X-Google-Smtp-Source: APXvYqwB9ZOMtRAYAPm/2IEaS/xv3UFInKk6lM/bAjzWCSMF1xL2Nrka2xwlnkwXsBU+o26huXgycg==
X-Received: by 2002:aed:2823:: with SMTP id r32mr5070134qtd.201.1578514308682; 
 Wed, 08 Jan 2020 12:11:48 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
 by smtp.gmail.com with ESMTPSA id k4sm1912921qki.35.2020.01.08.12.11.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 Jan 2020 12:11:47 -0800 (PST)
Date: Wed, 8 Jan 2020 15:11:45 -0500
From: Tom Rini <trini@konsulko.com>
To: Fabien Dessenne <fabien.dessenne@st.com>
Message-ID: <20200108201145.GD31026@bill-the-cat>
References: <1572442713-26353-1-git-send-email-fabien.dessenne@st.com>
 <1572442713-26353-2-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
In-Reply-To: <1572442713-26353-2-git-send-email-fabien.dessenne@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Simon Glass <sjg@chromium.org>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Suman Anna <s-anna@ti.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v2 1/6] remoteproc: elf_loader:
 Add elf resource table load support
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
Content-Type: multipart/mixed; boundary="===============0005092323139987000=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0005092323139987000==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+5G7L20VUoXZHCOn"
Content-Disposition: inline


--+5G7L20VUoXZHCOn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2019 at 02:38:28PM +0100, Fabien Dessenne wrote:

> Add rproc_elf_load_rsc_table(), which searches for a resource table in
> an elf64/elf32 image, and if found, copies it to device memory.
> Add also the elf32 and elf64 variants of this API.
> Add a test for this.
>=20
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> Acked-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>

Applied to u-boot/master, thanks!

--=20
Tom

--+5G7L20VUoXZHCOn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4WN4EACgkQh/n2NdMd
dlLhjA//TbnG8R4L8z2Tm1DFWinYp0sPjaHKtMieBQbtpfI6eIyARphtlemHTD/E
yVKryOVuf6I7ycBRXxrKFlWuADwp18fupALOEzMDfBwRDpuJmNmme+FRLKuwW1Py
IdcDmGr6rvpSYTOp2e2fsPkda8aJyWF1/CxAf4ikr9zTYdY1dMrVuNri3ut/2u4x
C4jyDnw4Jm0g7SDprCkhEJDcks1qZ13aIhD4StCkIlT0d0kRB0+ODdtX+Bqc6pBJ
02Bb27bmowuwE4lsfulEn+wgMxsDWMloM5zeoGXIZcEmvfdTeFmhdSyBIVJSSIYl
VsW3WJdXavooYO3uUqZXGM/p7tsyCgAi2b6uJeUoVi8hxqlOuv0ercdIcRJlrYY0
IAGssNBuRN0BVoK67gGzyuktoxhIAlglL1xMLSTLM3TJ6DHWIEzWN/gApXgi0RFD
kEibTPlcL1KOBg/023pEYHtWBCosoWm9ttojacFC0DstnxoZ2+gzuEnWmO9gROk+
yyPFrEybpq2hLhHR1+9L8cynf1osClGYNNcMYgVkU5Nvf+hsaE7SRBUPg9GsCBtu
DCro0ulmjEWw4NihPwWyZC6S0R16uMmR+jHn/J5OhsaYoJfxRSLPKdazeghg/Eh2
hjJyr+IdXnElP232zWwE6K0w9xZKDMFBuCtT6j99otK9PuVZkGg=
=hw5l
-----END PGP SIGNATURE-----

--+5G7L20VUoXZHCOn--

--===============0005092323139987000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0005092323139987000==--
