Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CA41CB650
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 May 2020 19:49:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5166C36B0F
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 May 2020 17:49:34 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAE4EC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2020 17:49:33 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id s9so1537160qkm.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 May 2020 10:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Q380tnaXimQviXdZpZgfaSwYjl6pE0sE2LTOToh7q/s=;
 b=fO++Iv52kV9sGr7P0fx7vCtLWUSQiR+uvNGQ9VAzVIZM3UdPS7ho5ynJdNMRUzv9se
 IigBqcfWa4bg8etTkW49pe4AemYAzDvboBTkaJpMS9laaytFZHBAd00yxkD1rzj9IOrY
 H04+32eP8MVvqDZXabY/QbqLwa/YofpLG+TH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Q380tnaXimQviXdZpZgfaSwYjl6pE0sE2LTOToh7q/s=;
 b=jaUUzu8QRpNvQBpwfZIsmsmO+dRDbs3WNBcX6Y3B1fOGbCmuIXyk+BRRR2dVUjkF3S
 prKPB7qB1Bu9flJJbiuN5qfb71ZNIrVzmEWOsadc3TTt/oA7ubrz928DhJngByruMQOa
 jSX4EMaml3widVtu3m9I0/tHNaG6pNm319rjZ/uw/mSMZ0XTnrEU00P8W0Yp1/9ASCE1
 U7p6rufexN3zvU9LjscFhG+mHCCTSH0bRkP8QW+Gb8KAoedTP9DtrFrrZHkry3Nd2sTK
 vy7O97GJACjsgl2haXvmdqUXaU0wsYAD97SNDXErpU0yC2TSy67qERdZNMgOe8ZI0yBA
 e/bA==
X-Gm-Message-State: AGi0PuY/YVm6nUJeVWOrWzOdXw1xQ3bNma37SCdwd1ZMMbrVnHHBuBP7
 Uf0C2VsrtDGqyo2SfMTwyHqnww==
X-Google-Smtp-Source: APiQypJbp05ZS9su0Xp3VKjtkwiGZsU5l8YYfnVV7T4ooQJMhjTcIqqS5MeKV9hyIfbH3KfH6kbnWg==
X-Received: by 2002:a37:b3c1:: with SMTP id c184mr3942962qkf.194.1588960172819; 
 Fri, 08 May 2020 10:49:32 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-d970-79cf-8141-588a.inf6.spectrum.com.
 [2606:a000:1401:826f:d970:79cf:8141:588a])
 by smtp.gmail.com with ESMTPSA id g5sm580693qkl.114.2020.05.08.10.49.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 08 May 2020 10:49:31 -0700 (PDT)
Date: Fri, 8 May 2020 13:49:29 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200508174929.GJ12564@bill-the-cat>
References: <20200226092842.5413-1-patrick.delaunay@st.com>
 <20200226092842.5413-2-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200226092842.5413-2-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, Pascal Linder <pascal.linder@edu.hefr.ch>,
 Holger Brunck <holger.brunck@ch.abb.com>,
 Enric Balletbo i Serra <eballetbo@gmail.com>, Simon Glass <sjg@chromium.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Kever Yang <kever.yang@rock-chips.com>, Ley Foon Tan <ley.foon.tan@intel.com>,
 u-boot@lists.denx.de, Mario Six <mario.six@gdsys.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] configs: migrate
 CONFIG_SYS_MTDPARTS_RUNTIME to defconfigs
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
Content-Type: multipart/mixed; boundary="===============4465748955802826335=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4465748955802826335==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZVHwZItCpgidUOc6"
Content-Disposition: inline


--ZVHwZItCpgidUOc6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 10:28:42AM +0100, Patrick Delaunay wrote:

> Move CONFIG_SYS_MTDPARTS_RUNTIME into Kconfig done by moveconfig.py.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--ZVHwZItCpgidUOc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl61m6kACgkQFHw5/5Y0
tyzc1wv/ZdaAoffYPrs6nqnBFmfHZjC+60r8Qfxz/NBqYNeVA3Txrcr1Vbbm0BOe
iVjCCF/3vmobhWmVh0X53PVeNtgKcmjtsya5eZk06WTcqFUXFOvIATlEtXxSboSn
1KzuhnwP9r3pi1aHWBVi4PlCFeggjkuKQ3tyzx7dOwX4aUcaVs/1zNH+4ugFyxTf
tRst0PEE/iSedl4B6Gc9/fbWrzJLnAob/hj+7Ts4+xBHnDQLARvF6yB7hC+v2uQH
tFBOCX0FVMTIyE61DX/2Bv1J7patC9z67xfv8aoQf54qoWOTNsGSoxMhHJoVvD+T
N88w3/MisaCHfrZ1biaAODCrcSbenPlNlyXUSIQCuhvs+ItWThsWzDb1bynk/LPC
BeR48Y10Daf+ah8EpyHYnItcD1bTM33DJgcpEZ89/Wx7zBrCJP5WFuVQwJdZXEbD
2C5JeBbLOc/01V4prgt56MKIS5GwMjMXF8XhCndlKbSCam4RuJQr4P2YV8lmLnt3
oq1ko0zO
=KTEe
-----END PGP SIGNATURE-----

--ZVHwZItCpgidUOc6--

--===============4465748955802826335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4465748955802826335==--
