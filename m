Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 452A058CE52
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Aug 2022 21:08:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10F57C04000;
	Mon,  8 Aug 2022 19:08:47 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7ACCBC57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Aug 2022 19:08:45 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id bz13so7213816qtb.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Aug 2022 12:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=MunxJuhNLDSanOH1cAWxzxXgrzWspyC/AG8n/+wGvjs=;
 b=hbdE9jgjnAngx0TQZJgnyU9uHZA8JtBQJbL0/Oemmc7++y7YQTVC8+FGAFip2zKMaA
 l83V9SWUoa5Q3T5DAQkA7BXPB9lNg5gNEESnkKcUMruMegIxVYaq6gkyv6Uwp7S9xAMz
 jg/B2w6aX338pBI2WNiC6SHeCuAJoxXWtaZmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=MunxJuhNLDSanOH1cAWxzxXgrzWspyC/AG8n/+wGvjs=;
 b=lgU0A9cUs134Epva2bqIjSiuZ8+zf5PmocDfVMd3xTz/3NcIj99Er44zYyNAMieJqm
 j+aUfCC8EamWsgQHeKd2WNwvD+0W6fjjW8u/aay9D7PQY8ii24b+sLUld3tqBOZ6/o1P
 Jm57V6dBZIi1upQ6WbTlW2bZ7hcAFGawv7hevpX5DvgMbC2zdKx08vOaUZup/1ajr+Jd
 TvYED2ANCTYzif6BZzS1lOwWudDDHz5MRvF8upJ/WtuZnJSn2pMp3Inevox28NcSbdQn
 7cF3G/Bxj+sKRdpAQFy1riXXoHp0IaUg6SxG8ZKneOKFMlhahdt4S5ZY5KPqSl/Tda+b
 V4xg==
X-Gm-Message-State: ACgBeo3pZ1B90Bq1MHtqCr6KmtacNMr/S61dIekIPvF7A/HmHPADZUd4
 5F9KS6Sz8TzaksyevAABhUR3zA==
X-Google-Smtp-Source: AA6agR7ZP+gZayRpyttCtAtg/RzUdr6H/5O9ROcAxxKKXEILMq2T4Jr+/WKbFsOfDSOKfJsq5Quw5A==
X-Received: by 2002:a05:622a:13c8:b0:342:f805:e16b with SMTP id
 p8-20020a05622a13c800b00342f805e16bmr5760142qtk.405.1659985724592; 
 Mon, 08 Aug 2022 12:08:44 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com.
 [65.184.195.139]) by smtp.gmail.com with ESMTPSA id
 e13-20020a05622a110d00b00339163a06fcsm8915404qty.6.2022.08.08.12.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 12:08:43 -0700 (PDT)
Date: Mon, 8 Aug 2022 15:08:42 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20220808190842.GR1146598@bill-the-cat>
References: <20220802085526.272953-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20220802085526.272953-1-patrice.chotard@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Peng Fan <peng.fan@nxp.com>, Joe Hershberger <joe.hershberger@ni.com>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] net: dwc_eth_qos: Add
 eqos_get_enetaddr callback for tegra186
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
Content-Type: multipart/mixed; boundary="===============6342037940921947360=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6342037940921947360==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3LIZ3AKqPvVrHazj"
Content-Disposition: inline


--3LIZ3AKqPvVrHazj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 02, 2022 at 10:55:25AM +0200, Patrice Chotard wrote:

> Add .eqos_get_enetaddr callback defined as eqos_null_ops() to avoid
> illegal access.
>=20
> Fixes: a624251461bf ("net: dwc_eth_qos: introduce eqos hook eqos_get_enet=
addr")
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Ramon Fried <rfried.dev@gmail.com>

Applied to u-boot/master, thanks!

--=20
Tom

--3LIZ3AKqPvVrHazj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmLxXzkACgkQFHw5/5Y0
tyxxQgv+MsWPpmLaCyDLj7TgOAJflTJOZv4d8STHiAJmJnXZQKJvW54j4pnhOSue
qSyVYVEQP6Ga3rnJnthmWyDv0iUS9frprTNmJ/sdMM72VSfQcUJtD9IP/N7JGGF/
aXTVjkTSB7DCsOtr0N1xcIJJX7l7Ca9IdJeN0ZRb6g3uIeTWQCsCohDVMiVbRMv2
9OBWQnKAfhR6ZmP5D6J6Xr6reTNJyMDPVwU3S2zExRBvLNWgH4ZgF1SWTafrdPJ5
GDHjWHywZWrPcVtAtnpw3ibup0Kknnb6a0z2j0nSo03CngZKkXG/kKb0MnAPiE3+
i0SVih+jihX6dvwsuf6hESbYXmCCQtoF7K3ZJV5890ESxegbJEDy1YosLiSjDIk9
xF/k5Ca5M0sPfDmT50+rg6tF0QebIQDheP6pg4Sb1CgnR55BYn1W0TNimVnpnpUN
ed4lgAEUqUzoaHz4wZS4ldrOWIh6N2mVqFF75rtBvhHIRRbCGPgDnIq4M9P2XXZy
gBNMnIfC
=Dw/M
-----END PGP SIGNATURE-----

--3LIZ3AKqPvVrHazj--

--===============6342037940921947360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6342037940921947360==--
