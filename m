Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3746864B654
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Dec 2022 14:34:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBDB0C65E61;
	Tue, 13 Dec 2022 13:34:38 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26A4AC035BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Dec 2022 13:34:38 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id i186so17579685ybc.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Dec 2022 05:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=padhGasapXYmTye5R9/PEsVq9+dDkk39tjbTt5UebNM=;
 b=lt9AWe+riydmCyBYc7BSr4ldux/tcuyrw0twdV3EshBzCDaALGXIMJn0cHCa4htLLS
 Lk13wT0Gz6tV1qEtoM5lL1SuXbOqP8y5czi7SWTOJ4wsWYkYcuMgaH20JucUg5WyD8xT
 lgeWf4RQRJyaTYOoZN/2SuBOFaOnjvO21sKCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=padhGasapXYmTye5R9/PEsVq9+dDkk39tjbTt5UebNM=;
 b=OQGrN6F58tCKxtkQ5CImEeor7D7jTzOuv6M9EcvqW0fY2h8ae/TQIhDIggdmPOo0LB
 i++PbsqNM/z1ipNHKpj2tK9sMCFhhSC0mOFnmzncfWBNbl+Pngw11Qdqb4j7yrIlmdn0
 xx8k1AzlO2SlMvWNOZ5TKv3vElR7B1ocChB6z4Kl0iYq85cJc0hkhQgWMQ3qDaoyRITr
 GUn0Ca96yMaB2QoY37td9a+njJD9nl21ZOh51ghpbnPr5U0Qrl68AstS/DT3aNdwqjkv
 +9F10utxH2UIzTJ+ZzrqQd+QXx+/H8YZezzcRl4PgD5flvvOW+cvArnE2wChuttje+mS
 QxuA==
X-Gm-Message-State: ANoB5pmotYRXGTCV91o5eihh+IW7Uw/ZRqqQio4Kk1My9PlsSvLLTOHQ
 j9gnmkzlolwb0P5BeP0B2dy9ig==
X-Google-Smtp-Source: AA0mqf7q3dXU4Pe2Wk2NJEbuSftqfFTgG30sDMMI+Kj5LIILwwcR0bOUPSV9o2F8S/Kk5hCDZYT5mg==
X-Received: by 2002:a25:ef0f:0:b0:70c:2540:69dc with SMTP id
 g15-20020a25ef0f000000b0070c254069dcmr15119518ybd.38.1670938476980; 
 Tue, 13 Dec 2022 05:34:36 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-09de-b540-f7da-b28e.res6.spectrum.com.
 [2603:6081:7b00:6400:9de:b540:f7da:b28e])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a05620a454700b006fb112f512csm8137164qkp.74.2022.12.13.05.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 05:34:36 -0800 (PST)
Date: Tue, 13 Dec 2022 08:34:34 -0500
From: Tom Rini <trini@konsulko.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Message-ID: <20221213133434.GT3787616@bill-the-cat>
References: <20221028090120.1536827-1-patrick.delaunay@foss.st.com>
 <20221028110055.3.I4bb4d81ec61fcc6340db1f81d5504905a22e90af@changeid>
 <20221212213458.GG3787616@bill-the-cat>
 <128fd7ee-057f-469b-adc8-35ba9e6f62f3@theobroma-systems.com>
MIME-Version: 1.0
In-Reply-To: <128fd7ee-057f-469b-adc8-35ba9e6f62f3@theobroma-systems.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Peter Hoyes <Peter.Hoyes@arm.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Artem Lapkin <email2tema@gmail.com>, Zhaofeng Li <hello@zhaofeng.li>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 3/3] cmd: pxe: use strdup to copy config
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
Content-Type: multipart/mixed; boundary="===============8418366044421842492=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8418366044421842492==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AqcvRYF2yp+N3891"
Content-Disposition: inline


--AqcvRYF2yp+N3891
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2022 at 10:03:17AM +0100, Quentin Schulz wrote:
> Hi Tom,
>=20
> On 12/12/22 22:34, Tom Rini wrote:
> > On Fri, Oct 28, 2022 at 11:01:20AM +0200, Patrick Delaunay wrote:
> >=20
> > > Replace malloc and strcpy by strdup in
> > > function parse_label_kernel.
> > >=20
> > > Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> > > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> >=20
> > Applied to u-boot/next, thanks!
> >=20
>=20
> I believe this was a mistake?
>=20
> This introduces a pretty bad regression as existing extlinux.conf won't b=
oot
> anymore. Distros will need to have different extlinux depending on which
> U-Boot version is running on the system.
>=20
> Was the merge done with this information in mind?

No, I was unware of that, sigh. I'll go push through a revert to next
shortly..

--=20
Tom

--AqcvRYF2yp+N3891
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmOYf2AACgkQFHw5/5Y0
tyyuZAv/diCrc9dsXT8qAjYjqbj6M3+uJNFtBISaT/EE+F4ttZqbkPfKyvwNGEiM
Q5xar3eGMAUMm61Yx5PJMkXIqyfaoZnsyqNo7w0LOgq8wO8qC6HeDl/DyFNYimfS
lelioN9thLeArFvT0r1JRkWEa/pKV3Et+OUV/OgG/T01QJ1kja1N6zDL0F6nzrUk
MNeysKJS7Q//1bJhK/DuCE7cJrXZ4OvuQQVa3HraiCHQP7Qy/fuLiKmdjb7Hd7RG
UeKdZm6kVyjVPjFHHolkddPhHPiKrgpwrv7YwrTegdtwa3fvQKrUQexesxJnOIpu
QYnEe0n1yiAhONlWDCBnIMidshCYBX/u7h4ZDZbNjRMOSpDXaHR+hNkH+GEVcIl7
cwEGt6g2pq1x3v/KV8HjSyGWTcXGO1A8FjJZWnyMdFJOM+RXSA8XUnHIIdPBDn8h
TytQX4Cg/r5z7TTZlroEeWyF6w8UVnIzMAmyec/roChjv/Hi/n7pbnIyKbMKggEE
zoZpxQIf
=pgY2
-----END PGP SIGNATURE-----

--AqcvRYF2yp+N3891--

--===============8418366044421842492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8418366044421842492==--
