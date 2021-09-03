Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EFE40076D
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Sep 2021 23:29:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73004C57B51;
	Fri,  3 Sep 2021 21:29:15 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B1E2C5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Sep 2021 21:29:13 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id w17so397614qta.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 Sep 2021 14:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nrtWGMT5GUUMzS3IrUGlb7o0BXCUa6vVQJDOeW+rCb4=;
 b=K5laY86nW3IoszPM6MWRGDQ3cpaElmrHtRYppE8l9qua2WW/P1B2YEex4GlYbJ9vXq
 FiPfViKPewadquFeca0jg5lmiT7iL1f0yWTjTUTuF52KYEunek7IONiAgy0+h3YRYFMW
 JnSgm6nyTfL7cCvoXTDuzbdVoZInqLZzDz0VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nrtWGMT5GUUMzS3IrUGlb7o0BXCUa6vVQJDOeW+rCb4=;
 b=qxW0uEfU2Ceif0OJLrRK6kGJhkEpP90BzqiOyufa5jLb6u7Z6eh/CQk8+mtfbmv9xR
 4LSBpbLD9zJfE/suyNZwV9Er9lLRSmii4al1ODrRrrIlAEha3PlcVmn2MYb10Y0/3c9r
 nozOEPam0WWJnpHrrOSAwbyYOskfGASSuE/HUIuQgxE6BXo7httmQCgj8spzBCuIapV2
 N5iHGy7RPjVCg18SnTFwPFUGvGqwaFlCC5ZdC348+sSlD3uvW+fzt0ses+Al6esVRKMD
 /qwoM9C7DWUkPy5J+kfjnQfT/Y2hHG93qV+bTRHvIFyKrQTcSxIkxQXwkeAXBR/RdMZ1
 ksyA==
X-Gm-Message-State: AOAM530h+rjMzQiXiZtASrJUc63vimPPEdTUAvxjUrbGkUsfjyd4lY+Z
 aPS2sXDD/Ry1RMpXC27888wXnw==
X-Google-Smtp-Source: ABdhPJxAe/8kwR7SZlGo4qJRAyF8N70R+ZKu4EXU4aLwhPj0/e/EBPCW99E9BwNMzj7SjzcniZKRfQ==
X-Received: by 2002:ac8:5c96:: with SMTP id r22mr1002866qta.267.1630704552903; 
 Fri, 03 Sep 2021 14:29:12 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-e598-7a50-554e-ee54.res6.spectrum.com.
 [2603:6081:7b01:cbda:e598:7a50:554e:ee54])
 by smtp.gmail.com with ESMTPSA id e21sm362922qtg.40.2021.09.03.14.29.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 03 Sep 2021 14:29:12 -0700 (PDT)
Date: Fri, 3 Sep 2021 17:29:10 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210903212910.GP858@bill-the-cat>
References: <20210903102331.1.If60c46be1f9a6ba3b7ad548fda51ef631f3a33b2@changeid>
MIME-Version: 1.0
In-Reply-To: <20210903102331.1.If60c46be1f9a6ba3b7ad548fda51ef631f3a33b2@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Rick Chen <rick@andestech.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: use CONFIG_SUPPORT_PASSING_ATAGS
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
Content-Type: multipart/mixed; boundary="===============0691466758077226931=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0691466758077226931==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ylIHvuZIrwYgarbv"
Content-Disposition: inline


--ylIHvuZIrwYgarbv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 03, 2021 at 10:24:39AM +0200, Patrick Delaunay wrote:

> Simplify the bootm and the spl code by using the new config
> CONFIG_SUPPORT_PASSING_ATAGS.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--ylIHvuZIrwYgarbv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmEyk6YACgkQFHw5/5Y0
tyx/xgv/fDT5ltfzNqZxtVkfB/IAVVzegdmOqMn+cNqypF65jnq0XcdiUVK0+IOf
YuPaRZrTPaEzypqMuSl9CGrqfeYnW7VmVreX15UA0DUcYkYdTDDMsVkabrl2Bs9I
b1YCdYdoBt+uvMzP3ZQkPgZCIPBoUvx+sAWtP4hm6Ct+qdqcpOyJ4SL8n0kdbf2K
1rLHCjq3lCvBR6/cQOxH+f5U5GGLkRzO8IfWS5zys4/dxyeZJ3Bpkx6OP1qSu2+7
iBLRwz8sONsBJauqKCg8MRBYUM8SP9d/vcQVbT1SiKKjHzjycU3WbLl1BE3gp2MQ
/TnxeoCOMm+RYZJ3rz8eiwHa9h7fvV+Y8RZhU9DpZzQvBv+cMr0iIzPJIzOPiZp1
tBZbYVm+im9zPB4V52jvnwQ3LlmEJmEUFyOolNUcNUQDw1TwHVaKVZLxd54oNiuX
hwH0A9xDd25TrmhQWUYE1yzdInSM3QSficExTQPBnaLJLrVuzhPtbSbPh1bkpz1a
AMDCISCZ
=6Dfk
-----END PGP SIGNATURE-----

--ylIHvuZIrwYgarbv--

--===============0691466758077226931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0691466758077226931==--
