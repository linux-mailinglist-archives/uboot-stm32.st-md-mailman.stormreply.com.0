Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7E4636884
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Nov 2022 19:18:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF817C6507B;
	Wed, 23 Nov 2022 18:18:45 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F709C03FC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 18:18:44 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id jr19so11771120qtb.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 10:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=e748G7H11hccEpF0VMPXfjWfOiuJvFWAnpBs2/Wu2Os=;
 b=XXKGFgVxn92QjcILTzhqnS6jwoJqFkccruUGR2L9H5j4pgzntvPMxojj/uLBFWgXo/
 vjc7MzcK2JKB7FGgyIjsjzpJgLxivMUxE4bEVFVvdaP0adnp3IEJ8temqTG8HodrGVFZ
 wq59cZQoZQruY9QGxqppN/GzRuH29L/OIXlZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e748G7H11hccEpF0VMPXfjWfOiuJvFWAnpBs2/Wu2Os=;
 b=2Goki9jjyNgOa5a0DVzjQUDYWO34jDV/tVWid0Pf108tNg7mUznD/QBbPdRtDuoNiY
 4xA7/8sryL3lqhmhDfnOswbh2WFt5+SX/9cpj60dwUvk05Z5xxJGV+ViyFdwAdulRSjH
 QdOMFl0xaMH+0LTET+UzZUTE+nUNiuJgCHE8ZoxKL36LgxV+OTixVllBEQ1gKSgQRsXc
 yu2fT43qyHkXfE0M8LRKi709DeHUIhDRLqs+G6+BcddNXR6p2xUPQ3KASNAJBHdPNdc/
 A+MfwZCZ5x880aCZ0J8wXXMGiFR6JBrVcYHvVqhwfyWc/wJ6VT6qlOjQuoZdGcsIHqDk
 1TXw==
X-Gm-Message-State: ANoB5pmcENkDCSgy+4cGS+1MZQSXXIDrAMXL9oj3loLKxyup9Szb4YF+
 XFSYYxvQ+ODj35L5eHl3ZJhodg==
X-Google-Smtp-Source: AA0mqf5yZsX1Pgi2wysQfIaK2B2qIUngR3bgylX5di+eKjKAFBwyQDiWhZ6OBgfpeFs0vL6LdBTzQg==
X-Received: by 2002:ac8:1098:0:b0:399:fb3a:4d0e with SMTP id
 a24-20020ac81098000000b00399fb3a4d0emr27156331qtj.256.1669227523508; 
 Wed, 23 Nov 2022 10:18:43 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-b4e9-18be-6c79-e0de.res6.spectrum.com.
 [2603:6081:7b00:6400:b4e9:18be:6c79:e0de])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a05620a404a00b006bb8b5b79efsm12899518qko.129.2022.11.23.10.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 10:18:43 -0800 (PST)
Date: Wed, 23 Nov 2022 13:18:40 -0500
From: Tom Rini <trini@konsulko.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Message-ID: <20221123181840.GA1482451@bill-the-cat>
References: <20221108085222.1378781-1-max.oss.09@gmail.com>
 <20221108085222.1378781-2-max.oss.09@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20221108085222.1378781-2-max.oss.09@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Du Huanpeng <dhu@hodcarrier.org>, AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Adam Ford <aford173@gmail.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Heiko Thiery <heiko.thiery@gmail.com>,
 Stefan Roese <sr@denx.de>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v4 1/1] u-boot-initial-env: rework make
	target
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
Content-Type: multipart/mixed; boundary="===============0143527752953434326=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0143527752953434326==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2022 at 09:52:22AM +0100, Max Krummenacher wrote:

> From: Max Krummenacher <max.krummenacher@toradex.com>
>=20
> With LTO enabled the U-Boot initial environment is no longer stored
> in an easy accessible section in env/common.o. I.e. the section name
> changes from build to build, its content maybe compressed and it is
> annotated with additional data.
>=20
> Drop trying to read the initial env with elf tools from the compiler
> specific object file in favour of adding and using a host tool with
> the only functionality of printing the initial env to stdout.
>=20
> See also:
> https://lore.kernel.org/all/927b122e-1f62-e790-f5ca-30bae4332c77@foss.st.=
com/
>=20
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> Acked-by: Pali Roh=E1r <pali@kernel.org>

Alright, so 'make tools-only_defconfig tools-only' now fails to build
because we're missing the dependencies to make sure that we have
generated/environment.h available.
https://source.denx.de/u-boot/u-boot/-/jobs/532186

--=20
Tom

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmN+Y/0ACgkQFHw5/5Y0
tyydSAv/WLs2G8/+3uQGuLRi73lZ+4l82V+R5l6qhYuLE+KbowMuGi4y342kCO36
xF5QTYF13y6GrVhKwjIZV5Ci4ngxl6YJqi5ofo3jOfrTK9A5hCdaYm+iviq2xqW6
usXMwdmDvspvhVHzi70raDdHKubdJZXlrc0Q62bAxiFQILY1SDzIcug9dUijXGlh
t4pKH8JETvGAOB9BP5vfVspV3Oe2YQ3jFhtK61dH7jX26G5Oeb+14XaHYQ8GPYBS
HIPy53uoqA/np53R+1eQlgN+IauIDFRL+5tiEOLBznD91MVcpfqgCDShammxZLqo
2WfQGA1OFZLb7doGhFCj6NPpVsOkOOaza22umUEc77RahlPUBVaspmnh4OU37PhY
rdJAxAslPdpqhGGWxN1vGSh1Rdc3aMNKcj/xCaZbBi+vykqaLBLiIod2l6tcPMTQ
Yg0R34Z4fe+Wee5drwHduK6q8bqG/A/yCha/k98qdgIoGoB2itSs20t4zhhnfvE9
n1uwNJVc
=wD8I
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--

--===============0143527752953434326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0143527752953434326==--
