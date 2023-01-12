Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7066678E5
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Jan 2023 16:18:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD50CC69049;
	Thu, 12 Jan 2023 15:18:20 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 014A8C69048
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 15:18:18 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-4bf16baa865so243148247b3.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 07:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9yiE3I62xFDpsBaTjUi2b6KrwgGpD94yfSZQ7iLuGGI=;
 b=Q7Gycz/ifdtRUHHhPAbKTiO43odUtqs2KPPKzNsK5axM7N33bbZQ8RQFDbgxxD35Pj
 uOF66n3z7BvXbz67hwJbhiA272wsOajtoWrFzrPCw9YRT8iOiJjokc/GDDR1jm0AAfJa
 WD2N02tyGU18En3qL3tcUtSuzGJnHwo6SjNXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9yiE3I62xFDpsBaTjUi2b6KrwgGpD94yfSZQ7iLuGGI=;
 b=XWPSbyaE6CC0SA2OSVjzcPdtfYM5NkamHaWK3+Jy+lXEGSyI3Z3VYVDgU2MxionXuV
 TfnWMsjOhxO49tQNzwd7Fsz0xg25axgkGrPS+THrbGBVeIwFPY905L/9S6+Y6AI1jDKp
 n2NuruCVFYia6Ya4W9Jfk0/1t6llmens1XcTBciy6+4NPk++7rtn8qVaWZ87CyhSYwWu
 lRjS5kzw5GY9UBquzOVSrEGfkS6jfDssDkzKCTlK73pEhDVnMcraPnX16FR4t7zH39ED
 btAxVC7xuK70IdpyShC9Z6ndjDwybrFvs81wXOYSJdZl22TQQwESkooQyPSkD7iqZDEo
 zkPg==
X-Gm-Message-State: AFqh2kr5odq6qtvjVe2D261wzRBGRiAdQDQm/ONyMy3Id9ccMhgsu7uP
 u4FOqYQ0XjA9e6uLEjAJwOSFiw==
X-Google-Smtp-Source: AMrXdXsSgyOs/46CZVGx5IBMjKH7lWnuNRXi3sWNt/IiDiWbukaRspMZ4rxfkIdrqWfegA6e5W577g==
X-Received: by 2002:a0d:e587:0:b0:3f5:1ed5:ada0 with SMTP id
 o129-20020a0de587000000b003f51ed5ada0mr21515093ywe.10.1673536698602; 
 Thu, 12 Jan 2023 07:18:18 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-38c4-8177-7e9d-a94f.res6.spectrum.com.
 [2603:6081:7b00:6400:38c4:8177:7e9d:a94f])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a05620a248100b006fc9fe67e34sm11075188qkn.81.2023.01.12.07.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 07:18:18 -0800 (PST)
Date: Thu, 12 Jan 2023 10:18:16 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20230112151816.GB3787616@bill-the-cat>
References: <20221214165126.1.I8d5c1748a43a5bba6c8470c6a3715d2c9143014a@changeid>
MIME-Version: 1.0
In-Reply-To: <20221214165126.1.I8d5c1748a43a5bba6c8470c6a3715d2c9143014a@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Heiko Schocher <hs@denx.de>, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] env: ubi: add support of command env
	erase
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
Content-Type: multipart/mixed; boundary="===============2528961358455778114=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2528961358455778114==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zOr3R8gk8nuhEyc0"
Content-Disposition: inline


--zOr3R8gk8nuhEyc0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2022 at 04:51:31PM +0100, Patrick Delaunay wrote:

> Add support of opts erase for ubi env backend, this opts is used by
> command 'env erase'.
>=20
> This command only zero-fill the env UBI volume CONFIG_ENV_UBI_VOLUME
> and CONFIG_ENV_UBI_VOLUME_REDUND, so the saved environment becomes
> invalid.
>=20
> This patch introduces a local define ENV_UBI_VOLUME_REDUND
> only to avoid #if in the code, as CONFIG_ENV_UBI_VOLUME_REDUND
> is only defined when CONFIG_SYS_REDUNDAND_ENVIRONMENT is defined.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Heiko Schocher <hs@denx.de>

Applied to u-boot/master, thanks!

--=20
Tom

--zOr3R8gk8nuhEyc0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmPAJLgACgkQFHw5/5Y0
tyxXkAwAtCsWep0bHsrihunTIfCc20sD3d+EoxLwiJHVUWFBiPllY2+0tYKRkpvI
bvdz77FL+cDNWk0vG8F58rySh2U/JGyylgr7zIEHKDbQgRixIJ4bmQZXqr3cxvst
fqyTa5ZF8A4fL8wBmxRt5i7bHp8o+dxHkG+tPX80xB0zuZ+OAuR15hk9RsyclZQS
RMIW7KjfUMsp84Mzdf1vWiZdkOkmQF0T7CSdsw3z7rLC6mbEatXwwvZTH7v7qoxU
1SSu/k24hgnK5wQBWJ7uV1cwbJZNKC45gt5xgFFg66KoGk3+9sUERAerJDBMGmvf
btqSftNy+i8xg/bQHugJoUdHyFwDdC8OEC1yrHb/Vn1gzb3X66fH7xGOfMK3/rXQ
GRuMJ9LOW6QgLvatArBd9GWGV7ULQ43FlUK0RautTvpqs7MvOVokWsoGH1XiiAzX
9pI+5VGMXxKVuyvajhOUVSmMIj29cG21TOqyEHO+sZjG0dKxXmLJBdrBr75S83Gr
3wNl1GjR
=37g+
-----END PGP SIGNATURE-----

--zOr3R8gk8nuhEyc0--

--===============2528961358455778114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2528961358455778114==--
