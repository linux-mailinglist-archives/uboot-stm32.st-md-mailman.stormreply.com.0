Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1964A01C0
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Jan 2022 21:15:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF0B4C6046A;
	Fri, 28 Jan 2022 20:15:32 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C097C60468
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jan 2022 20:15:31 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id hu2so6894655qvb.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jan 2022 12:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6QOKksIhGav7CfkYlsOw7Hh4bOyFt/zxD6N6hF23E3g=;
 b=qW6nB/0JuZIahywpYCmBGANxqEX6eBxndtnEkUhZxDBlQtJGi5xJZCSasmE0wkseOI
 ejE6XDbmFx2QGOMYp+il7HP7TkY9/hft9PYIoIqsEQAcH7HGa8lRVd/Y6FQFYSEvXiqM
 1yF7olfw7cuClq8YmKSkEjLW1vbxCAfjwAlX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6QOKksIhGav7CfkYlsOw7Hh4bOyFt/zxD6N6hF23E3g=;
 b=xK2pdXs5/V8tD7qWRmt3/Fq7f6jt3OpImmcpfmB30lHeJUUH8r0VH7n+n8bvZ6Iyt+
 cL1EHVc7x/Qi9OO3l/VHUymoeghYgj1f80l/Kz+N+HsjmRF1MxXbKoatgt8wWpjRZTeY
 pSYySQGGpmyx73At4DDlad59LDsXn47MyLZVHmLxZDwOexGWNGtHV6qxgyczLytuDBFm
 IhcROQyDLyGZtnv2jpxVY0kjzDxqC4ourp7DxDfy0MzwYDTDkKwIgGE4WnZbw5Y/GHt4
 JzSFDFupa82F+sJZ1lfDI/QJQEP/CBmuVrv7JLMDZFDQTXjt1CK5mtI9txUE4/Zpu2Ef
 TmYQ==
X-Gm-Message-State: AOAM531wWmGjuyY2EXu3fk4Tn+FrBhPZTcDkkNlxsjFj/98Zpq5072Xk
 HRpB4biq7VNHZ/SazPvJTbGn0w==
X-Google-Smtp-Source: ABdhPJz3l+2fOf2eX6zTvbxtl8VI7FzdY+pcMNLqC6wWYNRjnGLt2r13UbVEtcepnYdCc6tnbk3o7A==
X-Received: by 2002:ad4:5949:: with SMTP id eo9mr8572642qvb.95.1643400930193; 
 Fri, 28 Jan 2022 12:15:30 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-2ef0-5dff-fedb-a8ba.res6.spectrum.com.
 [2603:6081:7b01:cbda:2ef0:5dff:fedb:a8ba])
 by smtp.gmail.com with ESMTPSA id d13sm3487898qtx.35.2022.01.28.12.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 12:15:29 -0800 (PST)
Date: Fri, 28 Jan 2022 15:15:28 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20220128201528.GL7515@bill-the-cat>
References: <20211013170053.1.I1158bd6d095c996f2dbd4b0aa9327e4eee202331@changeid>
MIME-Version: 1.0
In-Reply-To: <20211013170053.1.I1158bd6d095c996f2dbd4b0aa9327e4eee202331@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] dfu: handle short frame result of UPLOAD
 in state_dfu_idle
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
Content-Type: multipart/mixed; boundary="===============7076944127632694881=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7076944127632694881==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3h0UNLyY10zL13pE"
Content-Disposition: inline


--3h0UNLyY10zL13pE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 05:01:37PM +0200, Patrick Delaunay wrote:

> In DFU v1.1 specification [1] the DFU_UPLOAD (Short Frame)
> is handled only in dfuUPLOADIDLE state:
>=20
> - Figure A.1 Interface state transition diagram
>=20
> - the state description in chapter A.2
>=20
> A.2.3 State 2 dfuIDLE
>   on Receipt of the DFU_UPLOAD request,and bitCanUpload =3D 1
>   the Next State is dfuUPLOADIDLE
>=20
> A.2.10 State 9 dfuUPLOAD-IDLE
>   When the length of the data transferred by the device in response
>   to a DFU_UPLOAD request is less than wLength. (Short frame)
>   the Next State is dfuIDLE
>=20
> In current code, when an UPLOAD is completely performed after the first
> request (for example with wLength=3D200 and data read =3D 9), the DFU sta=
te
> stay at dfuUPLOADIDLE until receiving a DFU_UPLOAD or a DFU_ABORT request
> even it is unnecessary as the previous DFU_UPLOAD request already reached
> the EOF.
>=20
> This patch proposes to finish the DFU uploading (don't go to dfuUPLOADIDL=
E)
> and completes the control-read operation (go to DFU_STATE_dfuIDLE) when
> the first UPLOAD response has a short frame as an end of file (EOF)
> indicator even if it is not explicitly allowed in the DFU specification
> but this seems logical.
>=20
> [1] https://www.usb.org/sites/default/files/DFU_1.1.pdf
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--3h0UNLyY10zL13pE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmH0Tt8ACgkQFHw5/5Y0
tyyAiwv+Lbun7lMUL/ObifB6e5CicnOQSIEW5k8dri3PAjxgi2IVNJ1G/ooc6wPe
/TbxtnW7sfC05J9fc2Egs2rAiybZXmgbXXgOidkaZcTzvToKpOcMaRlyDyt3bEFy
s/F8clUoz9ienZ2OnX3imO+sHbt0Pav5hDPXT2HHP9E19XmtTfKXQGX5gOZLFSZW
ipLIS0HgbaG08talzN4B7zdwTzL++gFtQ3wmcVcnvJP4GLBUON9vBqnxBF4Q1mSs
uE3TCwfm5b7fBTJC1qMfP+a3aBFG1sa0nvJBX+dhH7ZrIrxY1DQUeSadodE9yU7b
0vJECahyNlFh64l8APfwTQUJYexhqOqGG3iLsYtpVOwlKgMPYAgLsZDOZuQt9htv
VsiAePHLY91vEEHcsGGIU0qxVHaAuFh53AVdFV9Ffn1OxyJCC/Q+nOT0brRRwQZG
qzQQPOPeDRdinGsYBmKCocivHDgV1oGfuwgAlJAEQhdyc/k/d0BW8oGNx5N9YbLE
/WChQR6q
=ysKS
-----END PGP SIGNATURE-----

--3h0UNLyY10zL13pE--

--===============7076944127632694881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7076944127632694881==--
