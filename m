Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 072E6234D3A
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 23:40:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3B68C36B33
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 21:40:45 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C164C36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 21:40:44 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id h7so30166635qkk.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=e9Q9i/otCc+xUJJeguJRDfmJB1OGfgoYjrNqdkDGz+Y=;
 b=rvClU9ozaVwbVH00w7qrnmt1nWVBaWobDfse9H4ZVGyTdpTX7vX8TB8y6tdpMJUzZw
 vRh8NmP8A8asGvsNjczdMQ7VL3sf6shE3rIwoaNxt6X/cTWFbZ4xrHs/SqvXMRy8ds76
 O3rIcN2QVaWOhPy4S7uBNvSmva2PWQPMy2ELs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=e9Q9i/otCc+xUJJeguJRDfmJB1OGfgoYjrNqdkDGz+Y=;
 b=nQ/c4oupO2uIQPh8whHOUTpEVi3aw2sCR3JTOuICKGWPg3syJKWcDStKzP/3G+7zhq
 NHAFjde/OSyz0MJfAmfjlp0xanCIcbyVdTCK+zrO1iYkJ09CrsvzP2DVzbtNmLNrdsjc
 B0kv7FqlBIA0uj8H20z+wlNEyyUb6i41SouY5Kpail3hCiTQerPCHDYr66i9mHARepPW
 cPSU/D7/Dub4Zcdu5pMxMny3PASDU5NLF1z4uBJEEyyT8sC+FqK8UBme689+poITNceT
 cue56gVsJyk4BYmntvYsSrwGGu607MQkoz6FoOVhOAfMfIPNMSRz0ZEhi1Jq++z+rzx+
 rcgg==
X-Gm-Message-State: AOAM5337AjKZxXB8YT1kPYM/O5ixF0PNfKrUp/fxr0ZnXc9ATqpT5rSe
 cY9LtC/A0lIZuPEWib4UgJojRg==
X-Google-Smtp-Source: ABdhPJxrullUfMMMlBR/tZqrXgBB0+9m2mOPTPZJgduHq6Zd8tvBptAStbQVTFQYDdrU0x6zuG/PNg==
X-Received: by 2002:a05:620a:1188:: with SMTP id
 b8mr6005280qkk.440.1596231643153; 
 Fri, 31 Jul 2020 14:40:43 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-18ee-3919-a84c-b555.inf6.spectrum.com.
 [2606:a000:1401:8c61:18ee:3919:a84c:b555])
 by smtp.gmail.com with ESMTPSA id c205sm10040837qkg.98.2020.07.31.14.40.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 31 Jul 2020 14:40:42 -0700 (PDT)
Date: Fri, 31 Jul 2020 17:40:40 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200731214040.GW6965@bill-the-cat>
References: <20200728095128.2363-1-patrick.delaunay@st.com>
 <20200728095128.2363-3-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200728095128.2363-3-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Wolfgang Denk <wd@denx.de>, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v4 02/14] env: ext4: set gd->env_valid
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
Content-Type: multipart/mixed; boundary="===============2004088424062132314=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2004088424062132314==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+bngJNRfHg+qX2/U"
Content-Disposition: inline


--+bngJNRfHg+qX2/U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2020 at 11:51:15AM +0200, Patrick Delaunay wrote:

> Add a missing initialization of gd->env_valid in env_ext4_load
> as it is already done in some other env device.
>=20
> Set gd->env_valid =3D ENV_VALID in env_ext4_save() and env_ext4_load().
>=20
> This patch allows to have a correct information in 'env info' command.
>=20
> Reviewed-by: Tom Rini <trini@konsulko.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--+bngJNRfHg+qX2/U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8kj9gACgkQFHw5/5Y0
tyzcnwv/bmp2rsMMWFr9U7iierPaOOm55bLNOQwU490WBUwRGNYUkmv65ZiKK+wY
/9DIU3Y3rp12StN217rKOPdEBkWxFqsd31jCqdO4C5NoBaC28xGq6gIcKh45XMEJ
k+1kD9YFsJPzWgSaf60Q8nWdAbs3w236A6DmTEvQb4SLqBk+EBaLmx3pLNInx4aX
9zdPjjBRFEtYZ2W8xKc/9mS191RHmXtJCcLNUAXDfH4AtZutK29TO1KKfSH32eu2
9Kcl0KRvXGE18tZ4PAnPyYZCRmW40AhF7JxXieB+Q5zlB3qmlO1n8s7fhQhx71lV
rwCIRM/XNnhqs59++aEEs+URkZtfIkpJ3mu8wdtvGUaxcudAzc3SgGTvVOJBmI2m
RiFVaX3oO8jykqvvDcQHwFnkxGq4PNvlsRKW8VcAWsxbS168+TG0ShzAEMV1BfuI
hgTdU8GWUiCHQGWzzZwyqODYIjqmK6AHgqGJdL6/Cu77VZ9zkk+fEmXbe9vbWbkw
3F/Axuzi
=QnP1
-----END PGP SIGNATURE-----

--+bngJNRfHg+qX2/U--

--===============2004088424062132314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2004088424062132314==--
