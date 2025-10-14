Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A8BBD9F94
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Oct 2025 16:22:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EC9BC56603;
	Tue, 14 Oct 2025 14:22:52 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5914DC5558C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Oct 2025 14:22:50 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-43f715fb44cso3166174b6e.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Oct 2025 07:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1760451769; x=1761056569;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wEctA2w32PuSWWYU82c3qHcdGNcSRYtbljYtH4SLUwo=;
 b=QxXK366aHE5TOOcLyQGog65Hp6ljgUBZKUay+QXNB6uT3PO8usGGWQ/TQukO8TQGPi
 CAECE5+V8Iu/6qvRlcHTY+k7QaTuxb5vKlnTzOqmvluS3hWkPzZ322suHEZa+0kgKL3h
 olVU5O2b+Fk4mCR9J/bbWSMXGK7ILbdkF1+6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760451769; x=1761056569;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wEctA2w32PuSWWYU82c3qHcdGNcSRYtbljYtH4SLUwo=;
 b=qQ6ohDfTrfZTLvpvPF0WbOCErlx6KlREy7Tcw7EPbO06pQ/4yyiOuoNE5vgkbK1tu+
 nWjc7ALOvirKTaERa6mCUcPlD3DSpO9+HKD/RXkWYjqCEyNg/8zrmpjcyfqC0HDxWzXk
 jS6ZYfuMIvv4jsMh5rZOf2KDlKrGvcElBlj5mAQpBrQc1sSY4FxBG0Vs5I9V6uCpGigW
 N1+pyVuCbKPJLn5GmVviiEeSXdjM8e5VEjo3fqWk1kDCtCmKnDOxKRrnQY39/HFjhRVQ
 GzSvn3yQjeO6cUGMvDdcdoAvI/EVxP0DacLUbrJxIX43/vvXmfea8rKR5GIFTMw/Hl3A
 7qmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAfUBB5XyRnfBKHPmVsB0mgPkAS+Hr5KKIJbJxeNd+4PVnxj9t2hqUw5mfDoCHMpbrKGPl/x7heBw61w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzhSTHHvIRE+NA+dGzpIC3HG2w86gmGRvLqIjD4x0eKHRxrwJ2S
 tli02+bUVJ149aTJEI6ZkUaM46/pNRNwXNSZmCrAF9GPeSF+rOl8gLR4x2IxVvhH5gY=
X-Gm-Gg: ASbGncsAdMD/u5daLey29NyXZkiXOZUQG5jEl5ggCEj0WBi0oKdnWAGOqu4Fy1Hon2X
 +BZ2wSG4ho4yLlzFxtqJnWCnEHtuTLZXVZ+lo3x4ROEptdcijHDELZo01sM8Y9it/8IaHRXoeiI
 ldH/Y1kqTAn8CcqfUByKnYv8/qE9LSkzLpDPddwi/gSnDHZDslxZePaL9yoHovI4zbmU1Q2a+Dx
 O/w9LNMDg9jlfAXCq7qHQvVQcmfpDBroAeVlgpS7aPv4iGM8ZdwrksUQJDO+PadL9pdnrBeNrn0
 07rTFvFFbhCpLoVQSp9STcYbxckv6TNNtLZB9Hi1ZHjDiI5fbNkv4kKLzZuqmOH21Qfso5rtccr
 zUWQzlskwFneXJY1wXg3knQsRDA7sGQeLCxTnoseyilEM541OBZAn+SE3dKMzx2KQOUffUWsZwz
 YJA01QTKgLwSp5oQ4=
X-Google-Smtp-Source: AGHT+IEO4yXH3btx6YtaIrGCEzO2V4az5eDsxsBzdNQFztf7auFgMO+dkcNe3IwJed1xSvF+yIDYJg==
X-Received: by 2002:a05:6808:5290:b0:437:dade:463f with SMTP id
 5614622812f47-4417b3dae8bmr11498957b6e.34.1760451768924; 
 Tue, 14 Oct 2025 07:22:48 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-106-235.totalplay.net.
 [189.203.106.235]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4419887fd8bsm3320246b6e.2.2025.10.14.07.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 07:22:48 -0700 (PDT)
Date: Tue, 14 Oct 2025 08:22:45 -0600
From: Tom Rini <trini@konsulko.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Message-ID: <20251014142245.GN6113@bill-the-cat>
References: <20251013-imx-rproc-v1-0-fb43a3fafcd0@nxp.com>
 <20251013-imx-rproc-v1-6-fb43a3fafcd0@nxp.com>
 <20251013155546.GJ6113@bill-the-cat>
 <20251014015037.GA31468@nxa18884-linux.ap.freescale.net>
MIME-Version: 1.0
In-Reply-To: <20251014015037.GA31468@nxa18884-linux.ap.freescale.net>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
 Udit Kumar <u-kumar1@ti.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Ryan Eatmon <reatmon@ti.com>,
 Andrew Davis <afd@ti.com>, u-boot@lists.denx.de,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Hari Nagalla <hnagalla@ti.com>,
 Fabio Estevam <festevam@gmail.com>, Stefano Babic <sbabic@nabladev.com>
Subject: Re: [Uboot-stm32] [PATCH 06/11] arm: dts: imx8m: Add remoteproc node
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
Content-Type: multipart/mixed; boundary="===============6280153845917377459=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6280153845917377459==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sxPSYHK7ToevmQhX"
Content-Disposition: inline


--sxPSYHK7ToevmQhX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 09:50:37AM +0800, Peng Fan wrote:
> Hi Tom,
>=20
> On Mon, Oct 13, 2025 at 09:55:46AM -0600, Tom Rini wrote:
> >On Mon, Oct 13, 2025 at 10:49:25AM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >>=20
> >> Add CM7/4 nodes for i.MX8MQ/M/N/P.
> >>=20
> >> Reviewed-by: Ye Li <ye.li@nxp.com>
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> >>  arch/arm/dts/imx8mm-u-boot.dtsi | 4 ++++
> >>  arch/arm/dts/imx8mn-u-boot.dtsi | 4 ++++
> >>  arch/arm/dts/imx8mp-u-boot.dtsi | 4 ++++
> >>  arch/arm/dts/imx8mq-u-boot.dtsi | 4 ++++
> >>  4 files changed, 16 insertions(+)
> >
> >Why is this in the u-boot.dtsi? We have
>=20
> I am preparing the Linux dts patches and will send out for reviewing.
> Before those lands into Linux dts, we need that in imx8m*-u-boot.dtsi.
> After linux side done, we could clean up the imx8m*-u-boot.dtsi
>=20
> >dts/upstream/Bindings/remoteproc/fsl,imx-rproc.yaml and so your updates
> >here should be compatible with that, yes?
>=20
> Yes. Per the dt-bindings, only compatible is required and that is what
> this patch added.

OK, thanks.

--=20
Tom

--sxPSYHK7ToevmQhX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaO5ctQAKCRAr4qD1Cr/k
ChkfAP9vI0N2x92olno4Rl/jM5lq5dysXJzNscQfBDyTWnRDBQD/W32QcDdXcJz7
j7IViYMlPNrfFox1W111yOB7BbTFDA0=
=rltC
-----END PGP SIGNATURE-----

--sxPSYHK7ToevmQhX--

--===============6280153845917377459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6280153845917377459==--
