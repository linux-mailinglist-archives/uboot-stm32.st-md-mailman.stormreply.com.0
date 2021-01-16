Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D89BC2F8DA9
	for <lists+uboot-stm32@lfdr.de>; Sat, 16 Jan 2021 17:22:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A564BC57190;
	Sat, 16 Jan 2021 16:22:15 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 927A3C5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 16:22:14 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id c7so14838818qke.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 08:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cfkNAWSGUDKudATFgirfySKkZ+zGUBFm5KEVn2YU54o=;
 b=HFGQxWHPUDR8K7Nd0RFxmHE5HXo9mNqu8lLoZiTtn0WswseueuwyLv9EdJcLN9CM9s
 DHqGSSwXDZfXcmOdmf12zKdXCZQ8AOjYowXN6OzH3cOXiKeX5J0e/mS3pMDLHFF7EpMG
 Ca+Q26OKFVH19DWonCLLbZfaGcvL9QFMQvMBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cfkNAWSGUDKudATFgirfySKkZ+zGUBFm5KEVn2YU54o=;
 b=od5Kui0C44ZmOr2Yx+cVyUzVuwc8fSL6/89PEzxLpQHXdDIRnrw5HM20wm5iNoxvsY
 sBg0bixjMWhF+7trhdFXMfPhWi6vnLOGQRMedkZL88SM2XuY7NiZ5hZbixYPlPP1Ry13
 PS7kcFHkJc1zlu5GDfb7PJlMQisg27DKdwA8FiW0fz1bEvVFMLhtzVs0bgN1/76gTVfn
 RslUuwuf2bMVqdAn0khMMmniJborTlo7KopXIbboSEuEJpo5I/qUcN41H9jqON8vzj62
 P3FXZ6hMiO97M+MQ8PJ0g8aiXYDYvTtzXSeKbIxvdcge5T+J3hOONakY5yqvEanVKtqx
 PeRw==
X-Gm-Message-State: AOAM530rM+EwGDyHqUvT+csUEHjdYVYHn8IoNXHzikTocIPT93V2RBp3
 KaMcmxEpIVDIcLqCXMa7iLYHAw==
X-Google-Smtp-Source: ABdhPJywnur9j/pSkaAxdleLYeQ/I7mElJiEYNDNWBS9cmxFvbfkcvDF9YuMkWg9IQ/Pks/iP0kHfQ==
X-Received: by 2002:a37:9c07:: with SMTP id f7mr17309490qke.234.1610814133625; 
 Sat, 16 Jan 2021 08:22:13 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b42-3f4c-bc5a-f8b8-3605-e048.res6.spectrum.com.
 [2603:6081:7b42:3f4c:bc5a:f8b8:3605:e048])
 by smtp.gmail.com with ESMTPSA id 134sm7389618qkh.62.2021.01.16.08.22.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 16 Jan 2021 08:22:12 -0800 (PST)
Date: Sat, 16 Jan 2021 11:22:10 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20210116162210.GR9782@bill-the-cat>
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127102100.11721-7-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20201127102100.11721-7-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 8/9] test: log: add test for console
 output of dropped messages
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
Content-Type: multipart/mixed; boundary="===============1250853082328100773=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1250853082328100773==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZRLamLUCLuRJXeX8"
Content-Disposition: inline


--ZRLamLUCLuRJXeX8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2020 at 11:20:58AM +0100, Patrick Delaunay wrote:

> Add a new test to check the content of the dropped messages
> sent to console puts function.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--ZRLamLUCLuRJXeX8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmADErIACgkQFHw5/5Y0
tyxGzAwAryjeTXk1gBUfXo9npHPOh5lb8b6YcMQ/h9stKuGVSM3xdVui2pIS67x3
DHczHWMwZH+TuzpADTH2bPTDoOPizkdDiB+tf2K/8AXhqKm0pgFR/gcf2iIPWAXM
Alz2QEjIiTgVjU5fkvX9+Yw6C0htXzRrWuzCoPJXljGlss7B4q2flhaFcHZfuJ6S
RRCVu4sDdDpOizU5L4t0gHLWoiGRGPw+KASJJFOp85PSkWVhO0IDcPeG24IUxFaZ
8Y915vFuRLRn5ds3g0Gazu6p1yG3CUtiGAKZ6Ga5HGP2Wr2vLIJcwzVVvyG2kpg5
d1des8+MxOVYn4VlWqBW7x2aYEm1VSLohwI3d56kWhQNanp6z/mEaXUe8H68r2N4
lsWnhj1IZVgGy6TSKNgWL87/W4LXHbCb+vkVkZU+rveGN+qPnLW+CKIFVoz+0GJi
53uq0Gm4RY2a44SIkM8Sp0mLkEiUbgy7xYciFIchWKmjSoUFGe4F1a6eCsF/I/A5
d3ymKHdK
=YQLF
-----END PGP SIGNATURE-----

--ZRLamLUCLuRJXeX8--

--===============1250853082328100773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1250853082328100773==--
