Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 324A242FAB9
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Oct 2021 20:02:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED61BC5C846;
	Fri, 15 Oct 2021 18:02:45 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E86EC5C846
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 18:02:42 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id b12so9555168qtq.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 11:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZDyo2tcc7MDDEpScGXUYlaYDfl8FUMTUpzw9uW3ba0w=;
 b=CsNDgxiA/RYNi0NOcdxLvQY6QDb12jqM9V8o7MVrDScFDD8IXse5sNzkCf/K+CXhAs
 cnnL5TCMHMZiXB4FIQd3YOrG41eQvRGZjJ6eYfjsXRQB+C1MQ0LW5MNdak5Lhj/PbWKV
 yGvtkYIdi9xEvDXpabUxYry4FkNnN+PJmf+zY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZDyo2tcc7MDDEpScGXUYlaYDfl8FUMTUpzw9uW3ba0w=;
 b=EPdf1bh3MGnuAqh/FFFxoSSe0gOz6OU3tD6q/4nCJ0NkK9cWuTvyOwsqN0tY245pBO
 7JrPFpe5RLVpi/QYEY32YgNRcJgC4V44hoEfsLKKK5VgrH9f1Vp8Xu5upGSha9D1N/UP
 WWUSuN9CO3p021Yygxr3/16zSM4PRnLJHkmsT/5/tlV5mdt8eeImFA8VCgLCNE2jI/95
 HmWpp5abxe9AQxVLzt45O0/ML7l/SvzMYzTaISTz8sL1ElqNnCFHpOjlnPES0B2XiHEK
 iuDAXU2hZcCbrxFufleIlYWZ01EfOvhw0dg9hdOldVQB0NCkK8TCZi5fdXMRevH8sHaD
 5aaw==
X-Gm-Message-State: AOAM532NQG5Fm9RW+aj9XOKuX+c5vEyPY45OkUblNLlWn1Q7FWIYNKx0
 m37ZETVv/VzJKcTCjmcEmryEqw==
X-Google-Smtp-Source: ABdhPJxMcfaiKOtdLZiqpfkycUCVTMSXOGG6FfA6IwhFgHzx/LNHbMngdQpwBupL1wdIlZgByL/0ew==
X-Received: by 2002:ac8:705d:: with SMTP id y29mr15096394qtm.73.1634320961686; 
 Fri, 15 Oct 2021 11:02:41 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-f8b0-5c25-4d47-ecdb.res6.spectrum.com.
 [2603:6081:7b01:cbda:f8b0:5c25:4d47:ecdb])
 by smtp.gmail.com with ESMTPSA id u28sm2400474qtc.48.2021.10.15.11.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 11:02:41 -0700 (PDT)
Date: Fri, 15 Oct 2021 14:02:39 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20211015180239.GD7964@bill-the-cat>
References: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
 <20211004115942.4.Icb58232aa80ebd59b9530f565f0189067d43568a@changeid>
MIME-Version: 1.0
In-Reply-To: <20211004115942.4.Icb58232aa80ebd59b9530f565f0189067d43568a@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Stefan Roese <sr@denx.de>, Wolfgang Denk <wd@denx.de>,
 Igor Opaniuk <igor.opaniuk@foundries.io>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Rick Chen <rick@andestech.com>, u-boot@lists.denx.de,
 Matt Merhar <mattmerhar@protonmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 4/6] Remove unused
	CONFIG_SYS_FLASH_AMD_CHECK_DQ7
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
Content-Type: multipart/mixed; boundary="===============1999912833174774782=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1999912833174774782==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hLhiQeiEMivY5ScS"
Content-Disposition: inline


--hLhiQeiEMivY5ScS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 04, 2021 at 11:59:53AM +0200, Patrick Delaunay wrote:

> Remove the latest reference of CONFIG_SYS_FLASH_AMD_CHECK_DQ7 in code
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--hLhiQeiEMivY5ScS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFpwj4ACgkQFHw5/5Y0
tyzFTgwAoblME5/ai2zASetMP/g0CMmGx0tSSZDsL1h/+DtMDlNgc4euqC0tozyZ
Eb4lbPeP/vrVXyHDTDhCxslDgq7IVUdZphrpl9mQfoI9FkLYij1IYbjKSg6rcD4i
FQhTPZz0Q2uVSHptYMGjDLjj0qwmqEwPya9qKDjLWoEMB+mq2lvk22Yn4dMW4iy3
Uz3ensmiuIjtehYpP5hG4tbm2qKAJ4V/TqT44SjLlIPShKf+EKeJ6AA4BoOZ+vL/
DasiNaHZtAjLw6oZdsfWEolPUdl+2Yw5GM75pHKwkVzut/kZ1khEW88mKGfu7JHf
1kjDhcTlXIoRB9s92aWdNVTYoA5tR2Riee4Cz7oMCHIn95MMImdmDIy77QDCeCVq
IXNsVdTHQk/UUt4IaYPQy4ds392VZlO5zBfricsBOrHKLeeuU3Ga7Kt5bZEHXyd4
0aCkZBv+abe7C6CjkLqVFnYmz89M0vv/1D8XQfyRzyDzP0fnTdJNmtM+9aEpgmko
NYamF0rM
=LS8f
-----END PGP SIGNATURE-----

--hLhiQeiEMivY5ScS--

--===============1999912833174774782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1999912833174774782==--
