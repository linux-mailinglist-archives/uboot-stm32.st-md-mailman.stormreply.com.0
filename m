Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CB5234D3E
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 23:41:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D569C36B33
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 21:41:24 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC5D1C36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 21:41:21 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id l13so8447480qvt.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=y8IrCYNfgR+SyZofTfFlfSBndHzNkuKdm9zBTAFXQpg=;
 b=P44whcx0n7Lu0T9EsGFfUJ1chqC7PwwWBMFIm2xNklAXG3qoQbW/pW/aTI2kVRzZRy
 RDi4huqtSYNNH3atSVtg/FpYgqNFtFm6YI4Zs54NjMIiVQ1d5jaGux2+b7VqbwkhuM26
 hlV9BvZdqNSAysmB60oVAXFW9I5EVFEsxkMf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=y8IrCYNfgR+SyZofTfFlfSBndHzNkuKdm9zBTAFXQpg=;
 b=g8XKtxsupDHI4botD1+KLXGQvltDDCLimgKwpDxoDxH4AjuaU+JVQcdHsxBjgMDylt
 cKccJkXTkRz5vZsGM3IOTzLadH0NOV9lUUiH9vL9w6WqOrlCvGiDIb42ZD8YbPD2KsgZ
 cHYidKJX1TF2RCgs6lG8MxEzll/P5RPOj/0lNlAwfKddD+LZsEmfUgNOuN3SWZSAepeN
 8I1CvjkvgNQRLCEpJPodl+8SLq2irOdZkW05OUqaZq6gRbYkFIlj0bbP0kikBLmdqDt7
 qV2BJHA0svCTytloW0j4kESB3iSANPuaAhkI9tJrCVWfrQ7atrbnZ8/GBUNERdHhp62P
 DiYQ==
X-Gm-Message-State: AOAM532G33/a9pRH/RKqMnFA2gEpywa+QrIBOhlqWfM3G4XSCYW8kpbU
 V6QC0XCcEYwpuXnjKRlZ2Iam7A==
X-Google-Smtp-Source: ABdhPJyBxKh5oVJMDWMkHP52lsnnJh8qJr/XaZQne8XAvYGlYAAQrVEVBdUtcEvkfdiZb5mrbwnLhw==
X-Received: by 2002:ad4:4024:: with SMTP id q4mr5953828qvp.243.1596231680891; 
 Fri, 31 Jul 2020 14:41:20 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-18ee-3919-a84c-b555.inf6.spectrum.com.
 [2606:a000:1401:8c61:18ee:3919:a84c:b555])
 by smtp.gmail.com with ESMTPSA id f53sm10996884qta.84.2020.07.31.14.41.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 31 Jul 2020 14:41:20 -0700 (PDT)
Date: Fri, 31 Jul 2020 17:41:18 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200731214118.GA6965@bill-the-cat>
References: <20200728095128.2363-1-patrick.delaunay@st.com>
 <20200728095128.2363-7-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200728095128.2363-7-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Wolfgang Denk <wd@denx.de>, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v4 06/14] env: the ops driver load becomes
 mandatory in struct env_driver
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
Content-Type: multipart/mixed; boundary="===============8763459936236204439=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8763459936236204439==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NpaPS9owJKTasCT/"
Content-Disposition: inline


--NpaPS9owJKTasCT/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2020 at 11:51:19AM +0200, Patrick Delaunay wrote:

> The ops driver load becomes mandatory in struct env_drive,
> change the comment for this ops and remove unnecessary test.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--NpaPS9owJKTasCT/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8kj/0ACgkQFHw5/5Y0
tyzAmwv9EZ5X/Hv6BNDyAY1gRcJ3GjHKLJoRSGkwDVK7Uu/YtRIE6ucc8cx3oEmD
qOnSqQ4caYP4y9Vf0n9VRJCGJAO9KiWgzmMK0GW0jRniXiBzAz1mXXKyswr7xnjE
uyBa9Qo2RQW6gsP9OPjHCbeAmVZ5JU1Rtxif7YishSQoQ1pr0q5zUh7dK4EF3Jk6
h063Cr2DY6iXKOHFIUT+Pc8UbXWnZygqeC7MB7PNtC7IFYX2LDYNqc8QfH840aFv
iqonG5OiEgN21HkdB37VYssir/Cd8BPUZ1TenZiRwJQkc+Qp9uBQ6KbV8YaS2QB5
X4G9TF6Im8SmjaziRhFB5lphHh9cWd2kPqcbgUoXPpzgbCTrRt099tKHHvGURGoo
l8wY3PTydyaWfKjeA7uH5Q+MkuxBG4c/Ra4Z2IdF435sw3Xq5VfzPvVemG6Wbn2h
AoEFinl2G9Djw6zVkrn9rn4TQUgwqfStANEbteDsIB0ylS67GoLVACgFmK9k/ii4
B1ye3vRL
=J6cj
-----END PGP SIGNATURE-----

--NpaPS9owJKTasCT/--

--===============8763459936236204439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8763459936236204439==--
