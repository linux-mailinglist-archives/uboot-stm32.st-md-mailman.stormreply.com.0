Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3193170C7
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Feb 2021 20:59:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 413EFC57B52;
	Wed, 10 Feb 2021 19:59:33 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 979C3C5718A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Feb 2021 19:59:30 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id b14so2966797qkk.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Feb 2021 11:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=I+SILpdaklD1nPjFrbyup3l5FGQh83I5SA5ysnIaa0A=;
 b=oRAwcUlYAN1JVBSQL/anK6IefdtWa3eXQU0lN64D17m+Dg1ojtSeVcpQsgqbKnOl02
 nOq1JL/hbD7J3pOOqn8Bdbl+9PVVQFzMlXN/BJ1Wtvux872VADtksY4mxXWJPRW5He4g
 ss2Ub303ue9azgNqB6//1n29dw54gT8QwQLcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=I+SILpdaklD1nPjFrbyup3l5FGQh83I5SA5ysnIaa0A=;
 b=SXR7ykepcqKtcqxug8pwWS4qDYQgiVif6gIZI+Z/zZU3ZwrdbaGxsg8Z8X1uy2KSv4
 zNOo0ZslzLHHi+krYJPWT/BRMkqh9hGb3ucOtBwrU7uqQNAac3hhOZ1OPPbk7wPP/Eu+
 cLOBzUdL+mVhYztXTPheqK8wC8zx0FBEYGw7GdDhPMUD+3N2G4RcTub+Lox6jgnpsNVr
 n+6KYMFxQltjY4kqnUfwUWv8yRLAlf/mW7t/SnNpuCda4SKviG4w/mDVb9T4b/qSKMup
 n2amY+7+hscpFJDYTKaW3qLG+VEFgbQVRaO3XsE5wom/lt0UtmYhgoMDvxjURQYMtUSU
 j7oQ==
X-Gm-Message-State: AOAM5309T5vWvpm4mQhP3h99zIUv0nYAkBxsrUmDpxRhETanu5VqcZhy
 8JeFTv2bQwTo7eirDO32jDi/Pg==
X-Google-Smtp-Source: ABdhPJzOp8D37bkZXDjS1Uo7hC4VwUY8cDMDiSXBoptYa0QYDocGCkJ3JP64uF5olLuF5mQNxBLvaA==
X-Received: by 2002:a37:52d7:: with SMTP id g206mr512242qkb.343.1612987169502; 
 Wed, 10 Feb 2021 11:59:29 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b07-927a-9541-aad2-0c20-3f85.res6.spectrum.com.
 [2603:6081:7b07:927a:9541:aad2:c20:3f85])
 by smtp.gmail.com with ESMTPSA id o194sm2189300qke.101.2021.02.10.11.59.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Feb 2021 11:59:28 -0800 (PST)
Date: Wed, 10 Feb 2021 14:59:26 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <20210210195926.GJ10169@bill-the-cat>
References: <20210209111438.1.If6218391a7cf47afdeda5e5e6c79937b4e8ab085@changeid>
 <804006bd-a6bc-0352-374d-6d2b33e42db9@denx.de>
 <a64dfb56-e43c-5adf-4c07-8935f900a47f@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <a64dfb56-e43c-5adf-4c07-8935f900a47f@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] usb: dwc2: change compatible st,
 stm32mp1-hsotg to st, stm32mp15-hsotg
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
Content-Type: multipart/mixed; boundary="===============1377356616261084964=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1377356616261084964==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2uAKP8+d/kqCgTv4"
Content-Disposition: inline


--2uAKP8+d/kqCgTv4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 08:51:26PM +0100, Patrick DELAUNAY wrote:
>=20
> On 2/9/21 11:39 AM, Marek Vasut wrote:
> > On 2/9/21 11:14 AM, Patrick Delaunay wrote:
> > Hi,
> >=20
> > [...]
> >=20
> > > diff --git a/drivers/usb/gadget/dwc2_udc_otg.c
> > > b/drivers/usb/gadget/dwc2_udc_otg.c
> > > index e3871e381e..ecac80fc11 100644
> > > --- a/drivers/usb/gadget/dwc2_udc_otg.c
> > > +++ b/drivers/usb/gadget/dwc2_udc_otg.c
> > > @@ -1176,7 +1176,7 @@ static int dwc2_udc_otg_remove(struct udevice
> > > *dev)
> > > =A0 static const struct udevice_id dwc2_udc_otg_ids[] =3D {
> > > =A0=A0=A0=A0=A0 { .compatible =3D "snps,dwc2" },
> > > =A0=A0=A0=A0=A0 { .compatible =3D "brcm,bcm2835-usb" },
> > > -=A0=A0=A0 { .compatible =3D "st,stm32mp1-hsotg",
> > > +=A0=A0=A0 { .compatible =3D "st,stm32mp15-hsotg",
> > > =A0=A0=A0=A0=A0=A0=A0 .data =3D (ulong)dwc2_set_stm32mp1_hsotg_params=
 },
> >=20
> > I have to point out the obvious, DT is ABI, this breaks ABI. However, do
> > we care about out-of-tree DTs here ?
>=20
>=20
> I know that the binding backward compatibility and "binary compatible" the
> is a key element of DT
>=20
> for the Linux kernel (for example the latest kernel image should work wit=
h a
> old device tree).

The way we use DTs in U-Boot we don't enforce ABI because we allow for
DTS and bindings to come in before they're fully stabilized in
linux-next/similar and then it's required to re-sync them once they are
final.

--=20
Tom

--2uAKP8+d/kqCgTv4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmAkOxgACgkQFHw5/5Y0
tyxWaAv7BaCz5jd3Za5hd1g5DWfXtZTzYdXh0quocqwPVdb/tVSEwER6sR65fciy
c4Y66cXA6UnM2uulA7SaT0N7EdiZC/6olHweWyCRQtUWt1ZIYogWx4+FPXYocT4b
dn1A7YLJI7sOXvQbLtVuJan9IeXbLqY9lIOwIyU0OCK6yhE49jgCRrYPNqPhrIpa
am0yKIF8wh7z7t+GnhSLlGpvKNOcqw+AqYz81baVx2ouSbiLkKggN+f6JcU4COw4
7H+BJljOsAVvzzdtWL9NTV1bk2AV3Pd0mXoMe26Xhpr8OBEC5kDAhbUzogNb9Bbh
Bdqp+SMqOv2KhLpPrZB1bGZ4pN/QWxdFiK3XGnQC2lLvPC8ZYOVIu/ro16ygyQ7M
6qgBS+RdEbSYEFJkl7YRIi6kViu4+bwYYo903hpsaTJuHI/O2ZIa16AgHdR4dMET
PIo9VsF6BToKV/LH0eKS92mZS6jSxvOtvqD/lT383xE22MtrPMFvGd/5uvY9yu9d
d7L/quKX
=FWQs
-----END PGP SIGNATURE-----

--2uAKP8+d/kqCgTv4--

--===============1377356616261084964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1377356616261084964==--
