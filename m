Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0BA6AEC2B
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Mar 2023 18:52:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87CE5C65E60;
	Tue,  7 Mar 2023 17:52:59 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29948C65E5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Mar 2023 17:52:58 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id y3so9454222qvn.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Mar 2023 09:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1678211577;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jZwUrsXg2+tChhrSL81Lm2fefNpOlU/5ly3nLvPuMQI=;
 b=L3tQcCTm0xtsk3K5KlDA5ar2QkVtRKGnmePcXZkKu4e5ruvZYw9eSyE+/E5u6yKkry
 YMKexZKImSKE50tHtaYLRlpFJYDevliugsYg5w1BTqWEN/KdIVyTwQtTpKVW89SEucvE
 +aJQDiYGbiwFCycMW6mSow7EeY5m03uou9W40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211577;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jZwUrsXg2+tChhrSL81Lm2fefNpOlU/5ly3nLvPuMQI=;
 b=cQfIlcHKNB/1fLYkLj0qJaq9Wl5vqQEszUnxy3sQsHdQPWoH1nqXbJC2YpCwTZHNE4
 ppuPNPyp30hks9EHw0giP+TmDaJK0T7rCvDQESb7RF4ET+NbpoJV+d6aA4zWCug5vw6g
 GBruSDODBh9oU5apwy6vg4Jr9BYlMne4p6/uJeQNggfH5kLhz3uoWmo5kq3KtEz9ZEWw
 1dnQsRmwQgJX4y0UY5NYj+eelosMZPWEdAhdr8WxgkS9f2dUB7HIgT9psrVe7dEi+sL/
 VZwB683h+Epz7dDuR51zrBOQk/Wb46700nlN3yB3R4obtBh+FkMKwuw2ygObP6QAXDiN
 t5uQ==
X-Gm-Message-State: AO0yUKXF5bpBlw6AhsTviNKQYMyCioR8OyBKlMt/purcNCtEM6acP18Y
 HfWA1vLnGF9BKfA9vz+P6AOPYA==
X-Google-Smtp-Source: AK7set+0V0WSETLmCj7u9ExY9Avnr7jzgjz0JVR92yBdm3Dss1/0urBJUXeSQ6VRamd8cvGvWEPdFQ==
X-Received: by 2002:a05:6214:508c:b0:56e:b347:8df4 with SMTP id
 kk12-20020a056214508c00b0056eb3478df4mr22014843qvb.11.1678211577136; 
 Tue, 07 Mar 2023 09:52:57 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-0000-0000-0000-036b.res6.spectrum.com.
 [2603:6081:7b00:6400::36b]) by smtp.gmail.com with ESMTPSA id
 w20-20020a05620a0e9400b0073b8459d221sm9808348qkm.31.2023.03.07.09.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:52:56 -0800 (PST)
Date: Tue, 7 Mar 2023 12:52:55 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20230307175255.GU968799@bill-the-cat>
References: <20230222201943.1.I901beb8819b481b6a9b55b2c00768225e5e12649@changeid>
 <20230222201943.2.I26822655244f3aba21fc3a62832a901a9445a8be@changeid>
MIME-Version: 1.0
In-Reply-To: <20230222201943.2.I26822655244f3aba21fc3a62832a901a9445a8be@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Jaehoon Chung <jh80.chung@samsung.com>, u-boot@lists.denx.de,
 Peng Fan <peng.fan@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] mmc: remove SDHCI SPEAR
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
Content-Type: multipart/mixed; boundary="===============0317872871050200223=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0317872871050200223==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gt8m99ivzsdkbfjy"
Content-Disposition: inline


--Gt8m99ivzsdkbfjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2023 at 08:19:59PM +0100, Patrick Delaunay wrote:

> As the file spear_sdhci.c file is already removed, delete the associated
> configuration CONFIG_MMC_SDHCI_SPEAR.
>=20
> Fixes: c942fc925e7dab ("mmc: spear: remove the entire spear_sdhci.c file")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--Gt8m99ivzsdkbfjy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmQHefcACgkQFHw5/5Y0
tyznQQv/Yqw2qRjhcbwMMT7trI5ubitURoNYJyJmlbl8Ex8Qb9xakcL7ryffMhWv
U88ilIMqQVvo4N1QEdCShx8BX7Nuy46t4DryXz9tqbXaiUjYe296+gUpt+C61Jb0
GYtoj4+gZuyaIocDQs9EKr516LQuRTtqcZ/4wXWPrx1hCBWluKTVZz/8mtGZr21i
r/VywSvIRUAOXjcaL7KhGoAAUBrbA652rVBb1LmA0wZM6KoLY+ggmMVX/oDwOQWQ
kH70/ATCc2USfn/asoqAmJKh/5CZ5WyQcwFMOHKwAqMDvvS6TcaaGawqfzcMyY1D
/5SOuDJvm1u2zLH8Uu8GwdjPTazr3td8atAm6Av3JOtijvyXNZrcnb8vQnNlsXEJ
1tkU97LLRF6+bfK4oescsh2bzIirJzaaiussCWvuUsmBLIxeBzsRUNJ+awMsWwBI
cQsdAX+h3guloCCJdfFGnEm+T6CGf6UIxwKflQGB1QqFV6mdN6cJG58dCvcm13cN
ugrhZfVc
=BF9n
-----END PGP SIGNATURE-----

--Gt8m99ivzsdkbfjy--

--===============0317872871050200223==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0317872871050200223==--
