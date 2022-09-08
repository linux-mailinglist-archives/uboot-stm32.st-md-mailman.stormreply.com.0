Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B145B2842
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Sep 2022 23:16:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 257FDC63328;
	Thu,  8 Sep 2022 21:16:52 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88943C03FCD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Sep 2022 21:16:50 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id j17so13907711qtp.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Sep 2022 14:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=sm9LnfvHTEiAHYKn6IxBKfCmpGHGb8Ip1higouFSpYo=;
 b=bGKrGv+6UxqrLrCuu/wNOh5tFmeMcS17QC2Xx+Uxo70wXabmOMgNxNQDGN4H0BMo9k
 prWVK6sSmqdL0bW/7C2ZVhqp1mH7GP1NARAJJcFHtNR6ImpdBESc7EMD6mJYST8rIzeu
 5Su0pUVJg0tCRZg0q3Uo9SZLYY45SKzx+jajg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=sm9LnfvHTEiAHYKn6IxBKfCmpGHGb8Ip1higouFSpYo=;
 b=8B9FLvqtZtTdzKUGawRP1zlDKOUxdauNyVQ1C21Po6fqguty+Iz4Nn6ym9GsVCCeKk
 DO5pJj6Dm94kOgXoGgPigU7LxVUOYfXPpft9EukUIUcIA1hRUMKLdiRnm7dI3fa0bW9B
 NDqXEYMPHxotoRAxO9v+Ss+b4RA5QT3Itrv1Dz3MOrfMUDXKErPaaxDQHqEcP/5Ib18v
 LWIRT3JVNmc90kP0MMQ+S3tZuMeGXZXmdpBpzR7xHh9VOUCNXD8w7bmiyUCr3EiYjhwa
 sZGSkFrcmpvnYIDGAlFBn4UoNLDml7kFgSX5nGjhuGfaKWxU6SRo3eR4z6jvKGGHiP97
 BlNA==
X-Gm-Message-State: ACgBeo1ouoWNstXUsxelsdIBhAtOijBtv1mzcQMvJ0Qy+icz5AUAxPQs
 U1QhOTZ9RIXEJAJBXfAiLnA6qg==
X-Google-Smtp-Source: AA6agR7pZDVRDhFBpXx2CwobBJlsM/A8mAJ3PISl4uV6CnBOXEfw3vDwXqxqs+EDZzcYcG/1TOoP0w==
X-Received: by 2002:a05:622a:310:b0:344:89e4:cf8a with SMTP id
 q16-20020a05622a031000b0034489e4cf8amr9735404qtw.206.1662671809401; 
 Thu, 08 Sep 2022 14:16:49 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-e8f3-4bcb-5977-bee6.res6.spectrum.com.
 [2603:6081:7b00:6400:e8f3:4bcb:5977:bee6])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a05620a448900b006b5e296452csm19176178qkp.54.2022.09.08.14.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 14:16:48 -0700 (PDT)
Date: Thu, 8 Sep 2022 17:16:46 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <20220908211646.GU7942@bill-the-cat>
References: <80f5c40e-4915-2291-cb70-130c1fbe050b@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <80f5c40e-4915-2291-cb70-130c1fbe050b@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Marek Vasut <marex@denx.de>,
 Johann Neuhauser <jneuhauser@dh-electronics.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request for u-boot master / v2022.10
 = u-boot-stm32-20220907
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
Content-Type: multipart/mixed; boundary="===============3921507184678126571=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3921507184678126571==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P4FumoV6cQve47oF"
Content-Disposition: inline


--P4FumoV6cQve47oF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 08, 2022 at 10:03:34AM +0200, Patrick DELAUNAY wrote:

> Hi Tom,
>=20
> Please pull the STM32 related fixes for u-boot/master, v2022.10:
> u-boot-stm32-20220907
>=20
> - simplify the STM32MP15x package parsing code
> - remove test on CONFIG_DM_REGULATOR in stm32mp1 board
> =A0 and enable CONFIG_DM_REGULATOR for stm32f769-disco
> - handle ck_usbo_48m clock provided by USBPHYC to fix the command 'usb
> start'
> =A0 after alignment with Linux kernel v5.19 DT (clocks =3D <&usbphyc>)
> - Fix SYS_HZ_CLOCK value for stih410-b2260 board
> - Switch STMM32MP15x DHSOM to FMC2 EBI driver
> - Remove hwlocks from pinctrl in STM32MP15x to avoid issue with kernel
>=20
> CI status:
> https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/13383
>=20
> Thanks,
> Patrick
>=20
> git request-pull origin/master
> https://source.denx.de/u-boot/custodians/u-boot-stm.git/
> u-boot-stm32-20220907
>=20
>=20
> The following changes since commit 51601397fcbb13e6dc2e4223408230c82955a6=
01:
>=20
> =A0 Prepare v2022.10-rc4 (2022-09-05 20:32:56 -0400)
>=20
> are available in the Git repository at:
>=20
> =A0 https://source.denx.de/u-boot/custodians/u-boot-stm.git/
> tags/u-boot-stm32-20220907
>=20
> for you to fetch changes up to d6ff3c9f04f744345fe77a3d82c5b5e0c07c456a:
>=20
> =A0 ARM: dts: stm32mp15: remove hwlocks from pinctrl (2022-09-06 15:40:14
> +0200)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--P4FumoV6cQve47oF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmMaW7sACgkQFHw5/5Y0
tyx+5AwAmZCQpS5R5YDznE9wOSha1g3LtKQMGWvCAv1Ym90rBUut/3P3wE5rBxKx
BRGbd9t3zLdSLX0dQ5gvpv+N/h53G7d1FiQwvc031k8t9wkLaWrk2p3QKB10yZqU
RVwgWHqHPUyR5ac5M1Apz+YhHYVUiwmt0QBKaeF6Fg+ynMnqay2hnLTmROA45gYB
+9n0Z562m8K9MMSPU2qQ8rVvf4+inO9xMlI5YDYohG3ZakWLaYOaIrhJzLs6JmFB
YC2PrfX4cchhTXRAjrnVtyu8bKbKcsUisuBweLVH9+Z9bRC+T0O2LbUDq+rwIFLG
4H0X7nmlobLyrDaOiyZuVq1qfu6A+ml2UUG334uR65BKl6ISZN231DvG/okESQEo
Z71KmQDBCNqHe44apZyOzySZbii3RalsgiWkaaKwIsdWN4GFBvDF3uG26Ao/Xsz4
vB89/lOoALbAC1KXKnDvA1QdT0XWE7Y1F2yJKq2ck5sDwGoBo7viZ69FBkXQX8d1
7N+GpiJk
=azBq
-----END PGP SIGNATURE-----

--P4FumoV6cQve47oF--

--===============3921507184678126571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3921507184678126571==--
