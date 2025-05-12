Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF66AB318C
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 May 2025 10:25:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F68BC78F91;
	Mon, 12 May 2025 08:25:48 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E61B9CFAC45
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 08:25:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7B7E5101EC11B; 
 Mon, 12 May 2025 10:25:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1747038345; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=G5n6PxLhRqxatyVq87CLsL2Bq785cCb9S9ldu8NGSPM=;
 b=Ie/K6FbF0z7lEYVDxi8UM4k5pdLVj27C1IeNnWGU7I0Vacirx3d0QMXUK5rv7k/PxWaM6M
 asA2/eQ45uh6sV8A5hA6qMq2aKVykliD8HeCwQwXNohHXo192IZasU0UmrSEr6tT4UfLSS
 tfxxKKI3AiXyuiUY/iKKbTHPzB12pz3oCSiEJ7QbQ3FDp+Bch20XHqVNwOom/uia80+T7Q
 kc+44too/TtQjVhqo60m5cCkh7CXrzEOoOiSznRoMzRGUthuhgS0q15cJK3AeMBq3Cphf3
 lEQHDlxEktLwrbMKf6y03n/QA7lAMNfAJ33XexRxy1pOYgaI7NCcSI0PBkr4ZQ==
Date: Mon, 12 May 2025 10:25:42 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Marek Vasut <marex@denx.de>
Message-ID: <20250512102542.5ff9f240@wsk>
In-Reply-To: <831cd958-018d-4f39-91ed-5a9c44853bc2@denx.de>
References: <20250510065256.267546-1-lukma@denx.de>
 <831cd958-018d-4f39-91ed-5a9c44853bc2@denx.de>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32mp: Correct sign extension for
 memory address in dram_bank_mmu_setup()
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
Content-Type: multipart/mixed; boundary="===============6587909931994499498=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============6587909931994499498==
Content-Type: multipart/signed; boundary="Sig_/WuTL9JMq5GSaWquHQ7Hykyn";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/WuTL9JMq5GSaWquHQ7Hykyn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Marek,

> On 5/10/25 8:52 AM, Lukasz Majewski wrote:
> > On a system based on stm32mp157c, with 1GiB SDRAM (starting from
> > 0xC0000000) and CONFIG_PHYS_64BIT enabled =20
>=20
> STM32MP15xx does not have 64bit PA range , why is CONFIG_PHYS_64BIT=20
> enabled ?

I've wrongly looked on defconfigs - Patrice has enabled
CONFIG_SYS_64BIT_LBA=3Dy, not PA 64 bit range...

It looks like I've prepared a fix for a problem, which I've created ...

Sorry for the fuzz - please drop this patch :-/

And of course thanks for pointing this out...

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/WuTL9JMq5GSaWquHQ7Hykyn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmghsIYACgkQAR8vZIA0
zr260gf+Jhw30Ilf4pnZId85yB34MvynLFsblaI+Fi6vWaUGtCvr11R7hnf4VIHP
AZIE3b6AAVyZYG4jTuouubo+hCvnOorWf/hpVOuLQjkbJ+Lv+J2dekJuZ3MG4Sug
H+ofKivOrlRd+zJmPbrywInWfg9jwRz0ipAsY5wh/QeN/syKS3iV5dfJY+Ky6aj9
2Xk+oLOBsySQUaA52JMqppPg0rHgVJPa5bdv6HC8oCGX8gZiJ02U2Dw8St4JoKxU
fYHpaz4Y/zbrKPMC4Qzl+Q4ne5rWlw3/5g658VB8p/xHehtAmI1Di3Q+L9BFLhOc
Atm7KJ7o3sAxFVw5WTKuxCW5o3XaeA==
=5zve
-----END PGP SIGNATURE-----

--Sig_/WuTL9JMq5GSaWquHQ7Hykyn--

--===============6587909931994499498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6587909931994499498==--
