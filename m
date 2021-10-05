Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07832423323
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Oct 2021 00:01:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B53DC5AB7C;
	Tue,  5 Oct 2021 22:01:48 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80136C5AB64
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Oct 2021 22:01:46 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id a20so613307qtp.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Oct 2021 15:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cRUQXYVBmZ4MmOuLFIri8yQX3NL9BL9G5Blbki/1+iQ=;
 b=EdiPQJYam1wcjpBDpyIb2AXLCjqt3ivuBgEPdI9E/4K3F378mPfER4Q8MXIYbAwHg2
 VQc3BJ29twmAuSvuOUdOY38NoUMqC7CuZFXQJSG7NqNqJuP9T87gWF9ff4lVD2cZwV07
 lSWbXJ7cAUpdRd1sI1XZgeqWWs/SYRLG6mwm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cRUQXYVBmZ4MmOuLFIri8yQX3NL9BL9G5Blbki/1+iQ=;
 b=1R6Rsbgf/BK1S0a8GSsTgbuG0cHFmuW2KuRkCFTCp3q3mYZmj54RAW9IvV0sq6twv4
 RIlFJrVs2sug1gidkskkkHiVqJ1xs2DSSssVWr7lNGf7OZGTT5tnrBhB81GyN2goxXjz
 Kmr6pjoG7yLyf6tLt9hKeqcObicEsyvzYTJhV3Hy2cQCI7IJmlafDVncAbdMv2Sr7wAD
 mp1VnU/SC1+TSqbNZI17nLiX2bIvmpV4+1M4xLjuqZq42WOs4zdXdXZpfnIcpAytwEY7
 Bq9yLbkPjvMMcIBnr6Biu3Uaboll3FGMgoJQbslotavS0C78hDDnWmfJixUClB2qgE6d
 gPIw==
X-Gm-Message-State: AOAM533sdmdTtXVYCst9ZvErTImLqah3fV3r85VexOyBkYd+Wu1PtXnW
 NM9wOraM1xRP5kBxwZaoZOPHtw==
X-Google-Smtp-Source: ABdhPJzj/WapWFrwqLpDxVfOSg8KmA+ar7D0cp76xLKQpVE36DyOKvN13eCJLFLTuOe4Nz2Em+G3dg==
X-Received: by 2002:ac8:7458:: with SMTP id h24mr4705853qtr.355.1633471305405; 
 Tue, 05 Oct 2021 15:01:45 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-acff-2c31-c6db-812f.res6.spectrum.com.
 [2603:6081:7b01:cbda:acff:2c31:c6db:812f])
 by smtp.gmail.com with ESMTPSA id p190sm10085859qkf.15.2021.10.05.15.01.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 05 Oct 2021 15:01:44 -0700 (PDT)
Date: Tue, 5 Oct 2021 18:01:41 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20211005220141.GA31748@bill-the-cat>
References: <20210902115512.1.I1c6536da7609f8240549cccae2708e075dc9fcf3@changeid>
MIME-Version: 1.0
In-Reply-To: <20210902115512.1.I1c6536da7609f8240549cccae2708e075dc9fcf3@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <royger@FreeBSD.org>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>, Stefan Roese <sr@denx.de>,
 Samuel Holland <samuel@sholland.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 "Alex G ." <mr.nuke.me@gmail.com>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>,
 Bin Meng <bmeng.cn@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Simon Glass <sjg@chromium.org>, Tero Kristo <t-kristo@ti.com>,
 Michael Walle <michael@walle.cc>, Ovidiu Panait <ovidiu.panait@windriver.com>,
 etienne.carriere@linaro.org, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 1/2] lib: optee: remove the duplicate
	CONFIG_OPTEE
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
Content-Type: multipart/mixed; boundary="===============2483833030848354677=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2483833030848354677==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KfXI8UIjd/jaDaxZ"
Content-Disposition: inline


--KfXI8UIjd/jaDaxZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 02, 2021 at 11:56:16AM +0200, Patrick Delaunay wrote:

> The configuration CONFIG_OPTEE is defined 2 times:
> 1- in lib/optee/Kconfig for support of OPTEE images loaded by bootm comma=
nd
> 2- in drivers/tee/optee/Kconfig for support of OP-TEE driver.
>=20
> It is abnormal to have the same CONFIG define for 2 purpose;
> and it is difficult to managed correctly their dependencies.
>=20
> Moreover CONFIG_SPL_OPTEE is defined in common/spl/Kconfig
> to manage OPTEE image load in SPL.
>=20
> This definition causes an issue with the macro CONFIG_IS_ENABLED(OPTEE)
> to test the availability of the OP-TEE driver.
>=20
> This patch cleans the configuration dependency with:
> - CONFIG_OPTEE_IMAGE (renamed) =3D> support of OP-TEE image in U-Boot
> - CONFIG_SPL_OPTEE_IMAGE (renamed) =3D> support of OP-TEE image in SPL
> - CONFIG_OPTEE (same) =3D> support of OP-TEE driver in U-Boot
> - CONFIG_OPTEE_LIB (new) =3D> support of OP-TEE library
>=20
> After this patch, the macro have the correct behavior:
> - CONFIG_IS_ENABLED(OPTEE_IMAGE) =3D> Load of OP-TEE image is supported
> - CONFIG_IS_ENABLED(OPTEE) =3D> OP-TEE driver is supported
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--KfXI8UIjd/jaDaxZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFcy0IACgkQFHw5/5Y0
tywRLgv/W5yOzO6cebcBAc0BETufmNQv3z4jMpPxJrmsrsrsC+ipQMJsiaGY9iyW
+S1D850Tn28fOgQ6uFWj8XLOgbQF7CtPskGBX2fzBCKl6VOg1zdl1E0GAgRpiEMU
lyNh/D/Mgv7jg1DeAqXuv4FDNKM4kR8kFvO0ym4/ySRDtesHypEFLTcp1rV3AFOq
E141QbMwRBxFAHv29Ox9dVJuShS+F9F8DOJmeC8vz9nzmBM49eco4/8sxsIU8fH+
BDZQ64nsItJ+GRV0uXyM6GtQz+zCvtY4VOyNfDIik7YCozX/Our/A1XyVHRVSgne
xxnwF8FOcftaoZAqirHvwzz25lE0/PU40kSI+RGdvH8i5OeR/GCdVC+3HjQWdxsd
3tmn7zSbQzr0XGzit4y47aMCI7Vvue+s9yOkfDgFZR6FtXpHd8y6+PwRRxXhXrF6
fTUH15jxjYnVULx2rj3nixH5Fqzr54IJ4SdKSfpGtIarMbdzhi5lFzr9I69YqD93
b02/6o4Q
=2xdk
-----END PGP SIGNATURE-----

--KfXI8UIjd/jaDaxZ--

--===============2483833030848354677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2483833030848354677==--
