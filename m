Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB2B3696D4
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Apr 2021 18:24:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6663C57B54;
	Fri, 23 Apr 2021 16:24:03 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D33FCC57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Apr 2021 16:24:02 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id d19so14439597qkk.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Apr 2021 09:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TIhI58WQLuSzye5Tk9WeQdLfwCoonFTfZldtGzGdwqE=;
 b=cPgc1FwGWtytr9az9Fqjo8n75UjIhrZ7cLzP+5zYgB4bMDXwIMVQ95u7bSWvqd6BvW
 q9a98kJdnyCFnEDKSc+C/Rn9YNutuNq9uDhjNtpl7Np95lfHM1kuQCK5ynPR42sSY6Mm
 VwEggelBa3xZ5zCQZWgpcdk41Zu1RIbY81Y+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TIhI58WQLuSzye5Tk9WeQdLfwCoonFTfZldtGzGdwqE=;
 b=hzn1m/HHPDH3RLAdGN9QlhzG9X46M84wd4j0KEODSQO85wmr4kBMyC2DC/I/0PFjMx
 X5WTosjJQq5s71d6v4DgJABGaqmgWBLvOLP5ntkrKcnW1aTGC6oz8Sy1BxQaKS0X8kkD
 37YAVmCV+r3C1ZcQGiqX0oNakOmciHYGCupNX5xsUnods4CSqUOJ5N+aSYaz9d/1iAVF
 ftGB4N2BuPMVLJ4o6/fLRnAlTLeXAYjfb2v/023U6c0pdwQfxl2Z+tU1/rCn3+H/HuwZ
 Bk/KluRp254YB6KVLs76/N9hvUi3xnE9yKPol68G4+vRVODtwsf1SKUXmILPvcVfipK1
 UoiA==
X-Gm-Message-State: AOAM53133+YMNvRVXZXNLphXxB+GRs8N4uXQU3UCmD6yBRr7Wn3ob5Dk
 iVODWYn+DJd2AwxnleOXwSEgnA==
X-Google-Smtp-Source: ABdhPJyTMKCbHxZtRpsIlOHNuGMaemQ/4ILkVUt6cqAPHfGl5X7Y7mDiSUL/lMko6HUrulbTiGmHlA==
X-Received: by 2002:a37:8a01:: with SMTP id m1mr4944189qkd.85.1619195041731;
 Fri, 23 Apr 2021 09:24:01 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-140-239.ec.res.rr.com.
 [65.184.140.239])
 by smtp.gmail.com with ESMTPSA id v18sm4648050qtq.38.2021.04.23.09.24.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 23 Apr 2021 09:24:01 -0700 (PDT)
Date: Fri, 23 Apr 2021 12:23:59 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210423162359.GQ1310@bill-the-cat>
References: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
 <20210310101622.v2.4.Icdf0b7e662fc65658e591ce0f692a5695f607256@changeid>
MIME-Version: 1.0
In-Reply-To: <20210310101622.v2.4.Icdf0b7e662fc65658e591ce0f692a5695f607256@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Stefan Roese <sr@denx.de>, Reuben Dowle <reubendowle0@gmail.com>,
 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
 Masahiro Yamada <masahiroy@kernel.org>, Tero Kristo <t-kristo@ti.com>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Simon Glass <sjg@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Uboot-stm32] [PATCH v2 4/8] lmb: move MAX_LMB_REGIONS value in
	Kconfig
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
Content-Type: multipart/mixed; boundary="===============7497930325325139935=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7497930325325139935==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1aNSWsKBlOTFpzcX"
Content-Disposition: inline


--1aNSWsKBlOTFpzcX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 10, 2021 at 10:16:28AM +0100, Patrick Delaunay wrote:

> Move MAX_LMB_REGIONS value in Kconfig, the max number of the regions
> in lmb library.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--1aNSWsKBlOTFpzcX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmCC9J4ACgkQFHw5/5Y0
tyzWpQwAmv9+SSRGYQzkS1gFudC3an9/TfVp7foCTzq7B1FUd5RafeXba+tK8a+I
YF1KYw0eOy8Swf3fnsaFQK7ZTNz0VimdthQQoloCf2LCG9HCQIUtCw41WgYw2Sb0
8ZmTg0NgMOFzlYc4RA9hZNxbZUZd9ApXPccSgGkTw3jL71HsnkutkqSCmuz4moUh
51i/FbsAXBGJByw/VlMW8hC9kdG1vaYPcA7G02pDdM2ZgsLp2wvHbKVtkLLrWo9i
V0supqYiKdEA/y2+b9+67PtENUzoHWx451TeTCdJjdEKHaWFqKoxA3PPYkyyM//S
k+05USpV1mG48ynVjoTIu55EPNJbaQNRBlDM2wc8EEEWvcAY7e87eMSD6r5l2AtP
DnoelLaHAAi6qF9q88Aw+4xO30qiUXlAoWFojXVgP3e6bS9Er/Ffsll+DJGROFB4
9Er/SZQDL6E5VM5aWBMGjABQUE5/Lm9d690bdZQJ8isRwnWTD7qAYVUNQWAfocXD
9ehbqw6w
=d/hD
-----END PGP SIGNATURE-----

--1aNSWsKBlOTFpzcX--

--===============7497930325325139935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7497930325325139935==--
