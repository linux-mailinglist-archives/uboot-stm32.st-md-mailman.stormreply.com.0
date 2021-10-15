Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC6142FAB7
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Oct 2021 20:02:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BD61C5C843;
	Fri, 15 Oct 2021 18:02:34 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EAB9C5C842
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 18:02:30 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id r17so9517747qtx.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 11:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fODOe1Vz/9Ub/RJMf/ALDt55ing6du5982GvuL46GmA=;
 b=qbXGJTmX4oX68saExYU1QIQ/6YA06p2NKkcPtbXI2yKeBnNIAzKRszUYXFvdJs0uxv
 59xh7SlmVgqw2n2l0WG8CD8yCZvt1EuFFXjZm77xUuibj20/nG4uDeS2nDyWni/Y+521
 Qkpw8zOJrIw7tv6RlTTpxf0DC8lnve3AuG1Ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fODOe1Vz/9Ub/RJMf/ALDt55ing6du5982GvuL46GmA=;
 b=7esDbp9wbrcshD2lgbH/oxXPDzZOBufxYUDmCkQAK5yTFwRfxf2a4pHjyJW2qojZBy
 q7FFI4PMtTYZ2Jl507PKKxGPSe4uJ93bse6OV6+E1Rn3VdJuDsdvEljOtFXjXx8VqNcW
 /T/ZnLgAqc6oIoOAH6mOSv9H6/6NDpQSHY9WUvzEzZWaSIPbrV34xk+gFvj8rRJut2dS
 9OMqfhnUoBynxSk0FzKWyvAJc2DzN7UNEge4OKdQK07/qIoEvjrsYVNv9tdiyJpCXM6M
 yfBjhsuC6gD39XU4C2/4ETxElYKel0ChYz03h1V3LgJ3NZKknfbQDGoaXo5I69vzl44f
 Vu4A==
X-Gm-Message-State: AOAM533ZWmU1sdg2RN/Dx7DCWZfP7/nxrnLCFluyDZ6NYVf4KiAsv/HY
 fB+jjbxOoxHdadnJhTVrDg3Nig==
X-Google-Smtp-Source: ABdhPJzqaaXK4RWQIFRsGMQCK88PLRhiOeJAi6y7qv7ZfykxfDEhxNwIrlv1eSPdHs+xFAJ/I/5WgQ==
X-Received: by 2002:ac8:578d:: with SMTP id v13mr15219583qta.61.1634320949115; 
 Fri, 15 Oct 2021 11:02:29 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-f8b0-5c25-4d47-ecdb.res6.spectrum.com.
 [2603:6081:7b01:cbda:f8b0:5c25:4d47:ecdb])
 by smtp.gmail.com with ESMTPSA id h68sm2945969qkf.126.2021.10.15.11.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 11:02:28 -0700 (PDT)
Date: Fri, 15 Oct 2021 14:02:26 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20211015180226.GB7964@bill-the-cat>
References: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
 <20211004115942.2.Ie0f69e59ca3de9def2b0cf0a825c333bed4707fa@changeid>
MIME-Version: 1.0
In-Reply-To: <20211004115942.2.Ie0f69e59ca3de9def2b0cf0a825c333bed4707fa@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Stefan Roese <sr@denx.de>, Priyanka Jain <priyanka.jain@nxp.com>
Subject: Re: [Uboot-stm32] [PATCH 2/6] am33x: Remove unused define
	CONFIG_MUSB_HOST
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
Content-Type: multipart/mixed; boundary="===============7923663145193292683=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7923663145193292683==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CJG28G0aS4yi9xey"
Content-Disposition: inline


--CJG28G0aS4yi9xey
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 04, 2021 at 11:59:51AM +0200, Patrick Delaunay wrote:

> This define was left over from a previous revision, and was never used.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--CJG28G0aS4yi9xey
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFpwjIACgkQFHw5/5Y0
tywsuwv/Q4IoRQnmLPQKorY7wOMPpezk7DCEzyJC5P9ZpuprzSknsZ1PPYTMjwOd
6PGivIqstzVJx/uD+ccZ/4RpxMPDMX6XGytBRfA1x/U6V9ttgKCgm651fcblr9xR
EPmZJrxBQVGNnAXcdYOV5c3H5vVg6kqf2EO3/W6pLftKdAdf70Hwb6l2H615QCKz
6Nkdkkqx3g//8DItI5cG5FuQ/CetsSZwnq+EqZPKeyv/hFUTRHPvqjkGxEdmGUEr
yIg4apTohFTfL+rCKKJl1bSg05LE65plUlxlcAJhEbwQonz6RJPejXrVLzhXtcM0
IiAHbuG9z5AiRP5NYA0CN1ZSoiVkyfZ/SabK/8ZKqgW70oQOpT+2/Pn5pKsw2R1u
5o2m+zzKoVsmVxg6DwikTJW0sCsBn7pqyaAHtJgobmqR4Sgb4+oCjqA+ID8vR/Z0
PDtzsem90ZHF/PAuo59OS5jDskz3BkDVdFidh5zvFAJfqErdPL1FfiEA2sXcyd1w
OSENwFIv
=PNuf
-----END PGP SIGNATURE-----

--CJG28G0aS4yi9xey--

--===============7923663145193292683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7923663145193292683==--
