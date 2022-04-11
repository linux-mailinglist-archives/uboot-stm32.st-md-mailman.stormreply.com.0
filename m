Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2548C4FBF80
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Apr 2022 16:47:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF6D7C6049E;
	Mon, 11 Apr 2022 14:47:28 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC930C60495
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 14:47:27 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id kl29so13397542qvb.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 07:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3f8/xFX4H+KVC/0vFXd+D4ixxnNxISLkPhfcBKLxVYY=;
 b=nddkID/D0yP+GA545cxHXQKlRO2+/mh820UzF46iAbPnnUMFSo56fTsJfRICt76SjS
 eVMemTZPPiXER+/3mhN89mzk/AFCmvcKOgt66utnNnv7+7eLTcE2S6nyuhw+ZZyxi1z0
 qfWd7KEj6x+fKTgCYiEGXw4UjGBASKCgceviE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3f8/xFX4H+KVC/0vFXd+D4ixxnNxISLkPhfcBKLxVYY=;
 b=QhVzoLur7eICz2Iq2JGA2ZcFxyf0C84NURrTwSpiM6IJ6VQuDZuMqgEs9WQtQN8nyh
 gLbEwgQlMv4wkwsb90aYzbQ6TorKLsuNBhces3QJH7y7rhKvEfOUzcu8hzqAHlo1ADJW
 OnIlaFoYiM2gJZG1r5Pj+lQERhjfT39rOU1k8WF/NmvJ7pLoWrva4fDx3pMEolKPtAeT
 S1XLp91k73GyRhZLWTmf/Rq2RK+5XBCfI7JIyd7idDGBpugItr+Tk7hF2fsjEXvKk4oy
 +yBCE+/k9JmdOOr6361kmTRfydW1w6DqpF6Z7Jj+ObxJM/H5U7Hmxyp4bVwJpp54yrsD
 AYsA==
X-Gm-Message-State: AOAM531nlp3oVkhbft8UM6Hwa6Me0aMSVTwSvDwv46e1d/zL6geR1jpV
 xPr/S5B6EWSL4LwdNMlBccQDxg==
X-Google-Smtp-Source: ABdhPJyhqLD3ARj6ddkNmiG0EqntpIAW8cnu4jQ+8WdPLbthBEsH/+cfvULwPDztHwv7tg1hOp2fDw==
X-Received: by 2002:a05:6214:22c:b0:432:6b2b:95d0 with SMTP id
 j12-20020a056214022c00b004326b2b95d0mr26968835qvt.63.1649688446853; 
 Mon, 11 Apr 2022 07:47:26 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-2ef0-5dff-fedb-a8ba.res6.spectrum.com.
 [2603:6081:7b01:cbda:2ef0:5dff:fedb:a8ba])
 by smtp.gmail.com with ESMTPSA id
 k1-20020ac85fc1000000b002e1c6420790sm27146221qta.40.2022.04.11.07.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 07:47:26 -0700 (PDT)
Date: Mon, 11 Apr 2022 10:47:24 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20220411144724.GG14282@bill-the-cat>
References: <20220329141831.v3.1.I2d5fc62b65a61d4e11ce442f3b5572ec03f39cf6@changeid>
 <20220329141831.v3.3.I0782b2e4122e700b562bf2149fa3668e82a15b24@changeid>
MIME-Version: 1.0
In-Reply-To: <20220329141831.v3.3.I0782b2e4122e700b562bf2149fa3668e82a15b24@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH v3 3/3] configs: add support of OPTEE RNG
 in stm32mp15 defconfig
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
Content-Type: multipart/mixed; boundary="===============3212449828227893763=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3212449828227893763==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6oDOB6mVXEStRxH7"
Content-Disposition: inline


--6oDOB6mVXEStRxH7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 02:21:25PM +0200, Patrick Delaunay wrote:

> When the RNG device is secured with OP-TEE, it is only accessible with
> the HWRNG TA, the CONFIG_RNG_OPTEE is needed for STM32MP15 targets
> with OP-TEE support.
>=20
> The probe of this RNG driver fails when the TA is not available in OP-TEE
> and the previous driver can be used, as CONFIG_RNG_STM32MP1 is activated
> and when the associated node is activated in the device tree with:
>=20
> &rng1 {
> 	status =3D "okay";
> };
>=20
> When the RNG is used in OP-TEE, this node should be deactivated in
> the Linux and U-Boot device tree.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--6oDOB6mVXEStRxH7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmJUP3sACgkQFHw5/5Y0
tyzTKgv/ZXDtfxmyEcAUja4dz4gQ7Me2tE0VScedtWXaV5zJvKQlJ2pUeQWJ6eUu
I4TRCmc/JBJlVkWL8YJY0AtjvfhzYoJZ7XnOsW4A5tesnGBhV0S+FDGGvlHWOPjx
klNHLkFZCPeW1BpaI+CMLVz+5xkRhMtj9tJBQIZOUK1SWNTq96KzGW0rDlZ6gbwS
+ftET8JD00L0DmWjibVYaKBq839S29EiK9PTugQf8nq1ZcTYYOQLDJqa5qh5UXO3
C7rLGYYyOV77rQg4DCi90kbkiMjQe7pUOA91BFbtuQJJ5vIzVCecjEkpGwvQz3AF
a0cZre7tga1A6L+86pbO15Ki3x/S8kN5gf2KCB2KeVghNxPj3/I8q0gha0lonti4
q4v3/4nMo9syA4Edsp2+GPR5aT2J98WfFrwVdu/bVjq4e6n8lVhFc7YC95FeVVng
u/N1UiRxM+ULwf6LtOU1Yq140vNR9V7lNriHr4QwSUT9ETfz99z/dEGlQCvIQitO
kWod8v40
=Ol11
-----END PGP SIGNATURE-----

--6oDOB6mVXEStRxH7--

--===============3212449828227893763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3212449828227893763==--
