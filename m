Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA270A75392
	for <lists+uboot-stm32@lfdr.de>; Sat, 29 Mar 2025 01:05:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55C2CC78F83;
	Sat, 29 Mar 2025 00:05:59 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E8D3C78F77
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 29 Mar 2025 00:05:58 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-72bb97260ceso778681a34.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Mar 2025 17:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1743206757; x=1743811557;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rMz46kuYFf9beXQW3eAE7DatjlDTNLTmR59Lwy+kCAs=;
 b=BSwey5j0jd2qyEu/KiNzW/JMEwEZSqGe4sIkCtAIiEFjd5BHkzAKo4t2eCO0THTMmN
 eo1DWa/bIQTvaZmSH6TrgPR5vF7Fx1K9CQ7HdAqT9HhYyfANGWEZ2E1HWREMea2uwk9w
 HD/3AusdR0ztuO/3BRVFWLhbxMVnTCV4xRjI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743206757; x=1743811557;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rMz46kuYFf9beXQW3eAE7DatjlDTNLTmR59Lwy+kCAs=;
 b=SKRql7CUcAOQNKzHe/CjA34pSr0SeZ6108uGw8LRiZbV2vPJEwBFyHi/AgPdgL3udv
 d05z6uXmhsshlucxDQBgZbsWH+tmMUcMu2jk+uhRtodk7JrtFvlgFoqIJkDTbCIiQru9
 CNMuuq5OKoYsLd83B1gi/NEMO393UPiHHDQypWxWQuPHy/far1P7r7Rl3sFrLKgj1vVv
 GOGMatgICWwYq2s4/8i16wwi1uX8DjrwQJxIKoa9eG9E1Ow+7PsWUNfhalruOC0MnWrd
 r3UN4jqHqiF9nL58ortIG+l0wvRgGg00cDPnieswoz82wsKxyi/AX0fHLVc95s+J1lYp
 DLcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCURHQScUnsWwMhvwOLmkqjtrIFHAP1OEkNOKokf4W2i8Npu0nGlFQdbnn4c0z/r7aAdv0/2pjO0xlb0eQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyCZSfb2P/TWhCgigLOiYMXWvE6zVvwPxtx9sXCx3dKnXQl7b6z
 s2k8EXf+6Dn6DSeJr8SvhlkUwtx8M0tneh1l8ZUDovSM2rgcU/BHp0a0uWkRK7g=
X-Gm-Gg: ASbGncvOHR5T5tlPY+PldAp7+dlsrbSchDcGXxrIsrgthxdyohJIPHLpKVFEPS4kpgA
 MJK9fN+XcOnuROsJUfYG+24GOIUVh3RuhJc0rwLYQMK0/LcI1oNHsCJd4Ql0sDnB0Hrnd3hBrx6
 iawfQzX0b2NpuAvdXDCfXJmVk5VvgRN3DMnwmqO/inD+RoKRtBBjvzqE5N8E/xJVLUaW+nkndkW
 KrXRoaWfKxLK+DjDlak0LXqaOY8CSYfa3SS5E/KtzOpBaXy96aqqkkng6kJAthkgonyoKnhmcpj
 Y2fEqePAMN/tbfrj3nxFAEMSCmJBrilDfXdeTdDiNCa4jWAnqr50yZxU6nGk2TvvsbEr29fdQr0
 Tgl8JPQ==
X-Google-Smtp-Source: AGHT+IGD/O4BHkbLLi1KDgXTJOZc4CLiOSbmDhDZwCr75vlBogqp/HsOUzLjlGq+eM3+MEAi7ROC1Q==
X-Received: by 2002:a05:6830:4195:b0:72c:3235:3b99 with SMTP id
 46e09a7af769-72c63816ed4mr788789a34.19.1743206756834; 
 Fri, 28 Mar 2025 17:05:56 -0700 (PDT)
Received: from bill-the-cat (fixed-187-190-205-42.totalplay.net.
 [187.190.205.42]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-72c5828b38csm546788a34.61.2025.03.28.17.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 17:05:55 -0700 (PDT)
Date: Fri, 28 Mar 2025 18:05:53 -0600
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20250329000553.GJ93000@bill-the-cat>
References: <20250328163115.642347-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20250328163115.642347-1-patrice.chotard@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] dtc: introduce label relative path
	references
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
Content-Type: multipart/mixed; boundary="===============3939485177349331414=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3939485177349331414==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R605kABQg3NXpTBJ"
Content-Disposition: inline


--R605kABQg3NXpTBJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 05:31:15PM +0100, Patrice Chotard wrote:

> Since introduction of OF_UPSTREAM flag, U-Boot's dtc must be able
> to compile Kernel's device tree.
>=20
> Since kernel commit 7de129f5389b ("ARM: dts: stm32: stm32mp151a-prtt1l:
> Fix QSPI configuration"), label relative path references has been
> introduced. These label relative path references is not supported
> by current U-Boot dtc version 1.5.0: (see mailing list discussion [1]).
>=20
> In order to support such label relative patch references
> adds following commit from upstream DTC tree:
>=20
> commit 651410e54cb9 ("util: introduce xstrndup helper")
> commit ec7986e682cf ("dtc: introduce label relative path references")
>=20
> [1] https://lore.kernel.org/all/20250115144428.GZ3476@bill-the-cat/T/
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: Simon Glass <sjg@chromium.org>

Thanks for digging at this more. It would be good to make ourselves
compliant enough to move to newer dtc wholesale, and it is a
longstanding issue, but it's also as you saw not easy.

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--R605kABQg3NXpTBJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmfnOWEACgkQFHw5/5Y0
tyzhkwwAjkqYKOgAzpYf7lfQm77/IhdnwVPJiW53a+03kZZz3oneuTfQBdq6e+m+
LXX7DkXHXv8sa5OOB3MhWVZoV6k9CXZWsBRQyvd+/3zWGEWxMPzEXHYFr5PM6uAv
93MjbjRblsBI6NziTJ5Nw5Soj/qL7PwFadY9QEF/O5RBseElIjeOOlrkM17FwXnb
fvb+A9ATPi67h62nCtkfhYP7iQIS+lbjSWKFf3SaCUIYrq0FP3RrPx7+dI8mZgf6
KO0ptMOMHbSjmNr8l41TUM2bzmr5InW+zGw17XAjex/nCe6bZc9oYX1HNm0Vcg1Z
Y4hRZ+EDe2y807IabK71geOLZl8GdhlJCVqcs/2EidGy9ykFOUrKhAWicmtXfP4Z
jjBnavGaawhW+Wh8knsk1jkalyMRe55ko0Ij6VumGcFD/LbCbt1Bg62UiRXk+lTw
6Ma6BCd38MHbrxGSwz0EqDql9JYVzo7QBxh2LwbTt8qHhzlpktz+0yDaRpxzTNJ7
hLWjJ/iq
=Q+gW
-----END PGP SIGNATURE-----

--R605kABQg3NXpTBJ--

--===============3939485177349331414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3939485177349331414==--
