Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BCC2636C9
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 21:45:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26D8AC3FAE1
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 19:45:28 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D26BC36B33
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 19:45:24 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id o5so3610069qke.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Sep 2020 12:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=o2P8xBk8BNMPDFKvX8537RSvwd2d3DG8avrgFmtwR+Y=;
 b=QLSQfviPFnAGqTXxh48FEOnEHyO3nMKr7BtyEMR8EgXcihKCte/xjb0RyB0kkS88mu
 DackKCdRtRWgIY4Scf92dDf5XEa9SiIZWK8Pq8B+RmEvW14lUedXR9mUUyjIEjAJGDKR
 eMDp9Huf0RHb1DkasJxVQGPJ940SnRRBq6gKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=o2P8xBk8BNMPDFKvX8537RSvwd2d3DG8avrgFmtwR+Y=;
 b=iBTv4XbGC4z40mIG8tc40WsQZ6OVOYv68QiDAEdBZv93iQV+I2HuZPUzxICXBdeyOY
 G5v43UhsWmsjSnYIku5m8n7XqIKDVNNKnXHqxl5M0aFP25bj/91J6sL/bcAuVLRyCy4q
 oeBeppg0gBSZx0A2I3B9q+UJ4wr0IlGOzNrDTgu0q63lMBaESg+Oz8LcqOcUw57GM88d
 7FzlAorBeLYGKuLiccIF+SeIB09+mX+p5u2CYP354s30F4A2flAGUV9OahD/ScSbfvsZ
 dH/AMAZ1J2ej/228EbqRTMPb38eCwrIqBLDRdadKgxKhBPDuZRpvUfXJ+JjArB56B1eq
 xHNQ==
X-Gm-Message-State: AOAM530T7eEos/4TdljuJeL4evGD1gU0+9CpJhWxoO1Ann0Su4Fg/v1W
 xWlfmzKnGQEpsnPhMs0Wovkn0g==
X-Google-Smtp-Source: ABdhPJwIvNoIJc4T5AIzfXbg5HQ8C3HCGqg00YtNgTHgG0JMj51v5Ma3S+uL3DAysSbicGO57VhxGw==
X-Received: by 2002:a37:5cc1:: with SMTP id q184mr4861427qkb.66.1599680723111; 
 Wed, 09 Sep 2020 12:45:23 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8ebe-94da-de81-9660-53d7.inf6.spectrum.com.
 [2606:a000:1401:8ebe:94da:de81:9660:53d7])
 by smtp.gmail.com with ESMTPSA id o188sm3293991qke.83.2020.09.09.12.45.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 09 Sep 2020 12:45:22 -0700 (PDT)
Date: Wed, 9 Sep 2020 15:45:20 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20200909194520.GS7259@bill-the-cat>
References: <83458f7b5f104d0f94f243f10f0d7060@SFHDAG6NODE3.st.com>
MIME-Version: 1.0
In-Reply-To: <83458f7b5f104d0f94f243f10f0d7060@SFHDAG6NODE3.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request: u-boot-stm32 for v2020.10=
 u-boot-stm32-20200909
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
Content-Type: multipart/mixed; boundary="===============0394499092254559579=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0394499092254559579==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ck22u5fw4m2k6hx2"
Content-Disposition: inline


--Ck22u5fw4m2k6hx2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 03:20:27PM +0000, Patrick DELAUNAY wrote:

> Hi Tom,
>=20
> Please pull the STM32 related patches for v2020.10:  u-boot-stm32-20200528
>=20
> With the following changes:
> - fixes on AV96 board: pull up on UART4 RX and adjust PLL4
>=20
> CI status:
>     https://gitlab.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/4631
>=20
> Thanks,
> Patrick
>=20
> git request-pull origin/master https://gitlab.denx.de/u-boot/custodians/u=
-boot-stm.git u-boot-stm32-20200909
>=20
> The following changes since commit 96d66a9b8ce11aae9f8bef5244b83b4740b376=
44:
>=20
>   Prepare v2020.10-rc4 (2020-09-07 14:17:33 -0400)
>=20
> are available in the Git repository at:
>=20
>   https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm=
32-20200909
>=20
> for you to fetch changes up to b6055945d66d0f4e3b1ecb82af476232067a4ee4:
>=20
>   ARM: dts: stm32: Adjust PLL4 settings on AV96 again (2020-09-09 15:02:2=
3 +0200)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--Ck22u5fw4m2k6hx2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl9ZMMwACgkQFHw5/5Y0
tyxagQwAqF1FdGNeqoYeS/bdI81LCiXsGJELIFHNoVavG/ZBMxd+zqhI3SuQB2Vg
3koaoo21LAkPqvrzHMw5HM2lbTAltRRTeQZmc6kCs4nE57kYPyvYCqi1X281t+G7
bu4su1kpJSq0FuBKBU07U8vCGAFnXUtbtWldVLhjvY6Zu6ZbwbxvzkSbPkZF10vr
/RVIW6CQMYio065QVi0p66Urrl3Ibi8PbfnfdK8YqeTp/Or8sUIs0/+0rReD6qtE
lnrxh7vtpUWHprfCTI/kPOMoNQcNoWXc9QOTex22p1ZuhVrVue6iFI2RVNtSPaRz
zZU8KPiRx8ezOkn22Z1syg2pRt/mWUubaIgLPQHe3zCGBNQm/YqyErvlUEioUyx9
9eESEG4VkIxsZCPzKRGuvmfD9+DIiEn53ZAgSrJWgypDiCz7q3nL0pjvY9rWHrxT
ErwQm6kfPH2eS8HY0wbzyXS6Rh1egGh2XtAPmQFhhE1V3/o9waPbdhdt9+bPbLTF
ZCsan+ew
=woGF
-----END PGP SIGNATURE-----

--Ck22u5fw4m2k6hx2--

--===============0394499092254559579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0394499092254559579==--
