Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A14881B8670
	for <lists+uboot-stm32@lfdr.de>; Sat, 25 Apr 2020 14:19:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FB87C36B0A
	for <lists+uboot-stm32@lfdr.de>; Sat, 25 Apr 2020 12:19:47 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B832C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Apr 2020 12:19:44 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id n143so13091039qkn.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Apr 2020 05:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xhDWGvhr2y4m4Vg05qxS9+ipjHPflP/AM5NNrAN8ePU=;
 b=S9FMU1YeUli/sZ8idNaIQL5vQ1gLhn38NBN2Lz6G9eYghnTR+KxpOeRevWVefgonce
 8uDRju5U8H8zRuZ5gyaT0qyQvZPINsGwjWdIjifA1yqYWrPVf8eEIoY+TXtcdDOqT8v9
 H+sp6RDoYBObtv5iDx7oWAfribZ8B90ftN9PA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xhDWGvhr2y4m4Vg05qxS9+ipjHPflP/AM5NNrAN8ePU=;
 b=q/9BXonGI0RAeqPzsGhrFPHI8ZYYs7hQyCv5P0npMlAEag5yFxZZYqF979C8U8HUXc
 ZKdps2dSg2iE8GFuTIxczEdhHrsO1J2weXxoa5BiIKvuKpYIR93HqQ4ZIaQdii2rsAWj
 gfmw6kErHBuPumOsLZDKiLDJ/hF0Xm3ebWgDnfvT4ydgvC9ANhuCwCBRy6HNJvhQWDJ9
 V6NOvKgSvq8gbsUJkTDxTVydvZDbfdnNBhnWpx0DjQAgsrjmHVeTrCY9hdhBB2NzvXR9
 oL4z2mH/AqtSWI8HY3ljB+7YrhHaxrQcQ8lEjqPJxzW8gnF5NDEmfTZveOYP5qqhwsyW
 JC0g==
X-Gm-Message-State: AGi0PuZlqoOUIPUzf0nTHhGhKakyB23c/cN+nHwpOfHfSBah91gDIWUm
 h6Jlte60CSNeRGT/LXn8/pWbPA==
X-Google-Smtp-Source: APiQypK6/lQfEi/bozB4rPKTRpyGKuo0Gj/UZVH47L/Vh/cF41k2qKuYMAf952faSla9Twjm5KTIMw==
X-Received: by 2002:ae9:e011:: with SMTP id m17mr14042970qkk.103.1587817182960; 
 Sat, 25 Apr 2020 05:19:42 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-142b-baeb-ea9f-aa30.inf6.spectrum.com.
 [2606:a000:1401:826f:142b:baeb:ea9f:aa30])
 by smtp.gmail.com with ESMTPSA id p80sm5736836qka.134.2020.04.25.05.19.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 25 Apr 2020 05:19:41 -0700 (PDT)
Date: Sat, 25 Apr 2020 08:19:39 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20200425121939.GK4555@bill-the-cat>
References: <500b672581d74a37b23de7a9c35125c9@SFHDAG6NODE3.st.com>
 <1587750125350.94861@st.com>
MIME-Version: 1.0
In-Reply-To: <1587750125350.94861@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Marek Vasut <marex@denx.de>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request: u-boot-stm/master
	=u-boot-stm32-20200424
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
Content-Type: multipart/mixed; boundary="===============4806453548740206819=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4806453548740206819==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VZoQXr/frJt+kLeJ"
Content-Disposition: inline


--VZoQXr/frJt+kLeJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2020 at 05:42:06PM +0000, Patrick DELAUNAY wrote:

> Hi Tom,
>=20
> Please pull the STM32 related fixes for v2020.07 =3D u-boot-stm32-20200424
>=20
> With the following changes:
> - Solve stm32mp15 pinctrl dts issue (patch conlict in branches master and=
 next)
> - Split device tree for DHCOR Som and AV 96 board
> - Update PLL4 setting in AV96 board
> - Enable bootd, iminfo, imxtract on DHCOM
>=20
> CI status:=20
>     https://gitlab.denx.de/u-boot/custodians/u-boot-stm/pipelines/2909
>=20
> Thanks,
> Patrick
>=20
> The following changes since commit dbfd9e0e61ff1f9c65703959ed8e3ceb410d1e=
7e:
>=20
>   dm: pinctrl: Use right device pointer for configuring pinctrl (2020-04-=
23 08:25:37 -0400)
>=20
> are available in the Git repository at:
>=20
>   https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm=
32-20200424
>=20
> for you to fetch changes up to 23d203d62e0ec95bc42bf96c56df991ff924f360:
>=20
>   ARM: stm32: Enable bootd, iminfo, imxtract on DHCOM (2020-04-24 17:59:4=
8 +0200)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--VZoQXr/frJt+kLeJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6kKtUACgkQFHw5/5Y0
tyyAQwv/YdkBwUiJmIwT+5fT5brFSCj3q2XZj0eJXImc6IVVqjgEhmHBhAU0MYQY
sVWXDs6tup5M55gCds/GIzU2ArY3Jv89V9ylEoIjMppGD5ixR0ZUrWzrxRxqttUK
YLpzThemJok8WI44C4l4F5GFGpQZ08m7QWOcHvbZ/Nvyq6npBXDwCsrs9fijK7kG
+cXv/QQPL74ze/NUc4GV8lYiOxCGeatZIZn7TpJFTNwEhW5qjBVcEEfpDZqeNE9D
OhCHKxmzDMeDFIgkJL6NQsvkUke5W5wrmWP+gUWdr02PmPeL0TlNivlB1s3ukx/m
atDrfOn3SbbcriaYK+668Oie6HgiQa2qS9xqPY9Zhq4aFr2Ir+zU4FTsvFSwNdbY
f4Lr5EQL5DDNIL3+3ISBBFK0o/ZrUghtn69SSeGqLd+eNZ9fJV6iNzt5g9nPAFil
Vu+YCL0jf9GtM0fHHEyT02iT/XcE7heM5NWFCii6RAidl/brPmUzP33HK1jj0/n0
rfdElzRD
=qVBQ
-----END PGP SIGNATURE-----

--VZoQXr/frJt+kLeJ--

--===============4806453548740206819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4806453548740206819==--
