Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD95234D39
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 23:40:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FDA3C36B33
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 21:40:40 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 655FAC36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 21:40:38 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id x6so8982042qvr.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kusgrGVyAYhF5H91jnZz0bTUiHM9ELrzq19FW5FzfwA=;
 b=EoQFGDKguFv/B2n73McRvwxUZ5RnLI7IoVO+ScJsZYoDzH8cVaGdgfootBQ9qFmBYh
 EcPz0/ZX2xLhx9ixRlEI9UIKDluc4YjB/x4HB49zVcBPnsZOF2p5tsoHePoY16NDWs1E
 8h7S1DyYdTe1Pc5fxb6bA8WoMqHBbSoxJj+1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kusgrGVyAYhF5H91jnZz0bTUiHM9ELrzq19FW5FzfwA=;
 b=Ar1UGNOMU0Uvurlmoz/BfLB/gf+k8vdywajR6CC4TUdTVyZt2yLNj+dgGQyAV3oUZM
 OiKbWfRI36AV2Fbh0IeYb3u/9lYcRTGY9J2D5RDe/vt6aFZ+a4zvF8JhIY0MxK3u6d1G
 VGTcsGCZ39ShCRpQRf+j4KItDQAnrf/VY1v1m9VMldItk0RLvt0hgfxmOwfCI6VpaviB
 +yjDcnMDzgzPnlmnLC2QYTTrlXLAIdLNQBk4sxmw2o9okIxiGmb614mSMttShsRzf5bq
 4+98wGWKb+Mwcl7+f3LUpyub9uxFMiJLVkeplD7QdfUl9nwgR/7UpYldQHmHi/b6cZE/
 8MaA==
X-Gm-Message-State: AOAM533ia+sPdhZYXLGbZ9IAZMQwfXzXWW14OH4N0k4dpf+v1LUFA/BB
 FqMgOTprB0guep65JhN0Of1rZg==
X-Google-Smtp-Source: ABdhPJwMNkodYdqD+weeXbGhNsW8M+4/3aJpBDOTbop8cnw6ZwaVAzFfbWPjgeuxC6OQnmkBIeF1Tw==
X-Received: by 2002:ad4:4482:: with SMTP id m2mr4098501qvt.102.1596231637375; 
 Fri, 31 Jul 2020 14:40:37 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-18ee-3919-a84c-b555.inf6.spectrum.com.
 [2606:a000:1401:8c61:18ee:3919:a84c:b555])
 by smtp.gmail.com with ESMTPSA id s30sm10703421qtc.87.2020.07.31.14.40.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 31 Jul 2020 14:40:36 -0700 (PDT)
Date: Fri, 31 Jul 2020 17:40:34 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200731214034.GV6965@bill-the-cat>
References: <20200728095128.2363-1-patrick.delaunay@st.com>
 <20200728095128.2363-2-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200728095128.2363-2-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Wolfgang Denk <wd@denx.de>, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v4 01/14] env: add absolute path at
	CONFIG_ENV_EXT4_FILE
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
Content-Type: multipart/mixed; boundary="===============3181532073233257967=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3181532073233257967==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lVeXceEWwX5P4dh7"
Content-Disposition: inline


--lVeXceEWwX5P4dh7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2020 at 11:51:14AM +0200, Patrick Delaunay wrote:

> Add the absolute path to the default value of
> CONFIG_ENV_EXT4_FILE =3D "/uboot.env".
>=20
> This patch avoid the error :
>   Saving Environment to EXT4... File System is consistent
>   Please supply Absolute path
>=20
> Reviewed-by: Tom Rini <trini@konsulko.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--lVeXceEWwX5P4dh7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8kj9IACgkQFHw5/5Y0
tyyzCwv/TaZdIUB9s1yqHSrGvwInfDIfRBPHZfSt5ghNNT+dYJA1i3pdBQi/i9LW
t7P84uAwqpMTjz8SE8avawHgYd7IDA/hTIUoGgeBD32ttBKZMp9MVlST0UTe1erL
8DHX76H5NmUvNY9vymi9hGKfpl3VzCAkS4hRIFFVwj5MCGjJP7DAmrrIGQk7YL2W
qhoTvya/q2aHImXvZ6njs64YmyAMRQkpIeSCgxA2+UWcrbezZE8Pw/uukMBpOqiU
tkiwXxvtOcnCvDuZpgTqc8ypTMr+0RvXk8tdV+FViLFx9+YvuTA/elUTy/YkHF8P
lsTPjvUmH6WHLtSGmNTQtf1L/74JTypSPwBUrnYM3OUF1uvAEI6fu6Cj/+qMsMRd
8vQ0Mqhctdmzv+nkQFWvhQmI09ZNmhV6qokjQ8IkmuoftrjeMNy7Ju4S9SH0JjzA
tSIX3cJVz7J7occ58dpuPSMZ44APbXtgxDRM48VNDN13hDUAMtH3P0uVVRZPkgf1
V/NVoyBF
=cZUI
-----END PGP SIGNATURE-----

--lVeXceEWwX5P4dh7--

--===============3181532073233257967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3181532073233257967==--
