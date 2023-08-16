Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF62677EBB8
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Aug 2023 23:26:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90C92C6B45E;
	Wed, 16 Aug 2023 21:26:58 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14FDAC6907A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 21:26:57 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-583d702129cso75892937b3.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 14:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1692221217; x=1692826017;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Gfl06WBoNAt1/TMaI/6s/8GxNEJ8pbLwOZscO53178w=;
 b=qGDlLCvUij9WFZzaziqHhGER3P/899GwaROH2VRSniMALMdfkHBwY/pVJaQZVQVF2O
 WTdwtuyO/g5s0wX1rvg7UbaiKh/7lnQz4Zgt9jvscgpZkbCtvExpgHlC0us345dv0AtC
 fIHKP9keWc/ZHW1j0x+VYBeyshSR2x8ln0XNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692221217; x=1692826017;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gfl06WBoNAt1/TMaI/6s/8GxNEJ8pbLwOZscO53178w=;
 b=PdKhSE14/fUtFBDU2xKiIjTnlwhlpMDhC/8VIMI+/j2mnilXLTwHSf+hmw1F9HxtrK
 pmPvqZW6r4BnbufksXSNVFFQpxdGnPSu48kVadlIDIiJnOJDPrxWxzAXEAdVz4KwFljO
 vXnNp8TSlxdukOcO2r9R8xNGb8k0FKhyUQC6Tvp0gaHFcnLNCp1nG9frr3xjGXZ8CuwK
 g3pfoU43nGJGx1FUnIZaDIZ+EXUs1oMZuzoGfqgKw2nz46Yw4hJrHbJv2h1jsCLui1WP
 ZWOR6lqq4yTX7txqFzHa8IlTyP4w/XeRnW0SROROuT52jpcaWnVgZEDLuaid6D+IhuDy
 jTug==
X-Gm-Message-State: AOJu0YxB5wupwAWusC1Hw4LiJdLPxHZJaUQ60q1COabj+13YPUTAW0QZ
 O/tTg6v98KKVs7NlSxj4rILKHw==
X-Google-Smtp-Source: AGHT+IEUczMRNI3jcIdaYfVpP/bhWIfj+ZUhojlKJglb1Kp4PPQUzDGeVW9v4/bvq9j5MNtnXMK+Bg==
X-Received: by 2002:a81:a1d7:0:b0:583:f5fe:d73e with SMTP id
 y206-20020a81a1d7000000b00583f5fed73emr3011277ywg.30.1692221216932; 
 Wed, 16 Aug 2023 14:26:56 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-83d6-b858-ec94-88d9.res6.spectrum.com.
 [2603:6081:7b00:6400:83d6:b858:ec94:88d9])
 by smtp.gmail.com with ESMTPSA id
 r69-20020a0de848000000b00589a5bbeb43sm4217871ywe.117.2023.08.16.14.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 14:26:56 -0700 (PDT)
Date: Wed, 16 Aug 2023 17:26:54 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <20230816212654.GB1515023@bill-the-cat>
References: <2eff3bb2-ebbd-b71e-3707-c3ae29419bfa@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <2eff3bb2-ebbd-b71e-3707-c3ae29419bfa@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marex@denx.de>, Valentin Caron <valentin.caron@foss.st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request for u-boot master / v2023.10
 = u-boot-stm32_20230816
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
Content-Type: multipart/mixed; boundary="===============4585932251187066869=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4585932251187066869==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B8Z+1ZtNwFqOMHWf"
Content-Disposition: inline


--B8Z+1ZtNwFqOMHWf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2023 at 05:07:31PM +0200, Patrice CHOTARD wrote:

> Hi Tom
>=20
> Please pull the STM32 related fixes for u-boot/master, v2023.10: u-boot-s=
tm32-20230816
>=20
> CI status: https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipeline=
s/17388
>=20
> The following changes since commit 9b54b0e37b72aa9bfff09cbbe13465abfa143f=
84:
>=20
>   Merge tag 'efi-2023-10-rc3' of https://source.denx.de/u-boot/custodians=
/u-boot-efi (2023-08-15 13:08:17 -0400)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm=
32-20230816
>=20
> for you to fetch changes up to 9e8cbea1a74516235820ccd50d513c961e43cb70:
>=20
>   serial: stm32: extend TC timeout (2023-08-16 15:38:23 +0200)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--B8Z+1ZtNwFqOMHWf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmTdPx4ACgkQFHw5/5Y0
tyzrkAv+Iv7/cvM9DUnfnl7KHIsc92X8E6+/4uyadwR2FQHpIvy/JkSO9WsZCvFj
9TyhMBfQUMbaAWprGeY7PCdvFQn8NXtExUnQXxih80JegnhNRewGzWZC70S8zaaK
MFcUMvbxkSetT4L5Uuu6h2PH7YayWrSOjZO114+GtDjnYmuk30QNYXfwhnvU4COR
C9nN3Yfi2cNO61lShHLsfqnS371SWWfzD9qlldqr+BgLQrytGdKcEWIgCgBVKf0l
LGDr8XeMsxLD4I+/n4OTgLXBew/CqERkvZBW1ASFNZ0I0ddpDOjpxEXQeKh8Sy/J
1XpaCt6zQD+KOjcltgjBI2giS9DbD87tSl7ZteIYaCFNtWvtdsO7MQNNGoHyjqU0
JRthXvWr+i626VifhxgQlYUPPXHpdYxEcJeNW/9hOxXTqiR9+UA2B3kGBDLc/CtV
FbgogoA8shbRwmezMgz0Yef5kATRVL8SgbypDwkMtEMhcTpigQ6vuqytWODELR0B
dV/ON4n8
=lM4n
-----END PGP SIGNATURE-----

--B8Z+1ZtNwFqOMHWf--

--===============4585932251187066869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4585932251187066869==--
