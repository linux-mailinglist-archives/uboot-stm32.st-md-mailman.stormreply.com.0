Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FAC2744F9
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Sep 2020 17:07:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09D6AC32EB1;
	Tue, 22 Sep 2020 15:07:47 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15D58C35E2B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 15:07:44 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id o16so19288962qkj.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 08:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ivK+67rVk5AGkh9YT6BvE3AMDx6CVQ7AboM8w/ZmYN0=;
 b=H7k1rpjZ93TZf1Ne716nI13p4bqFa1RWmk3x55kHcEOJ3pY2gru9dsw784CrrN1gZ6
 gdxQmixMcxGisYHxbrq7XOFU5s7Sq0EqEubIKto7fgN1nl2upIRzKb8OaWEVfmHPxcf5
 LfsSLeN2pxm+VpC6RhCqlynVFd4q/Qpv96wdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ivK+67rVk5AGkh9YT6BvE3AMDx6CVQ7AboM8w/ZmYN0=;
 b=LFc+bHzF0axCwRu0WT0DkjuwUxtryBSqUbHpwHi8H0KSYS6ZTZWfZg8YlutE18diEF
 F8rQ2JBanGR8p/h9AnfqfkJMp+OzAtggbvnfe1Juomy6li4VDzAM2K7yeKa6Sqa07wNO
 uGRNIGO0XeiOJMa9fTYB3rPc8JBn72yIrf7bnWRq/WsGd8OZESakV25Z8qrhMtkGrYIe
 isMtB36Jenq89p2Y7LJbXzWpbH/HiJUGr2ZUxBkUOLy+rsnvYPBF6ZlXkkmgSNQYaXhe
 4R6lqwJZQXnmvTu2dazKrnK81h6V7/MjlVGWAALKjqJAUy49aaIqIXdliCa+/MHx3JiH
 pemQ==
X-Gm-Message-State: AOAM532a7iTmCXq359r6SCt7w82T7s6s0bPSy1jr+4aWATP7WWADnCWK
 AZAZ3Knc0HqmRq4ERvAXG7Rhcg==
X-Google-Smtp-Source: ABdhPJy3LHzkP+NiOjsV7WEp2N4eAJCM8FPm1KBLsRZ6wIfCyhkYh0VwL3fVEHhL7VKt26usNENtyw==
X-Received: by 2002:a37:84a:: with SMTP id 71mr5208400qki.166.1600787263414;
 Tue, 22 Sep 2020 08:07:43 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8ebe-a44d-5ac0-e6e7-4c04.inf6.spectrum.com.
 [2606:a000:1401:8ebe:a44d:5ac0:e6e7:4c04])
 by smtp.gmail.com with ESMTPSA id 192sm12255114qkn.9.2020.09.22.08.07.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 22 Sep 2020 08:07:42 -0700 (PDT)
Date: Tue, 22 Sep 2020 11:07:40 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200922150740.GC14816@bill-the-cat>
References: <20200703153646.28533-1-patrick.delaunay@st.com>
 <20200703153646.28533-2-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200703153646.28533-2-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Simon Glass <sjg@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Weijie Gao <weijie.gao@mediatek.com>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v3 1/7] phy: generic: add error trace to
 detect PHY issue in uclass
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
Content-Type: multipart/mixed; boundary="===============8171097240298606256=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8171097240298606256==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Td0dI20rpRb/lyQ/"
Content-Disposition: inline


--Td0dI20rpRb/lyQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 03, 2020 at 05:36:40PM +0200, Patrick Delaunay wrote:

> Add an error trace for PHY errors directly in generic phy
> functions provided by PHY uclass.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--Td0dI20rpRb/lyQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl9qEzwACgkQFHw5/5Y0
tyxXpQwAslAd8RTpemy8oJLtUVZHeWy7ivp/UDDyHA7vCkR5S1ZNSbbY2UTH9bjG
w5E+DPs5nzgVRr7XBHPoumqRchsRUCEOoxQwQmpq44oWbacmnvfobWEulPRWGziE
4duSGI4isE+BJyn/8dIZSMcJCXX/OEeqfbdPmDsUc5nr17Xk+5Q7eqoaa7w3CdQM
x3WMzsQAX84FlflnYCquvMYLqw76U5NqBcN9FIUHO/BdcBcm8k6BBEdmQ8qqLqWr
PM1PAJmgy8qwaCMm8T+MTCLU/Hp0lYawqBiXQC0/R8X80mII/yK0ri3A9sy4WY1L
kK5jblqlZSSN6pc5tfic2uSVw5kEkSyP6EAA7wHVsERDmCTbvyQQKwxbooL81DLP
Ki/R50fAPf3X13a0G7aK184sP99NfrfmsRfN/bgHTzobhb4E+El9/j1sbGJHPeRP
5qUkN0v8CMPsxetLDjmPntFB+2+lszP73/kIkCEeh6NVm6zBJx6oiz3CT+JKdWYr
m7RShCe5
=iKL2
-----END PGP SIGNATURE-----

--Td0dI20rpRb/lyQ/--

--===============8171097240298606256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8171097240298606256==--
