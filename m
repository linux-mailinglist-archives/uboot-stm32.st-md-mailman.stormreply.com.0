Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6943746DA8
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Jul 2023 11:35:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 970EDC6B45A;
	Tue,  4 Jul 2023 09:35:55 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3780DC03FC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jul 2023 09:35:54 +0000 (UTC)
Received: from [192.168.192.146] (port=50906 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1qGcRo-0003lk-A3; Tue, 04 Jul 2023 11:35:48 +0200
Date: Tue, 4 Jul 2023 11:35:46 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZKPn8glvkWvApvIK@nx64de-df6d00>
Mail-Followup-To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com
References: <20230703162754.2341117-1-dario.binacchi@amarulasolutions.com>
 <ZKPUJpRdRG7fH79S@nx64de-df6d00>
 <CABGWkvo=Be70U_azqj73vF-aN5+A6nN5awBFTQMUo77E3Cy=NA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABGWkvo=Be70U_azqj73vF-aN5+A6nN5awBFTQMUo77E3Cy=NA@mail.gmail.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] board: stm32mp1: add splash screen on dk2
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
Content-Type: multipart/mixed; boundary="===============1642800286966896409=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1642800286966896409==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BwRW5TRqaU44t9B8"
Content-Disposition: inline


--BwRW5TRqaU44t9B8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 04, 2023 at 11:14:39AM +0200, Dario Binacchi wrote:
> On Tue, Jul 4, 2023 at 10:11=E2=80=AFAM Grzegorz Szymaszek <gszymaszek@sh=
ort.pl> wrote:
> > > +			ulong logo =3D
> > > +				(ulong)stmicroelectronics_uboot_logo_8bit_rle;
> > > +			bmp_display(logo, BMP_ALIGN_CENTER, BMP_ALIGN_CENTER);
> >=20
> > Technically logo is const.
>=20
> int bmp_display(ulong addr, int x, int y);
> And throughout the code, I only find ulong parameters being passed to
> this function.
> Perhaps I can replace "logo" with "addr".

I'm afraid my comment was perhaps too terse: I wanted to point out that
your "ulong logo" variable is assigned to only once, its value is never
changed, so instead of plain "ulong", you could declare its type as
"const ulong". I won't insist on this change since the code is trivial.

Consider simply removing the new variable and just passing
"(ulong)stmicroelectronics_uboot_logo_8bit_rle" directly as the
bmp_display()'s argument, like in
board/st/stm32f746-disco/stm32f746-disco.c.

--BwRW5TRqaU44t9B8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEZT55kPBhnB69hD4ZeE9lGUIcpz4FAmSj5/IACgkQeE9lGUIc
pz7RsA//aB+RIc5l7mz/iTByd4X9nMe4Dhb1Edp185A5fEoz3oUAkY0ggeH0EdYh
09jhJUUvS3SyeeJBdlTySQixdMda52kpSZrKwyyiWRvAzPuUSg79lQRSRiDty2MA
XnLwKDW8I3M9tH75xhiagYWcn4wMj8qtEWLYICMSiCHidoT+rNFaWkYIyj/2caob
0J6ku4KIOngeqdkBNgjGrR3jt6qGgE5ynBlh9tAB0zX/EcgL1avq+Gq6gu/yj5hm
KTZj/9mS7c9BnB0esge52AmVRi0yW5w6pHOgTsFVkIFXsbtW3chjK2wsSLoD+sg7
LGoJMcVw51mJhx0mkZF/VpDXSzMso5b4caDL74psmMNlD8YfuLrnYSNuto9NgJtc
LgAj94vM/4i1XhDiIX2D2ygT8VuiY4zgClDCMIAWDpc6iUiEMyYHyP7fhrbtl8PK
iByhRS2SlP4YPZgWlNtTnesBjOGAyilk1sziEyMQpKIUnenzWjtQkbXLOvSBT5Kk
Ifv6ACxO1CPVLdcd5k+Shi7QwvYEgJtYhL17xspbTtgNXKLSrlS7Ifz9qC17GqK3
Q6OnJBsgAWdNPW8RfQ4x/6L/K7Ci5esOu2Wd1NZUtoFu1191SMhAj6mwqGEbUIuj
W0SGSe3XKoQPMRVcArVEGjZZpl8MBgR/GWVJprzojwA+ksjnr/A=
=I5h7
-----END PGP SIGNATURE-----

--BwRW5TRqaU44t9B8--

--===============1642800286966896409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1642800286966896409==--
