Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FC523BCDF
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Aug 2020 17:03:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60321C36B38
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Aug 2020 15:03:49 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 166CEC36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Aug 2020 15:03:45 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id s23so31092305qtq.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Aug 2020 08:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sV9a67vug85MZISnNT5jAThtUeDY2Dl0BucKw4cFs8E=;
 b=bNC+Crm3y3oh+knJdbTi61lmog1L+EPftqyofkbvw9Htr7Omxfc4dqHnz47VUw+oou
 OWYRLudkoFqvoxNddGEpMGJHuxZ/hoDF4al88jrIYQsmF+ogT7EWEtCkOpb0F/qekwl6
 kXrkUpV+xcHKuu4v5lgcbltdtUJ3Z8GIJ3m8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sV9a67vug85MZISnNT5jAThtUeDY2Dl0BucKw4cFs8E=;
 b=Xl2Y7sbgamgBgCgTIHemONhVkfrJOu/PbYCQCHyRu4Mxqm7z30L1p4y9ATxdsGchWr
 CAKUQegaeT9DjzUYiKfQP0ubeF4UvxG56hmHz3OcxTvk06HI/DD4vkzgQ6rWsLBHEtYY
 3naufF8beZKDYHgZyEvu1+mpplLdXf/89jeuJBRzfhTBTf9tSk5KPsxUUf4vQKEc4flZ
 3DIBSDJUYwfRLx0cQHa5xlhGt4Tz1upbY5N2D8Mm5D9EvjL/WeixaIeZY5wp0hGjbyXz
 SNELZ8+KH5JRYCfpbonyc8zRNKcnUhtLo3nFpAnuTbOnc65gKt3h0CIGfDAVdAcjpB1H
 Cokw==
X-Gm-Message-State: AOAM532VFyRyfgZLR9fFs5M5rIa/0XF8QW5NoVygLbrIloN9vHDF0fVF
 3sd0rBkPIIoAXVd/mpCu1GnrAg==
X-Google-Smtp-Source: ABdhPJyFvAL5jjKdCdeaDiScccVGqGh7lX9gjPrEsonYsNVJNFCoT4sTAl+d0RDwDXyFtFgNy2vsMg==
X-Received: by 2002:ac8:71cf:: with SMTP id i15mr22164581qtp.119.1596553424390; 
 Tue, 04 Aug 2020 08:03:44 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-30d1-2f2e-908f-c5ec.inf6.spectrum.com.
 [2606:a000:1401:8c61:30d1:2f2e:908f:c5ec])
 by smtp.gmail.com with ESMTPSA id h23sm21588989qkl.38.2020.08.04.08.03.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Aug 2020 08:03:42 -0700 (PDT)
Date: Tue, 4 Aug 2020 11:03:40 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20200804150340.GD6965@bill-the-cat>
References: <20200719161601.495421-1-sjg@chromium.org>
 <20200719161601.495421-5-sjg@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200719161601.495421-5-sjg@chromium.org>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH 04/31] mtd: spi-mem: Drop dm.h header file
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
Content-Type: multipart/mixed; boundary="===============3661084431447086583=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3661084431447086583==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B3UyBIKcLn4zZXdv"
Content-Disposition: inline


--B3UyBIKcLn4zZXdv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2020 at 10:15:34AM -0600, Simon Glass wrote:

> This header file should not be included in other header files. Remove it
> and use a forward declaration instead.
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--B3UyBIKcLn4zZXdv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8peMwACgkQFHw5/5Y0
tyzbVAv/XKz31CM3YgvNxxk7Q2wB3PFpUad8Y9hGW9CbHw2QeH8QP7olTmKqK441
8uq77nnjIH8sx85Vg4aJEIv0dhdW2wivXePdfGxK2dbrSWNJkyGHSwWHDrAI4PLW
pFk3g7FXSekIrODLc0axuXjfoPeftHSBcW2UFblNYZcQu8j2vGldkdUBbMa4mwxB
GuwPMXlZ+cfqn+o2onWhqQrTRUbGSCRukpA5B0lufW83QJqAX9lvfPxKFaBWY2pX
WtrCHH86IIe5xcUkoW4BGJmkZsR20ExFvQ23RiRAhfPX03SYJRPmKW2WH0N9fj6I
AyQ+B7pjOzAW0UxVFlgJsByr/8/Au8Gvu5lf0dgxS9KcNpNWKFSSBxTeT8QbdZDm
NAAJFnJY4cf3VYRzDtd57AR/t6X0DrDRccTWRjHYdd4DvUH1w0nILCuO9oLO9eYU
tGbn6CZtpDEWScZpoqEPA9XaJsCT6Zzpf6RP26GWIpM6OL+oia6aQuOMB0hvY2KR
SJPh7it1
=li/V
-----END PGP SIGNATURE-----

--B3UyBIKcLn4zZXdv--

--===============3661084431447086583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3661084431447086583==--
