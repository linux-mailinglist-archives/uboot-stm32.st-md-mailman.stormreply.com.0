Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3A9496565
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jan 2022 20:03:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33B58C5F1EC;
	Fri, 21 Jan 2022 19:03:04 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDEF0C5F1EB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jan 2022 19:03:01 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id s6so4310875qvv.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jan 2022 11:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=R2U5GzdK7eXkrQZ0p+7c7IkCfxgOd+7b3rQMQuW21js=;
 b=JL360faRT4EIy371RJKxLScqG4yw5iKHEHT6NN/q5xRREjxbxniAcuC2XYZsHeKQom
 O2xwHJR6po+bE4oZ4ER9+nEs5irKtwFBbVaFz/4V6MHucFhUB/z5dsHduNVMGII3z6Gh
 6FczY2RJPmNxYLbGOKfT/9fOKn3jdRtk3JGNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R2U5GzdK7eXkrQZ0p+7c7IkCfxgOd+7b3rQMQuW21js=;
 b=YVu542i2svGLeKItE5xfNNc9Ducl7smJNDfEu7TaPW78kv+rvbSXQy/nQiVwsGDnTc
 miv0tbr8VKe468CrLsf06+WaJsorxRgzroJG98/qTYQ3HruhlqpcP/hko+ugKoaQoI+r
 AiEjA10xI9oDovIH0roOO1pQ+WZGvHgZUGhhIP+wx4FDfqwmtuiTAVCvX6H6d27Ity0U
 dPtj39YirEVDA4Dj1W7oJyjzj0cGNtO1XcQuSN4IRzt4GQPY2+pwY5CP23qctGWqlnot
 0Ms4h7PWgFrEmNc5NfwkhYkJVrMFD62Y9QSlczPTCeTend0t1V3LNrvvGN/WEjhcuF5O
 OqgA==
X-Gm-Message-State: AOAM533o0UzE/ImY70PVVFJ/fTG+XxeGTZc1YfChh5Nj2VdOXbMW2wBY
 UrmobipboSJ0pBxfpvl53f4HEA==
X-Google-Smtp-Source: ABdhPJzoSiPOgJto8TTPK+4TC5vxCRLr9aDw1QnsbWpI0RFluk2H6f00uu9L0cXizlbIumpfCeqvmQ==
X-Received: by 2002:a05:6214:1cc4:: with SMTP id
 g4mr5019416qvd.89.1642791780927; 
 Fri, 21 Jan 2022 11:03:00 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-2ef0-5dff-fedb-a8ba.res6.spectrum.com.
 [2603:6081:7b01:cbda:2ef0:5dff:fedb:a8ba])
 by smtp.gmail.com with ESMTPSA id j14sm3533879qkp.131.2022.01.21.11.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 11:03:00 -0800 (PST)
Date: Fri, 21 Jan 2022 14:02:58 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20220121190258.GH7004@bill-the-cat>
References: <20220104132401.3573475-1-patrick.delaunay@foss.st.com>
 <20220104142328.v1.1.Iaa7c4564c1e7d57e198f7621d124cddaa3296c4a@changeid>
MIME-Version: 1.0
In-Reply-To: <20220104142328.v1.1.Iaa7c4564c1e7d57e198f7621d124cddaa3296c4a@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v1 1/5] cmd: Fix up warnings in flash.c
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
Content-Type: multipart/mixed; boundary="===============7764383082012195253=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7764383082012195253==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R9b51G30WkD62Ue3"
Content-Disposition: inline


--R9b51G30WkD62Ue3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 04, 2022 at 02:23:57PM +0100, Patrick Delaunay wrote:

> Tidy up the warnings reported by checkpatch.pl to prepare next patches
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Stefan Roese <sr@denx.de>

Applied to u-boot/master, thanks!

--=20
Tom

--R9b51G30WkD62Ue3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmHrA2IACgkQFHw5/5Y0
tyzE9QwAuVPQnbhsw8Xr9bjj+AJnVYkUrOa3BpruHT6Avvpn9oVURlReLPEI0Z9S
ExlWdlNB6QbwVP7wGAvDLpqmFR4BUxLONpcH1pPKV5MAXm1BisJTYikls9C3bMEN
hHo08xiKdufGLPxu81hhzJ8NYZf7w7MboYDaKAa7SIdwVCRUAuR7ZuqTxMmLO5k3
JMfjisAlz/yoK75LE5O9PpB9J1L+nfnQ4FJE+cEtmqntI9w7h6GLQnWp+KzmWAQp
wQMwghXuDov3z6iWHBNVPlkPvNiWDe4LLZUnnzj58EsqEhS4pOVNm/ots+13P1v6
sOo9ZPfEcB7QM6+C/13I2p+NCI2S/VN8sll3Vvc9LcGC36Nk2GL+zPG/IwOY/Hws
ku9Ns7/UYvKQPB5aAzb3KJwhRWj7zdwbXX8K2rbhsNHJYGHq84kTPHfWXKnj34NN
JGUM+Eqxl3h786Qs8NjYFMfBqQcKela1r3FLsZWEUsXYgUyUoszUVskjK+oaiU7g
PF9PLZjV
=MBzM
-----END PGP SIGNATURE-----

--R9b51G30WkD62Ue3--

--===============7764383082012195253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7764383082012195253==--
