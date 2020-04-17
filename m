Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4EB1AE72B
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:06:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48C61C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:06:40 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BBEEC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:06:38 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id o10so3216757qtr.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=P/AIvoaLwaNPKAGm/nPp3Q4lIv+wNaZeysPBaaHIJd8=;
 b=HOFLj2uXtzEWsr0Cm/CUz9mCGn7wMd+mGr0bsOcuZOzQgn5RWwR3xyCARRwIMxnVP+
 CtF3zR+Qc86b4NcoInTeWIXYzgaK6fFQZwlNCllooeoOYTj1QQqw1YjNxl2ekR42Gvzs
 4tSvYvJn1e8wyzc8YUFabFnPVkwzueBHCtKsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=P/AIvoaLwaNPKAGm/nPp3Q4lIv+wNaZeysPBaaHIJd8=;
 b=Ov6bcEjw5ZpDFVshmqb9bD/Izlbo1JxRgauuzhAjIZSuo9eP4CzsbOeF5gq2OnaniY
 gFbu/AJj2IeOjjgkUfXbAMapyXB0QOL+ME3o1LAd+2yCIL2FU7UiQ3+lsiIqyrEIM85u
 3Ka4rSQDwvsWdajb4cRyYxpazYPYV1qX+5NjKUM5eyQTsj95f8y6BRbOGuMQLx9zcMrW
 lHTvPvvZE5dW6zS5SqXZg6oKGjYuHICMFg1zhxZBKS5JVHKr40E+eroSFAAppR9an5gG
 hAMM5Ur0eN0MRrQCquP8W7Ye71r7MZhj2Z+bV7Fell3631wC7XY8uiUDRZ/z3ndpz10T
 qhWA==
X-Gm-Message-State: AGi0PubUYV+mQ89MonmdAQv9xos0g6qZ8GCGNXQMhPIXSloA9HLHN2u6
 8HZqVgnUlbzq+14a9ahkezJIZA==
X-Google-Smtp-Source: APiQypIiHNu5TZRwGC6XiQrNmZFcw1USPO9zG01aRFpndtl0bD+P6QoUk0Lxs0jTADAPKmYlWb4ZkQ==
X-Received: by 2002:ac8:7498:: with SMTP id v24mr4964641qtq.32.1587157597509; 
 Fri, 17 Apr 2020 14:06:37 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id i2sm10082296qki.54.2020.04.17.14.06.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:06:36 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:06:34 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210634.GP4555@bill-the-cat>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-10-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200113103515.20879-10-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 09/21] gpio: add function
	_dm_gpio_set_dir_flags
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
Content-Type: multipart/mixed; boundary="===============2241668639761021557=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2241668639761021557==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z9t8O/5YJLB6LEUl"
Content-Disposition: inline


--Z9t8O/5YJLB6LEUl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:35:03AM +0100, Patrick Delaunay wrote:

> Introduce the function _dm_gpio_set_dir_flags to set dir flags
> without check if the GPIO is reserved.
>=20
> Separate the reserved check for "set_dir" and "set_dir_flags".
>=20
> This patch is a preliminary step to add new ops.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--Z9t8O/5YJLB6LEUl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGloACgkQFHw5/5Y0
tyxNjwv/dMuKGKNqjSM2rOFrSygzSny6FSQ1uW1aVnwpV/0mRfA76uFsuphfAQ5x
iOhpn6yk+8UMyypVM3Un77PjGGTcurCO1OyDQYfUxeTEIdcUKcQW/OOCAlcLQrNr
DXjc7QK9QIKxTdYKiuTqPQH2n8O49jZXj9iUInqd6XyUIbLxy3SyLqdchMzjMWba
oUqu8Z6nw5io4e1e4UoFjBl335FYqqJ4HoLn9yH/0YZSvSxI3vJg0Svsu6Z7uGpa
MrhOWY+daxWrFKuFikLHhAgJGC9dAPBe/GoQeDD602beXmODHkvFiXq+S6pP/rHa
HN0hUimKktf6gNruTTWYWqCztC1r3/EpvU+XIU3AyKa76NFzP4YGzguQoM8IFIgE
XNL8aioc5eSzTgbb85TC6z8KfcilNMXnQ3ID+bnDgTonq8ASEYsPDZMNQ8qtN5cb
FL1VY/LPpXnsJonbLph6tDtjmJuh1Ajsqw5VJjoHoqrSJgWgc1m0zDnxPCFt7mxl
UJSAjcqI
=DHiI
-----END PGP SIGNATURE-----

--Z9t8O/5YJLB6LEUl--

--===============2241668639761021557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2241668639761021557==--
