Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A4523BCE7
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Aug 2020 17:04:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72D3BC36B38
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Aug 2020 15:04:27 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 259A0C36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Aug 2020 15:04:26 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id x6so13326602qvr.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Aug 2020 08:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8HKZ5iLpvTDl/MVOnGam2PEBQlGSc8CV6qJGe+Ju8U8=;
 b=jtgL3GhdWBOHign2L/8Hp68A89jAGO8iS8zdIDbavsJ2ZR3FZ0D+DRUapGHV2nxb82
 +Jg0XZUua68jkjnlhvdpCCTDT7w31Kce0XKpfh+MxJ646nvL11qm4n4I3dpgwt1ahXTP
 nGLS0+sKOSTYBb2zlkxyMyXzFF5n6KZNg/tjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8HKZ5iLpvTDl/MVOnGam2PEBQlGSc8CV6qJGe+Ju8U8=;
 b=dH583OzWs8amJpl6TFxHI5dF9jpu/G37TAjE/TKQbLhdcxAlv1r+6lDhNuzwFVqFPC
 tT3Nfj1D3Mj05Y4OAt1TvczV+zFi2idU6naDJ5bDvsaHEuTTm6PmZjYfYTtWtzrtFhq7
 i7fRln5aSnzmDn/g8R8m3mFe9tjYLcOm4XqXMXAHGfOmLCK8YL4wkrUSjer6C1SiGYsw
 nRXxKpx7DPCdrLcm1wAF//jMqoadXODIUmeQ6u50+8VeVLD4xLPpT+lLT4KqlulHS1Ut
 APmHZ+3u1nm/WmPKT0ori26hl5hbi9QRcCWYC3wm0IX+FFHDbuy/vuuOvFhJJ4NdP2BQ
 pMrg==
X-Gm-Message-State: AOAM531avvxrpqGQXNSOPKbJepn1FmZCK3q7R2ZjjBVPzd1Lwit/DOZo
 TW98kU1J7R6qalgMuxoAk2QoiA==
X-Google-Smtp-Source: ABdhPJz1lL/fkeWokX7BVUPYNlHCnDRrL2GIeWOupqHIksljNoLhpaOC1KNvVlVyq2Hnk8Go6pogzA==
X-Received: by 2002:a0c:cd02:: with SMTP id b2mr21493299qvm.150.1596553464540; 
 Tue, 04 Aug 2020 08:04:24 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-30d1-2f2e-908f-c5ec.inf6.spectrum.com.
 [2606:a000:1401:8c61:30d1:2f2e:908f:c5ec])
 by smtp.gmail.com with ESMTPSA id g3sm20866834qtq.70.2020.08.04.08.04.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Aug 2020 08:04:23 -0700 (PDT)
Date: Tue, 4 Aug 2020 11:04:21 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20200804150421.GJ6965@bill-the-cat>
References: <20200719161601.495421-1-sjg@chromium.org>
 <20200719161601.495421-11-sjg@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200719161601.495421-11-sjg@chromium.org>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Mike Frysinger <vapier@gentoo.org>, Vignesh R <vigneshr@ti.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 10/31] sf: Drop dm.h header file from
	spi_flash.h
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
Content-Type: multipart/mixed; boundary="===============4413816198047129520=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4413816198047129520==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wthRHICJPcnPKmvQ"
Content-Disposition: inline


--wthRHICJPcnPKmvQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2020 at 10:15:40AM -0600, Simon Glass wrote:

> This header file should not be included in other header files. Remove it
> and use a forward declaration instead.
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--wthRHICJPcnPKmvQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8pePUACgkQFHw5/5Y0
tyw43wv/aFH/DimpPtlRMXx9EPzk5Q375t/D5V4fi5Bvvef/JrDvBJf/jzmRTx0o
E4vLdIwfGeYmkkthuxPEvI00MAK8evrbVp3MxIq81jy/V+oZG4e4R3mERZ0cH/JS
Fz0yPiEuBav6hHaCTrGjE8bVbx1LkzXP/HPt/tVQwvFfPkFyjzX9zEAJ7ZvcfYi7
YJhJaMgazcRrY2piZIeVwNAzR+lmCXgmqu29ULDJ1RBlPLhwOkE+GEXgxsBW6xk9
/U/irRzv20tE/HTalmb3Lsh3LPPJ7udTvSkuvDS3Mgr5bR0TIr70rxgiM5kkhX1l
H4G8XvIfntq/TN+Z7Y45XVtP1raMv4kOzo+imk+e8N2pYK2aV+IxNgMRVpkIbPX7
VCOAYSBlHyLjalUrzOmwLh5Bvzazd6/WPrsltL1MN+25j/CejPczpThJ97Cmy1jZ
6z88CkULLzuNAnEf7wFXc15dK/IvpeOgWo50oMvcMYq2TAGs+V6fBkkiNU6VN2g5
Qncj56eA
=JBhQ
-----END PGP SIGNATURE-----

--wthRHICJPcnPKmvQ--

--===============4413816198047129520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4413816198047129520==--
