Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAA335E16B
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Apr 2021 16:30:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B24F8C57B76;
	Tue, 13 Apr 2021 14:30:05 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB92AC57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 14:30:03 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id 30so8119296qva.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 07:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4uRAQoiLMrTtA3QmIb6UcIZxS+0i68/lDfiw9xSm2PY=;
 b=PS3OOD8HPTCybimiFc3drtKnYaq1Lz4m7BjM7k5ceHi6bR1v1YaXBzMlLYdZUiLzO9
 p92jSqjUaml98RhPiM7qQEssY6bREBDA5Xn4Fpc1imRIz/cUOO9H/4/4LTXQwPQ0OPgI
 NLg7bXVPvWTB1JzIZMhzfS7BLIPyxpEvtCxRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4uRAQoiLMrTtA3QmIb6UcIZxS+0i68/lDfiw9xSm2PY=;
 b=EO0f4/zFbNMLvznXVekQZ+V6PLZQBoXWdLULOaTBzO0XYFpzjkkxXt6ZmqePsCpFV5
 unddxMMqleYWJ+YrmTUAfYj++VQe9mdBTOT/e+hoOk+N/xP5ew1BWwIRK0pBSIDu/dFY
 kuU4ZK9k7RPm4NEcNTthSrvC1R0LXAz+1dTj4cJm7kZLmiLbp9QZfjmY1pzS2cSg4Av0
 W0CYXktV1Ci2J7lJVfaGKztFs1S8zXXUEgswHZOefNI+rnBdKgu6bHBUsyCcyWAm0yfj
 aQKfbrnVjAABDlwwoetNABZvNWJjwpIZNjkA+Tm7fhc8kelTAdOKmRiSTB9i8+P4hdMV
 4B2w==
X-Gm-Message-State: AOAM531hdgkjbuqTP6ENDwAR7RDH3qpkVaSnjfdt7+1KISn1TuXB3UI+
 7P0Btt/hRM2kTMzoAV2t0ZtCDQ==
X-Google-Smtp-Source: ABdhPJy6Sqv1j/iJw5OKJlk1YpGo8a7rR5tMCrPGPHdDbZN1v8lsia1xJxjoB2dBBhrMvG5DORINWA==
X-Received: by 2002:a0c:e444:: with SMTP id d4mr16710920qvm.51.1618324202633; 
 Tue, 13 Apr 2021 07:30:02 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-140-239.ec.res.rr.com.
 [65.184.140.239])
 by smtp.gmail.com with ESMTPSA id m3sm7144329qkn.65.2021.04.13.07.30.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 13 Apr 2021 07:30:02 -0700 (PDT)
Date: Tue, 13 Apr 2021 10:30:00 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210413143000.GO1310@bill-the-cat>
References: <20210330152813.1.I5743d7539eaa2c2c5a15114120d50ef8eece1431@changeid>
MIME-Version: 1.0
In-Reply-To: <20210330152813.1.I5743d7539eaa2c2c5a15114120d50ef8eece1431@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Etienne CARRIERE <etienne.carriere@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] scmi: translate the resource only when
 livetree is not activated
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
Content-Type: multipart/mixed; boundary="===============7951093080498808328=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7951093080498808328==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RpiVM3EVB2ZN34Ht"
Content-Disposition: inline


--RpiVM3EVB2ZN34Ht
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2021 at 03:29:03PM +0200, Patrick Delaunay wrote:

> Call the translation function on the ofnode_read_resource result only
> when the livetree is not activated.
>=20
> Today of_address_to_resource() calls ofnode_read_resource() for livetree
> support and fdt_get_resource() when livetree is not supported.
>=20
> The fdt_get_resource() doesn't do the address translation
> so when it is required when livetree is activated but this address
> translation is already done by ofnode_read_resource().
>=20
> Fixes: 240720e9052f ("firmware: scmi: mailbox/smt agent device")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--RpiVM3EVB2ZN34Ht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmB1qucACgkQFHw5/5Y0
tywsYAv+LDJwGr7oG2Ucr7/DcGZ1PGgLZHCXcR7jHZ6EbDv8nvDoielzhtb9wPVQ
zzHMTiGjoE7tbBaRDHpy2dnoR17Z3xuayLERiS9TgfZEU8QiO0rKIod0I0CKq8BU
xIwigmkw4Wg+7Dny1EEwqukQcX2X9M16gMqmw6R4dHtV17M+yN+sFyL6l5mMPcoN
KQ4CQAPqZMkUWDwlBIg1MS3xZO6+7WFgNpy7heMBTPGABJwJU5uWNaweOLDct9gc
mywZC8BmCmn9MQ6+eQc1P4AGWx8bLj/+CJmMu6FtZrWL/V+KhzCFUXZPqVSZnqzT
8slBvrSEa749Jcv7PGRWvafuuIEPH3gSXe8c/kAXYsSPuLdyfsZ5nBXsg9C6h7MB
xOsXdYElnWIocPR+h5pVm9A46AVJOaObj9CFejsrLDolQxXr++d7JK3LKAZRn3HH
g8Yoh8Ue+otc+aVv0QT4zNjlQPspvF2jrgpmcBrDulCER93p+bly/tz9NbeYKcpT
MuQDDjtL
=ojtL
-----END PGP SIGNATURE-----

--RpiVM3EVB2ZN34Ht--

--===============7951093080498808328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7951093080498808328==--
