Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A10F35FCB5A
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Oct 2022 21:14:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4ED03C0D2BF;
	Wed, 12 Oct 2022 19:14:23 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90BC7C03FD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 19:14:21 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id o67so11065777qvo.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 12:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=343VWZjqiHj5FtmAZCQzIEBlHA621+v+n/ieSx6cQGM=;
 b=VbwLFLxyTd3gX6FbENayL8eAG4t1cOCadH1NTZHA/OXGVPEj45QdS8JaO5/SbcGsCo
 jGPeD+82wPqelpPHR2Q+OkuPZVImSW2diWa8kq6UqCBgZKIiaSR0HYn41X6p/8UXUT7Z
 iBDC7PoRj5QmA8MWy7ECoj4YOWradGDYF2PLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=343VWZjqiHj5FtmAZCQzIEBlHA621+v+n/ieSx6cQGM=;
 b=nluK3HluR0oEI/SEwFokSH3v9kV6DE1KN6mBP/33PycuR7j1F0BcWPPo2DhouT9cf0
 8aNMX1X6wWSzayiptNSIobkLdoTDaKTHSUTS0jk/VWt5j/OuciJSwugXmtOYsAXGDS3x
 LBLJEWydNDoBPoCTW4Cm8kjFtKRPgjl2MLODBfeeQr3rftO+Y8JZ0Q0iNUoB+v0Xz53y
 MOLpdlUTq4evMI/MIy+dPAy16DtTulS0WI4tX0VyyWVWLm1z0JMBKkIUA49IFFouLGgH
 6yuo7vt9u6mV6C9dPMODI++gC5rfJWRni8KAo3syKKzkfROOKkcfWgHX+gTHr3ffQRNZ
 judw==
X-Gm-Message-State: ACrzQf0usKJjGm8gjGfblIifGgDXUlx5bAiJ6y47DepAmMV8AavcFINH
 NVevAKA1j8BfSx8/H3idD9otJmXUu+R10A==
X-Google-Smtp-Source: AMsMyM58eNnb/Hp5KT4j3uZrChShQJTnUJI81iqI+TdJJ1ybNrsb4PZmFyGxt76J5tRuAx1R3ssgLA==
X-Received: by 2002:a0c:9064:0:b0:4ad:5294:b224 with SMTP id
 o91-20020a0c9064000000b004ad5294b224mr24312988qvo.39.1665602060488; 
 Wed, 12 Oct 2022 12:14:20 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-295e-6c71-581f-29f1.res6.spectrum.com.
 [2603:6081:7b00:6400:295e:6c71:581f:29f1])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05622a08c700b0035a6f972f84sm13022005qte.62.2022.10.12.12.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 12:14:20 -0700 (PDT)
Date: Wed, 12 Oct 2022 15:14:18 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20221012191418.GA2020586@bill-the-cat>
References: <20220930093635.1.I38e66d79350b381b6059a6a80ce60c62f01f3894@changeid>
MIME-Version: 1.0
In-Reply-To: <20220930093635.1.I38e66d79350b381b6059a6a80ce60c62f01f3894@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Etienne CARRIERE <etienne.carriere@linaro.org>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] firmware: scmi: fix the multi channel
	support with CCF
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
Content-Type: multipart/mixed; boundary="===============0843803311962428754=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0843803311962428754==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0+/s3RgBAfRJTJO/"
Content-Disposition: inline


--0+/s3RgBAfRJTJO/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2022 at 09:36:38AM +0200, Patrick Delaunay wrote:

> When the CCF is activated, the dev->parent is not necessary
> the reference to SCMI transport and the function devm_scmi_of_get_channel
> failed for the registered SCMI clock, child for protocol@14,
> the channel is null and the SCMI clock driver crash for any operations.
>=20
> This patch changes the first parameter of the ops of_get_channel(),
> aligned with other process_msg() to pass directly the good reference,
> i.e. parent result of find_scmi_transport_device(dev)
> which return the reference of the scmi transport device.
>=20
> Fixes: 8e96801aa6a ("firmware: scmi: add multi-channel support")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--0+/s3RgBAfRJTJO/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmNHEgoACgkQFHw5/5Y0
tyxtLgv/Tt/x8cPfn2vI/HPqX/pFgxyAotNfGpu6HfcRtcYM10sQHDhC78ZIols9
kyRfxtHgQl7edeFf4kxTfT62GzT/fyQTLZSkG9YXszU3GkpnZYYfLNg7yDg5sqdh
2V5wtcYXG20+oPNra4Sjfotm6+Xx+GPsClmBXNn73SJ30LNWNMt+JjpNLfxrrEc4
ZhnCUpMPdOZFKO/Tus5vl2lpeQjzR725m1VNrhgPexus74jJPi6PtbJMD+Mb4z7U
Az784jytBMLQVbxH1bd/GVZvrCaWLDo1dOye73cYZHWHknQMW38nOFmepm1nfWEG
l3lBw0VXriI2AYCCa13vq7Yuk0jLY0g6yUpAFVtaZn/SbTnFWW4Y7lxxP9ykwcGc
rGrRp1tJjYjiB4s2INOvECuv6UjDMc/spn9zXM6EtZ5M9yT+jvkqOF8z8PAxwa8Y
H9Tj9kkvIuzEwBQbRhQBE6KZ7yVWENrO98F2VfiFZFVXcmJuGgn9D2zAGAxK1l3i
0bFNsFfc
=d9Ir
-----END PGP SIGNATURE-----

--0+/s3RgBAfRJTJO/--

--===============0843803311962428754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0843803311962428754==--
