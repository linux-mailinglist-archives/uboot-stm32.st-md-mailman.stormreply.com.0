Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E26AD2875D4
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Oct 2020 16:16:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB6F1C32EA7;
	Thu,  8 Oct 2020 14:16:16 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBC46C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Oct 2020 14:16:15 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id z6so7160080qkz.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Oct 2020 07:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YoPGYeTDef1IaYHtFP0Hf0DeiAzXEnc1SVTEFbOU0iU=;
 b=cFpSp2OnwSGrP/MolUg+mzbmDPuHOCsgEDWR3NgteUt5g+cjmZ1c59jep8pQ25XPTY
 0/jlqNTleDJ8i+bc7guyRXoGPDlxx47ZA1j266GuefpkkG+bx1rgOjbq0NSq1k51rq0S
 GPNZ0Qd8JG4BtaMweZFOtOQ+qZMUSr8wdL79w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YoPGYeTDef1IaYHtFP0Hf0DeiAzXEnc1SVTEFbOU0iU=;
 b=PMYpUmMiO9BBOCfbcEG2DdZX96LDMZv7QVPuP29CeY9Q0/xTepTjMS0sWABk13rQtX
 Ot31Ir+gvewQrcmi6XWY74RZ9HGv2qdSysyxwUxsHT4Sp9tT/fxp1rKC0FbV9WI0Ba+4
 VrU1DfjBM7mEh/wlYQnRhT9ntvZHbWQvIpjbQ3BsxxVlT5wuSpX9TzFLDj6YNZ1PQfQD
 7VRypXI41anRD+2oR6RLR/rq+000uAfdcfLfsYTZth8B2Hi/VHaPtbfsD42+zoLsYkAu
 Vtepz/sCdiclkNj0pspWmoMlMFMdJ4FoGVZLGn3vDuNnNLC3YPiHfs77ug4EEi0BEa+E
 3gdg==
X-Gm-Message-State: AOAM531ZlcyU22iW3i0WkMnMtOBJA4PLYx5O9WzeQLZAjRC6oOKNvT4+
 Ndfr+072AglT82GsqI/0lrQaHw==
X-Google-Smtp-Source: ABdhPJzQQCLIfl+TDdPEOhkfad80UKC0AV8ZUVxeWi0SIWCQ3Vu2hcML3CCH5CSjYg5xz0BVnjFllA==
X-Received: by 2002:a05:620a:15b6:: with SMTP id
 f22mr1097950qkk.490.1602166574578; 
 Thu, 08 Oct 2020 07:16:14 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8ebe-b485-f8d5-5f78-0a27.inf6.spectrum.com.
 [2606:a000:1401:8ebe:b485:f8d5:5f78:a27])
 by smtp.gmail.com with ESMTPSA id s125sm4124085qkd.18.2020.10.08.07.16.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 08 Oct 2020 07:16:13 -0700 (PDT)
Date: Thu, 8 Oct 2020 10:16:10 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20201008141610.GB14816@bill-the-cat>
References: <20201007081020.30635-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20201007081020.30635-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Andre Przywara <andre.przywara@arm.com>, Lukasz Majewski <lukma@denx.de>,
 u-boot@lists.denx.de, Jonas Smedegaard <dr@jones.dk>,
 Peter Robinson <pbrobinson@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp: force empty PREBOOT
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
Content-Type: multipart/mixed; boundary="===============2524981486968391449=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2524981486968391449==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3WHXSKva2fGRnTbi"
Content-Disposition: inline


--3WHXSKva2fGRnTbi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2020 at 10:10:20AM +0200, Patrick Delaunay wrote:

> This patch remove the default preboot command 'usb start' for
> STMicroelectronics board. These command is added by the
> commit 324d77998ed6 ("Define default CONFIG_PREBOOT with right config
> option")' and commit 44758771eefb ("arm: move CONFIG_PREBOOT=3D"usb start"
> to KConfig").
>=20
> The USB storage boot (not activated in stm32mp1.h) is correctly
> managed by distro boot command 'usb_boot' (defined in
> include/config_distro_bootcmd.h, it include 'usb start')
> and USB keyboard is not supported in stm32mp15 defconfig.
>=20
> So this patch avoids unnecessary USB initialization which slows
> down the start-up:
>   starting USB...
>   Bus usbh-ehci@5800d000: USB EHCI 1.00
>   scanning bus usbh-ehci@5800d000 for devices... 3 USB Device(s) found
>          scanning usb for storage devices... 1 Storage Device(s) found
>=20
> Cc: Peter Robinson <pbrobinson@gmail.com>
> Cc: Jonas Smedegaard <dr@jones.dk>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>=20
>  configs/stm32mp15_basic_defconfig   | 1 +
>  configs/stm32mp15_trusted_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_=
defconfig
> index a8c4112dbe..f937a0278d 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -19,6 +19,7 @@ CONFIG_DEFAULT_DEVICE_TREE=3D"stm32mp157c-ev1"
>  CONFIG_DISTRO_DEFAULTS=3Dy
>  CONFIG_FIT=3Dy
>  CONFIG_BOOTCOMMAND=3D"run bootcmd_stm32mp"
> +CONFIG_PREBOOT=3D""
>  CONFIG_BOARD_EARLY_INIT_F=3Dy
>  CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=3Dy
>  CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=3D3
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trus=
ted_defconfig
> index 0792884a9d..b0be064cc3 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -12,6 +12,7 @@ CONFIG_DEFAULT_DEVICE_TREE=3D"stm32mp157c-ev1"
>  CONFIG_DISTRO_DEFAULTS=3Dy
>  CONFIG_FIT=3Dy
>  CONFIG_BOOTCOMMAND=3D"run bootcmd_stm32mp"
> +CONFIG_PREBOOT=3D""
>  CONFIG_SYS_PROMPT=3D"STM32MP> "
>  CONFIG_CMD_ADTIMG=3Dy
>  # CONFIG_CMD_ELF is not set

In this case you should disable CONFIG_USE_PREBOOT.

--=20
Tom

--3WHXSKva2fGRnTbi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl9/HyMACgkQFHw5/5Y0
tyyJ5Av/UWc8VmdJ9CX9M3nGcUVwqoav2aDS4zh/gan2o0j+9iRMElbKjmXVMKnF
LGu3yzszU5szDhtVnd1PVVAeTb42km4SmOvxwhcM8JaeDut1vm8UmYbGD4SCULrn
MxOuWGh2BCDx/YYmzUebL8Qa9JdWeFGrwM0PclHp6V/VjJ72+66EPq3zthM5mNc6
Syy1e/OlV/RxxC2t3lgOpb556vqhw8r2ts50dOKMQfMBfqEP9SkW20PDtdf0e4tV
ol6cClOvCdzYHYn7/Mc99KTBYoMNFBuq72EopcadJ5BzFQ674GosyZdz/qAgZqdF
OvskFDdAkwRv12lwmvWsNYfplTM3DwKX0EPc5h9/C6yYXE5oStrNQZUAhlvtwhwU
fUOYShjHSsR2WU4rJwBlDg/o44AFY9+PEzFfxsLwP/SOVhTheAn1S01qISKeRgBR
1W2H69AU1awVjws1pXeUE/L9sWFPH6Uh6t4tZQ98iYU0ozqNjdm+j1+21kFaDheq
AxYnmLXS
=6AUv
-----END PGP SIGNATURE-----

--3WHXSKva2fGRnTbi--

--===============2524981486968391449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2524981486968391449==--
