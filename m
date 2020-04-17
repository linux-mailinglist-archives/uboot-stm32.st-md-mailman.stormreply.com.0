Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB361AE730
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:07:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75BFFC36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:07:09 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FA16C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:07:08 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id o10so3218019qtr.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3gf6PWkadrNAO/mi0RLNBpwYTdJ7D7g1UP33fOjfu2I=;
 b=MdslXf/JFoMr7WMKJHcx9tsx55DjQYXJY5w93Pw2Iju/jLtE+gTgy8awrEqzdxM2xb
 lOH1Ju4pt+0URjgzEPPGZlXNxT4Rgl1IP9C2iZ/go+H2VeL1PTDE8pntJH6rSDLR7zdx
 VJlGbC6Y4KA0BXBcFb7Ymcdn9aiqjA8PAPjBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3gf6PWkadrNAO/mi0RLNBpwYTdJ7D7g1UP33fOjfu2I=;
 b=VNHfKrkrADZEzrUGb4iJkotmH4+WRF/hWx7K8rGaLLJKV3Mc7cM/Cc5Du59NHLPXjL
 pHkYjPYD/QVKIOniR1ktgrEp5DAd0ivkBvt6hQCNfHsDhRdj2E69PfTcZ+1sDDZJGCTs
 JkolTxEEZ+CSXnXf9e7e3En+Krlk0pwxaVB8DY2Rs42To2NM++7F2UHAza6oJkgs7Ww0
 xhUcwMf3vZxVP0sJO6YAdK3338wcx8VoR25bRgUtstvU716NYRlRlHJIGVT+lr50sn9X
 CNDHCSiTD+4eW6V6sBG5INu9nUVokGzVHMo/5fTFvDqA+RVKcuOR9t2x1qzOB/ljVkdp
 B9Ag==
X-Gm-Message-State: AGi0Pubf7jSpt69HGQnM/InpsNmRkuvf9QzdzgUEzhgX1s3xD2+HYksh
 8Yc6RgvvfUqcyVLIBBo+Nd3Wj211/00=
X-Google-Smtp-Source: APiQypK2Pw3CKG51dF537XmcrFjXdU2KsoQkDUL38orGouCEffYMkcfLacm5wpCm1nTCmczULsjz2A==
X-Received: by 2002:ac8:6914:: with SMTP id e20mr5101589qtr.357.1587157627125; 
 Fri, 17 Apr 2020 14:07:07 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id b42sm11492140qta.29.2020.04.17.14.07.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:07:06 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:07:04 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210704.GU4555@bill-the-cat>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-15-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200113103515.20879-15-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 14/21] gpio: add ops to get dir flags
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
Content-Type: multipart/mixed; boundary="===============5955474534139228781=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5955474534139228781==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zn4k3Q+N5puqXur4"
Content-Disposition: inline


--zn4k3Q+N5puqXur4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:35:08AM +0100, Patrick Delaunay wrote:

> Add the ops for GPIO driver get_dir_flags(), allows to get dynamically
> the current gpio configuration; it is used by the API function
> dm_gpio_get_dir_flags().
>=20
> When these optional ops are absent, the gpio uclass continues to use
> the mandatory ops (direction_output, direction_input, get_value) and
> value of desc->flags to manage only the main dir flags:
> - GPIOD_IS_IN
> - GPIOD_IS_OUT
> - GPIOD_IS_OUT_ACTIVE
> - GPIOD_ACTIVE_LOW
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--zn4k3Q+N5puqXur4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGngACgkQFHw5/5Y0
tyyWKwv/ckxYZ/3yHD2sgLIVVwUB0XcTzsvCTJbyigpUMAUg7RGdEScEv6NeOU/2
GqbzW/Zjs1gsk57aKEHkCj4rsOOBPaAnZIQLYClAotd4y5dFBSgAuhh3B/4PO4+x
3vcm4nUI6/oCQYfMdBsSz4coOJOPvF9G4FVUdzsaWmjE3S+YZcJdmTjoJQcqx+XK
2cV5FmqHrcDJom4scuMU8AQa/iujj2reTdvpAcnwKw4gy2QerPagnakhBHzJutzs
xJ0QcA4gTvUNoXxRmjcLREZV21kXLQxI9qHkIXuz2CQumJktCCJjzqI6VZXTQrDi
V9BKctocwBfSXBH+zJDP3dIvHmHqne5aHBDGSbzguDRMcDYdCHcaM2YnPtx0UYmr
L+5wxVcinkOISMYWjArS802Zre6KW20jwZcPBD5OS2+mNtnZ6trLoS06rnLxMDKT
9vyhyKx2utsOYDumnM7pBR6eQMnNFMBVMbNSUn+hXDe1upMFh1KU/DKtDqbgWtQO
VpZSFEoH
=AXLw
-----END PGP SIGNATURE-----

--zn4k3Q+N5puqXur4--

--===============5955474534139228781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5955474534139228781==--
