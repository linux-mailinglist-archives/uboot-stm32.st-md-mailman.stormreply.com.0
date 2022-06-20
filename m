Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B0C551F9E
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Jun 2022 17:02:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF4F3C56630;
	Mon, 20 Jun 2022 15:02:26 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 451B0C0D2BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jun 2022 15:02:25 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id n15so12220329qvh.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jun 2022 08:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HQPSipzNwkIdH+lJ9fqMq0I7ebgetZSmmH1b7nFJMg4=;
 b=ubvhdjE1uaNa9Ri7gdQxuPap7tYzhJxmxiSi9d35MaWBibX8UpIFiSqWrq8E+wXznv
 lxE/J2zxG3DORFIOxmis3fsgwZpvXpMN6XG91b48W76ppfoRHQE3dMXMB4QvhMX4IgOF
 VeMn5lIFDpj5FM3FHL4/l62VW+iy3d53euyjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HQPSipzNwkIdH+lJ9fqMq0I7ebgetZSmmH1b7nFJMg4=;
 b=VtlAHYf9Vl04ja+RGMK4n+CxDr6UhZk4Bri3XpYW3OjYMYNTFKxlVUc+zikSW43S9G
 /VRQ3pSTtjrDqiFQGIrJ3L9sDdMD5PN/ALnc6bGcHja5ShT5G6GO6Op2sz8oJokn0AYh
 KgK/qnhv4wFDZ+EgOe9iFKw3vMK4WL2OfUinClxRpP7qjNyY+pkm/TtqDRI9sataRMje
 I4r2PaaN2E8DIHZv4rEyZzWoYUhMQbaOKghkWLDaazPJgz4TRSlnGO3s6T/AqC7K6pIx
 ap3eAgGTbzZDuUFPlmX5zdEL6MpXqncrlaK7agqdXMyb73H73KdckUrrOpZDNMTLRXO5
 YU7A==
X-Gm-Message-State: AJIora93bSdmyfFPbF3QpGBgedw/kGEjGdbjCvvE+JY9EJ/R3enyPvs+
 K077HOwZ0WpkIuZKZVWPBx+ZRA==
X-Google-Smtp-Source: AGRyM1sGltiD5BCUGEOjXAjfNDzWlOoPGZeyCnX6oIYXWvKLvxQxtKFSZQR3ECEQXJ+hzMGlbcN4bQ==
X-Received: by 2002:a05:622a:87:b0:305:209f:3dd5 with SMTP id
 o7-20020a05622a008700b00305209f3dd5mr19742474qtw.24.1655737343937; 
 Mon, 20 Jun 2022 08:02:23 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com.
 [65.184.195.139]) by smtp.gmail.com with ESMTPSA id
 i3-20020a05620a248300b0069fc13ce23dsm12579534qkn.110.2022.06.20.08.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:02:23 -0700 (PDT)
Date: Mon, 20 Jun 2022 11:02:21 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <20220620150221.GM2484912@bill-the-cat>
References: <1fea8945-ebde-1c34-60f9-580ab4e3974b@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1fea8945-ebde-1c34-60f9-580ab4e3974b@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Marek Vasut <marex@denx.de>
Subject: Re: [Uboot-stm32] [PULL] Pull request for u-boot next / v2022.10 =
 u-boot-stm32-20220620
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
Content-Type: multipart/mixed; boundary="===============1021330918659952877=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1021330918659952877==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bnKz9hMOyugZBVhf"
Content-Disposition: inline


--bnKz9hMOyugZBVhf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2022 at 11:32:20AM +0200, Patrick DELAUNAY wrote:

> I Tom,
>=20
> Please pull the STM32 related fixes for u-boot/next, v2022.10:
> u-boot-stm32-20220620
>=20
> - Add STM32MP13 SoCs support with associated board STM32M135F-DK
> - Correct livetree support in stm32mp1 boards
> - Activate livetree for stm32mp15 DHSOM boards
>=20
> CI status:
> https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/12393
>=20
> Thanks,
> Patrick
>=20
> git request-pull
> origin/nexthttps://source.denx.de/u-boot/custodians/u-boot-stm.git/
> u-boot-stm32-20220620
>=20
> The following changes since commit 98c4828740f4944462b7d9608b95d5b73850c7=
b0:
>=20
> =A0 Merge branch 'next' of https://gitlab.denx.de/u-boot/custodians/u-boo=
t-imx
> into next (2022-06-16 09:27:43 -0400)
>=20
> are available in the Git repository at:
>=20
> =A0 https://source.denx.de/u-boot/custodians/u-boot-stm.git/
> tags/u-boot-stm32-20220620
>=20
> for you to fetch changes up to eae488b77906692627622abc61f5b7160b6eb2a4:
>=20
> =A0 stm32mp1: fix reference for STMicroelectronics (2022-06-17 14:12:27 +=
0200)
>=20

Applied to u-boot/next, thanks!

--=20
Tom

--bnKz9hMOyugZBVhf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmKwi/wACgkQFHw5/5Y0
tyxhQAv9GnXLdGSfaO3Nyq/ZsbNQ+Ts3h0kiOhptz9cBbAFjILLrAP4qjPSbteAc
a4amOxx9zdQivUIRDSZnGZvcvDUAbRhbcA+p3Zumkh3AHR9aPE23+ozAGawSwsgU
C8St8jJbIiasUG0I1+SenuChGumE6gN7JbsspFCwGv2SrqTuMsR3Jmy+iYHUbR2s
0xDxNZ78AKs15E0mIRffdpHm/IbAm83l+FnkUYmTOuZlE2wjwH35Q9XneOyqZFUJ
6BydTX1BtYZKGmAQdOO5T7wfWkO5uOe5DDtsfDFjNWRH4tAriGXERCTG09MpX8lk
JB8OCN4MYxPUQbVIN9ZMvQHlHQYWI+ZsbIqK35I0i3oVsezhUWGcqurszMrGEYg1
VglUt8oJEmy8KBTMZQE5mC8jHS+t00BnDOPgZ2TREZBHNRkaQii24mBGdX5NPMgz
PsRq5ssk82REpN48T+CJzOiHpJIzjXPux+/XaXhJB/njJWOEsz82ZFAAUTsnWo3x
3J/nfLT/
=7lfn
-----END PGP SIGNATURE-----

--bnKz9hMOyugZBVhf--

--===============1021330918659952877==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1021330918659952877==--
