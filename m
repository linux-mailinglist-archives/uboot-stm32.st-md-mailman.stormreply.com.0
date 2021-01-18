Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B38A62FA095
	for <lists+uboot-stm32@lfdr.de>; Mon, 18 Jan 2021 14:01:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDAAAC3089F;
	Mon, 18 Jan 2021 13:01:36 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8187FC36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jan 2021 13:01:33 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id c12so5593103qtv.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jan 2021 05:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UJXlG83wPqsED0nk/PpPGHj6MqmTLlS/H6AacOQGLRU=;
 b=FiAgjOR8KuAOXv29O9e6zzx8XIZFFOpw7o8b/jPz1i1D8KPSjkSXI2wKr8DrR7DCyS
 LQLTPsfZcftoFmJ0eb/bYnuynuUoJDexnz6AW0iLtPb7yqiDuOgmodsR72hcqizsd7Bd
 +paJ9EPI7LxmuGfJGL0mQJXZwj75+zue/BZl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UJXlG83wPqsED0nk/PpPGHj6MqmTLlS/H6AacOQGLRU=;
 b=tWrusPGDuNppvbcxrI4h7OP+yrYZhYiCBt/+Tp+7aIIFpIZ6+FjHPbg7Y/ArqxmJQr
 RdsOQdOzbY2RI2JmHBrPFiNgvdNRzbJf5Etlx5XEG34F1VN0Hfh3bBlIP/XDHd9IecuK
 TgSFZl/X211EZSMy7R+xqr4V0cor4pW0LocdhkGzoEgxmTXbI97lj+zjkckKrAyiwHIH
 +cori4zZz8Osv5CFdV3XqLWEeFsvSJ080Mcm90H9ceWb+8yr4vioWsOGXpkes/18hGAh
 LPa1W4aRSCW3rC6e7hH49djsMvIUhzUjHFC6kE1b18Qxn2zG4helDfsxf0sV3NjPAh54
 VT/A==
X-Gm-Message-State: AOAM530SjiXFuH2X3bLHO3GVprHzGA7HGpJHSEJzh6gE8FfvYtpznA8z
 7/EArwQeKxF9oJ0QfRKcE02GLQ==
X-Google-Smtp-Source: ABdhPJyPQN07ewoIRB9qDzsG6TvGz1Atl9V4fnmgFODS17mTdQurvbeElVaHNzasUZt6+h7j1llyTA==
X-Received: by 2002:ac8:2615:: with SMTP id u21mr23381390qtu.233.1610974892510; 
 Mon, 18 Jan 2021 05:01:32 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b42-3f4c-71d2-022a-d5fa-e283.res6.spectrum.com.
 [2603:6081:7b42:3f4c:71d2:22a:d5fa:e283])
 by smtp.gmail.com with ESMTPSA id 17sm10710642qtu.23.2021.01.18.05.01.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Jan 2021 05:01:31 -0800 (PST)
Date: Mon, 18 Jan 2021 08:01:29 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210118130129.GW9782@bill-the-cat>
References: <20201211145635.v2.1.I56a5b1310adc1bce11401f8f2e1577be96dee65a@changeid>
MIME-Version: 1.0
In-Reply-To: <20201211145635.v2.1.I56a5b1310adc1bce11401f8f2e1577be96dee65a@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Guillermo Rodriguez Garcia <guille.rodriguez@gmail.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [Uboot-stm32] [PATCH v2] string: Use memcpy() within memmove()
	when we can
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
Content-Type: multipart/mixed; boundary="===============2092736705281924189=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2092736705281924189==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="onHzGjl9laKQkQkM"
Content-Disposition: inline


--onHzGjl9laKQkQkM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 11, 2020 at 02:59:23PM +0100, Patrick Delaunay wrote:

> A common use of memmove() can be handled by memcpy(). Also memcpy()
> includes an optimization for large sizes: it copies a word at a time. So
> we can get a speed-up by calling memcpy() to handle our move in this case.
>=20
> Update memmove() to call also memcpy() if the source don't overlap
> the destination (src + count <=3D dest).
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--onHzGjl9laKQkQkM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmAFhqkACgkQFHw5/5Y0
tyyndwv/W07o3TSKiJVYwhd/v/u9yeeDslaTVtdy/DsxVY0davs9Q+TJu+kgEFVI
AzHLGdlyLxIcvd6wC+/MC7k/kLjklCzTTVfv6ZsiT83msd3HHyZprFvYW2ychxyt
t/EeIknG4LbKquA/ukZXyB1floTc3bg9H2piJjp5y65cvEKzr9QvJ3E1H1PR80c+
xczE0efU9AlKhJxcBwRplRzO61oCYf9bxOBz97ijHtumHb7uXaz1YZ3IewpjJwfW
j1yTc/qZAZalSc14zyFaimjrGhYb2wXczMeBmPJDdJ7Pzpab/CKdqKImSPRjB1RD
YUMLYWrP7JFKP9zDjS1VQpv6cxLmCbbEPeHyP3Kpl0PEy3TAiX/Rk0I6NOI7xH0a
FZUAAx57Lg4APvNPD5XIdYShAr7nImqkGZezfUa3G6zMJtIYBUxiOlj7c79tAvkS
HwxtFh09T8+KXtKRAy/jc/MiiVqw0N7Zblru652eSSQWeBaEO0WZ75YQR7MBB0kr
7ihMh3nn
=URqO
-----END PGP SIGNATURE-----

--onHzGjl9laKQkQkM--

--===============2092736705281924189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2092736705281924189==--
