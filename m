Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB03A52F983
	for <lists+uboot-stm32@lfdr.de>; Sat, 21 May 2022 09:19:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E246C03FDF;
	Sat, 21 May 2022 07:19:45 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 068C5C035BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 May 2022 07:19:43 +0000 (UTC)
Received: from [192.168.192.146] (port=38330 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1nsJOk-0003GX-F7; Sat, 21 May 2022 09:19:38 +0200
Date: Sat, 21 May 2022 09:19:37 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <YoiSiRnxydsHXNSR@nx64de-df6d00>
Mail-Followup-To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 u-boot@lists.denx.de,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Lukasz Majewski <lukma@denx.de>
References: <20220519155647.1433652-1-patrick.delaunay@foss.st.com>
 <20220519175614.v2.1.Ieec76f320c9cc6885d7b519dffddff9ad4c97b59@changeid>
MIME-Version: 1.0
In-Reply-To: <20220519175614.v2.1.Ieec76f320c9cc6885d7b519dffddff9ad4c97b59@changeid>
Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] clk: Add directory for STM32 clock
	drivers
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
Content-Type: multipart/mixed; boundary="===============4404405914144731095=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4404405914144731095==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WCn44sSbdq6fekPi"
Content-Disposition: inline


--WCn44sSbdq6fekPi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 19, 2022 at 05:56:45PM +0200, Patrick Delaunay wrote:
> Add a directory in drivers/clk to regroup the clock drivers for all
> STM32 Soc with CONFIG_ARCH_STM32 (MCUs with cortex M) or
> CONFIG_ARCH_STM32MP (MPUs with cortex A).

Some nits:
- s/Soc/SoCs/
- s/cortex /Cortex-/

Even if you will not include these two changes, feel free to add:
Reviewed-by: Grzegorz Szymaszek <gszymaszek@short.pl>

--WCn44sSbdq6fekPi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZT55kPBhnB69hD4ZeE9lGUIcpz4FAmKIkokACgkQeE9lGUIc
pz4U/A//S5PAZKs4Kr6o2hqRCzz5jNlKbLmVVw4sXL8B5WzpOcIJlNh82TsBlIJE
+sUn4kQE/dGGVWrdqNdYOGCcYqXIgLWT1kjy6GZ7kmW/8P9QX1Jxg6zWsYUkvnjn
ohdlxwkO1apuRdMb7pNMZQ+4RSqpEv0dZ0qr8sC6iSKQjNb4YQnuwxuGDVa7Yqqf
qj1tNLKFDE2g0X4msb41bjI5XKRuCqhR4Bg15RqWbjIzg8KOjpffTHR/Uw8XMfoc
9tEKvlAz167ryNWQeLIJSEoeWg0Bs2CuLBkRV3fpHsUoe1saGXDCMPOW/04DrnCh
Jr19i+Wq/x/4kC5tkqlnHb8FXhyBwqIo94kmMfOaxtXDABCy8y4Iwy28KkSKDsYO
I/n7C88ciZxaSDXSOTFbygwxEUFCV2V1Jsvn3Q3IoAv1ZGXffi+dd94dRrkeGhq+
wCkiOD09krUea7CV/Tg4Y9KRSbPz0hpcv+YL5DeAqdIdvzWWr55xEfbYknT64oeM
EZTlS3QnXlUt4S6eSkR9EZE29hB34fQP8XNFd5oeTIfQ75Qsds1UCCd8nJ77ACmg
sQFN2JySGLkZYVFqZqsIww3Dj5uQ7tM0wtY4RSAhU3iUQvt8NeiagCCS/2p0YZEP
4MniR1Qbwz/q2D/kV4J1VjD4bh9zM1I9WSBK0y/Z89lmhBTldIo=
=/s94
-----END PGP SIGNATURE-----

--WCn44sSbdq6fekPi--

--===============4404405914144731095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4404405914144731095==--
