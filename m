Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D83466353
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Dec 2021 13:14:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 666D7C5F1D4;
	Thu,  2 Dec 2021 12:14:52 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 063A4C5719E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Dec 2021 12:14:51 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id m25so27195579qtq.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Dec 2021 04:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aenpfGlafcZkjzbKSfvo+X+Soim/JCI2tOQIOccKGzM=;
 b=knQ0f2x6d7AYk34uja/A5+nVtp3Ex7eb+dsqSDrlsj/1rg4kjFRV6VM8hQJ5U0my/7
 lTUHIvHwnE9TosMteHllxjA9P6Gx55dA34YlDw6cGpChQ+iV1W7GvdtvuL7K9zI9iiIL
 BrmyS1VylKdf0XJApBt6/Sf23HJLJc2pX4gWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aenpfGlafcZkjzbKSfvo+X+Soim/JCI2tOQIOccKGzM=;
 b=abvTXiYmc/9o5MFhtaTRMRpV4sZdcCY0p2QEdklSyuJuJnKW6QvJ1hQTx4+LvujU9p
 PnSWDNJiAit0LznWzRo8qF4hjERx9sBGbl55WBMCGDCf+OTPNlLIEULaATvd1FNH0E2L
 5NRhglse5Ac32nTVwRnZsfRbDvPb+7ccxQ1qdkILwgSjghZ5VMzeVxAxcMEfycHKH063
 cg+vvtIWZiieTZiXuh8mSTPg7ajPV7NsrElznichV3C9li+xh+79RY2rUzLWn8xG+Ssj
 sqhjfAB5SQrn/58xAo+i6N8hzUSdYW4hxa3DuA9XL/qKUjGLvfAYAMC5XvhDlQbDjBpw
 XczA==
X-Gm-Message-State: AOAM532odolMECXtnRxY1kcB7N9DJo3HjX5dOAfWEvnzxNkcWXqd30Gp
 3NDpDj753+5ufYb4gpHS4FCBzw==
X-Google-Smtp-Source: ABdhPJxsih5U5aitTzTnbrBqEjOpCoMhNhgiSTLVMRyqtdgGOapf4NP84p2pgqfBdNqwuil2tx1NRw==
X-Received: by 2002:a05:622a:5c7:: with SMTP id
 d7mr13305180qtb.202.1638447290113; 
 Thu, 02 Dec 2021 04:14:50 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-c825-72b9-4e49-4490.res6.spectrum.com.
 [2603:6081:7b01:cbda:c825:72b9:4e49:4490])
 by smtp.gmail.com with ESMTPSA id f1sm1462221qtf.74.2021.12.02.04.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 04:14:49 -0800 (PST)
Date: Thu, 2 Dec 2021 07:14:47 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20211202121447.GQ1220664@bill-the-cat>
References: <20211119090227.126391-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20211119090227.126391-1-patrick.delaunay@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [RESEND PATCH 1/2] pinctrl: change result for
	unsupported API
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
Content-Type: multipart/mixed; boundary="===============3127640475118660331=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3127640475118660331==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f9b3biUB1f7FHqGn"
Content-Disposition: inline


--f9b3biUB1f7FHqGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 19, 2021 at 10:02:26AM +0100, Patrick Delaunay wrote:

> Use the return value ENOSYS for unsupported API
> - pinctrl_generic_set_state
> - pinctrl_select_state
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/next, thanks!

--=20
Tom

--f9b3biUB1f7FHqGn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmGouLcACgkQFHw5/5Y0
tyznWQv7BOzD7LvhvDkbyN+/z15/HzQAxFrkTb2+3XprWa/OnrlechSzUpDh3IDD
PEaQ9cTzbl39ywaUMEl8SuyHDDkimTnnVuBvPIiRgWX3+Nzf9HN0LDA0JfhE/vCE
H1XlxscVqPjSdcrQmUzOvWd0x/Ppbme2eXdaKKsdGmQX7u5DOUCcrxLtnDoB8dOe
xoC89nDE58+al5e1wPqabkpbULC6Hm61ktPm1wf43iYxcKJ2stpTDOW7xqpE4IL+
Qan4s3PySTav36M20ov1oDxrZvFg7G4i1gwD7cZlyEYVRnDu9N4xOUZtUBAXJumC
AtownOpRoVFBPqW3NBAN0j5LcWdUBunIobV6hNi03qyDAVoJszvdWWXBla1cJ6yR
xOPpV1Cdg9w5aYtF5hivhbZjKCe9yKm/d+ve9T2GADMJn9U0GGW3lbBOeN4uRvg6
RoRhHBXYNAEm3CqjRPOCKoH1eHPUHLrfrMIo2XpJWZ1aHnVFR9yNJ/t8GY1d5QWj
7qMUpq2F
=nTXN
-----END PGP SIGNATURE-----

--f9b3biUB1f7FHqGn--

--===============3127640475118660331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3127640475118660331==--
