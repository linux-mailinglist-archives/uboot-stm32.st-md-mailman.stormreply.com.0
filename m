Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CB91AE72E
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:06:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49911C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:06:58 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CBC1C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:06:56 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id y3so3982028qky.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jkHc8s2EfonabLeiuPWYdCh+5Lljo3gU0M4346fXv5c=;
 b=kr4C92Qeb1et+Hq3WzGEFwtqFhTjrHCcHkfIZiZyXjGDAd5B5RnxwA/4xV4m811H9U
 JDcCC1+L/t7fVyg9V29vkhRHkdPysjn5fP73p+KBnDSXSZ/e1rzXfeL4U/S3sde6y0ow
 GPaM0ZF8E2X3rFWFdTNWpFkD9QUZDX4TT2McY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jkHc8s2EfonabLeiuPWYdCh+5Lljo3gU0M4346fXv5c=;
 b=fGBapWO/OcuRJIsXHhZ9Kr95Kkxuf4Od+2sPCLJbPZRswOAmLwLiwZ0duRkANk6DsK
 tP8qljipMZkxQ1OVUhH9p3PN2sw/Atc1GUcww1EUA9c/pHAS/9UyQ8TOSqiDZgTvsS4u
 kklhGba5Cg44efxIbBMkC2U0xZnR2cQ7IZwTolIQ8/BPkq0RhtVy7nX7rgpDyJTtW6DK
 bQwTqN5uzw2x1BnlsdBYcRzNFxtBWvfTqGd4QfGPwobi+8yqQY/odVp347Z6Gd+K6s7w
 rEZsPF0F515oSrXq2dR+UYAsqNaxWEIqrX7M79KmsurOc1YQANu0S2EZTi4+K2JWaJ8i
 U00A==
X-Gm-Message-State: AGi0PuYSZ7l25e3DpLVJZbMx+3CHVqeOA5oOFWIFkCAm8LIVCwmfThDP
 yzWtLZii2O0bQ5adfhpIO55srrRpnBA=
X-Google-Smtp-Source: APiQypLgxk/FLzh8h7PWN74t580kkCKnaqSxJ7F+NjNGlX4GGb4xeazDe+k3q9/kGtCagdPA4ZDTLQ==
X-Received: by 2002:a37:4d56:: with SMTP id a83mr5542408qkb.40.1587157615435; 
 Fri, 17 Apr 2020 14:06:55 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id p22sm8504467qte.2.2020.04.17.14.06.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:06:54 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:06:52 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210652.GS4555@bill-the-cat>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-13-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200113103515.20879-13-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 12/21] gpio: update dir_flags management
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
Content-Type: multipart/mixed; boundary="===============0750647564536225308=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0750647564536225308==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tpyx7gKuSYt+mjHM"
Content-Disposition: inline


--tpyx7gKuSYt+mjHM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:35:06AM +0100, Patrick Delaunay wrote:

> Update the flag management in GPIO uclass: the desc->flags is always
> combined with the requested flags and the GPIO descriptor is updated
> for further call.
>=20
> Add a function dm_gpio_get_dir_flags to get dynamically
> the current dir_flags (configuration and value).
>=20
> This patch prepare introduction of the dir flags support with new ops.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--tpyx7gKuSYt+mjHM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGmwACgkQFHw5/5Y0
tyxbkAv/ZMiOUgp2qTcwe0bhu5Dk3phwLdM79GKP4KuSuRmAVXUTukeKpVkP6DdS
v9FU+RmN/efxuZ8hEZNI6gdDAwzhM8Voa9BWaV35karwXaLglAn8iVyhDHHMgqA5
sMOEahGuuWEz6gGBa6o2hAQEAXyx9SwOS6KKxx7TpDCiYs+RO8qMr9AYT1sy7SNU
kCNnYSOdHS0WDhGE/bhRghXgGFKMM2V4qvJDf0lXQpLZwwGzIgZVEUUVWagaOZlc
fIe+xxy4evHKBBe40HYk9A4AmDGEsdluSwJXzZXMaEDybQ6fcPTtzqRavOBLgkCi
q2ecQHgCpNc440MCzHspN21geaOMTL0RcPxjClIefAwUynuUyn78GhGel7ccK8vD
vnvwiWvw64Kr97ISpkSD4HgeEvpfYVq7hvMmsoS277W5bI/RfN/8S6lkZkGMRySq
OaIKZNotZvbouNMb6hF6g6mrxmax+AI3vZf+NC1r8qUSsBAN+E/iMmc838+H5fmK
41W/y0Ae
=Alg7
-----END PGP SIGNATURE-----

--tpyx7gKuSYt+mjHM--

--===============0750647564536225308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0750647564536225308==--
