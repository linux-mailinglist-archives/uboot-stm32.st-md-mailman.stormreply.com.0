Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D9C32BA1C
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 Mar 2021 20:09:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0FD8C57B53;
	Wed,  3 Mar 2021 19:09:04 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3109FC56634
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 19:09:03 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id f124so6985360qkj.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Mar 2021 11:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1GvylDVOndlIaRgIzQE4Bf1yP2oMpuqDe+6f9vO6o9o=;
 b=BwHnx1qaiNO16LblYVRKzYI3GzLTYEwu4uYf5Bx/aUFWcBoeuHdquce1xSIeNnYdoo
 ThL8vOymEk+/oXSzMYmtpqD2vT4sQhHunjlHJuke7PU4N2zeD+RE+dLCw6UitCGmDIp/
 3hOwukuRO2+okkEJ4cp+mBqvMus/QdqUMRYbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1GvylDVOndlIaRgIzQE4Bf1yP2oMpuqDe+6f9vO6o9o=;
 b=rrash/u4KxXu9AuLfQWxxYntJxssK9+AWDdychIFc1hgY8k/lZ0XB6MiWD0EwuqiG6
 VdCqaYqknpk8bhlGjke8Q+l3Tad3yoTZ1znOv/elkqXDRYJvGuOBSDzNAPjx1T2pEMj+
 qfKiHxedKFCnXa6aRdTkitUccNsUszLTEfpwIMKbyN7fxQMwqT8wVqJaMGtXIgQewVU7
 tI77bvAZTfPmK9yXM6A89xl+KJWQw2HSQA0TxOUKeVPVrjuhWei+wynM3nq/SVguvE7g
 w7WnamtBl+t9fSBQ7XFo7kzM0FFU+kzyLOglfVaG5Eya0NiburLwoN1jfaiVcpKg7eZh
 H0VQ==
X-Gm-Message-State: AOAM531nU/bE+JLdL0aX67kfLA7QCu2YZTffWj9eW++dxBXsB7wDKYyl
 R4URwsjWBORLkjyypOBHUeixyw==
X-Google-Smtp-Source: ABdhPJyMY+Q2sc2jtV+KTA+k5BP4OSEsRUVBDG/qJwFxF1B1dC/svo/WI0NYBkv6258vdSDhSud6NQ==
X-Received: by 2002:a37:b81:: with SMTP id 123mr482026qkl.466.1614798542182;
 Wed, 03 Mar 2021 11:09:02 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b07-927a-451a-3a99-8647-33ef.res6.spectrum.com.
 [2603:6081:7b07:927a:451a:3a99:8647:33ef])
 by smtp.gmail.com with ESMTPSA id q55sm16767467qtb.5.2021.03.03.11.09.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Mar 2021 11:09:01 -0800 (PST)
Date: Wed, 3 Mar 2021 14:08:59 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210303190859.GP1310@bill-the-cat>
References: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
 <20210205135332.3.Ic60984b860abed150b9bead538770cd1b6d930fe@changeid>
MIME-Version: 1.0
In-Reply-To: <20210205135332.3.Ic60984b860abed150b9bead538770cd1b6d930fe@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ovidiu Panait <ovidiu.panait@windriver.com>, u-boot@lists.denx.de,
 Andre Przywara <andre.przywara@arm.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ard Biesheuvel <ardb@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Uboot-stm32] [PATCH 3/8] arm: remove TTB_SECT_XN_MASK in
	DCACHE_WRITETHROUGH
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
Content-Type: multipart/mixed; boundary="===============5439292196240878063=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5439292196240878063==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4IFtMBbmeqbTM/ox"
Content-Disposition: inline


--4IFtMBbmeqbTM/ox
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 01:53:34PM +0100, Patrick Delaunay wrote:

> The normal memory (other that DCACHE_OFF) should be executable by default,
> only the device memory (DCACHE_OFF) used for peripheral access should have
> the bit execute never (TTB_SECT_XN_MASK).
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--4IFtMBbmeqbTM/ox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmA/3ssACgkQFHw5/5Y0
tyxzFgwAhGH6TObOL8EBTHI2G0kEDGrTxarlPBqMvFgHQ1K5iKl3J/QSGPTXOQfG
PmJf2vbaFGGQlwjo0EnH8+mQCZQKmu6IXMRZo0zeAIolJ8l1ySqPhClgaZH+w7QS
LQNG0HOhQe6g8FSssM1BPocFDBZZY/kkXe7DyDfu0yXiiJdiXSzNaLVx1viOg/F/
LsAA2gUKgO2jXsInBvpyEP25x8g3nBzSVGkdDpT0n9543jRz7FZkldufon72OCPF
2YUGBuEHSAu47jxlhPjDrRZY/Hildptqs9Qc3CPsLPxoQmOMyhnxQdwxIxp/dUMd
wsTeUgnbNLYvKJc5C0v4wvvLbheibKK4Q2ulMZDPylO5PZ24WSleVJWoWagsMrbe
GMvpZIA577S2SV5RrRnL47fJ/Z//TMbLfp2ija8MVaEQG44oVCYRwWOPmZ/yqh09
8VsP7xl6GR3jo3pW/2ty5UyX2Gz+0om9V3NSU55e8WlI89A9J2TJXCVkFH3qUpmE
IqvZoJqZ
=S93/
-----END PGP SIGNATURE-----

--4IFtMBbmeqbTM/ox--

--===============5439292196240878063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5439292196240878063==--
