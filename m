Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CE34DED3
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 03:53:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F2F8C79B4B
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 01:53:55 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 299CAC79B4A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 01:53:53 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id i125so3336637qkd.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2019 18:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FzeoHNvwNFAe4JFuN6JNq4ROJ3+gT4OPaAU7ox4WFrs=;
 b=JEzYUMzW6GSpZ2SmTAAVCmMIXWQ3mGX9Y3BMNga/HR4REq67ZsZD1+YnnJHJAVqQAa
 ipM2rOAS3mmbhVdN7mQvOMWEHd7qv/NpERnoywif4HQ1xP9OYZs/q7DLdilH9JCLMUNt
 qI6waMASdByE4D0gth+heRqWG4+0JbLXR2ag0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FzeoHNvwNFAe4JFuN6JNq4ROJ3+gT4OPaAU7ox4WFrs=;
 b=H2Sslw0eXUlCyfhn3B6hVe6HYBxsst1FF3kI6f85aaUAwFlUEzgWWb2GN8bkmMDBFj
 XGrLvYu/1PcU4/TCXcPsBz5B4jKuA4S+VXhWEEJDaRaPE3dH68tc8ILqYcKZfQl4M8QZ
 kRMy7yd6D5gWtru9luF/SOYF6v2WBqCT2qxmx9OXbIBFT6vxK/IjDe9HDn6rgBptMizF
 OKbcTII0U1QcVl3A/AUQzonWplibNVUNautTQ6DAlIIKPocFuQ/THQYZHQGky7/76olz
 rv/hjl0BixMv3SVp5v5NQan+NIupQJoWJohXk7e2CWwIcryEu2qDf5PxBvVU/v3ZgtxL
 2wuQ==
X-Gm-Message-State: APjAAAXijdvKnnp5oEsjIwwuSpbselBIHWNlh56QV/w0yhXmuPHRifPr
 ZkMnntHWCtEWrT+rNuvy/mZTMQ==
X-Google-Smtp-Source: APXvYqzbK3/2KGrHLeWsKXcGJ4s2ZK15+c6WX0GoX4xmnlh5DkvS6BuB8rR+i4TkjqUsM4C5XiQ5Tw==
X-Received: by 2002:a05:620a:1456:: with SMTP id
 i22mr83892291qkl.170.1561082032064; 
 Thu, 20 Jun 2019 18:53:52 -0700 (PDT)
Received: from bill-the-cat
 (cpe-2606-A000-1401-82DE-D11D-7B2E-C73E-584A.dyn6.twc.com.
 [2606:a000:1401:82de:d11d:7b2e:c73e:584a])
 by smtp.gmail.com with ESMTPSA id c4sm795558qkd.24.2019.06.20.18.53.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 18:53:51 -0700 (PDT)
Date: Thu, 20 Jun 2019 21:53:49 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice CHOTARD <patrice.chotard@st.com>
Message-ID: <20190621015349.GH9388@bill-the-cat>
References: <ace52b94-5155-cfdc-f6ba-7d012bc12d7e@st.com>
MIME-Version: 1.0
In-Reply-To: <ace52b94-5155-cfdc-f6ba-7d012bc12d7e@st.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32]
 =?utf-8?q?=5BU-Boot=5D=5BPULL=5D_u-boot-stm32_for_v?=
 =?utf-8?b?MjAxOS4wN+KAiyAocm91bmQgNik=?=
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
Content-Type: multipart/mixed; boundary="===============8416881943153324701=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8416881943153324701==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y4E6tNLPdzD/Rx2+"
Content-Disposition: inline


--Y4E6tNLPdzD/Rx2+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2019 at 06:48:16AM +0000, Patrice CHOTARD wrote:

> Hi Tom
>=20
>=20
> The following changes since commit 77f6e2dd0551d8a825bab391a1bd6b838874bc=
d4:
>=20
> =A0 Merge tag 'efi-2019-07-rc5-2' of git://git.denx.de/u-boot-efi (2019-0=
6-15 13:03:00 -0400)
>=20
> are available in the Git repository at:
>=20
> =A0 https://gitlab.denx.de/u-boot/custodians/u-boot-stm tags/u-boot-stm32=
-20190619
>=20
> for you to fetch changes up to 7c654683464dc4cd89f9a8198e26336263390b57:
>=20
> =A0 usb: dwc2: allow peripheral mode for OTG configuration (2019-06-19 16=
:56:11 +0200)
>=20
>=20
> Travis CI status: https://travis-ci.org/pchotard/u-boot/builds/547780537?=
utm_medium=3Dnotification&utm_source=3Demail
>=20
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--Y4E6tNLPdzD/Rx2+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJdDDitAAoJEIf59jXTHXZS1O8P/iVDG9PxEGBpeCWiBBGlyd0c
F63ojWMG3T+VSCOWXRPPC025lz+cqi6JQjPTRU9CxRzsQfIyMvBn9BdCAPPOx96T
QjDj3WqKW/QZs7B9YNIXpNRlqpE8Lr00sfUL7dnMVLO7SlguT3NAk5GwDNf46czf
K5cT1Dxsm5QIR4sr3bzG4QZkHFATZqatj6sBrtHxsUSxZLhJA/e44lcWcc7lJREZ
Ix7ZXHP2uLCp7LS3ACvOcLEasU2XF/Bal6erdgxd0Q/bnVOkFyQhoyMYmtS3QDGH
yiwLi+kxVPi2CcLCwdZI+WO9iRPlMqCtok65c/xURnicCZZB01p//+d9ZDQfAHTO
RLhytbTL6bbbJReEFRyxAuLRKPSFGUCUi112sWMf06QUpI5CTAKsDaBJTVqBFy/l
ojVbVER4arMA/YjrIBpwORB+E0F0YGfgAOcS315f25JsPD4S+hrFThQXj97hNZfb
oOrYPpmTeMi2Q2zsj7FI3MA0+hpgEENZcP/cxmtEYIqGGl7c/WH/RjejGaR8nf1N
g/ZmvEIgjpY0zfxTFXJSJaVAF0keUOAZwtrhj6rU6M6jJhJK6zkWPiMYKY77Hn+3
f/5balnwW7AGLyV/VKOFqYXKcOTh9a9JgYBt7/1YNTY20HarIT7dTnQDPHGnAf/Z
XdlSPBBOdRcrFDbmrJOk
=7g+5
-----END PGP SIGNATURE-----

--Y4E6tNLPdzD/Rx2+--

--===============8416881943153324701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8416881943153324701==--
