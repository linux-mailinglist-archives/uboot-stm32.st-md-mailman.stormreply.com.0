Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3366E234D41
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 23:41:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED9D3C36B33
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 21:41:38 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C25AC36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 21:41:37 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id o2so14789474qvk.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0tbNEHXDvkmRIt7uizdfyCU8CTGoDzrA5sA6WVr/aCU=;
 b=cblLV4Gqdgad9ZekCmv+RZl1LCmfjlzzA5vFGH2jvbPLcia8u+nrQfFVZ4UQwmMnz3
 jAllRxu6MokeTv4TcoHiu7MbeOz9k0823n+6yVWpwiGr+6IzI08orUM0BAKoWzskQBcY
 sDd/xpWZc0Raujco5uhby338V3JyxVWat6mGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0tbNEHXDvkmRIt7uizdfyCU8CTGoDzrA5sA6WVr/aCU=;
 b=EXsWnbSLp4qekHlWVYtUNwYrQqBa2+8mnut27V32DtNdcrSNd9HVNuyDFEEesKxyBN
 soc+S+fJut+ttL+mDTsydyaKkykIf/hDr2EaQIughsEH+6w1OBaE7NuYLz7nYFjoxf8R
 7D81/K9HPOMV7PG4Y3K1vmIYRDGicn48a2TSlHdjugfxPif9m9ScHW7MyxPsv9h5B54G
 gj0LTtwCG3NJMOnJ1G9aUyrLhA97duFYEDhWVVYUKekDsUSbXmyYli/oJcrUdVVKKQQy
 XS/XPKn0yJVo8/8//tsTxMfynoRIHt2tW85fSzk9VXOHc6K7/fWVW8u8FJePF/6uu0sn
 uS+Q==
X-Gm-Message-State: AOAM533CY3boxUmyNa+UDL1VuJbQTi+W9D+VpKL008hm1C9BNIYqT1PT
 nlfq5+A9sabUYLsRkajLmoEjFw==
X-Google-Smtp-Source: ABdhPJyIa74wKU3vuliAnN7tcNyduZ7p3oqxqCpuZ8T1FKtZzQIe4aw3uwP3sWxJEWlXFYCcRPFfxQ==
X-Received: by 2002:a0c:ff07:: with SMTP id w7mr4032596qvt.153.1596231696556; 
 Fri, 31 Jul 2020 14:41:36 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-18ee-3919-a84c-b555.inf6.spectrum.com.
 [2606:a000:1401:8c61:18ee:3919:a84c:b555])
 by smtp.gmail.com with ESMTPSA id c9sm9386097qkm.44.2020.07.31.14.41.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 31 Jul 2020 14:41:35 -0700 (PDT)
Date: Fri, 31 Jul 2020 17:41:33 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200731214133.GD6965@bill-the-cat>
References: <20200728095128.2363-1-patrick.delaunay@st.com>
 <20200728095128.2363-10-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200728095128.2363-10-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Mario Six <mario.six@gdsys.cc>
Subject: Re: [Uboot-stm32] [PATCH v4 09/14] configs: sandbox: activate env
	in ext4 support
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
Content-Type: multipart/mixed; boundary="===============3599579821549726258=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3599579821549726258==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DyGujRxquesowawl"
Content-Disposition: inline


--DyGujRxquesowawl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2020 at 11:51:22AM +0200, Patrick Delaunay wrote:

> Activate ENV in EXT4 support in sandbox.
>=20
> The sandbox behavior don't change; the default environment with
> the nowhere backend (CONFIG_ENV_IS_NOWHERE)is still used:
> the weak function env_get_location() return ENVL_NOWHERE for priority 0.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--DyGujRxquesowawl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8kkA0ACgkQFHw5/5Y0
tyysjgv/T+JlmTED/ExY2FkB7g3VKxfjsDFOrWAT8BJv2chfcchHsfq+2F1Gv9ry
Jd1lKTOtdns2pI6QvWtmfCk/Sbd2m1UMjoeO5DkCuhD+UOjSs73y953JV8Ue3xRz
2h6Ai2gNZTGw7oOVLGAHm+aEU+yDlDs2pbo2uIPJFy8Ev1b+pckZZ3ircgMXckeA
r/dOsu26LwUVReYIvuQ/gvjZ4fzxd69HR6gq+XIkuTGDxPqBY6Ge3R+yByuZ1J2n
dxTp28iTHdojlBBEqdDjbZrQ1MVke9uR2B4qLq2xgBYhLa0n0qq5GUhCardE98HV
5JfnUHD3ia8WlWdWCljTP7DmqbDL7T5h8HjmSWkWxwPofAeX4NcRnkfJqvBv6sl8
c54rPE3mH3cI8mKS7qPH+s0gzu27CsiU83WW5gXuo4NVt5eJNjcSmGGU4ZJqgdvF
Q/ndC5Rt4exuP6WFmECdULhEn+NWMpZTEMd4DI6+8FyYt5VOPZIlwjO91c7Lp9O2
nTkuVTu3
=Ig0v
-----END PGP SIGNATURE-----

--DyGujRxquesowawl--

--===============3599579821549726258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3599579821549726258==--
