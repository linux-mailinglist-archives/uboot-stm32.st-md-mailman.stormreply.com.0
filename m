Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AFF787062
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Aug 2023 15:38:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFE17C6B44C;
	Thu, 24 Aug 2023 13:38:21 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DBFFC6B442
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 13:38:20 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-59288c68eb8so4049067b3.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 06:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1692884299; x=1693489099;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Yrbh4XXrEwvm465dl46OB0euZP8IGrBy6pB070Hyhhw=;
 b=QppgnsAQDVfOXZ3fZO4UexPsVpD3OEcex9qdF8dkpWHtuxOVRb1vC9crmfLuDr99b5
 yTMlT+ZDUnwjF6mrCh7sJfQv2EzG6duHLLCobB81MIwEdkrlcQYye9Z7ivDMab5ovtow
 2VJX+N6Iau9NqYRsQbo7A2wNRREPVgqpCJWJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692884299; x=1693489099;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yrbh4XXrEwvm465dl46OB0euZP8IGrBy6pB070Hyhhw=;
 b=A2RCVz7bhxgqIwhVUNFzKmX+8U8lW3xUxeM/Jlyi6FOyY1Buqw6Z6yJFRw50Y/sTJq
 rnr7PJY/5OJASVyiXGFxCf/D9h8zQwvh/u7KkIsTl/iYoF7K3Ufix/hvsdpQnYWLG1fC
 jDftY+SaGXVCTk3qF/VGaCGryMPfuQJyluy7wGHqDdL1/OLxyvkRt9VQrZ6evDZ57ZQO
 v9FlQSBs8dJ9FU9Qe04Z6sZlHYlLBKd5nRpQTwvnOMl9C9HVHLuR0qj4hTtIaHNas/9v
 4Xdp/hOpTI+ewhsf3zt+UnEGkkmKlmeRhTDy9zzGOAZW987W9ekq/UPt0/CL8nyQhQ0L
 wBvw==
X-Gm-Message-State: AOJu0YwW7/heWslcF3pI60kiNu5stU3Dvbw5dBBfe3BVyglfcC3jpazt
 lWe7Tp/q+u0oaRJzsLNgAlhowg==
X-Google-Smtp-Source: AGHT+IGaVRguzVl0o/i5IdiqHb0ohDah7AlRmoKqTtU2/duNjLiyBlNS76QacmNuGSciSXCPg7gykg==
X-Received: by 2002:a81:bb4f:0:b0:592:ffc:c787 with SMTP id
 a15-20020a81bb4f000000b005920ffcc787mr12756376ywl.30.1692884298437; 
 Thu, 24 Aug 2023 06:38:18 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-37ed-1199-bcc5-406f.res6.spectrum.com.
 [2603:6081:7b00:6400:37ed:1199:bcc5:406f])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a0dff04000000b0058bcea54fc2sm3921080ywf.57.2023.08.24.06.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 06:38:17 -0700 (PDT)
Date: Thu, 24 Aug 2023 09:38:14 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20230824133814.GH3953269@bill-the-cat>
References: <20230824030304.1555547-1-sjg@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20230824030304.1555547-1-sjg@chromium.org>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Jonas Karlman <jonas@kwiboo.se>, Neha Malcom Francis <n-francis@ti.com>,
 Vikas Manocha <vikas.manocha@st.com>, Michael Walle <michael@walle.cc>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@dh-electronics.com,
 uboot-stm32@st-md-mailman.stormreply.com, Ivan Mikhaylov <fr0st61te@gmail.com>,
 Dillon Min <dillon.minfei@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 0/6] Attempt to enforce standard
 extensions for build output
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
Content-Type: multipart/mixed; boundary="===============5872209328133813339=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5872209328133813339==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yEtdhzA18XLNGmL+"
Content-Disposition: inline


--yEtdhzA18XLNGmL+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 09:02:53PM -0600, Simon Glass wrote:

> In this early stage of using binman to produce output files, we are mostly
> seeing people using common extensions such as '.bin' and '.rom'
>=20
> But unusual extensions appear in some places.
>=20
> We would like 'buildman -k' to keep the build outputs, but this is hard if
> there is no consistency as to the extension used.
>=20
> This series adjusts binman to enforce just 4 extensions for output images:
>=20
>    .bin
>    .rom
>    .itb
>    .img
>=20
> Other extensions will produce an error. With this rule observed, buildman
> can keep the required files.
>=20
> Some patches are included to fix up some easy problems. But the following
> boards generate 'custMpk.pem' and it is not clear how to fix this, so I am
> asking for help from the maintainers:
>=20
>    am62ax_evm_r5 am62x_evm_r5 am64x_evm_r5 am65x_evm_r5
>    am65x_evm_r5_usbdfu am65x_evm_r5_usbmsc am65x_hs_evm_r5
>    j7200_evm_r5 j721e_evm_r5 j721s2_evm_r5 verdin-am62_r5
>    am62ax_evm_a53 am62x_evm_a53 am64x_evm_a53 am65x_evm_a53
>    am65x_hs_evm_a53 j7200_evm_a72 j721e_evm_a72 j721s2_evm_a72
>    verdin-am62_a53
>=20
> It looks like the .pem files are listed as top-level images, e.g.:
>=20
>    &custmpk_pem {
>       filename =3D "../../ti/keys/custMpk.pem";
>    };
>=20
> but if the only objective is to pick up an existing file, it is better to
> set BINMAN_INDIRS to include that directory. Also we should only have
> simple leafnames in the 'filename' property, so the '../../ti/keys' is not
> correct. It makes it harder for people to get the files from other places.
> Making this easier is one of binman's goals.
>=20
> Most likely the custmpk_pem node can be removed and the .pem file can be
> included directly in the place that needs it, e.g. by adjusting the
> ti-secure-rom etype (or ex509_cert) to use tools.get_input_filename() when
> reading the key file.
>=20
> For example, this:
>=20
>    custMpk {
>       filename =3D "custMpk.pem";
>       custmpk_pem: blob-ext {
>          filename =3D "../keys/custMpk.pem";
>       };
>    };
>=20
> is really just copying a file from '../keys/custMpk.pem' to 'custMpk.pem'
> so is equivalent to:
>=20
>    custMpk {
>       type =3D "blob";
>       filename =3D "custMpk.pem";
>    }
>=20
> (note that blob-ext implies that the blob may be missing, so blob is a
> better choice, since the key cannot be missing)
>=20
> The fact that the .pem files are at the top level means that they are
> output images, which surely is not intended. They should be buried in the
> image description, at a lower level, as part of something else.
>=20
> So please take a loke at the above and see if the binman descriptions can
> be reworked slightly to follow these new rules.
>=20
>=20
> Simon Glass (6):
>   binman: Require image filenames to have certain extensions
>   buildman: Keep all permitted output files
>   buildman: Show progress when regenerating the board.cfg file
>   buildman: Start the clock when the build starts
>   kontron_sl28: Use u-boot-update.bin instead of u-boot.update
>   stm32mp15: Use u-boot-spl-stm32.bin instead of u-boot-spl.stm32
>=20
>  .../dts/fsl-ls1028a-kontron-sl28-u-boot.dtsi   |  2 +-
>  arch/arm/dts/stm32mp15-u-boot.dtsi             |  2 +-
>  doc/board/kontron/sl28.rst                     |  4 ++--
>  doc/board/st/stm32mp1.rst                      | 18 +++++++++---------
>  include/configs/stm32mp15_dh_dhsom.h           |  2 +-
>  tools/binman/binman.rst                        |  5 +++++
>  tools/binman/etype/section.py                  |  3 +--
>  tools/binman/ftest.py                          | 12 ++++++++++--
>  tools/binman/image.py                          |  9 +++++++++
>  tools/binman/test/022_image_name.dts           |  4 ++--
>  tools/binman/test/311_bad_image_name.dts       | 17 +++++++++++++++++
>  tools/buildman/boards.py                       | 15 ++++++++++++---
>  tools/buildman/builder.py                      |  3 ++-
>  tools/buildman/builderthread.py                | 11 +++++++----
>  tools/buildman/control.py                      |  3 ++-
>  15 files changed, 81 insertions(+), 29 deletions(-)
>  create mode 100644 tools/binman/test/311_bad_image_name.dts

This doesn't seem to address the ones I pointed out on IRC as being the
first order (to me anyhow) problem of needing the _unsigned files on the
platforms you list above for PEM files.

--=20
Tom

--yEtdhzA18XLNGmL+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmTnXTwACgkQFHw5/5Y0
tywOqwwAkiZdUIeTqfAT5L/JNdpmaVD3Awn2B5la6lJzgGWrOBrQCZ7M9jNpvYUM
4CX8uMvlJxjLHQreACM5e6nu09+ZeBPoIpLZZdvD+vUMnp3HFT45/Cw/7sTkOkmL
lFN2mf5dqzyBSfYQCSlqC2NBTxQKYenKNpFPn+FlWzyTkVX9qAvhThPQfWN8qu/T
Z8IsRJJhSGr41J1insHZAs99HSUA4ljCMD6u7DSd4ra/jo9eoluJwEZT6lHts+3j
nk1C3fJmHoQAMSiwe6FlqcLrHgefG2M0wX1zk4CH5RBEHiNcU5MnyFmVfyAxi8xC
hEwvWZ02PVZs7N5YQRhjBbNCKRrwHRfDOiTetwT/w70VBCLSBm70USRVNrvHzLxu
ySJk8X/aQyb+6+D4w233j2qqjr6Q5OBW6kVYqb+Jh+pXMpXobYUJNq0NlL7iYDtw
cWQFSqA2cOWJCyc5Vun0snlTKngHffIxsXNEQCDgvrGm5LIDunbgYy/+XjUBebJy
43ra1Xha
=fXoK
-----END PGP SIGNATURE-----

--yEtdhzA18XLNGmL+--

--===============5872209328133813339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5872209328133813339==--
