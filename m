Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D692FA093
	for <lists+uboot-stm32@lfdr.de>; Mon, 18 Jan 2021 14:00:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1762C3089F;
	Mon, 18 Jan 2021 13:00:19 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8495C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jan 2021 13:00:18 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id z6so4070148qtn.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jan 2021 05:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5f+QRHAqBDrEzAMvdVNF9M1HYlb5j5jfMGXQZnE8gx0=;
 b=c67ngwa+UJ23pZd+NtajSd3GYmfv2nZtp/VYPCDIhiMas32PBFDO+wMDvWSinJOIgz
 a/LOtJQ3VWiwkDrVasTec5PoEez+9JnPn0wyOvZGtmNIod/v7CMY8RebvCkydsZ6KTu/
 x05uCNDAv4fRIBaWEjUvNhU3uRyNAcAntj19E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5f+QRHAqBDrEzAMvdVNF9M1HYlb5j5jfMGXQZnE8gx0=;
 b=EzmDviEDwPAx7YX8k7O4xotO/PnEM8yrhxkHiIWz9ToPXsh6Tc8pqlIUZ5Io5qz8aD
 yqDroSFaPiBl51Kxlk153aCV6vMJUzaS0g9l+S2N/pepztIYw7RDDFofaIeEKSMeDP3+
 lRgkR3ouZAcOWikSvKVaPvfpeiktV4jJAKbMpWC6I5kyxLIbRtUsQEs91GgZua7GDQDn
 NeXpQAHtYBeMCMeZ49eRN3sUnMlia9sqM3TQ9P/ttt9mbg/fupRDmBba63SaWHHOYcq4
 leZ3BeoEn8Xley6yVtKY7rLPE4w8GED94GmzM12nHghUPG7YaRQs88ttoupCtvS8iFKL
 0JCQ==
X-Gm-Message-State: AOAM532C6ApB4KphMIxrgHlLu1AvVDjHZb6sSmMnuf8xlFLIRMvKa0DB
 /070sxQWyuCM1kE8umzB15w4+w==
X-Google-Smtp-Source: ABdhPJyja8yUQb/chC4AU6WAKnPS4cVljEMRM7uokKwWgAeiPwX2tCKb9oyeFklG+RSzueWSVy2fmQ==
X-Received: by 2002:ac8:2a8f:: with SMTP id b15mr22809983qta.33.1610974817980; 
 Mon, 18 Jan 2021 05:00:17 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b42-3f4c-71d2-022a-d5fa-e283.res6.spectrum.com.
 [2603:6081:7b42:3f4c:71d2:22a:d5fa:e283])
 by smtp.gmail.com with ESMTPSA id s30sm10280718qte.44.2021.01.18.05.00.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Jan 2021 05:00:17 -0800 (PST)
Date: Mon, 18 Jan 2021 08:00:15 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20210118130015.GK9782@bill-the-cat>
References: <20201119090843.5614-1-patrick.delaunay@st.com>
 <20201119090843.5614-3-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20201119090843.5614-3-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH 3/3] test: correct the test prefix in ut
	str
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
Content-Type: multipart/mixed; boundary="===============2412780003624163012=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2412780003624163012==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z2hf4YSN3H4nBSDp"
Content-Disposition: inline


--z2hf4YSN3H4nBSDp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2020 at 10:08:43AM +0100, Patrick Delaunay wrote:

> Align the prefix used in cmd_ut_category function and name of tests
> for ut str.
> This patch solves the issues detected by "make qcheck" after previous
> patch.
>=20
> Fixes: fdc79a6b125d ("lib: Add a function to convert a string to upper ca=
se")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--z2hf4YSN3H4nBSDp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmAFhl8ACgkQFHw5/5Y0
tywbUwv+L7/m66A+6fiDavrx53DdqOGd4nazTavu1MLaT2OnzgrCicZ/zkx3GrfI
fZnPvlKrD6M/LX4AUGvn5PwlFXJrW668GFEpzfmHmxJjv/LzmqsIbJSnPN/dn24c
1AF0g7kGn/y7DiLQlGAeOLzynx1Nc5VA/FtdbbsVPWOB+EyS6+ximjta5oi6UxSE
X/+8PsrScOezf3hd6nMJ8yzN2QtewiMcBC+yvDtf9RZY/8m60TAYzycF/kpKgy/R
t36SWRIjiFqqdk3z+L9x349jJ4zHC0P9tAx5EkVl12zlUVY25esKGnZGgYRG9suz
EJEIzqcAxsTqKdxJNBzlEabWCj2bra4clHBPflbOi4X7jAFxWmbLt9FXZ3Wg5qXW
yS+BeNBbCxitjYAyAQowg/3g1dVtM03TkkVe0zAfiANJJrO3C/xaNeJnHFUozeaI
AufdPHxj3fla3+PVb0/izV9awjD273kT1+SlayGEIIwoa9ntX6uuzTVZbILwmi0M
u6waV9Wr
=Q5uk
-----END PGP SIGNATURE-----

--z2hf4YSN3H4nBSDp--

--===============2412780003624163012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2412780003624163012==--
