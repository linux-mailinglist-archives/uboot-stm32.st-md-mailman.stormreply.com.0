Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A62E01158C3
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Dec 2019 22:48:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 706DAC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Dec 2019 21:48:22 +0000 (UTC)
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
 [209.85.219.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C848C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2019 21:48:20 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id i3so3548743ybe.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Dec 2019 13:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gAAbJ9mg+EyLWxY0U7MINrLQmGhGuQyh1s7BNWxK5kY=;
 b=hchPd4vprRpaBBaliDm6ZNEY8HZNmJQLyJxyTN20eTNcqZS0uIkNXfIVHSuyjX7Xok
 6nGCrF6GE+ES+ihls4LxMlZjsg8L+lLp10ZQ6R7QSDWB1X38l7hygu2lPsaqGAZFrTAF
 zh9gTdvRsRROiojS0HDf03wo027GbuSPdPhBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gAAbJ9mg+EyLWxY0U7MINrLQmGhGuQyh1s7BNWxK5kY=;
 b=G7JnI481TymK4fqwmH5jHp5xLNJEz9ujgekbGrQP5uWNYd8+C0i9Q7TxlC32T5Zhdi
 2KlbstsDHV+ycgNA+LOeC0/+2SRIJFtC7KmaudaiMV25eNcVM6PkqVi9PP4q+cHZI46E
 yHXqaRZTDAqCqIHZ289LcLFqiQH6tiSHsSFRcrbZiIWvm/tIJSEjoipzTkDkpcuBFRH/
 mZA/JW4L/UGSy0GdAg2NkWqcu/q1QcWesLfRegZ+GbakE3P0tgIYfr2Un1jIqhoROGEt
 OJHUnVzB9TTfue/DZVuNoAz6XM9S078/hEXEby63Wgy0voehcDDafkehuHqfmSwWlcHs
 LZyg==
X-Gm-Message-State: APjAAAUnMUHW1YGRNiLNBFXRESADyJdh/6/TXxoq0Y0vo+9w7pkrVOyf
 P0r1Qgini2fU4F5m01GYEeGRKQ==
X-Google-Smtp-Source: APXvYqychIT3O+Aj9TNEJPeK4MXdw9jWQpyvEsMMCxe7svwIzSr1JwJyt3E5WTI1U+wWWRi+6tciHw==
X-Received: by 2002:a5b:78d:: with SMTP id b13mr11478353ybq.157.1575668899388; 
 Fri, 06 Dec 2019 13:48:19 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-d558-5e40-3af2-2592.inf6.spectrum.com.
 [2606:a000:1401:86dd:d558:5e40:3af2:2592])
 by smtp.gmail.com with ESMTPSA id k8sm6963078ywh.33.2019.12.06.13.48.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 06 Dec 2019 13:48:18 -0800 (PST)
Date: Fri, 6 Dec 2019 16:48:16 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <20191206214816.GX9549@bill-the-cat>
References: <20191125080741.2215-1-patrice.chotard@st.com>
 <20191125080741.2215-3-patrice.chotard@st.com>
MIME-Version: 1.0
In-Reply-To: <20191125080741.2215-3-patrice.chotard@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v3 2/6] cmd: Prepare sysboot
	command independence
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
Content-Type: multipart/mixed; boundary="===============2695886261220932348=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2695886261220932348==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tkSjRT2ItO2nndq7"
Content-Disposition: inline


--tkSjRT2ItO2nndq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2019 at 09:07:37AM +0100, Patrice Chotard wrote:

> As sysboot and pxe commands are sharing piece of code, migrate this
> common code into a new file pxe_utils.c to prepare sysboot command
> code extraction from pxe.c
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

With a little function shuffling to reduce the size growth (due to how
gcc optimizes things) of the now shared functions:

Applied to u-boot/master, thanks!

--=20
Tom

--tkSjRT2ItO2nndq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl3qzKAACgkQh/n2NdMd
dlLF3g//YGuDsUJiTQFBnSZ8Fj5qF/Yp+lPFdyUk9I+2Y15YtM5be0dQ+KTBcUEp
r9pUphqFP7dC0kdKzsskQQ0xOAr4hfMMdr0LzlHarFdGDkPVmfy33idnjelE+v9W
1zouIznZrRYxPXWYQWgPV2DC59+H9SvnSeup8iC0QENpIcGa7mWsbcWyatS/t1mI
KtMerBwR1icZSyhLTs3BuKbIBvPr3aaJkufH05n1toiisV2mKsEYHY07ueKw8q9I
Yce/mi5zeki6DXc3Y0NP/LHZ9a0Q74AKuesOarhZIu6crk7aUAMFMC0cGgH3x5Tq
7nrrkFk2EGlVNldH02DntPkySPaqmUmlCmpGzIyn00hRB0zaoaXP+KHbkn+p1SKC
gKda9Rsq+uXhJju3rGXkPMvw+4v/vbI/tdlL4JiM1SYuy/B06mi0FFv7o3yb/cwO
W0IKnL2H4PGq8d52bqKYi/DbZK+mOSNpD/Ho0b08XSy2UyJkibPlbNQHPBgJWMut
wLcHHHk0RWUrhcewh1vPKN0Z22H608kkojWS9HA1xKuVCPigfcStgehI88SQDoj6
rzNoYvPCeHBZFeq7J6Op4f1veB9HjQP2wg0aPbCnNWzJxV1Kb6zmytjHD45CdZ4O
CU/xmFjlXrpI/VLmzththXoFm4yM2NEcWIeIvKPWAlzIc/o5+c4=
=TmxD
-----END PGP SIGNATURE-----

--tkSjRT2ItO2nndq7--

--===============2695886261220932348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2695886261220932348==--
