Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6A022457B
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jul 2020 22:57:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6ABFFC36B27
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jul 2020 20:57:42 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71A12C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jul 2020 20:57:41 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id 11so566168qkn.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jul 2020 13:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1yzXjUCijC1FEPMaAoJEzLJT9fIBHa6yarVHh0C1GnA=;
 b=AxFiInnWAXP49+zuvCDC7H9YW2U+eC+GKiTqjraxYYop9vqJQjG/fzu3S1GuQqB9X3
 JxdaRFQ17evyu1wxKybuE3DSuvo8XYwF33pe3JXwjlZ1HxxTIbmewpoejTqWDNN9QzVL
 q878fHIie8G9DWJ45k9zU50GYwf6laEe80vno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1yzXjUCijC1FEPMaAoJEzLJT9fIBHa6yarVHh0C1GnA=;
 b=g74+csr5YpzluxQMqh/EHCeMeTsS41p7I3dn7otyJUUSexTWFtU8X/wgsE4ggqV0hx
 N7t31L48BYsvhzW2YfzxA3WjnKhsYgdlKwgSSwTfO8rgM5p0v29/+DeCQ7mHvPemkBr/
 AHmTzBI9iQDLMRnBr95QGYiB5P4gpn68KoBibBfBZFPE6ccvRu//XFbACFODStdNGNY1
 PaFnP16zSZsehBLAIp53UoKOWcUR7bV3TFnPvlWtXMImHdwcT38AbvNf8dtyKTJAhS+z
 bm6IDIszbV8YlOgfWrgouOxzk+fywJquWfbYkv/yUYZimBmeMMjPAD8rqG4pFkGKV81u
 Vjtg==
X-Gm-Message-State: AOAM530w9a9fHPyFjtycP8EhDMld7DEb/aO6b8d+L/GK1q63xkfOC81Z
 JZq/u0A9oEA8oWKC800vxh0JQA==
X-Google-Smtp-Source: ABdhPJzKiJSjmdXtfbixd2uHQ4zYAFX2ONCKkjqgofizErgQksEC5XrAnAT3ZiGOPEEiK2BcUV+N0Q==
X-Received: by 2002:a05:620a:782:: with SMTP id
 2mr10811021qka.50.1595019460302; 
 Fri, 17 Jul 2020 13:57:40 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-d965-699b-5e29-1c80.inf6.spectrum.com.
 [2606:a000:1401:8080:d965:699b:5e29:1c80])
 by smtp.gmail.com with ESMTPSA id o10sm11981523qtq.71.2020.07.17.13.57.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Jul 2020 13:57:39 -0700 (PDT)
Date: Fri, 17 Jul 2020 16:57:37 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200717205737.GT6227@bill-the-cat>
References: <20200617161918.7540-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200617161918.7540-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Pascal Linder <pascal.linder@edu.hefr.ch>, Sumit Garg <sumit.garg@nxp.com>,
 Holger Brunck <holger.brunck@ch.abb.com>,
 Breno Matheus Lima <breno.lima@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Simon Glass <sjg@chromium.org>, Alison Wang <alison.wang@nxp.com>,
 Kever Yang <kever.yang@rock-chips.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Stefan Roese <sr@denx.de>,
 Heiko Schocher <hs@denx.de>, Adam Ford <aford173@gmail.com>,
 Trevor Woerner <twoerner@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] Convert CONFIG_ARMV7_PSCI_1_0 and
 CONFIG_ARMV7_PSCI_0_2 to Kconfig
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
Content-Type: multipart/mixed; boundary="===============8876709259110735400=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8876709259110735400==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0k7NRaGPjSSxFfo/"
Content-Disposition: inline


--0k7NRaGPjSSxFfo/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 06:19:18PM +0200, Patrick Delaunay wrote:

> This converts the following to Kconfig:
> CONFIG_ARMV7_PSCI_1_0
> CONFIG_ARMV7_PSCI_0_2
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--0k7NRaGPjSSxFfo/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8SEMEACgkQFHw5/5Y0
tyynsQv9GQ/EFz+pF2SJB95LRa0cW8L7zCdemkHgm4OLOlAJOrZ+36NRiVKLh3sM
flOsUKsB45b8qtbJ4tYhpFnpYDtG/BwSLg2mUVFwa50VLxU2w+F8w9gua9UXC5fY
lU4tfFCocWbJwnBC3XuPw9pgQshYNF7pO3SpPkIAitNZTn2X9VJr6+kshXcq+Bj8
9vCGEHdZZb7oJGVL/9Cy74yhULIySwKA3ZmGA9bFeddHYRL45NAfsLcEjXa0BTK6
pgtfbdZ5vJbkl6PId+EKo/k73nPY98wWe3b1RiowoF8C0czxlzuLlgxnq7/mfv9P
/VWH9DqcOyufWUjkT6NA4ToxWaC10Et3u5evVfQhzvAHkhxmPWlCKSYUo2Ww8C4X
Mb9amlPuzdy8pR00Ep3wGmsh51OsIUY+MFzQ2hs72pW+orE95mAAw3Q9T4CPhQpw
oFeBl5TWXM9VRGKmMxaFhl13i6+Xol+lKt413szvcTFAqsJ0rKaXNLnyh9YIy0kA
MakxAMWq
=GsaW
-----END PGP SIGNATURE-----

--0k7NRaGPjSSxFfo/--

--===============8876709259110735400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8876709259110735400==--
