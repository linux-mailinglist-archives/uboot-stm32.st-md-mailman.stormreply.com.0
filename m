Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C057B5B9C7F
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Sep 2022 16:03:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FBABC63324;
	Thu, 15 Sep 2022 14:03:21 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCB9BC0D2BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Sep 2022 14:03:19 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id j10so10747954qtv.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Sep 2022 07:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=krJSm1jWGm1WKDMeYlYmzsX8dhLoFzmGRvaUfVorwlQ=;
 b=LlmLka6VsvuHAzyC0WfWFcnIJ2J5gF1JhmT6zfjveJLpGjfgZ2iUkxzQbNwndoUUMn
 H60tHs7hnGk2VBU//Rq0qK2NYT3ANqF/I4tjTpwUC6/s380KQeOT6POJ1lo5qdYVrlDQ
 XuMDy9KsKqVp0eunUFtjzWYHAsulcM01mat2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=krJSm1jWGm1WKDMeYlYmzsX8dhLoFzmGRvaUfVorwlQ=;
 b=3OE5skJLueKPBJRwot9CqjbbmPOmvVLVqGnUn3tT8Ctb56vvy/9X3kCBQAPSiY+64c
 7QgRGJB++mWR8mT33bVn9Y4xyn0qO53jHleJ/6hjYN5+7gIGUS/h7TWV1is3SMTfIgfK
 +PorPVH9i/2R9vdrKJOveutzy4c+ykN7cpbV5DL9Ho3up4DKvEQb1gDhpOgiDuqZPcxF
 n5uiKKaRk4Gz2WIHhx0D44Rt4IgBjgLKFXKEIm4L7HnZsv+FSgE5WPoxN+dxZOxo0nF6
 Fslha2rKPiZ0h+8Lx62JfVkcBv+L/Jl7gHF5ptAmeRzRHZYYbBmNZ/W0GMw0jNAn/fRn
 0CoQ==
X-Gm-Message-State: ACrzQf1/3YVoVVgq8IhMozAhqvQH/xl8W6uP3ZFh8oLWzKoY6SHTvdSq
 BrUo7QThfCavdxY/mXVbVbuK4U+nyjnZJ91V
X-Google-Smtp-Source: AMsMyM7hccEPCg7yi/XaHZRX9nEes1HhtYlg6Eb2zW9R1NIOeQESsget6I9SjZu6ovjyRx2bz0+qMg==
X-Received: by 2002:a05:622a:1706:b0:35c:cbab:af49 with SMTP id
 h6-20020a05622a170600b0035ccbabaf49mr114328qtk.394.1663250598759; 
 Thu, 15 Sep 2022 07:03:18 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-6011-212c-4988-e1af.res6.spectrum.com.
 [2603:6081:7b00:6400:6011:212c:4988:e1af])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a37f914000000b006bc6aef46basm3971468qkj.114.2022.09.15.07.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 07:03:18 -0700 (PDT)
Date: Thu, 15 Sep 2022 10:03:16 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20220915140316.GL6993@bill-the-cat>
References: <20220830120914.2329522-1-patrice.chotard@foss.st.com>
 <20220830120914.2329522-4-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20220830120914.2329522-4-patrice.chotard@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v3 3/4] pinctrl: pinctrl_stm32: Populate
 uc_priv->name[] with pinmux node's name
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
Content-Type: multipart/mixed; boundary="===============0341150131564343076=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0341150131564343076==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KqIDP7BYbqnwKRO+"
Content-Disposition: inline


--KqIDP7BYbqnwKRO+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 30, 2022 at 02:09:13PM +0200, Patrice Chotard wrote:

> Populate uc_priv->name[] with pinmux node's name in order to indicate
> the pinmuxing's name in case GPIO is configured in alternate.
>=20
> For example, for STM32 SoC's based platform, "gpio status" command
> output :
>=20
>   before
>     Bank GPIOZ:
>       GPIOZ0: unused : 0 [ ]
>       GPIOZ1: unused : 0 [ ]
>       GPIOZ2: unused : 0 [ ]
>       GPIOZ3: unused : 0 [ ]
>       GPIOZ4: func
>       GPIOZ5: func
>       GPIOZ6: unused : 0 [ ]
>       GPIOZ7: unused : 0 [ ]
>       GPIOZ8: unknown
>       GPIOZ9: unknown
>       GPIOZ10: unknown
>       GPIOZ11: unknown
>       GPIOZ12: unknown
>       GPIOZ13: unknown
>       GPIOZ14: unknown
>       GPIOZ15: unknown
>=20
>   After
>     Bank GPIOZ:
>       GPIOZ0: unused : 0 [ ]
>       GPIOZ1: unused : 0 [ ]
>       GPIOZ2: unused : 0 [ ]
>       GPIOZ3: unused : 0 [ ]
>       GPIOZ4: func i2c4-0
>       GPIOZ5: func i2c4-0
>       GPIOZ6: unused : 0 [ ]
>       GPIOZ7: unused : 0 [ ]
>       GPIOZ8: unknown
>       GPIOZ9: unknown
>       GPIOZ10: unknown
>       GPIOZ11: unknown
>       GPIOZ12: unknown
>       GPIOZ13: unknown
>       GPIOZ14: unknown
>       GPIOZ15: unknown
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--KqIDP7BYbqnwKRO+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmMjMKQACgkQFHw5/5Y0
tywrqwwAmTaUjWBrumMqUTh9pQTv30WRCwsPlLtFraKFz2mmhjD+MnTd1DTePXY7
Msc4UvE/z7geDC6q88cUsvnMjo1DcZaCb2lvr+W80nJ83xdPFEpfRqpWqEVvJjy3
KvKFtOEbr0Yx+FAZkkyunSPYOFkoAcurNkXJwnA01AidU/JRMjrIB60ZvYS4RjPS
127q9ZoI/FAiY7LXnsxyISxSoVAHSOe+P/mpnBYyyj2Sw3T5JjcqSPGvh1QSiRFU
3+BA4d+I1R2qanfVENMKip8fdGN5JBdE0YCuTkz1lpXw84IeZhUeNRT9IrADzMgP
j9SCvU2Q9HItPaAb1grXdPb1zlbWBTR2yA9uCcGhz1BA5Hn1DCjVRI5qc7baSDNU
i3fwdFbXCA9SN/XT6la0byAQifKaAMJDGxFXuybmSvpCrGSUl9dbCV0j3apF2Er3
yAmJ566G83CsG5w/muo1JXWhXZx8xO6z+dB+fO4/mXJRDlKdbwFi9YDPwS6OLotD
nyOYjJsb
=L1mz
-----END PGP SIGNATURE-----

--KqIDP7BYbqnwKRO+--

--===============0341150131564343076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0341150131564343076==--
