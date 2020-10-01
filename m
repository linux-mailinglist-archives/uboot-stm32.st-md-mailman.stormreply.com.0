Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4A32800EF
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Oct 2020 16:10:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A00BFC32EA8;
	Thu,  1 Oct 2020 14:10:11 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07CB4C32EA4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Oct 2020 14:10:09 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id f11so2996299qvw.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Oct 2020 07:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YrYlp9TRKQN8B2pRSSP/s6abBnicW/qr81YHBWp3nP0=;
 b=CiwbBJ4ltGdQaikDCAh/BPxchbg1S98uq2a6IHyi+2kbgtMcRj8ZqO5O9tVCEhvuxg
 JSnMVJjV0DeQwBkSFjXEnPjKGTZeFPAGM/TWpubxXYi55CXpXuT1dXpthIdZhkV9BX/o
 JmgGEqa4ZhjosdVrsPBkdeOiZID8LFuvQGaOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YrYlp9TRKQN8B2pRSSP/s6abBnicW/qr81YHBWp3nP0=;
 b=K36pip9GzGlXI2RO+52HzTrkLZrkkgKWXkYNgpYsiruY106gZpZgvFwV6i/YNAPUj3
 j4tLFWPk/3nAypxzQ9DlrCzFmq91mg0oWSMi/4PHrdkxf2ES6KZqgQi537FVde595hrK
 +hm0t3j5r0Ci+QDadJyVSq6CE/AxxaZy0ng5dKfZwLxk3FkkV8wYINpicenvIUgmo1jY
 7N4g/Eiasiz6Fbjt/w6pa+fmk1d0VJnFj1K9aBZr7NF56jNo+h5ZS+N/Gi1jpy2I30pU
 6gbUkKqw5p+m7oszANML2bAPwP+OF5eKbA6sBGuRlkS5arug3Zl41n2jYCGWeMbA3FXw
 6r2g==
X-Gm-Message-State: AOAM531lzUueUwPtuTPn1Xsznn7b7jihftriToXFic2LXxG4KpSNMSy0
 UQlBQoRi2LNQQf9ckI2fTmZMRA==
X-Google-Smtp-Source: ABdhPJwzj6rtVk1n2PW0YYdZg/WoFzJNizGySCPTHrUXS8T2xm8l066uuaaWFunTCh16L30tUka98Q==
X-Received: by 2002:a0c:8b02:: with SMTP id q2mr8144555qva.48.1601561408624;
 Thu, 01 Oct 2020 07:10:08 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8ebe-3025-afbb-b50b-bf4a.inf6.spectrum.com.
 [2606:a000:1401:8ebe:3025:afbb:b50b:bf4a])
 by smtp.gmail.com with ESMTPSA id d12sm5810459qka.34.2020.10.01.07.10.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 01 Oct 2020 07:10:07 -0700 (PDT)
Date: Thu, 1 Oct 2020 10:10:05 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20201001141005.GN14816@bill-the-cat>
References: <20200909163006.32153-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200909163006.32153-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] net: dwc_eth_qos: Convert to use APIs
 which support live DT
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
Content-Type: multipart/mixed; boundary="===============6689693575242838121=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6689693575242838121==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xmg83RGVS/t1FIqP"
Content-Disposition: inline


--Xmg83RGVS/t1FIqP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 06:30:06PM +0200, Patrick Delaunay wrote:

> Use ofnode_ or dev_ APIs instead of fdt_ and fdtdec_ APIs so that the
> driver can support live DT.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--Xmg83RGVS/t1FIqP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl914z0ACgkQFHw5/5Y0
tywOOwwAoH4hwCoevbGdoNFeKThalI2qG6ASU5iHvILfbFZGqV30KA29LgNp6uQ3
xq5uv64LD13MoVOUiRSOLgz+Ypz6RJ/okELMI5bpeWl1bSUvVzZcqZOEBwCOo3tm
sk8ql4TvWQ+zv2rfep/ti/9obgiYZVjeIsShiZF3ed+LOzw1Hb9EWeKB9ucpFQLW
xWy7/adH6DLRl3vfaZZlqiufb4wjbnT7RigrtRg+MFhd3XeR0gXo0HbzpbxAAReh
4XnRSCa+/N/JbSNeH98PGDCQTZ6gCf5EnnCi72Y/pfpoYdGAkTwdAj/6ua5Q1T2P
a+vFgBSk+NYS5kDKViIOmqutUYl/isiCkUSNic0pY/GvnCU1ccT6tekJik83cngm
4yxrgBFv8FRSE7g4i22OyL1EtoV6eGepRUA/vrNM8UxJM2DRQadPhL5UdFvUGIny
Di8fm3ZWuXt2FyMsqKBgUpATBT7HZEOCB6z33KO8rjhL2/BdRbqb9eT0BcaF2PvQ
nR4qGABi
=Gt7K
-----END PGP SIGNATURE-----

--Xmg83RGVS/t1FIqP--

--===============6689693575242838121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6689693575242838121==--
