Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A31C6C19D
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Nov 2025 01:09:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D4D3C62D2D;
	Wed, 19 Nov 2025 00:09:54 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDE02C62D20
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 00:09:53 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-3e898ba2a03so1725946fac.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 16:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1763510992; x=1764115792;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0HBBjk4Dj7shOveulG1Gq22RUBGdGMbA/CYa78qmNBE=;
 b=BuQt+ZTh0PqBQN8WzNXKQb5imYpJGldWJ67KYiTd53Yu2P3Ify/yUS8iLwFSvH6jDH
 Otafov6DmkgN+dhoMoe+lHsbbWEgiKEamiDZP6FC/Ej37T5b93ukyowh7x0pcbFgE4nY
 mOY7uPYXrJj81+LNfSh4rrRtCETqbWD/ug42k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763510992; x=1764115792;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0HBBjk4Dj7shOveulG1Gq22RUBGdGMbA/CYa78qmNBE=;
 b=o9LN7d4MS8i9OVJdCpSKJYho2RUryOKPZgL5STaQ7gmwonjTM1fRoqIgbVEdPY1zch
 6uQ5lKDfuRJCriPQsT7FN07E+JBxzfYm8T+8q93U/Oui4M2KDU3cZ8ZnGrhVaJDyfvWT
 SP5oarwFWaJ/Sh/S/i1EImnh8tpKKpejPe4nwWdsOWElkBDyFx/oFYjQWc990+rQ1ArK
 WsKPT24B71gtztpvCmxsHcofle829XJ10XSq88oNWQ2MCGSG5TSxEy8OAtBulR8IMnBb
 k+aiH3C0SV0pUCHGF91iDmr2UQgGmc7KREFVZNfg4zj5a1t7h1tEma7jGDOmnHiDRm18
 8M5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOB2e+5jaulPHri4v4/JWeeDK7toRuJv/yg4wvSFS9St94DikO9C4TK5NsdIzGmPCBxFMfq6jwdGmz2A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxt2YeHFfiuOhXMAmFZc7pgrRIwocVXeI3Q9aTc22C1cwreDwS7
 kp7X8x3SYMERFbVXXGnKmNxKgkU0j3pQ1o27Hn5oQxPiDJLpRV3lyNODIW1l8bxkcyo=
X-Gm-Gg: ASbGncuuWhv63TiRaGdi9z+IVh+pmINU8T8N24RJr+U6orcLlR2FKw8FX6QKs56aA1b
 OYhNUzGPvbKmvBtfK0z9NjRepVCYOXtIffsottZtAqRar+195Ohi7zcAJ6FFq7cJMh2pXTUY1i4
 k0oehRRhCCOLAAdbZW632K0A3LcFCi9pz+RwKFDr3ytokTX9Z4DFBA/Bm+ACpwS6L/yKf+gqcMy
 oCYZaPuIy3QDS06rjD0dOdktxgwLQwb75uLLBbc+EppScCCdULH3f8Y3JnnNGWg7zAefK6PePSP
 rkBI0mRJiwKz7WWGrcOqAYBTOnHifQ1v1wZ7JHVdOTpztizEuC9hK/2qbwjIROfF4rHxK2zdsTk
 aIwCkmzWApHa32XPrJgbWxp2ORCo7N104RoSEDfOskj96ZvxWyTPf0HWFISWhfiS95Nnijp8cci
 7Varh5V0MDyPqREcX+1h1Zfgd8J5hEDXM0qV+mbk4TVJ7aPeC1iM0f35qbzNne
X-Google-Smtp-Source: AGHT+IEG3WHOrFUSeRsUZsyxgc2b5g5meQcsUELKESR3w8pYTupHXGo9EXuldZ3+5O9BYDI0/GuiRw==
X-Received: by 2002:a05:6870:4f88:b0:3ec:50cd:2415 with SMTP id
 586e51a60fabf-3ec50cd3754mr3912023fac.29.1763510992311; 
 Tue, 18 Nov 2025 16:09:52 -0800 (PST)
Received: from bill-the-cat (fixed-187-190-202-235.totalplay.net.
 [187.190.202.235]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3e851ff9dfesm7566406fac.2.2025.11.18.16.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 16:09:51 -0800 (PST)
Date: Tue, 18 Nov 2025 18:09:49 -0600
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 u-boot@dh-electronics.com, uboot-stm32@st-md-mailman.stormreply.com
Message-ID: <20251119000949.GW2125796@bill-the-cat>
References: <20251118231732.577952-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
In-Reply-To: <20251118231732.577952-1-marek.vasut@mailbox.org>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marek.vasut@mailbox.org>, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Add missing build of debug
 UART init code on DH STM32MP1 DHSOM
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
Content-Type: multipart/mixed; boundary="===============3236480505368618539=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3236480505368618539==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5NSMHfX4GuePnLiQ"
Content-Disposition: inline


--5NSMHfX4GuePnLiQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 12:17:23AM +0100, Marek Vasut wrote:
> Commit c37a6684818d ("stm32mp: fix compilation issue with DEBUG_UART")
> split the debug UART initialization code into two files, but failed to
> update other non-ST boards. This did not lead to noticeable breakage
> until debug UART is enabled, which is not the default. Update the
> Makefile accordingly to allow debug UART to work.
>=20
> Fixes: c37a6684818d ("stm32mp: fix compilation issue with DEBUG_UART")
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  board/dhelectronics/dh_stm32mp1/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/board/dhelectronics/dh_stm32mp1/Makefile b/board/dhelectroni=
cs/dh_stm32mp1/Makefile
> index 2f4a301d1a0..429e01453bb 100644
> --- a/board/dhelectronics/dh_stm32mp1/Makefile
> +++ b/board/dhelectronics/dh_stm32mp1/Makefile
> @@ -3,6 +3,8 @@
>  # Copyright (C) 2018, STMicroelectronics - All Rights Reserved
>  #
> =20
> +obj-$(CONFIG_DEBUG_UART_BOARD_INIT) +=3D ../../st/stm32mp1/debug_uart.o
> +
>  obj-$(CONFIG_PMIC_STPMIC1) +=3D ../../st/common/stpmic1.o
>  obj-y +=3D board.o

As a future cleanup perhaps for ST folks, this feels to me like there
should be more code under arch/arm/mach-stm32mp1/ somewhere and not
board/st/.../

--=20
Tom

--5NSMHfX4GuePnLiQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaR0KygAKCRAr4qD1Cr/k
CiUgAQC/cwyzIjDTjlDqBkrCtI8VhOjVOCPVspMPx7Rmn8KFrQEA4wj3I6tF/ulZ
l6M4ZqiyNRDofj6oF2xINVD2ntdCkQo=
=hJHD
-----END PGP SIGNATURE-----

--5NSMHfX4GuePnLiQ--

--===============3236480505368618539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3236480505368618539==--
