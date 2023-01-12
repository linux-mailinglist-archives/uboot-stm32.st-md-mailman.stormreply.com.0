Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4536678E3
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Jan 2023 16:18:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB170C69049;
	Thu, 12 Jan 2023 15:18:03 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16DBEC69048
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 15:18:02 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-4bf16baa865so243129527b3.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 07:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=emV2hqp/B6DlDmQ+24+NnsMhmp9dUOKJb7lFWLqSOK8=;
 b=CAFiHJEcCWh1dbK0h0BP/MU4RXH1cWeMOjuGsz4Qyz4tsmW6jcewnEJekVXRXa2M0g
 178EB+ACtaZYsmSSe1CLTqTp8Ev1NCWSt2bZblXtdFzEW+oCfKFKYMoiFivOzEwyW0ef
 kCaPxiXHsRrt0+DkYosjMtz4FCS1w/Akk9t7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=emV2hqp/B6DlDmQ+24+NnsMhmp9dUOKJb7lFWLqSOK8=;
 b=MaUrFkU7JeQkQ3G/zMz5OCDvukVYu9Qm3KHsBg+kNiwvO3+zMoeemeXhowKD88u5QM
 v8A/A+J/HhCXcU8xAbFKZm3Sui/XiKTnSrFoUh/tIJiuxWf7Duw3jqhFcyRzss7CwrxV
 DhCCcYiLP2afGa1QrC3r6MAvhhhSpObBt4fjX8TGQsx8Ct4MIR4dL2G0qPZraaY3J5dK
 AYHhRQ/z/CJhsK1RBoR8/R5p45W7S7mEpceVpsOlfl3PVBVRgOgoo05uq9N2Rxez75Kk
 HkrX1sk41vD4cQcz6AfXKhBgAPMDUprNeU6DH/dxGsIvXZRgfxyREeaTGvUsIRM4qkh4
 3NMw==
X-Gm-Message-State: AFqh2krfqV7v+xB5TCapvl32AzY4BEbsRa4URTKPNB5/HIo2L/HVAADw
 sWLLNqaaWO+o5YL3r0uZp751bg==
X-Google-Smtp-Source: AMrXdXs+mIab5oqNh0h+jx2QX+MUTk5ck9s2oKZkqccAjy6d93yaeJqcVyjyQwKsSj11cb99O0RqFw==
X-Received: by 2002:a05:7500:7206:b0:f1:989f:65b5 with SMTP id
 kf6-20020a057500720600b000f1989f65b5mr162006gab.48.1673536680843; 
 Thu, 12 Jan 2023 07:18:00 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-38c4-8177-7e9d-a94f.res6.spectrum.com.
 [2603:6081:7b00:6400:38c4:8177:7e9d:a94f])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a37f705000000b006fab416015csm10924941qkj.25.2023.01.12.07.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 07:18:00 -0800 (PST)
Date: Thu, 12 Jan 2023 10:17:58 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20230112151758.GY3787616@bill-the-cat>
References: <20221208091010.1.I87acf9c65e708df1d5a45a57ce8508a14dfeb6a6@changeid>
MIME-Version: 1.0
In-Reply-To: <20221208091010.1.I87acf9c65e708df1d5a45a57ce8508a14dfeb6a6@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>, u-boot@lists.denx.de,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH] cmd: mtdparts: add SYS_MTDPARTS_RUNTIME
 dependency on CONFIG_MTDIDS/MTDPARTS_DEFAULT
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
Content-Type: multipart/mixed; boundary="===============8925823254627889500=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8925823254627889500==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qMftkJ3bVh5S8osR"
Content-Disposition: inline


--qMftkJ3bVh5S8osR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 08, 2022 at 09:10:13AM +0100, Patrick Delaunay wrote:

> The two configuration CONFIG_MTDIDS_DEFAULT and CONFIG_MTDPARTS_DEFAULT
> are not needed with mtd configuration CONFIG_SYS_MTDPARTS_RUNTIME which
> allows the MTDIDS and MTDPARTS to be configured at runtime.
>=20
> This patch has no defconfig impacts because CONFIG_SYS_MTDPARTS_RUNTIME
> is only used by two platforms (stm32mp and igep00x0) which don't define
> CONFIG_MTDIDS_DEFAULT or CONFIG_MTDPARTS_DEFAULT.
>=20
> This patch solves an UBI environment load issue for NAND boot for
> stm32mp15 platform. In mtd_uboot.c, when GD_FLG_ENV_READY is not set,
> env_get_f() return a EMPTY string, define in default_environment[]
> because CONFIG_MTDIDS_DEFAULT=3D"" and CONFIG_MTDPARTS_DEFAULT=3D"",
> but a NULL pointer is expected to allow call of board_mtdparts_default.
> Without mtdparts, the env partition [CONFIG_ENV_UBI_PART=3D"UBI"] is not
> found in env/ubi.c [CONFIG_ENV_IS_IN_UBI].
>=20
> It is not a problem when env becomes ready, as these empty variables are
> removed form U-Boot environment in env_import() / himport_r().
>=20
> Fixes: a331017c237c ("Complete migration of MTDPARTS_DEFAULT / MTDIDS_DEF=
AULT, include in environment")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--qMftkJ3bVh5S8osR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmPAJKYACgkQFHw5/5Y0
tywNdAv/UKN4bKg8LnnrDlYGbqlm4ehMkZ3guM3E+I/sPYlx5HsasOR4nPMne2yN
U+FLM/mrya5/9+mL0s6EgC2RCimHg7Sgf3tBfECpwREKzhfZAoeMzMb3PSKc4ng8
EiGvz45t8gamKFdzbMOUt+2VqumpIZ7CLrTvfuurpml7cD2FVto3TUUlx/vvu+lW
VBxaeeCMy8mQHPcADn+8r4romGNT3lR6bU/9VuQyTd1RQ/haIemIYJJh8O/6fMtU
g/q0D3yS1fuOLgxg4eBJv39R4MlQRgEIJiRhApzlTWZdC2IaCWeZstaKPO+tYlPV
EBi4mN1AqjQ+uxrBYMkKetkawQR179BfybNcGoykOOc7BOgCceYUULZXMbHyKnat
bGVM5ln2Przs27fS3XfMPEAMV0xENuLWsVrvDe3LMMsQnbOXVbgxRxI+ytj8AW0D
8WNcBdANTlwlGmX8C/2Z/2t/XaHNKL82T9k28W3QP+xzQOlQTMSD5ntIhuwlRFpp
OMXXAbQk
=xx6i
-----END PGP SIGNATURE-----

--qMftkJ3bVh5S8osR--

--===============8925823254627889500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8925823254627889500==--
