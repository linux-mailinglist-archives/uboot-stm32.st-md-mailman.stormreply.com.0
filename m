Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FE91158C7
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Dec 2019 22:48:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 900C0C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Dec 2019 21:48:46 +0000 (UTC)
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
 [209.85.161.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E554FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2019 21:48:44 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id i126so3299635ywe.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Dec 2019 13:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oKI+GmBe5B/93pmZq236UacGX+cxgNUvm1e8B13WV28=;
 b=WRs6N2NzM42j8lmdzCr9zngW2cEwy1chPqEaxO4A4dsvKXJ/z9/uGdwr0ZvgkQ9Rl4
 SY/BGQqTPgh17PV2Ovg+XHYqVD/14MYLo+B2S9LFETcOO6fJNToDoKY6jzESdu1vs4a4
 +tQsqBVqfLPJGGKvavrsTlbQKsvjZhg7et/aI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oKI+GmBe5B/93pmZq236UacGX+cxgNUvm1e8B13WV28=;
 b=LkOdpv5bwTF2penwXeDVJ8lPWgt4Or/AX4W4C8JBcjtF9HFs1qszuuu7VzAVWEdDPd
 WgoRPirRwYjHqfqtsN0S7P90rz4xwMZsvibRywTsYWou7ayB0bsFvDt70FBdZFoOROno
 Ntz5qXUGZyrF/GK6hHVQyUJ9W7P/S1vTR+JbH6CaR/DIeXqzNUKOW2sMN7V5a1M4DG1m
 i8N6SgV0wGs1brpWM1nRi8KLjv2vJDjx//BvnE40QXA1WPxqXrk9f9O/XOyup57PSPE5
 I7xz+Rqrt4Cn55APriJO9KExbf4t787i5YZTspu6EJH0by0VQS52X3FypfEpwjdtpYxh
 xmHQ==
X-Gm-Message-State: APjAAAX1xE1as+yGU/tXRUH6IJ5AN4Aq4ShmQYji/kE6IYls5s9Am0VR
 xyxpVEZ/PxfnGayu2YSeF3mUdaK6Qc/apA==
X-Google-Smtp-Source: APXvYqx2gsYVgN82x0nkC9yOeWu6iVqV918Dt/VEeoct/XB2A7PBEle3yeWFdHFDpw+wlzELIBRt9A==
X-Received: by 2002:a0d:d742:: with SMTP id z63mr8131365ywd.284.1575668923756; 
 Fri, 06 Dec 2019 13:48:43 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-d558-5e40-3af2-2592.inf6.spectrum.com.
 [2606:a000:1401:86dd:d558:5e40:3af2:2592])
 by smtp.gmail.com with ESMTPSA id g18sm6611310ywb.25.2019.12.06.13.48.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 06 Dec 2019 13:48:43 -0800 (PST)
Date: Fri, 6 Dec 2019 16:48:41 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <20191206214841.GB9549@bill-the-cat>
References: <20191125080741.2215-1-patrice.chotard@st.com>
 <20191125080741.2215-7-patrice.chotard@st.com>
MIME-Version: 1.0
In-Reply-To: <20191125080741.2215-7-patrice.chotard@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v3 6/6] cmd: pxe: Fix checkpatch
	WARNING/CHECK
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
Content-Type: multipart/mixed; boundary="===============1230462273914196613=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1230462273914196613==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lwi1LpykoG3J8gyB"
Content-Disposition: inline


--lwi1LpykoG3J8gyB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2019 at 09:07:41AM +0100, Patrice Chotard wrote:

> Fix checkpatch WARNING and CHECK issues
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--lwi1LpykoG3J8gyB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl3qzLgACgkQh/n2NdMd
dlLhvw//aLJ5b4UXw7t91nO2luPjr+/iaYbHDsk5218DbLaDzyzEVXwdvnTF+UDY
mFxq0sV3maYopdtk9fLfw3iWSBVGnbmnaFDRrO4gvOgFm245O6O5gQoBxsZI6cRU
TjQovzFPPfCMnaJyMYoKjSRb9YaA6DhWihRXz0rJVpsMwfJNzTwwGv60KyxCYkgJ
WfLZx83gS3fH/JkOeEmvFXBxv2pdOkGp49MlO1192HvRZEBTrLKfO3uAWM7KDzsc
4UabWWManP+8zCgORNmUfCLahXxRmDyMWAAdig5FCMaNM6/U2CozgaWnogAtpaiM
1RTmFHMMHN1hNfXPNVsa2PyK2LsrRqFko8vYWSK8PyDkSNxeHHXbw9aNpfmD2wxA
R86s9m4PwtM6LiVVMVhgzZOsu5E5ioSE9IzzB2bJudcOKXzqYbagGZiwCNLUSqvu
P1gDwj3gGBHfSLe3qZ46MK1xWZhPNodlI8tafT7+WREgITDm4wQgZpTno92YbAMn
KwUG1Y/qaKh5Cbe/Kj8xfnB7t5zZolVdT1wyMMcbMmtzLfmGuP6xirrRzZolsv2g
zgF/4yxUNOY1XHIXGeCnYegJriZovL/anAp6R3b6gPzAEDA2HNrvUtNdjLmPUCSb
IxbR6/PK8YOQfg8m71SLYsX/7bcEXmW2rFXrvUWgykHXeDJD5Do=
=esp6
-----END PGP SIGNATURE-----

--lwi1LpykoG3J8gyB--

--===============1230462273914196613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1230462273914196613==--
