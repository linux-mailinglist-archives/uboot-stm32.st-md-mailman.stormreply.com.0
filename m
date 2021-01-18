Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 648422FA0A6
	for <lists+uboot-stm32@lfdr.de>; Mon, 18 Jan 2021 14:03:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27A43C3089F;
	Mon, 18 Jan 2021 13:03:02 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD509C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jan 2021 13:02:59 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id j18so7416124qvu.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Jan 2021 05:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UK4BEsk4xwgV52HAVE/3eOvIJ8KOfdO6qEVVqlQS6Hc=;
 b=iKq9fRIeSEnA6f3xNEYKvzYuFoNKdt3ynQMd3rHKDyMsmYmJoeZaBak47yvbYBPXtb
 y40cVnZlkNszxACF1AJHheqLin8i+uL4gSfJ2oPL1t+p54jr6KnJ83kHegbJrac/UV6W
 +a+eMOWxlbzW5uE4Kojhai5n3aGjiRt5dH0t8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UK4BEsk4xwgV52HAVE/3eOvIJ8KOfdO6qEVVqlQS6Hc=;
 b=TNsA4exY4tOvlVjW3SU8ZCfPGX5yyLmyIesdtjE07dpVJTD9l+9/LCT26jsoaTYvVi
 clevRJcgWaGvvjUBcFP7qbvx7dcZs+ifJYGn935WHaFKTCWYv4C616USbocdYeZY2NpZ
 aQjNHnXprzwGCenCqQEZlisU5SWY5Gpd5kXPZ+0htcAF8wFunyVVEjJxPXZfYvfxjwXs
 aN2DHYXmBlvvbcn50nIW8r1Vnb9nPepklBnpdqRSTbq2TsVn4nDmMI90Q3j88vju7dGp
 R0wUqVVMNCuTrd7bSMApJIYRLQ+4BPu+/H8EFUgVTnYhQxW+t4smVYqNSDKes4wTash7
 hdug==
X-Gm-Message-State: AOAM531T2slOnUVRae73m/wEbNiZC3j0T82cGABY2eQRc94y5OrGAIaH
 HXJzOFbe3ewnijVzQ2McuYA28g==
X-Google-Smtp-Source: ABdhPJz2GOd8/cnexkkRtFkS0dCSAkUmfjLGNwWViaolP2SxTA9Khi3/3HBStW58EmH/wA6UAt2iKA==
X-Received: by 2002:a0c:e5d1:: with SMTP id u17mr23940145qvm.34.1610974978310; 
 Mon, 18 Jan 2021 05:02:58 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b42-3f4c-71d2-022a-d5fa-e283.res6.spectrum.com.
 [2603:6081:7b42:3f4c:71d2:22a:d5fa:e283])
 by smtp.gmail.com with ESMTPSA id c14sm10104120qtp.4.2021.01.18.05.02.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Jan 2021 05:02:57 -0800 (PST)
Date: Mon, 18 Jan 2021 08:02:55 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210118130255.GK9782@bill-the-cat>
References: <20210104153315.1.I3168dfa428bf48b85ecca07ef26eed5d2c0a494d@changeid>
MIME-Version: 1.0
In-Reply-To: <20210104153315.1.I3168dfa428bf48b85ecca07ef26eed5d2c0a494d@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Stefan Roese <sr@denx.de>, Andrii Anisov <andrii_anisov@epam.com>,
 Reuben Dowle <reubendowle0@gmail.com>,
 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Michael Walle <michael@walle.cc>,
 Joao Marcos Costa <joaomarcos.costa@bootlin.com>, u-boot@lists.denx.de,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Keerthy <j-keerthy@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Uboot-stm32] [PATCH] lib: cosmetic update of CONFIG_LIB_ELF
	description
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
Content-Type: multipart/mixed; boundary="===============7211796828584432234=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7211796828584432234==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xpdswJpw+Ehe2/nQ"
Content-Disposition: inline


--xpdswJpw+Ehe2/nQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 04, 2021 at 03:33:28PM +0100, Patrick Delaunay wrote:

> Change 2 typo error in CONFIG_LIB_ELF description:
> - Supoort =3D> Support
> - fir =3D> for
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--xpdswJpw+Ehe2/nQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmAFhv8ACgkQFHw5/5Y0
tywCjQv/ZlAur2gMVBK2gKTCXgkx47+BHiOlh9j6Bce5HtdtvPDLeLP8qNXOS5f0
Pv7A6f0OZiBM0CPWxbBL3cf/wnT+Gj+NRx87XSBVjldg2sCLbpJbs0VBOHqwGzUb
QmE67wqw1BHdXdC2yG5k5+NqdFhLf7IJ/8raCaoF6wo1xusjZaFUacJMl+EomPqk
YI88FK2KNK9f924LjilaDh6sRaUcv27BfkqpknuL719knEThcMsy1Tw48HjIZTqj
j+YTLI4QHwkUhQDG3/zJxuLuL4CkW3CQtSD0vXsNW/t0YMsHVxhmk9FKNA5Y45AI
chOxU/1CfRheLhjp7KZPJWeL7wdX2d28tSsImTweio8S1XViRa8xLYao9OBB029b
k30zwV/Gsdcy+TiDcrTPpfatm6oTXPukvJ1UnSs8+BXzCb1559Y3T4L0oqa40xfe
nrZ91AtW1VeopagEptQox+00u4I9UNVIXKu1v/X6aNn3BWLv3JaJ8vaNshyFWUsz
3shNFKBO
=ag5k
-----END PGP SIGNATURE-----

--xpdswJpw+Ehe2/nQ--

--===============7211796828584432234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7211796828584432234==--
