Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCA1B9787
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 Sep 2019 21:03:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04C4BC36B3F
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 Sep 2019 19:03:42 +0000 (UTC)
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
 [209.85.161.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8F4BC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Sep 2019 19:03:40 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id i188so2442870ywf.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Sep 2019 12:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zWhw6BA2nzv5hkGPQOiJX7D0nXLX6R8S+gaN5RL9w6E=;
 b=qbfXWrtDOwimMLLeDRkP5eDsRItFYd3QGpSmIgLS7L/NBgLdRSX0K9khorxAy5lNYa
 XamaPndjRelyoB40rGx3V1+mbD/inmCP+ZuUEi55oQmX4/73znNB0YKxbqNAtsbJV/Bh
 Sjs1uHFPlNQ2dlm0Gj/xohHsubLwQi2U5Draw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zWhw6BA2nzv5hkGPQOiJX7D0nXLX6R8S+gaN5RL9w6E=;
 b=sfaeSTXLwpHerA5T9OATpb7LiABrkJMAFCAPSamx4OgWhVT2L+8TlT1btzqZFe9LDb
 TzHHE9eKeFx1PmiosXSToH3bWtv+a6kF7xsJryXi1K1kupmgv/vM5xeRr5MsKPpCsgXn
 bkzEXRgude7cx/NrdX9iDECB2bDyvQb6Mm/kN8ujZCldjQVC7Ram+B00a63cwQQI4uOX
 57RuokeEZqjrNNgjn7TrkY8ZhomWntWVTATb5VJ4lQ7ButiXe8K7k4ajlMQU0s1bsdUV
 wWN5Y7VHRcExI5qlVi7X9AFxdP3SXRgWrpnOJJOFOV6Hr5mGloM0iEWaNNAeJKpNGt6b
 ypWQ==
X-Gm-Message-State: APjAAAUGRExMryxDq5exW0ubRp3gina1RsnB5Rj4MeyhpctMmd1zzEGr
 4C8h085IoY0gAbIQdY2mzRzy1w==
X-Google-Smtp-Source: APXvYqzuLsSC9LsIbGm4Zb4ESH+Pc+plYrCNKSOpCL7fX11r7/DO3l7PhwVka3oEmD+oLWwJLPekjw==
X-Received: by 2002:a81:4bc2:: with SMTP id
 y185mr13340008ywa.491.1569006207601; 
 Fri, 20 Sep 2019 12:03:27 -0700 (PDT)
Received: from bill-the-cat
 (cpe-2606-A000-1401-87B6-88B2-6D19-9205-7C6C.dyn6.twc.com.
 [2606:a000:1401:87b6:88b2:6d19:9205:7c6c])
 by smtp.gmail.com with ESMTPSA id h74sm622688ywc.15.2019.09.20.12.03.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Sep 2019 12:03:26 -0700 (PDT)
Date: Fri, 20 Sep 2019 15:03:24 -0400
From: Tom Rini <trini@konsulko.com>
To: Stefan Roese <sr@denx.de>
Message-ID: <20190920190324.GM1011@bill-the-cat>
References: <20190918092920.21435-1-patrick.delaunay@st.com>
 <b3874e83-e983-2adb-aef4-585acc4e08d9@denx.de>
MIME-Version: 1.0
In-Reply-To: <b3874e83-e983-2adb-aef4-585acc4e08d9@denx.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Hamish Guthrie <hamish.guthrie@kistler.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de,
 Ash Charles <ash@gumstix.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v3 0/3] env: Add
	CONFIG_ENV_FULL_SUPPORT
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
Content-Type: multipart/mixed; boundary="===============5121253565222161086=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5121253565222161086==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MsEL38XAg4rx1uDx"
Content-Disposition: inline


--MsEL38XAg4rx1uDx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2019 at 11:09:14AM +0200, Stefan Roese wrote:
> Hi Patrick,
>=20
> On 18.09.19 11:29, Patrick Delaunay wrote:
> >This patchset is a the 3rd version of
> >   http://patchwork.ozlabs.org/project/uboot/list/?series=3D129339
> >   "env: Add CONFIG_ENV_SUPPORT"
> >
> >The first patch of the serie only solves the regression introduced by
> >commit 7d4776545b0f ("env: solve compilation error
> >in SPL"); change_ok was always NULL in U-Boot.
> >See "U-Boot: Environment flags broken for U-Boot" mail
> >http://u-boot.10912.n7.nabble.com/U-Boot-Environment-flags-broken-for-U-=
Boot-tt382673.html
> >
> >This first patch can be integrated in master branch
> >for v2019.10 as requested Tom Rimi.
> >
> >The next patches of the serie is a proposal after Wolfgang Denk
> >review on the first proposal: I make the env support coherent between
> >U-Boot, SPL and TPL.
> >
> >I need to change many defconfig (to add CONFIG_(SPL/TPL)_ENV_IS_NOWHERE)
> >because I modify the dependency between the CONFIG used by SPL.
> >
> >Moreover the size of SPL increase after this last patch.
> >
> >For example on stm32mp15_basic, the SPL sizes:
> >
> >   62024	   4616	    892	  67532	  107cc	spl/u-boot-spl 00003e6c
> >
> >increase by 250 byte to
> >
> >   62274	   4640	    896	  67810	  108e2	spl/u-boot-spl 00003f56
> >
> >And the patch also breaks the compilation of few boards, when SPL size is
> >near to its limit (.sram overflowed in SPL or SPL image too big):
> >  imx6q_logic (by 1572 bytes)
> >  omap3_logic_somlv (by 220 bytes)
> >  omap3_logic (by 276 bytes)
> >  omap35_logic_somlv (by 156 bytes)
> >  omap35_logic (by 3064 bytes)
> >  smartweb (by 408 bytes)
> >  duovero (by 952 bytes)
> >  x600 (by 1624 bytes)
> >
> >So the last patch can't be integrated today with these errors
> >but any review and advice are welcome.
>=20
> I'm looking into this because of the x600 breakage. So this patchset
> increases the SPL image size because all the environment "features"
> are now also available in SPL (please correct me if I'm wrong). In
> the case of x600 (IIRC), env is not used at all in the SPL stage.
> Perhaps it would be possible to (optionally) remove the environment
> support completely from SPL/TPL in such cases?

As part of correcting things here, we need to be able to have boards
either:
- Work as-is today, whatever options that need to be on/off now, are
  on/off.
- In the potential cases of undesirable configurations we need to be
  able to opt for "OK, drop stuff" as well as there's going to be many
  cases where the board doesn't have the binary space for more features
  and removal of really unused stuff is fine.  ie TPL/SPL environment
  use cases boil down to:
  - Need read-only support, for network stack.
  - Need some read/write support, for bootcount
  - Maybe a few things along those lines I can't think of off-hand but
    are $X needs read-only or $Y needs limited write.

--=20
Tom

--MsEL38XAg4rx1uDx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJdhSJ7AAoJEIf59jXTHXZSj90P+gNUjSpOyHgUzpi7Vz9auW4M
6HgR24p2p/u020Nj4pwmABJwFfenpEM2ZhQ/qDPALMiGj5+fRzMz0rNbqjRlavfx
VlHFp8bo+MO6ewbmguDUlwdSxHrBhZlsRTR2hTE/bQdOOPfSvnrmqQ5pZKa++ANH
R5MLYr4V8A5aj6MsRZmV3qXPKePr6KPADZY5D1oNXY3cZ+YXjgGVl2XF7lGzPstx
ALEU2105iI6JHVcDHFBdmE7kwdu/5ERZob/zQ8c1QA1rttsk68jrKUr9+oTrFSq6
WCM51643UGaL9KBK/SYo6042ZUqYXdpMJhZAyg3zDGC56fq8yW7i1L4NKUA6uEDH
5f35RdbFAoIA6MKYQM6ukhpEIVs6S0TOtXO33W905SH0UUaC4xm4q4NAzRBmpqtW
gMBsv6bgmff0X+5o01qCwy64uIe9C+n0YqunfJALKWGhrE+l0yXfGyGE2fFYsj/r
5CtchOYT3+C3zHoqQXkE8VoBVE38xXbLncl958UaC6hP1gRlHblqotiyVgE6LOnl
WCzPWz6RWcs9tLnURrsXd1T4rwjYe63THMQTZzDcSkYd69fIp/ylqpZlilIzMQxW
PRfuR3J2gpvH25KFrEEroYSjXwnuqfL/FPcTMx8xs2/3FUsR1PQUZYC3SRmxPyxC
W4eIjZWjOnrNQ7qXN5+H
=flJP
-----END PGP SIGNATURE-----

--MsEL38XAg4rx1uDx--

--===============5121253565222161086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5121253565222161086==--
