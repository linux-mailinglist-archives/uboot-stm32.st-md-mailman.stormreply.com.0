Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A072FA092
	for <lists+uboot-stm32@lfdr.de>; Mon, 18 Jan 2021 14:00:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B85A4C3089F;
	Mon, 18 Jan 2021 13:00:15 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5ADD2C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jan 2021 13:00:13 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id e15so11122634qte.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jan 2021 05:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zmLZFVjY/PFSXbfS/B2a8hX22T9jrOtaKJY7smlMeyQ=;
 b=LIJOKQUT9fOPgla919B3J8WOosutrq4xQ+fjEO4G/fA4i/QX2Mz1zXBTW9Nq0XjxNZ
 1rvXeJqz7Iiqs6sicXYlTgJfr8lI3ziN/JjEADiIUJwEFDSMypJdqpfwR9Ru7aGMaYp2
 jjXDRFfXnymaFvCEPbxM+POhRmb9J05OJMfJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zmLZFVjY/PFSXbfS/B2a8hX22T9jrOtaKJY7smlMeyQ=;
 b=StNnlFNpgVMQsmzVVHgUHKMSxgNIpFkulECb4YEEyl5ursR0906/P9lzlQDjI6eb+X
 MYNQhpAkbR5KJRDz4YkND9Zvnra8qAqklsyMo9ntcuBJzaW360zwr91OjpRQ+YO/S/RV
 dpmprbRK0HmTy0F0y5qdzWD5FqNwt06jC/Y7QF6xm5jfjBVchr9/Kfoobq/gChJ1OUyw
 t4fznJ6eOS6xA83GGmwxtq6nIo3I++0kIcdaJRUOSOtypccwXDwfex2KRfNKQ7R2CapN
 uAlx0inHFf38HqDpoZ0jlOzSByCdSki1gX0avrmiMqoS3KcH4xn3V3iCkH3Cv/FeAHnJ
 8vyQ==
X-Gm-Message-State: AOAM530RyWXrNwDFd4MkTg7tDVgX2WNe1Ttt33lvNGe+MxoGkYp5B6M1
 snLqLrBx3IRYvtyJ2QXj8qib/Q==
X-Google-Smtp-Source: ABdhPJw48r70f0WzdbA0EUa7Ix0t6VC0cRVoAqcjjB2FXBaVOSAS9P8+OH3Orva1ipwixfzuayY5IQ==
X-Received: by 2002:ac8:6f15:: with SMTP id g21mr19345114qtv.37.1610974812284; 
 Mon, 18 Jan 2021 05:00:12 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b42-3f4c-71d2-022a-d5fa-e283.res6.spectrum.com.
 [2603:6081:7b42:3f4c:71d2:22a:d5fa:e283])
 by smtp.gmail.com with ESMTPSA id 141sm10451645qkn.53.2021.01.18.05.00.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Jan 2021 05:00:11 -0800 (PST)
Date: Mon, 18 Jan 2021 08:00:09 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20210118130009.GJ9782@bill-the-cat>
References: <20201119090843.5614-1-patrick.delaunay@st.com>
 <20201119090843.5614-2-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20201119090843.5614-2-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 2/3] test: correct the test prefix in ut
	cmd_mem
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
Content-Type: multipart/mixed; boundary="===============0744232036763896918=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0744232036763896918==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZndnTVfTRaTj/fea"
Content-Disposition: inline


--ZndnTVfTRaTj/fea
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2020 at 10:08:42AM +0100, Patrick Delaunay wrote:

> Align the prefix used in cmd_ut_category function and name of tests
> for ut mem.
> This patch solves the issues detected by "make qcheck" after previous
> patch.
>=20
> Fixes: 550a9e7902ce ("cmd: Update the memory-search command")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--ZndnTVfTRaTj/fea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmAFhlkACgkQFHw5/5Y0
tyzsUAwAiQ1XYq2mM4bhyNjFtS2bdnKUqLI+FcxVQev9dggxYaT9P3merQCasz11
QT5aC00waemdn/iHfZP94+QQgXSe7ImrNENGNspAF3/8j5WsjzEvdWsL+k2enO+4
CSiuKFRoqcLJaHjsN9+JmZZfztjbl1gDlZBbbl8NOWu6w6Pq14/Ez5npX0lHFyLy
VPt2Cwrjin9KuQf3+G/hTvVqhYnYb6TC3UYKhDRUJwyiJYDLeSg9z4SvzZimkhSk
ncN66VadwIMM6mOc9aZJK5Ihc0kxRLYgirLmt99ErnzboU3TJRtX2c7iN3+YtDRD
UHztXgetrUWbYE+wqVHJoOfJXd24WQFrJwnoW0ozjP22H3CyYTXMo+q241ADs29c
NwQcwiml5clO/kFtmoS0Knf91/m2i9J3Be09h06/cvTDMiaTKlGfzbpT4urPvxZ1
kybv6kxfKtNuNu0m8hNWjPRsLaB7GMIvJJm6uC7COO0+oSfxtjaTMoT8gJ0DMCh8
5PaLronR
=F0+C
-----END PGP SIGNATURE-----

--ZndnTVfTRaTj/fea--

--===============0744232036763896918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0744232036763896918==--
