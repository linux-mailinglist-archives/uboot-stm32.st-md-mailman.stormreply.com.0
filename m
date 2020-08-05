Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF0223D2FD
	for <lists+uboot-stm32@lfdr.de>; Wed,  5 Aug 2020 22:27:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E3C6C36B38
	for <lists+uboot-stm32@lfdr.de>; Wed,  5 Aug 2020 20:27:00 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16D5AC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Aug 2020 20:26:56 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id a19so15390016qvy.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Aug 2020 13:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cK8wCJzLjdU3fc883fKw885Tg8MqW+Lk21Qa2ilSc5Y=;
 b=bljAmjPq2FwerPRE/hQPIwWJ/O8nTjQIa6qXtGnKlyaflbw9GeQj+331lvw0NVc35Z
 DCefCzIz/wtT7Kk4XZnK/ITZDtzqqN+NLB5j9mMw8W7Y520KBLP9LmwPCorBeoilZWzM
 U+JDWONJ80TreWNqZcnbpneOZ0mcj5TcEu4X0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cK8wCJzLjdU3fc883fKw885Tg8MqW+Lk21Qa2ilSc5Y=;
 b=mOF3CnaMVVPBkHzVruQTRlyxlYj1lEm9XQ9l8A4hVM3DIfM3vs8yslNiRNvH0Oe6t1
 rExMuUyvZWTRFZhMaigO4pNMDXtESIxKEwrLot1aN38mXOcDAtDZrHfewrb++qbJi3M7
 KDcB886akTOY6uP5lBM2sk+CUkpzZTRmw8iZioeUNtcSqgra0rPvbYfzFqb2WUoA4hij
 YSoDFHRyLo0mxRAfsX52uEP8xOsWoQOKLIWnSR10K6WGpaGuaJVQ6/tnWjVrwwlwTqXh
 bXuoDOpJ0W+qLjEeZLdfh9ZJE1Z00+wWO5eNQ5VdQWsTOYHzRks49ubh5vWLsR8sl0gh
 auWg==
X-Gm-Message-State: AOAM531sZzQXDqcAUxzkNNv+5IM7JaojhkTyXNYwqWe22OQUtNZUgYG3
 oWJNbdY6XX2k+g6RM62gR1mTnw==
X-Google-Smtp-Source: ABdhPJwO84xzeBvLkrbd8BKknwVKOb5SCLtMEyfko+92YgVofrFwOzaVUEvsY4ICQHb4Lt/3dVcqQg==
X-Received: by 2002:a0c:ffc6:: with SMTP id h6mr5610060qvv.251.1596659215808; 
 Wed, 05 Aug 2020 13:26:55 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-3826-99f0-e3e6-2490.inf6.spectrum.com.
 [2606:a000:1401:8c61:3826:99f0:e3e6:2490])
 by smtp.gmail.com with ESMTPSA id p202sm2385596qke.97.2020.08.05.13.26.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Aug 2020 13:26:54 -0700 (PDT)
Date: Wed, 5 Aug 2020 16:26:52 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200805202652.GS6965@bill-the-cat>
References: <20200608092719.10643-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200608092719.10643-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] net: dwc_eth_qos: add Kconfig option to
 select supported configuration
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
Content-Type: multipart/mixed; boundary="===============3043399337749621470=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3043399337749621470==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VDo88IHMZzDSr6Ba"
Content-Disposition: inline


--VDo88IHMZzDSr6Ba
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 08, 2020 at 11:27:19AM +0200, Patrick Delaunay wrote:

> Add configuration flag to select the supported dwc driver configuration:
> - CONFIG_DWC_ETH_QOS_TEGRA186
> - CONFIG_DWC_ETH_QOS_IMX
> - CONFIG_DWC_ETH_QOS_STM32
>=20
> See Linux driver ethernet/stmicro/stmmac and associated glue layers
> for other configuration examples.
>=20
> This patch removes the not-selected compatibles and lets the linker remove
> the unused functions to reduce the size of the driver.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--VDo88IHMZzDSr6Ba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8rFgYACgkQFHw5/5Y0
tyzJMwv/WPJU3OmtgynV6FYTcu546CVejfXAOy1yb9UnMeqS3XZL2EUyjr0uI9va
lGRtFxFX6dIfHV2zUpZToO+fKqqsvCB7AJcNFPODRBOSpFQ10ymYwPdH7ytLYRmZ
69S+ezrtTU9CpJLSXZtr+yTaPK2CAIKLiODSnIvfsZOy7ThjDgicQiQ0oKRCFBFM
pslCNzpAzd7leh6NZlbU4tViLmVDY9XjQPyrPH/gVQhq2VprRuCeuzJ2PxX+sUcN
Xez3BKwrUHZmmZl/hTXzS88UFknSLFeP2yd718l1kxdqGdiSuhsHP775G+Ux7nga
liPIUl9wPkCg95fXVJKz8PN7MXotb2NZLbWeOCDzpQiEJ3gGc6RelApqSRDYKVrf
lM684I6FHezlOx9GWMt4eRlpDtkYtPO8mVXRYW9npniK3VkhCcJGFNPWjATjRN64
DRQYkNV3OtSv7XgTc0Xw5TwM7G6JaqH8Tnm9fPPKxKHzi2Rz4GrejfKRGhvM8KA2
Mwd9SXMm
=j8ez
-----END PGP SIGNATURE-----

--VDo88IHMZzDSr6Ba--

--===============3043399337749621470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3043399337749621470==--
