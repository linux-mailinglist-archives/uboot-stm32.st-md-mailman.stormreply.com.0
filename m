Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23407134CE3
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Jan 2020 21:12:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1D90C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Jan 2020 20:12:13 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6430C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2020 20:12:11 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id u10so1991998qvi.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Jan 2020 12:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6hjpjZBRocVqzGluVoZRaaiHj4UqJNX77ddoOtqObeE=;
 b=ron4/lcKG+vDpDx1050yZQJXymJP7M/RwLvAF9NYJfCp3v8hjtyb7rGNpkyWBdvViJ
 YO4DGKy/onERc18HHZMWBOk+InT4g9gOjgnNxSTdC3P/diPU+suS8u/mbCxPngFTChEC
 YNEPWjF8K84SZJSs8WCt0IFExGDrudNclu9nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6hjpjZBRocVqzGluVoZRaaiHj4UqJNX77ddoOtqObeE=;
 b=ReGlNaXTKSIonuweR2+XD3c5rQswAHPTm3FAu2LpzO+UNvk4oz+JGxvJiOOqa99eqa
 h/muJJI39pmbc19VLbjmO+aE4CXVUIYyI6WFYbjxxdU5pGP+Hd5nMxSoBo8bRkbTZnkB
 y+JEJSFqOdWuP9cBFEkkSF/2shNr+46a3qNaO4kmYyqnUC3M2K3+EXPhkzCmDTLINFg4
 Er9NIj61gsmB4yBG/MvFNfJWzFtInaIPkwzfYqYU9OrGTbr1Dyr6YRDdg+qMsLkzO4FT
 sXtbq3qvMTABIUYAJcu7Vust8ErTz0GJ2QSE93kbAshBDizp1h3ySE3JIbVeAnEdL2Sv
 ZAfA==
X-Gm-Message-State: APjAAAVXHgPR3scYoqL45rKYP8MI1NAYb34rAc/3vJsz0MSsu+HS9EcR
 FnTxcrk2Bkqt9LMps3gGNTUdMw==
X-Google-Smtp-Source: APXvYqxAxdOJFRXIA3cB0MmRUpUcbCF9F/J3PxlOnsvpPLfjZWcMoYN7Y7RwFUwDrnSb2A1lIOxUWQ==
X-Received: by 2002:a0c:ffc8:: with SMTP id h8mr5930621qvv.146.1578514329865; 
 Wed, 08 Jan 2020 12:12:09 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
 by smtp.gmail.com with ESMTPSA id c24sm2191253qtk.40.2020.01.08.12.12.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 Jan 2020 12:12:09 -0800 (PST)
Date: Wed, 8 Jan 2020 15:12:07 -0500
From: Tom Rini <trini@konsulko.com>
To: Fabien Dessenne <fabien.dessenne@st.com>
Message-ID: <20200108201207.GH31026@bill-the-cat>
References: <1572442713-26353-1-git-send-email-fabien.dessenne@st.com>
 <1572442713-26353-6-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
In-Reply-To: <1572442713-26353-6-git-send-email-fabien.dessenne@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Simon Glass <sjg@chromium.org>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Suman Anna <s-anna@ti.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v2 5/6] stm32mp1: remove
 copro_state environment variable
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
Content-Type: multipart/mixed; boundary="===============2214077061978557005=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2214077061978557005==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eDyw1yV8HuEtd7LH"
Content-Disposition: inline


--eDyw1yV8HuEtd7LH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2019 at 02:38:32PM +0100, Fabien Dessenne wrote:

> Since the coprocessor state is tracked in a backup register, there is
> no more need for tracking it in an environment variable : remove it.
>=20
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> Acked-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--eDyw1yV8HuEtd7LH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4WN5YACgkQh/n2NdMd
dlKJRQ/+ObGtEvVWAFRIsy9+6vbMjUE7CSWDzOiVx6FP/WK++VkmR6PgaUVD8Qqb
AWJEYg+Imx5rYOXuhK0KBhQwGhPcGdoPoA8/aSA5a5Mo3j9nX58GOMS3g+kXDtR2
mNYXn1F7JOu9bWv1/+LQqfx2cP5ieavvUIycx126J5yn+35ETFEpln6Pyrt7ggFi
Fa8OkKj28Wk0klzLwYATbq+TvwGp4chgguavkYnLS6fzmYz9c7nowEn6gNdDgk5j
HTB/wchykH3mLyEBR6JGn7gRY5zJ8ot9pH5ow3NTQY4axptRYxsmo/O/woNcly5k
WmnDivYc2xDXtrd1j3oFiBjChmBmgPE3RZ4Cx0WFcFDUUIJgvsWX0JaYmvaj7pv0
xNmeJ3EFVtx1mfuZiN5u6+4u9a9Ynjme2TaN1soWR5q1p0xfJsXAAKM4y7eBkxgn
b3PlD1gGRUyjCWZRTwvpRtUIzyuE8UBYG+v31mn9N/5zexclRkeiURV5Nbc28+5k
yuNDczBhOHeFBdCieFFHfoufFiagVfE7xW8L0WiHPw0hn95KL2GMFr3Pgow4GQ6I
1LRRAWkZ/5hC3POqULlLm+PgJy9CaQOIJdAARE5ERVuhCaM0CaVzMNnFiANEeAi0
k1KXJ8xSAOBVyvVIoy7s/Q3gw4udw0Gx/puK9O/tXlApn4mfhJY=
=QxGu
-----END PGP SIGNATURE-----

--eDyw1yV8HuEtd7LH--

--===============2214077061978557005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2214077061978557005==--
