Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60728496561
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jan 2022 20:02:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 264C1C5F1EC;
	Fri, 21 Jan 2022 19:02:45 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBA2CC5F1EB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jan 2022 19:02:43 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id d11so10940006qkj.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jan 2022 11:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7/EJOQ6MUlWplwEnPINJ8kV22ENbnvw/mJDTNmVBr+8=;
 b=cYsKk9erD3kGp0dVTX42ol2c0u1700PJrkk6imATVXjL3RXOr1KIY2mgKW17aAFgh+
 nip/u/+++jULt6NtZvDUki1P6XQymJ/RK/UH0mZbkH/wIL0Kr496gKifP0y/0Y6E9OaD
 2jXVT9oYObXJTx6Xp3Oh36ZMk3LktwiuDd+xQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7/EJOQ6MUlWplwEnPINJ8kV22ENbnvw/mJDTNmVBr+8=;
 b=J7hsbL8pZNB8tHy89L23p26azD40skMpFTbiRNXVbkgyqBWx5cG6AK5FSrievmnFoS
 9DRdfqFHkEsSAU+DBxWuRAqcTq7T4auJnfsBGe0dwv4QTqDAwDdrtMm9gsZRvtVuRpKn
 ChGuVLrbVVvRu/gyhlmM+lcb8gVKoDKUpWwEkic/Fecu1nZ15wvPmlgRaTPcltBlo/N0
 /W3J/edTNoj9jrDtQcXwQJ90Vk5ykwIBpKKdGhILYIAzBKzeoQr2d5uAp05mHHkooX9e
 Jv+Z3ndIDgZ8NQH4eNv3pSWyFEa5gsd9Fd4nOr47tEozN7jJFYNP1H0jt0PzfB0FHVAO
 o5Tg==
X-Gm-Message-State: AOAM532I2dy04uffp+MCWHKaIk0D5+O7hunbEetAG5DwWLMthwvwydmM
 FavccpD9gmUEPZKLIDAmC3O5Ng==
X-Google-Smtp-Source: ABdhPJxEc2B/HwBZ8asjFWcRlqedmAFKO80QuaxFE+/XLLBN7rr55JzqAYgWlxviWXylTI7vB97U2A==
X-Received: by 2002:a05:620a:1a95:: with SMTP id
 bl21mr3918664qkb.177.1642791762827; 
 Fri, 21 Jan 2022 11:02:42 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-2ef0-5dff-fedb-a8ba.res6.spectrum.com.
 [2603:6081:7b01:cbda:2ef0:5dff:fedb:a8ba])
 by smtp.gmail.com with ESMTPSA id g74sm3378491qke.48.2022.01.21.11.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 11:02:42 -0800 (PST)
Date: Fri, 21 Jan 2022 14:02:40 -0500
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20220121190240.GE7004@bill-the-cat>
References: <20211218182752.1121322-1-sjg@chromium.org>
 <20211218182752.1121322-4-sjg@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20211218182752.1121322-4-sjg@chromium.org>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Michal Simek <monstr@monstr.eu>, Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 uboot-stm32@st-md-mailman.stormreply.com, Mario Six <mario.six@gdsys.cc>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ramon Fried <rfried.dev@gmail.com>, Stefan Roese <sr@denx.de>,
 Andes <uboot@andestech.com>
Subject: Re: [Uboot-stm32] [PATCH v2 4/5] Convert CONFIG_BOOTP_SERVERIP to
	Kconfig
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
Content-Type: multipart/mixed; boundary="===============6418451585815415290=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6418451585815415290==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I7gN1YuHeqxrxkIZ"
Content-Disposition: inline


--I7gN1YuHeqxrxkIZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 18, 2021 at 11:27:51AM -0700, Simon Glass wrote:

> This converts the following to Kconfig:
>    CONFIG_BOOTP_SERVERIP
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--I7gN1YuHeqxrxkIZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmHrA1AACgkQFHw5/5Y0
tyyzfQv/frr2J1s//NOlB2+5rCPXuWTcCVEJZLSCNdNBksn+Eyfv+iJ/obB4sm9g
eqrE+ZK4GF7LG0u13e/Y/WoqemxmQ6LMy4hGZYk2c6K9J8KBWFGIb9pIjTqse6f0
Uho/O1DtfLqdvYMw6EtYz8khnGKBRDulaV1RWLyL0fPp/h63nGuj5y4nKFz6yFEE
+S4EbLDCUBObGqZf33GYAqbeLI2CAdNGqHi2KOTTdjtZuWW4e8H+w+CDro33LX3k
gXuUxxvvXgXmd/xum2STcvR2VFYJgVNCvxiDEJ4b55vHhJkuGgdYqs/DlVdGcDk9
D/JD9+rp/TyJSwn4bsjlDYBBqO11OqhTwV2Mtqep85MQUFF2LSe9NV80NEbCB8Tw
ZCfZPiMtsiXIq089BJhthCJGGlYJzP3D6YHkQG0NU1tVp9nxUGQlaLcfolQLpxuY
yqigavVwoooAk+ZQ4Q8Hc1rhL/R8adV5XajZnWJ+J65WI56tudhg2VJ5b/FlpuiP
tZcTZjU1
=/hXT
-----END PGP SIGNATURE-----

--I7gN1YuHeqxrxkIZ--

--===============6418451585815415290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6418451585815415290==--
