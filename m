Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CBA318B59
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Feb 2021 14:02:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6880DC57B56
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Feb 2021 13:02:42 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 867FEC57B52
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Feb 2021 13:02:40 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id p6so2454742qvm.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Feb 2021 05:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SIALxnhZQR2kyRKJUv/2+e5rXYLzxj0kDr2rjFwG7T4=;
 b=sHhw4GCeL55X1XKhgSGj8IvLaINUXmHj9Ls+4Msc04FtCHHNlQPNrYeF3zfmSoMeGS
 UpE/EOCF8kNo0CQuW+kXEG9xvcKhWel4tRdYGsyi8r7SdwBYkJKiSisXsLZVGWCeYKD2
 i5GAm+vTgUOOK/v715cNIotrHDw+7+4olRBro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SIALxnhZQR2kyRKJUv/2+e5rXYLzxj0kDr2rjFwG7T4=;
 b=X5r6WwpMR88L01GBVfQKDqZgIGIWMJfaHW6Sp8P3lNcrqJ+KnkFUcClC8zV6Wus8Cl
 yEWWvXh1zy+k/IVmup9G79e6vBidrXmWHyaGdcPVClrtfjLasGnekcXLi+5BsXO4GcDw
 D2+YSDJNCk4Dufldw7X39ZK3b079BL4aCVgJjDQLdj9eVjwd1F+gt6UphwIC/hTBOhI9
 g/L3k2XcTiikVsSixiNn8YFDaknD9clcvGqLW8/enpd9ymGiB67CbmwTIEqZWe80+fJe
 Re+9HoIK18vfAiIVU7cE/O5LMKJbKPFYtW92gulWd8LGklS2yP0QOOB4xPcneY+XQ+lo
 TI8Q==
X-Gm-Message-State: AOAM5322r8ULXg9s1gFv0TfQFGqKiNrwGK2yc2HHFHKVjPKWqWdB0JCp
 1VI8VsEswmjH/kpdOxVn686yGdDAiUku2w==
X-Google-Smtp-Source: ABdhPJxZEpUkRnorLnfWsMdd3dVjG7Fxj7xMD0qQ6GBwxWXM8zTJjTC9LW1c9OdhrrA8/+PPEriGqg==
X-Received: by 2002:a0c:eb49:: with SMTP id c9mr7499985qvq.37.1613048559253;
 Thu, 11 Feb 2021 05:02:39 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b07-927a-382b-bc08-eab7-1a26.res6.spectrum.com.
 [2603:6081:7b07:927a:382b:bc08:eab7:1a26])
 by smtp.gmail.com with ESMTPSA id d14sm3596218qtc.25.2021.02.11.05.02.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 11 Feb 2021 05:02:37 -0800 (PST)
Date: Thu, 11 Feb 2021 08:02:36 -0500
From: Tom Rini <trini@konsulko.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20210211130236.GR10169@bill-the-cat>
References: <20210209111438.1.If6218391a7cf47afdeda5e5e6c79937b4e8ab085@changeid>
 <804006bd-a6bc-0352-374d-6d2b33e42db9@denx.de>
 <a64dfb56-e43c-5adf-4c07-8935f900a47f@foss.st.com>
 <20210210195926.GJ10169@bill-the-cat>
 <f1d19f29-d07f-c345-a329-bd912e53ec23@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <f1d19f29-d07f-c345-a329-bd912e53ec23@pengutronix.de>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Marek Vasut <marex@denx.de>, uboot-stm32@st-md-mailman.stormreply.com,
 Lukasz Majewski <lukma@denx.de>, u-boot@lists.denx.de
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
Content-Type: multipart/mixed; boundary="===============8799251004639756453=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8799251004639756453==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kmDQSz8w3oz7gXp0"
Content-Disposition: inline


--kmDQSz8w3oz7gXp0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 12:14:51PM +0100, Ahmad Fatoum wrote:
> Hi,
>=20
> On 10.02.21 20:59, Tom Rini wrote:
> > On Tue, Feb 09, 2021 at 08:51:26PM +0100, Patrick DELAUNAY wrote:
> >>
> >> On 2/9/21 11:39 AM, Marek Vasut wrote:
> >>> On 2/9/21 11:14 AM, Patrick Delaunay wrote:
> >>> Hi,
> >>>
> >>> [...]
> >>>
> >>>> diff --git a/drivers/usb/gadget/dwc2_udc_otg.c
> >>>> b/drivers/usb/gadget/dwc2_udc_otg.c
> >>>> index e3871e381e..ecac80fc11 100644
> >>>> --- a/drivers/usb/gadget/dwc2_udc_otg.c
> >>>> +++ b/drivers/usb/gadget/dwc2_udc_otg.c
> >>>> @@ -1176,7 +1176,7 @@ static int dwc2_udc_otg_remove(struct udevice
> >>>> *dev)
> >>>> =A0 static const struct udevice_id dwc2_udc_otg_ids[] =3D {
> >>>> =A0=A0=A0=A0=A0 { .compatible =3D "snps,dwc2" },
> >>>> =A0=A0=A0=A0=A0 { .compatible =3D "brcm,bcm2835-usb" },
> >>>> -=A0=A0=A0 { .compatible =3D "st,stm32mp1-hsotg",
> >>>> +=A0=A0=A0 { .compatible =3D "st,stm32mp15-hsotg",
> >>>> =A0=A0=A0=A0=A0=A0=A0 .data =3D (ulong)dwc2_set_stm32mp1_hsotg_param=
s },
> >>>
> >>> I have to point out the obvious, DT is ABI, this breaks ABI. However,=
 do
> >>> we care about out-of-tree DTs here ?
> >>
> >>
> >> I know that the binding backward compatibility and "binary compatible"=
 the
> >> is a key element of DT
> >>
> >> for the Linux kernel (for example the latest kernel image should work =
with a
> >> old device tree).
> >=20
> > The way we use DTs in U-Boot we don't enforce ABI because we allow for
> > DTS and bindings to come in before they're fully stabilized in
> > linux-next/similar and then it's required to re-sync them once they are
> > final.
>=20
> I think platforms like the STM32MP1 should be handled specially, because
> they support having an external device tree passed from the FSBL at runti=
me.
> See https://github.com/trini/u-boot/blob/master/arch/arm/mach-stm32mp/boo=
t_params.c#L32
>=20
> @Patrick, wouldn't this change break booting newer U-Boot with older TF-A=
 in
> some configurations? Or is this reusing-fsbl-fdt feature unused?

The long stated policy of U-Boot is to allow non-final bindings to be
used until they're finalized in Linux in order to address the "chicken
and egg" problem, since it's already a terrible idea to go to production
with a Linux kernel that's using non-final bindings.  Any older TF-A
that doesn't work with this newer binding should be on a developer board
and they can just upgrade.  Linux says "DT is ABI" and allows the ABI to
break when there's a bug in the DT.  We don't say "DT is ABI" we say "we
use the Linux kernel binding".

--=20
Tom

--kmDQSz8w3oz7gXp0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmAlKugACgkQFHw5/5Y0
tyzo4Av/WnZHjhnxZoH0vURreJ6+/oFNC6aVS1OVxn4zi28czgkgcf1/EWZC0Tql
l2GzMciombjciw1CFbKpm94pg1ZdHUfOBhk2rkM1sEy79QhPZZ39d5mdup7hZ2qD
lx8TIbfGVPDTaZ5wXYZOQVASAj9HwWEexmA4UQhOSuzln+MKTi/DXHBXfuvI4TE3
pdlLn1OAC5ho4g8QHGC/6HXyEfTsfw0m+uoecw6K2KpFr1PgSVOWfp7wxSicDqiB
QXjvqaiRajbfVeQlVFwlrs20zNG4q8SjTu8X6PHqwIiREY64EowyyAd+m8S/f6pb
RstR6TB6BrzfXDe/eBOncdguD+HY0Dnqabnz/h7OQNfWAT0gg+cHMloi92svcqsk
Afi3jLruRxBbuqYdecXUfry66lgfbu5O4DM38LfHbVADkjm3fSZWTa3Fh/e8M8r1
vIcYua5gcNuSu5Pr9vux/E5VFwP+oFU+0ZYdV+ncwohfm+hfYA5iQ5Jd0ienMIBM
Z+UDgWe0
=xGCl
-----END PGP SIGNATURE-----

--kmDQSz8w3oz7gXp0--

--===============8799251004639756453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8799251004639756453==--
