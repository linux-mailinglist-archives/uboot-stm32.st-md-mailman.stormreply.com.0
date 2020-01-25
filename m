Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0031496CF
	for <lists+uboot-stm32@lfdr.de>; Sat, 25 Jan 2020 18:10:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B2AAC36B0A
	for <lists+uboot-stm32@lfdr.de>; Sat, 25 Jan 2020 17:10:45 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEA9DC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jan 2020 17:10:43 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id w15so3709918qkf.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jan 2020 09:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=b7H3+zn0rTAWGdYBgHNeF83mlKlXrIjT0LHcEEnR6tI=;
 b=Uq7GyqbB3aameF3YXapyOm2mB1bV+/FUm6w4fZespyNAbC9UjIhA2mJFhvSLzPB0P1
 kJ+kUXQmlZHuWq9ukNW2fDdmqcQ719E2wL0jlHwmCsd8xQpc1xsLyY+dqCRYBt9yQJoC
 RhtIuYHMJG5ED27yXt5TA6AtP36TsuNHXvBvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b7H3+zn0rTAWGdYBgHNeF83mlKlXrIjT0LHcEEnR6tI=;
 b=jYrKra4RX+upkmWH69aHCpPnN/+jC28d7kfoxGaYr/aJhiKkY/AasOYQd+hh5eUTAM
 cFsyBCzANt5kXeRXqhOy5pNSDHycnZ7rAHEo7VQb5si66u5NUEDdoW9MTUjSjP1/oDnK
 z77zIXZVTgXALJnW20WN43QEQtpaK5L+QhwRghgm6K4xuZlbAN9omdpAS2q1V8xZbnrt
 85dJpSdAB1CY3rN79U1pipfdH7AxuXdQdQgT+HGxah5IeUCOGrptFdbiM/QzQPh1Tg3R
 TXQZBCiv5Gm+TB4VqaFp7X9zlT5I8Z4m8AcBRzyV1P6LBS9AClUvnYOXPxnLhaHMCSY1
 7Kkw==
X-Gm-Message-State: APjAAAVqqZIO9i/U14eBxo7ZHXlUf9/8tFQmPJGmy56qME7OntCU0+yr
 TW7dykqCPq3mIX8xYhzXflh1UA==
X-Google-Smtp-Source: APXvYqwCIt9oiW7eQzladO4lvw7SHnYv2Dt9fN/o4TjcXHUaOLbW0H5o3nsBdqDOqz0pzBJ+8U8FCg==
X-Received: by 2002:a37:5fc2:: with SMTP id t185mr8553523qkb.271.1579972242698; 
 Sat, 25 Jan 2020 09:10:42 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-3dc3-97ee-c77e-aac0.inf6.spectrum.com.
 [2606:a000:1401:86dd:3dc3:97ee:c77e:aac0])
 by smtp.gmail.com with ESMTPSA id a36sm5918098qtk.29.2020.01.25.09.10.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 25 Jan 2020 09:10:41 -0800 (PST)
Date: Sat, 25 Jan 2020 12:10:40 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200125171040.GV26536@bill-the-cat>
References: <20200124124556.2563-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200124124556.2563-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH] mtd: add prototypes for weak function
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
Content-Type: multipart/mixed; boundary="===============4298471985570681419=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4298471985570681419==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EzyTiZo8w1pFn3ee"
Content-Disposition: inline


--EzyTiZo8w1pFn3ee
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2020 at 01:45:56PM +0100, Patrick Delaunay wrote:

> This patch adds a prototype for the weak function
> board_mtdparts_default().
>=20
> It solves one warning when compiling with W=3D1 on stm32mp1 board:
>=20
> board/st/stm32mp1/stm32mp1.c:
>      warning: no previous prototype for 'board_mtdparts_default'
>               [-Wmissing-prototypes]
>      void board_mtdparts_default(const char **mtdids,
>                                  const char **mtdparts)
>           ^~~~~~~~~~~~~~~~~~~~~~
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--EzyTiZo8w1pFn3ee
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4sdo8ACgkQh/n2NdMd
dlJVcg/+M8efD13FYRgjx3lSEAKSB+/h4OVUe3O4Ky+ugev0ERn97hfcxDPqncwN
wQY/A/WpB8Y86mOukPkQQZmacxq5kFgZLckh8LSWqPyr1QVp5CWw38oVt4pflvMf
0Nk0/LWbkbFu0+gakGx1ERgcHlOGYrdrzlUMzvaytOl/jB6Z2ga/xdb/geqXQjBu
Dv630rpuIZq7d2sCOhVgcAqJT/H5jhKPKY0TBJGTR3/igwYwEO0GflgHpDLIEApC
vWgVMds3JYz9bsWp6OeywvmJMeqoj/cvSHKkg042eV7dYbES3F4mYrishhvppSYs
B+Mhl6it9+1i7l09zli1iy+x3afQ7fLTcGptlFfA3fBalvK70RQpFpFVKcOaLpOp
NrxOiC3ZUt/PbgiGxFBWAPCvc+jcC2FKkIAtoxAz/eQTL0wiC/HWwBGZbE5OtpME
hxw8omvrsyugZiELzjNJDnbBhtrtzdc5KkEBSb7kvkqgSoE9OhGTjDyw8qE+Pdc7
YqU0LYrxRRU42uvs66dV20q38VsHfYHzO1n3k1y2QtDCD3EJYrx+Dr3tSezgIqxL
tpEkGPnF7dF01kGfqemq5hyY6AuKrQE0hF4gKN7BtiGVm7eEkwu+jAaOjP2Eto2n
gqKU9LNKFNy49Zt3II2sehKlfwVtEEjjJhiEjZAMq01BZRHjuZg=
=pDiA
-----END PGP SIGNATURE-----

--EzyTiZo8w1pFn3ee--

--===============4298471985570681419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4298471985570681419==--
