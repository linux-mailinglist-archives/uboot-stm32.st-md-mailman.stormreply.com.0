Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CCD496567
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jan 2022 20:03:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F7A9C5F1EC;
	Fri, 21 Jan 2022 19:03:09 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B971C5F1EB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jan 2022 19:03:07 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id m9so7228710qtq.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jan 2022 11:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=d/iweW+CAiocK5vy0yQ+iQ+Jf7xfpuuMpvhXwvYLY1w=;
 b=K7aKGYUbNkecY8+0Pw0xmaLx5pnDe1rkAn+cZIpIMlVu9boPNZEBffdnHv4b2zTdxy
 au/fgcUX2y5X28hD5NxoI8iD+3Udc8JKfE2iloeWoqHbbNVbjnM/BQuzkqm9Bq32a3Wb
 qDlLZHpNK0IFeR1co0QOfARSgz+uQH0OS6JV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d/iweW+CAiocK5vy0yQ+iQ+Jf7xfpuuMpvhXwvYLY1w=;
 b=gr3kqrggweLVW/hMiCVx9cn6U/ar6Jc4sf/OZA+RL35Gc3aSv3qFtUbewI32bj2Zbc
 Z6Byd2s2g4qUka+8+ooKBVfwT6dfGKuGpudQcn06NWISkT7Q+KjgeAPbNbn5a+L4cVlQ
 vKO8a1IFhKnQwUdhLJtPuZ5lhwL+1K8bXWUdc/bmBqLoO1DppbcB7qUSvOS+sXAYtGJ6
 2OON+KFlutMLUNwRGY6oSfFPTIFsh2cGeKCFtuTr84uTvVNcvm3K/TgulZL1JymSXmni
 0hDzyN3qGINljGlHhm6w0GrgpoNBc55QfcvpoNAP6OXilEWXSQEbzbdjb8MydvASh1X5
 rH0A==
X-Gm-Message-State: AOAM533h17UVSTfw0TtafmpfsN9i6E0VdJcDWu/wLxbwCW14QveSU/D0
 /7HpyjSihJz2RPKaBB4n/z3+tw==
X-Google-Smtp-Source: ABdhPJyuvsjexL3HP1mcjGsA0rYgiTjm8uVAhs8qVgXvbCrYpCbVxMzeJ66p00n7DBsqHssD2lRUGw==
X-Received: by 2002:a05:622a:1c1:: with SMTP id
 t1mr4377282qtw.287.1642791786586; 
 Fri, 21 Jan 2022 11:03:06 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-2ef0-5dff-fedb-a8ba.res6.spectrum.com.
 [2603:6081:7b01:cbda:2ef0:5dff:fedb:a8ba])
 by smtp.gmail.com with ESMTPSA id t3sm3650693qtw.66.2022.01.21.11.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 11:03:06 -0800 (PST)
Date: Fri, 21 Jan 2022 14:03:04 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20220121190304.GI7004@bill-the-cat>
References: <20220104132401.3573475-1-patrick.delaunay@foss.st.com>
 <20220104142328.v1.2.I0180e07a31210ff2679a02de4221a54e12169593@changeid>
MIME-Version: 1.0
In-Reply-To: <20220104142328.v1.2.I0180e07a31210ff2679a02de4221a54e12169593@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marex@denx.de>, Vignesh R <vigneshr@ti.com>,
 Simon Glass <sjg@chromium.org>, Lukasz Majewski <lukma@denx.de>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>, u-boot@lists.denx.de,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v1 2/5] mtd: cfi: introduce CFI_FLASH_BANKS
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
Content-Type: multipart/mixed; boundary="===============1305473507853863325=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1305473507853863325==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oFMCfUPuRwe/HdF5"
Content-Disposition: inline


--oFMCfUPuRwe/HdF5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 04, 2022 at 02:23:58PM +0100, Patrick Delaunay wrote:

> Replace CONFIG_SYS_MAX_FLASH_BANKS by CFI_FLASH_BANKS to prepare
> Kconfig migration and avoid to redefine CONFIG_SYS_MAX_FLASH_BANKS
> in cfi_flash.h.
>=20
> After this patch CONFIG_SYS_MAX_FLASH_BANKS should be never used in
> the cfi code: use CFI_MAX_FLASH_BANKS for struct size or CFI_FLASH_BANKS
> for number of CFI banks which can be dynamic.
>=20
> This patch modify all the files which include mtd/cfi_flash.h.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Stefan Roese <sr@denx.de>

Applied to u-boot/master, thanks!

--=20
Tom

--oFMCfUPuRwe/HdF5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmHrA2cACgkQFHw5/5Y0
tyzYWAv+PaAbhV52JS5ZUiD3RglxgYMwE6ZOBEJtAVRYg39bI3lebaHqrqHfuIIV
l7hZ63QgrvJkNJ2QLXbgnshMi2M+OJEAaNOVtonKBEIg79wgi5L+W3GRp3NvmqbG
c4lxoPTUFJcKwBXyb7BjPpqFhVHbcJ44VBTazUCQSQGKE9owsOLlHdXS7VdFbvL/
uaS71+fHWoKg4UafpYCQMnYMduSeipF25/5l2l1n46FmjyesNoTKNKLVhybclnns
6e76UROA4ZAv6H08gViOkOqz/tuGa5iEFjNm8atoD07F8HMCsS0s9Ah+eh8G/FtH
Drs/6bpig7FzN+0kTdwMD4uZmUAwX7BGUpCMkypt1UcwF6Q3HRV0DbEYpNVw4zdV
cP27Oyky4rqK9NSlrf0dpxADZrRAym9xJId5Em5shQbzepCa3UVAgsflC6e8q3By
DcAK3v3zyX089wU1jVK+HAdW1kEiVI1MOTZhGeq26bh1cZ48RV6IwGxITDXC0/jz
S7IUjhZ4
=kZS5
-----END PGP SIGNATURE-----

--oFMCfUPuRwe/HdF5--

--===============1305473507853863325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1305473507853863325==--
