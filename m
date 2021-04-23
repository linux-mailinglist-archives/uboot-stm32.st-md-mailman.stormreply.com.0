Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E403696D2
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Apr 2021 18:23:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 903E2C57B54;
	Fri, 23 Apr 2021 16:23:49 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FDB1C57195
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Apr 2021 16:23:48 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id t17so21676962qkg.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Apr 2021 09:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7/XpHGp6GfqT7C1MeMCty3UQV7D6pTsvsgcvOmmWOOA=;
 b=marJ4Oi8D/xeqa7oeq5aDIVkS0nCpPHEaP2K3h2Xe66GP/EApopuAN36L0z68m0O+d
 M4kRZPUYZlxeCwackURGOhN7VyD+05i6ODVhhTpqtkI1akPLI45+0TCYSAePEujlU+TW
 Z/PUZ8MjVpKsI/xt7rZ2HO6dvx8jai5NBmOEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7/XpHGp6GfqT7C1MeMCty3UQV7D6pTsvsgcvOmmWOOA=;
 b=A20nrxL9aSeVCsLMtcAppZtpDFkEFs42xQzQuI/vrXdhA4KcshhSnPwgztAXeEN5AA
 6U9RcIURTlzWbxkmzUGLv7qPGOjh9Rr87eGPj6CWq3ZtiNAJBS45VbwXizP6Dz+OBS8I
 kYHvoDTCJpUN2V1zWgQ57w96CdXAR+2+Vl7cCc1sFaP9PTU0hVZq9LnngPatCGvEdOq1
 Th6WBDLToEJLBZuH0ja63v2VP9vR4gbJQQ5/NcBh2TGKFvnbQ/bHFLF8k1+yDzaiRZHA
 E8yjx+OW3kPOJrV0PZU5T/ULZNPgECu2bgNkcpigMdg1jgMhiSld7jO/+DtXOkaFhRgk
 aiGw==
X-Gm-Message-State: AOAM5330UUNv/W66RiGtr4xXzNq61NUSnRfe7aBEopMXrfmYT1Ir2wzP
 pmiBDcoI+sAPtkAWf/Yr4UNJyw==
X-Google-Smtp-Source: ABdhPJzRnMz3qkUtTlkX8P/tPBknWNVMXYveUZGVw607Y3vUssJGxJADNOxtSOE6oaVy9TIUJu7Rxg==
X-Received: by 2002:a37:7a05:: with SMTP id v5mr4917170qkc.266.1619195027558; 
 Fri, 23 Apr 2021 09:23:47 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-140-239.ec.res.rr.com.
 [65.184.140.239])
 by smtp.gmail.com with ESMTPSA id a22sm4706175qth.41.2021.04.23.09.23.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 23 Apr 2021 09:23:46 -0700 (PDT)
Date: Fri, 23 Apr 2021 12:23:45 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210423162345.GO1310@bill-the-cat>
References: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
 <20210310101622.v2.2.Ied3d7fa502a6796d8839ee9f4a048b276f16c073@changeid>
MIME-Version: 1.0
In-Reply-To: <20210310101622.v2.2.Ied3d7fa502a6796d8839ee9f4a048b276f16c073@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Tero Kristo <t-kristo@ti.com>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2 2/8] lmb: remove lmb_region.size
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
Content-Type: multipart/mixed; boundary="===============3950881019252234904=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3950881019252234904==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aj/VN1imxBpCjNTS"
Content-Disposition: inline


--aj/VN1imxBpCjNTS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 10, 2021 at 10:16:26AM +0100, Patrick Delaunay wrote:

> Remove the unused field size of struct lmb_region as it is initialized to=
 0
> and never used after in lmb library.
>=20
> See Linux kernel commit 4734b594c6ca ("memblock: Remove memblock_type.size
> and add memblock.memory_size instead")
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--aj/VN1imxBpCjNTS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmCC9JAACgkQFHw5/5Y0
tyx/jwv8DSTAJbR99yUbVEznn0KB+Stut+Qc0EVl3Xp4cbtY+kZJ5dV/LCWtFJJy
KWBg128z2d6E74Yg44SL7LnmCCiLe9Vp3v2jsfZcN9Qa0l5ul/d6gocu/3fAurED
SOYfjgT2uzLQ6SSXs3ndWThVMYNxvsW3/MZhZ8WhUbNa7wXabTKRSjOMPOg6yxe2
2L645mYfcQssbK8r1tHybVYMJiRJSq82US7LR0cSndiyYK735aDR6V6WaK1vdW36
pPiQWAsqy7FQXp2xe5PrjoMCesXR0+lskBwzxrCLRTQNk1h0AsaCnwA1kC5pzprq
fC2/awyuabIfuxZfBcjAcCau2E6nlYo+igOMb1Cfs/IW5cjYKqROyTJsd01xSBOs
8C3sb4CR9M/QvIFi6y6UODBkv8C+dspiEzinptOJV+KtcGOkO4szP0vZIgwzapbm
0FR95xdH8OM/ukOjeAa/SBFaFfJz8hqRdOq2V7zvgJIAcETtTkWtOfXlhxia5Vtv
GclhrZC9
=dRWR
-----END PGP SIGNATURE-----

--aj/VN1imxBpCjNTS--

--===============3950881019252234904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3950881019252234904==--
