Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E3758F3F6
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Aug 2022 23:51:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CB2FC04001;
	Wed, 10 Aug 2022 21:51:22 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25DD7C03FCB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Aug 2022 21:51:20 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id i4so12013878qvv.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Aug 2022 14:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=2qdvET/WujOPsclQTTmruToCfxQyYOXlbdUkI2wmoJM=;
 b=qpAY4RZR3XLCAokh9Zcqf5Qz7BDhXNNoEmWwIS2TUzRGiH1I9W0csTlN+RqkS7HaMZ
 rvdxxqyG3fz55OqZtSS3cK5kYFG8vCnPSBEnmqAG6cb8oicy2bauNUvyol5hjygMb8K7
 p38Ig7qkrDEmAtnMS7/RS1Y6aUm1VMonjXaGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=2qdvET/WujOPsclQTTmruToCfxQyYOXlbdUkI2wmoJM=;
 b=aLi3BVLzJlaA+kMXdMC/dcAa0wQF4jVIaXzuB0Y3ymWVKpKMP7qfadryByi5CsQDSB
 I1lHFHsSYE+3/3Fv9XAsP2RfLLeNwMSib5yPZkc9ZPhU/zV9nufH9Hd27Yy7900SUdHI
 w0FKnk1bXMSCmv2nfP/EqqM9mLa4LibS6exYMJGb3xSbEM9dDTr4vTeNC0Z1u2m9fpJr
 GYqmOgATwMifjqak5BzswjU0maMzgN+HGeNoHt18PjncQJoTNCFPvQUHyFevBurmQeFC
 EoNAQu8l7fIW9Vhe4FDcv9EaomWbP1KSf057NYdHedY9tyERe24BgeDtUcMXURD2oKAW
 tndQ==
X-Gm-Message-State: ACgBeo2kve7qss3sI7BvlSOAFxGhhKDqH1TEzEfWBC3F9uazCPPL9kmM
 ZqFsI8+ZBDZkLVKkFhb0eec1Qw==
X-Google-Smtp-Source: AA6agR4aN1fZUGcNp8OHTDYCuF0+f0Zq8f4HibR5M6EAfZ2Af/RzHfnZhDcki1taZFXhWLzSJA+cwA==
X-Received: by 2002:a05:6214:c61:b0:479:5221:d988 with SMTP id
 t1-20020a0562140c6100b004795221d988mr21980358qvj.37.1660168279050; 
 Wed, 10 Aug 2022 14:51:19 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com.
 [65.184.195.139]) by smtp.gmail.com with ESMTPSA id
 o22-20020a05620a2a1600b006b62c252d07sm783335qkp.76.2022.08.10.14.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 14:51:18 -0700 (PDT)
Date: Wed, 10 Aug 2022 17:51:16 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20220810215116.GT1146598@bill-the-cat>
References: <20220802082135.271308-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20220802082135.271308-1-patrice.chotard@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marex@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Michal Simek <michal.simek@amd.com>
Subject: Re: [Uboot-stm32] [PATCH] lmb: Fix LMB_MEMORY_REGIONS flag usage
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
Content-Type: multipart/mixed; boundary="===============7966313974865202069=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7966313974865202069==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nXktF6f1VZ/BnL/x"
Content-Disposition: inline


--nXktF6f1VZ/BnL/x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 02, 2022 at 10:21:35AM +0200, Patrice Chotard wrote:

> This patch is fixing a broken boot observed on stm32mp157c-dk2 board.
>=20
> IS_ENABLED macro should be used to check if a compilation flag is set
> to "y" or "m".
> LMB_MEMORY_REGIONS is set to a numerical value, IS_ENABLED macro is not
> suitable in this case.
>=20
> Fixes: 7c1860fce4e3 ("lmb: Fix lmb property's defination under struct lmb=
")
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Acked-by: Michal Simek <michal.simek@amd.com>
> Reviewed-by: Tom Rini <trini@konsulko.com>

Applied to u-boot/master, thanks!

--=20
Tom

--nXktF6f1VZ/BnL/x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmL0KFQACgkQFHw5/5Y0
tyyGZgv8Dosd1V7/XJK8j0dVLIqhlzwbhg7AvGVVCilz56ZrvAOJlt/dc2DyKIYO
RaJFUT1rXDKL3PSrBBdWro6KXTF/zYRnTwmgdF+aIBpv5OqIu8BcipMcVTDo8GAq
oFgNAxJ2KH5IP/ErT0p0uQxcdLUFyWF+K8Kxo0qW2VfguqX8x+gwdK+NuYt6nLUl
hPmdaJ4QIM5GLTzvsct+7fTeVoAauq75RurBNe2Znb6UEJ3jFp/fUYm6YWHHRdun
r0MVBoT+K0kim1TkOOM1vqWy/wKEr31gTH7XcwLqvoIB2ahUvPq6L4Mc5H3fK2KW
g1aY4d7vnRc/iBolO3ZVPOiWDEBZbmG69JHfkpZv5UXbxUxJSamBYFo5CZa7ZcO6
7QkUWuDNpZhgyM2yAtDnuVmRBE9cKMKcUNkooFOIz8tZ210q+NoXZYyGKY2zEmSN
fhFOvPbvQ83WS96/B1rzcVMEGzZWh5KA8jaRo0gq1w7LvdZsNgo9uLXJWuZiVHoT
j2kFi/xS
=VT/r
-----END PGP SIGNATURE-----

--nXktF6f1VZ/BnL/x--

--===============7966313974865202069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7966313974865202069==--
