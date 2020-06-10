Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FC91F5B01
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 20:11:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D4E1C36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 18:11:46 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 280FFC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 18:11:44 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id 205so3000266qkg.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 11:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rek5bACI6+V9QilVMziMXd6DD1MrK6wtpEQUd2DHGgM=;
 b=J0gFgBzij4WvNTI8ONAVaS4mBYR4fY6vFnlEeG8iPBLOGYbM3UoduQ5enDIlxV8bVm
 kvKtr4Mlm/pn3+lkCNUKQo3qKYEBc6Xry9sZv/CLqvQ1nYdmD8Qj9yR5ZRvLuFhmt/UD
 z4UpW7nd85Ad/0lfvssn7BtIdmKiafX/HRyCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rek5bACI6+V9QilVMziMXd6DD1MrK6wtpEQUd2DHGgM=;
 b=YfaCFWdmrAZWdWsoZV2ne0r7h2G3zYHAsk4RKlVeldnTu3y4wVQgHhsM8T0Zts5qms
 K6GkPC+OLkL9YAIEvRD+EB1+oWldLaBu1KSJr6Lqvj8GxxKVOas6yy9scISMwgZWBuVS
 W+3TduSxM3zdS1p8K5r92f6EKjxliXnzT5Ozp45ftZ10SkTaSq7JsmMrbKwqaHckySVZ
 0q2mj5U5Aeb4/nQcu8RujAsBRNe9onzSWziSEsDIsbOES5mPU3qy87XGUPhH1n9DLcJy
 sUT5C3wmxH98f806BLQbU0D9EvEvrVKiruR3c1EOZdf7IFgAZdX9Zm5WnBIQNli0hn94
 gkqA==
X-Gm-Message-State: AOAM532hbrMWIGGLyDh5tu7Q+UH5qcQ/O2GOPx5vOcYE/nIIdW48dt/j
 kiZF1No/q/GusgiMzI7EtN42Ag==
X-Google-Smtp-Source: ABdhPJy3pVxCT5sI0TYlAz1sED7KKB/tylRJWC3POwo1KcBfPd6kkfM4EA+IcIE+Ycg0AJw/hSm+cw==
X-Received: by 2002:a37:63d3:: with SMTP id x202mr4116455qkb.97.1591812703007; 
 Wed, 10 Jun 2020 11:11:43 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-2c5b-4fc8-1785-177e.inf6.spectrum.com.
 [2606:a000:1401:8080:2c5b:4fc8:1785:177e])
 by smtp.gmail.com with ESMTPSA id f14sm348280qka.70.2020.06.10.11.11.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Jun 2020 11:11:41 -0700 (PDT)
Date: Wed, 10 Jun 2020 14:11:39 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200610181139.GF24893@bill-the-cat>
References: <20200610172842.3728-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200610172842.3728-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wolfgang Denk <wd@denx.de>, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] env: Kconfig: cosmetics: update comment
 for SYS_RELOC_GD_ENV_ADDR
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
Content-Type: multipart/mixed; boundary="===============5492834235987609798=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5492834235987609798==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ca0e2zgpnh8/XhnM"
Content-Disposition: inline


--Ca0e2zgpnh8/XhnM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 07:28:42PM +0200, Patrick Delaunay wrote:

> Update the comment for SYS_RELOC_GD_ENV_ADDR as gd->env_addr is updated
> in board_r.c::initr_reloc_global_data() under the compilation flags
> CONFIG_SYS_RELOC_GD_ENV_ADDR
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Pretty sure that's just a typo I introduced, thanks for digging at the
code to confirm.

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--Ca0e2zgpnh8/XhnM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl7hIlsACgkQFHw5/5Y0
tyxwrQwAjZqdpcCfLy0XDNiHRcrl+fjT1FCmNLgao2jTgrqWh21hLeCe07yy0Lpe
lh0VDSRfs/DBInBDFpbma7AqNV3j0sAqJ/KHXqqPmy+XVC4gqF+3bqALF8MPS9ls
w02Dtb6T04HIMVmgARyUKrbDUM1FA4ZtgW2/fLIhSdi8/9J8g9ehRHbmizQ26KIF
8cayUl/DFH4wv/f20b/X4O11lJLxD4i40EWictaQEm7AuWe5ob5XloQQoq0+F2F7
/jrVo3PwtVflOHoKmShYgMdbZNLaXntZjjwyJzU3dePyAV78SZorUd+hKG9972KD
eLa6SoA1JzHWoDWSi7pFgOnYEb42sp7KkhdDbh2FrYi9uRg3f+ATupAAL/HSyWfj
TjxZgzdadjmYsKdracGu5xyYD5u5i4wgT3M72PadxxvEux2i5moD43wNgw1PghVK
3Uv2Cxk0HHn3dUOwr10tzKn66UbWUq0pBJ1xs4ltuRTRKhBVtZVaF+ntkTMRXld2
CVpO+eZA
=nhH6
-----END PGP SIGNATURE-----

--Ca0e2zgpnh8/XhnM--

--===============5492834235987609798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5492834235987609798==--
