Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1BD3FEE74
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Sep 2021 15:12:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86271C57B53;
	Thu,  2 Sep 2021 13:12:44 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 553BEC57B51
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Sep 2021 13:12:43 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id 22so1937843qkg.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Sep 2021 06:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pHg0/J3aNWOrPZ9Q/3n4Me7aT23swOhQTE5EnaYZdZY=;
 b=Wj6y75J9ygvB25Dw0Re8Wbsawx/Q+qHP4X8+rQjFLWxX7BvMnv6LY5REvsdeQ6PNbt
 rp7ly6W9UXPLefBJyEkuADxuMaHl5nJ2JXxRJOEMLxOD1/fQ8KZOBF45CO2VDjq0F+aY
 wZUMkjJfrrsw3HyeiWe2InUCa5hco5NwxqAE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pHg0/J3aNWOrPZ9Q/3n4Me7aT23swOhQTE5EnaYZdZY=;
 b=Yeb0Ul4PvVWLhrxxrfUNba2Xc9J01EUis06IOkOLvPiTdOl3n5v7qFZ+WyFOEpcLN/
 sOVV9Iyuz6bmPoAhwahZPUlM96rpV81FWuIBsWQ775qYlW2ThHyf8jK9fzBLU05uw/In
 d96LGXNY0U90fHrOzj4EALCVICN4pTjtDKd8rf0TkIM8J0XScasJbUVqFn04d1ltyX7Y
 1AEZTCDhU0nXqL6HurpSpo/j+aYfA5wy7Pm9PsZXCKJCL4MABUwWqCRxetmWC7Kop2pt
 vQsr0+2JpCX3Ux4pw33vfBYyA15X9AW9tvnRiUROIbZHuryvBwhZ0IER0HRCrWOu72km
 j87g==
X-Gm-Message-State: AOAM5316PSrPq1oFO9QHy9nvvKAUf9xRnSjZBrmPYxtOz2IS6yH6xHX3
 H8+1TVVMuO/1rqpzAkt2AhLH6g==
X-Google-Smtp-Source: ABdhPJyEKb/KhWS+xoW7wHXUls9UMuE9zDGqOQAfFXob/LeTWQdV8TV6+Ntl4XdIc/+Fjvwek6KZLQ==
X-Received: by 2002:a05:620a:3ce:: with SMTP id
 r14mr3014097qkm.228.1630588362218; 
 Thu, 02 Sep 2021 06:12:42 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-95b1-4c42-35f4-d991.res6.spectrum.com.
 [2603:6081:7b01:cbda:95b1:4c42:35f4:d991])
 by smtp.gmail.com with ESMTPSA id p15sm1009308qti.70.2021.09.02.06.12.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Sep 2021 06:12:41 -0700 (PDT)
Date: Thu, 2 Sep 2021 09:12:39 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210902131239.GV858@bill-the-cat>
References: <20210902120202.1.If7ddbb0eecde3d5db357ef27cb0833abbdacd362@changeid>
MIME-Version: 1.0
In-Reply-To: <20210902120202.1.If7ddbb0eecde3d5db357ef27cb0833abbdacd362@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>,
 Jean-Philippe ROMAIN <jean-philippe.romain@st.com>,
 Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 dillon min <dillon.minfei@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] arm: stm32: Disable ATAGs support
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
Content-Type: multipart/mixed; boundary="===============4170005858971186293=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4170005858971186293==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YeKJDHLGyKnnNtke"
Content-Disposition: inline


--YeKJDHLGyKnnNtke
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 02, 2021 at 12:02:06PM +0200, Patrick Delaunay wrote:

> These platforms never had to support an ATAGs-based Linux Kernel, so
> remove the options.
>=20
> Cc: Marek Vasut <marex@denx.de>
> Signed-off-by: Tom Rini <trini@konsulko.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> Hi,
>=20
> this patch is a rebased version of the STM32 part [1] of Tom's patchset [=
2].
>=20
> I also update the new file include/configs/stm32h750-art-pi.h
>=20
> [1] [13/13] arm: stm32: Disable ATAGs support
> https://patchwork.ozlabs.org/project/uboot/patch/20210204022415.20589-13-=
trini@konsulko.com/
>=20
> [2] arm: nanopi2: Remove unused code
>     https://patchwork.ozlabs.org/project/uboot/list/?series=3D227910&stat=
e=3D*

Note that I've posted
https://patchwork.ozlabs.org/project/uboot/list/?series=3D260161&state=3D*
recently and that includes this change.  2/2 of this series is good to
see.

--=20
Tom

--YeKJDHLGyKnnNtke
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmEwzcAACgkQFHw5/5Y0
tyxJ2wv/XtxGeK8f6wqUoCwtUGfn5nVLviBqo5YJOEnCzLT4BdpMIVXTPEoVi0Lx
w1p7U5tHXecbmF7QhyerJg20wVQzywmzc1oA5zkorAkPPM8q7FZ01epxHT8gNCph
/Y91eCwEGvso5CipH9RbT2+eedMipciqgNCllGSY2C8qCsOc/91yOWuWcrCD5awP
dkQitvfMAPaRtbbhhctFgJZQi83P0jfBv+5X73U6TIhCF0bZx/dzT1jkN7lKMpe3
xehJR23aSWtEmbtBxph40m/OaCLjS217O9R3ORQ3Kfldt3HTED/Uc5cfKWt20mAL
DhhyD9mNqa4lyVFyvHR3JylP6EqF3gJouiEPHCpFl/WD4R1diFJFPsY1944n7qVO
hYC9GaDbvG19AJ6AtNs96cupuiwvAA9gelYfEP0vj1WFXlmEDWAbx0cMENcDqNSJ
a0p6yzUrJCgyIt1jWKpvsSOPENsge/Xe8CJbDtH1h/wba9jKV4UN32CLKO5lmlz1
W5MyQ2DX
=ml7i
-----END PGP SIGNATURE-----

--YeKJDHLGyKnnNtke--

--===============4170005858971186293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4170005858971186293==--
