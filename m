Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D001B8F6E
	for <lists+uboot-stm32@lfdr.de>; Sun, 26 Apr 2020 13:27:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C512DC36B0A
	for <lists+uboot-stm32@lfdr.de>; Sun, 26 Apr 2020 11:27:05 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95DF0C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Apr 2020 11:27:04 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id k12so11911468qtm.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Apr 2020 04:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vWjcwPX6RAZOXOoo1Cm/Q86SH+mW5SSC+vJM4CIwmGo=;
 b=UPMbS6kZVpzX0IEpdnChfdtZSQBzwCwL0ogO17Z2Pl79EsUOCKQobYxVK/EFkuKDbA
 bv4WfA4jPlbmip7op8up9MyOSa/pDanR2b1I/TcnCBIfP/GzsMd7W2tl0DgII0vlflDa
 aU9ky6e2sZzleq6A8Eh6WPrgfSYSIYuGzolHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vWjcwPX6RAZOXOoo1Cm/Q86SH+mW5SSC+vJM4CIwmGo=;
 b=gwUEZ9ncIOh8YW/wI+l1JvSMv28kP28AkoH5fGUHt9tVmemAYxNBN7z9PHkSqIY5QQ
 7f2m8josk3iLQiWpKCccWCoi0FZbbM91SY5Az0+2JL2qU2ZUx9pZbfts6cSE9k2NYeNT
 SydN8Z2VNSzCYubsNWMxV2Zd5HtPOmf+cOtjkyOjAbWaGoO0G3aQ7y7EXHy2VsaKKMRC
 HET+MFvqpPP0xppaSEVmbG1V+P3heVsxpaUSzfDltuKg03siS5kTxjMbjAv5HLQUb8Ys
 8c3duw6cExVffl0kUUmsONmf4JW1xMijCRaR+buPPhSDNd2V+exE5MxqtJfzdAdsNYbZ
 DhuQ==
X-Gm-Message-State: AGi0PuaLzhSwS+HdP1qAmSrkSAZh8A7/zVugUchQeuBoUtIi18NPGBBr
 qnDDY0KO868+UYUhZBkFxJqV4A==
X-Google-Smtp-Source: APiQypJeYIdJUB5L/RVKLXTG9k7GQ0R9wAjTR57MJmPE3hbyEWxt8i7O6cZE5bn3OTeSfq9C6MhqeA==
X-Received: by 2002:ac8:6c6:: with SMTP id j6mr18167162qth.194.1587900423445; 
 Sun, 26 Apr 2020 04:27:03 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-0077-5706-6f89-bef6.inf6.spectrum.com.
 [2606:a000:1401:826f:77:5706:6f89:bef6])
 by smtp.gmail.com with ESMTPSA id x18sm7351257qkn.107.2020.04.26.04.27.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 26 Apr 2020 04:27:02 -0700 (PDT)
Date: Sun, 26 Apr 2020 07:27:00 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200426112700.GW4555@bill-the-cat>
References: <20200410163403.1.I3190d9b77167a808c65f44883fd1bc1c1d15218a@changeid>
 <20200410163403.2.Ice5c9d8cd5de91bb8b2f0db60c93e5be3d921893@changeid>
MIME-Version: 1.0
In-Reply-To: <20200410163403.2.Ice5c9d8cd5de91bb8b2f0db60c93e5be3d921893@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, Simon Glass <sjg@chromium.org>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>, u-boot@lists.denx.de,
 Thomas Hebb <tommyhebb@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] README: remove references on no more
 used config CONFIG_SYS_RCAR_I2C*
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
Content-Type: multipart/mixed; boundary="===============0615466127355197759=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0615466127355197759==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zSvig8sR1vi+U47p"
Content-Disposition: inline


--zSvig8sR1vi+U47p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 04:34:41PM +0200, Patrick Delaunay wrote:

> Remove the references in README on CONFIG_SYS_RCAR_I2C_* not use
> in U-Boot drivers/i2c/rcar_i2c.c, since commit a4d9aafadb31 ("i2c:
>  rcar_i2c: Remove the driver") and commit a06a0ac36d59 ("i2c: rcar_i2c:
>  Add DM and DT capable I2C driver")
>=20
> Checked by the command: grep -r SYS_RCAR_I2C *
> And these CONFIG are only defined in
> arch/arm/mach-rmobile/include/mach/rcar-base.h
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--zSvig8sR1vi+U47p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6lcAQACgkQFHw5/5Y0
tyxxCQv/Wfzg3cm7EUE0CvfTDzLqJirwkL+L3m7SCFD30WklSBABfgHHpOIdQJxe
4LQbwUPQXxgFHiNID8J5u7qcpfB/y5w13J0DTz83+20JU56mEw/8P19GfqTjNnQ2
8KtRZ/yx4ZougtxxafyXIv+2nqhZsVDfIkNYv6t7GKLmeEhRU72KbvbP91CMf5Lw
OFO7rnFXrTNo8epBhNIvSRyFRK+y/SQKuw/HvOSPtlaaWW/aMBM43rfjZh86aotU
EKCRXtaNQQJktuM5oh9ZPVuRoFzpmsYYNHsQydkRNfDyWeQMqgglT/zw4HmSFkKL
7ezv8fYQVUrxGKoUe4cS1EnrKJ8X9KrppMGjPhdSouF6YXd4HN51r7C6dNaVe6Ug
Jm5Gc3RDLbK5cP+RTAN/S6OKz6QfCCh+bH4tCblisJ1QhyUr+Jqf9bwo47Wo6qtY
2xq3RUGfc9AkIuPBGIhHMpRhPV7aaKSos/BLQFqAZjed3ZViymvA6Dx14/JK1mxW
dCJD4Kh3
=Zf6e
-----END PGP SIGNATURE-----

--zSvig8sR1vi+U47p--

--===============0615466127355197759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0615466127355197759==--
