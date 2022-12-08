Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F1264772D
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Dec 2022 21:24:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62298C65E63;
	Thu,  8 Dec 2022 20:24:17 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2D69C65E5D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Dec 2022 20:24:15 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 j5-20020a05600c410500b003cfa9c0ea76so1944245wmi.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Dec 2022 12:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+KS6TJFRDgMq5PbkAfKxYrRVGu5om7xMm9GjIlsYmOk=;
 b=eT6mREuSr1VAI8v+WjXEp9QmIoMp18UNtxB7xwbhnE1KLtpiEb3bm2dVnYcN/0ZR2O
 nwz+st9VMet3+V/GnuvNdZbQt6z+wdfHyLGu531aKREUM80MiJaWGMvpxjMI/G4eXYWz
 zj4netzGwMY4UlB4P4rTvYZEhfhmoaqbVr8Z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+KS6TJFRDgMq5PbkAfKxYrRVGu5om7xMm9GjIlsYmOk=;
 b=tW9O9Tw+uSWFc+qt+wLS+Lu+42/epELTXAEp445DcKNlyFf4zT/Pe8nwze9vS9iVNl
 XWDxYWmkV8fXu0CJ8OtobVQozxwlQpw0zRebQ2GPd4WfEZXC1zY/478464myiLpqo8M4
 ELAxsEBtnpnX8oyayTqfMspdFx/12ygy1hR1dt57bazzv4UaBuzmy6o7DNzPKnI36AT+
 CeLC86dm+ejbr6IVHVqKhEASN0rvYyYvjiKHu2NLt8bXSz9A6Oo8CcjcJ0bNHZU9vudZ
 GNxl0wxIE8bXE+Usspe374zkN5tCl64baqpc5neIRIy3jPrGh67X5Syw5eyOimtsAWAJ
 d0HQ==
X-Gm-Message-State: ANoB5pkn9fsdgz/WVFGkfFhDiYB3LAmicUtMrzCh4oOf8wahwYwpuveO
 55fXe1VcmZvNqWPn+adn5lfg4g==
X-Google-Smtp-Source: AA0mqf43xA/UhRvBz/Omwnpq5RRN4SL1nb/X+GOkFFONHxhdmDIhdV20VewuLF5XO3r6qVziOXvOJQ==
X-Received: by 2002:a1c:7303:0:b0:3cf:a258:971 with SMTP id
 d3-20020a1c7303000000b003cfa2580971mr3429137wmb.41.1670531055567; 
 Thu, 08 Dec 2022 12:24:15 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-0511-db36-5a97-af74.res6.spectrum.com.
 [2603:6081:7b00:6400:511:db36:5a97:af74])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c458d00b003b47e75b401sm6813660wmo.37.2022.12.08.12.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 12:24:15 -0800 (PST)
Date: Thu, 8 Dec 2022 15:24:10 -0500
From: Tom Rini <trini@konsulko.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Message-ID: <20221208202410.GN3787616@bill-the-cat>
References: <20221128084122.3456680-1-max.oss.09@gmail.com>
 <20221128084122.3456680-2-max.oss.09@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20221128084122.3456680-2-max.oss.09@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Du Huanpeng <dhu@hodcarrier.org>, AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Heiko Thiery <heiko.thiery@gmail.com>,
 Stefan Roese <sr@denx.de>, Adam Ford <aford173@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v5 1/1] u-boot-initial-env: rework make
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
Content-Type: multipart/mixed; boundary="===============0265125741499846262=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0265125741499846262==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AMjohP+sXfBv/Fra"
Content-Disposition: inline


--AMjohP+sXfBv/Fra
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2022 at 09:41:22AM +0100, Max Krummenacher wrote:

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
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/next, thanks!

--=20
Tom

--AMjohP+sXfBv/Fra
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmOSR+oACgkQFHw5/5Y0
tyyp/QwAhvWdC0uvom/1+sEyRok0GEIgoWn9bDCRnNnGnE1zH2XSYJT2M/kcYLOF
yFiOjVqYgT0nPzkQZjfceYlN8KadSBRXOlZKzbXcVBAsh83UAdvqy/tqWo+tJ+WB
dW5Wgrt5pvM0+l+exN1yx4jxMdBK9Yrbp4GtQvMFwrqsx6tzLwu3xuorBwHxkiQG
iJBd0TIMgYYjizuP597nO7J/Ia17nPV5CBk07xj/FnUge4NRLRdPt5h1Q1EJSHEE
3pRapRUZkOaVSO3jxZ9tv0vnIbvlz/jvKJv6CxolVZ6pLBCiPI/VCEsyiY97APV6
+8unLTW9k7AtxiQuZWO2HHh/gBdd9H+Y6ZOsIcJks1ZAsC9prrFr0hnhCFGb9+1f
iEVe35ircAaE5JNcvV+RRhNS8vQ5PnT3U6hEUBTmB76d8HIsHNy6XCwesMh6BYMG
D3sSW3tHyW77I1V6G0nt+lY2kjeZZ67jDP90MUWdoF0JRKeuK+6I3pP131845NiR
Ik+oUFZ8
=8bxy
-----END PGP SIGNATURE-----

--AMjohP+sXfBv/Fra--

--===============0265125741499846262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0265125741499846262==--
