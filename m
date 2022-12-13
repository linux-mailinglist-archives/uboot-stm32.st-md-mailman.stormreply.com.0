Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCCC64B9E3
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Dec 2022 17:36:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0C47C65E61;
	Tue, 13 Dec 2022 16:36:35 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93768C03FC6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Dec 2022 16:36:34 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id a16so248386qtw.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Dec 2022 08:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7SXh/XoewmaAGLJbmYkuUTo/zMGm5N04q3FzhFsHWnU=;
 b=fijioqhuzlyodcjmJoc+uSMXHM5VfuuczTF1n8tGyGDDv3sujfMeniPX61xCOkddn3
 8zIFdFeeRL4kEClSS+f4Hn+QxKHEqGC1SQFToPr3MXAnwA7inaSe4dyvvrI8xsn/W4yX
 4+n20KxozYp62JydQ4XwHvs2chNINLEh4vhOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7SXh/XoewmaAGLJbmYkuUTo/zMGm5N04q3FzhFsHWnU=;
 b=SqF2IPYqw1Vy/7Wy0lGj8OVASHWVr2JAuHYT6yMN6oodhURG2pefBwpYZWQD9OhwcY
 I5vjVVJkl0HZ9J3bXj2AemZuAIkaEhMXoZbn44s7O9uuoCWCtPUykeabsWAl8xTBB0ng
 85cFukjjlvymCralJhCmyJ6Bac1TejYQm6lBFdeFqM8tYbi/YBA7/N+Qix9vEQaIHm7D
 eLbuYcTQr2k0kCMCtwy/xNcpQlm7yknQlcTBWaHdUdSaBn/DddpBL8XV7tSwprMVSLbX
 7JYoXp8GgVIY2BOX+UkvV2uLD2Wn7T4DdMMrODdFGQb9jY+IRetL96Xxxif2mtCF7lcT
 fqhw==
X-Gm-Message-State: ANoB5pl/gobQfnnQD6EoakTN6T42HUnVPxMYOd2oQ/icRjN3wsQKcII9
 HpIc06ZdzioXVXJ8eZ/SeYVdEw==
X-Google-Smtp-Source: AA0mqf5ZLRc6G1cm1DGPCiOdrFILiODJDFQObwdOwrCtsGc25A56okIeoE0Kb5HxLRLmJLcj0PCNsQ==
X-Received: by 2002:ac8:4998:0:b0:3a5:3388:409a with SMTP id
 f24-20020ac84998000000b003a53388409amr25321599qtq.29.1670949393527; 
 Tue, 13 Dec 2022 08:36:33 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-09de-b540-f7da-b28e.res6.spectrum.com.
 [2603:6081:7b00:6400:9de:b540:f7da:b28e])
 by smtp.gmail.com with ESMTPSA id
 bl15-20020a05622a244f00b003a6a92a202esm108489qtb.83.2022.12.13.08.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 08:36:33 -0800 (PST)
Date: Tue, 13 Dec 2022 11:36:31 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20221213163631.GA3787616@bill-the-cat>
References: <20221207082644.3515486-1-patrick.delaunay@foss.st.com>
 <20221207092619.1.Ic1687807c70d49f6a2345db4e3da49341142584c@changeid>
MIME-Version: 1.0
In-Reply-To: <20221207092619.1.Ic1687807c70d49f6a2345db4e3da49341142584c@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Govindaraji Sivanantham <Govindaraji.Sivanantham@in.bosch.com>,
 Hiremath Gireesh <Gireesh.Hiremath@in.bosch.com>
Subject: Re: [Uboot-stm32] [PATCH 1/5] configs: am333x_guardian: move
 MTDIDS_DEFAULT in defconfif
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
Content-Type: multipart/mixed; boundary="===============6999706871846922871=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6999706871846922871==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gdRB34y5/MX/6WfA"
Content-Disposition: inline


--gdRB34y5/MX/6WfA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2022 at 09:26:40AM +0100, Patrick Delaunay wrote:

> Replace MTDIDS_DEFAULT in config include file by CONFIG_MTDIDS_DEFAULT
> in defonfig to complete the Kconfig migration
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

For the series, applied to u-boot/next, thanks!

--=20
Tom

--gdRB34y5/MX/6WfA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmOYqg8ACgkQFHw5/5Y0
tyxwygv/Tt44ejawgvqBIb2WGYiDtT6xlFGRL9horuIYGDyhPG0b9s93jFztvaEd
7YCnShJb6rWX3md68tND9nBZr5K7ejSkci2znVsJTYWRUNk/ymNDpj9JYR/VlYBJ
88aoLT6W34TTaW4Em1ERRDSMoaavehm8VJq7ugAlPvzXLpL770AiyzfYG5T2G7+9
QYDl+fJwFOC/mlRLX9XH+woW6Egs5P+2sTbJRfRl26/H1iWECj9PdEDgrKnRpbzW
V0AGCFrnlOkzJn35/gbgTTm7BXjFk5vXD4wkIs6iYsc8bqazZ0BE00COAwZ+VTzy
jGeVL7IFccKrG4j79Qg3hH5Gp8p+sf0bP/dbpdWTE7wXhHGbPddoNs6dDTJ3mFvD
fUdEumQ8jNz9rIrir5nztlmqlfozzk9vSJzdGXde/ju6JugmJZusChg6P9y5tIKi
v/y9bCuz5xX2o90MBRtomb1Wp4jSG7rEJa6nuZZ4eftgT7vJ3hULvJk/UH+6/DdX
MNWfmvKp
=YPva
-----END PGP SIGNATURE-----

--gdRB34y5/MX/6WfA--

--===============6999706871846922871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6999706871846922871==--
