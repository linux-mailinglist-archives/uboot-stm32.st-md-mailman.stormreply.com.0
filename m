Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0D6234D43
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 23:41:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55749C36B33
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 21:41:49 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A7E9C36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 21:41:47 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id 6so24133876qtt.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=j3/x4YsW8terd1wHavZ6gy0+6vriYb3OqqRMk6jpf9s=;
 b=Nwl0/w+TevpJTo3BtrrHQSGOlP6j0eOiGcVibBzTnUApehYKAZhZqbGEpTDbv4xsw8
 YNdSJL2r1D/oqMgbjNZDO/ctDh5Cm3NIhxCzTxe/lMcdAb5Wxoc2lcyxlWzooZoaSMzd
 +HAPd0MnU+qisJ8X55IYY4mUlccHcvFcTmQQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=j3/x4YsW8terd1wHavZ6gy0+6vriYb3OqqRMk6jpf9s=;
 b=pU1pFvbH2ponO1qWxVUDqk9xqP+rw3OhEICugDRmYl4LcCa0eRqqDLfF5rpp0EOhMU
 FX5tCGoHCRDzc8Hsi4zuIiUkmwZTWewa8uuu0iaFj0Q/IdF+Cr84R7ibSlKhlAe3Qsk9
 bbFVvgCoaHzHsBJtWINinCD7snKQAhOi66NFfk9ftUhraSYU8N8KVXqR2aOoSP3ipcMg
 yf61RNQNT7y6BYTQL2tXGVWL82gfz42Qx6nth4/FW6ocRcWCbPwHW9y1ZldGG9YKgS/v
 1OxSey7FHr0ETSB0PxUsIGVvb/mdnJWJL+CXwYIg64fLYPSqmDv1qXZPoocF4aQBKEhn
 C0Pw==
X-Gm-Message-State: AOAM5310B9Z9iPdWdz9sAZjem2a7Eq7qBrkZrhF2FGFTQpNsbhuX3cOP
 IdLJs6EDc7QBJelOI4iubbt+mw==
X-Google-Smtp-Source: ABdhPJzzafuITR0CKa8Mnm95wTR7EqLuYeRA9JYQVFQqeIbKRW5A6hgjOm6P0hef+rEDVd6t3yWBJA==
X-Received: by 2002:ac8:6f51:: with SMTP id n17mr5732405qtv.233.1596231706599; 
 Fri, 31 Jul 2020 14:41:46 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-18ee-3919-a84c-b555.inf6.spectrum.com.
 [2606:a000:1401:8c61:18ee:3919:a84c:b555])
 by smtp.gmail.com with ESMTPSA id i26sm10472396qkh.14.2020.07.31.14.41.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 31 Jul 2020 14:41:45 -0700 (PDT)
Date: Fri, 31 Jul 2020 17:41:43 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200731214143.GF6965@bill-the-cat>
References: <20200728095128.2363-1-patrick.delaunay@st.com>
 <20200728095128.2363-12-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200728095128.2363-12-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Stephen Warren <swarren@nvidia.com>
Subject: Re: [Uboot-stm32] [PATCH v4 11/14] test: environment in ext4
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
Content-Type: multipart/mixed; boundary="===============3258250623566232775=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3258250623566232775==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cClFwTGwHXbya3Sb"
Content-Disposition: inline


--cClFwTGwHXbya3Sb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2020 at 11:51:24AM +0200, Patrick Delaunay wrote:

> Add basic test to persistent environment in ext4:
> save and load in host ext4 file 'uboot.env'.
>=20
> On first execution an empty EXT4 file system is created in
> persistent data dir: env.ext4.img.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--cClFwTGwHXbya3Sb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8kkBcACgkQFHw5/5Y0
tyzL+Qv/ROuh2VEm5ny4VgoQgCSLfQNnIegvC24XgChDZRtgr9/FvF6+GeHG4dgM
PnjgrnheJNRRiK2Rqnme/YiAKq5gORYVx6Pba05LO1gWNAUQ/FVhPnGNR1bwV7kM
v/uLt3anRheiICqRdlAW92WGocFjBSPKx0gwaavfq+ZJ8xlTlMQibRizIcArRkOu
e7LBNdVLjOsL+63PRrG5TlDLjqtVay5jcgojW9vKg/OC8fvcHL5pegFfG2IK3E/T
RaXme4emX2RY7kITw98oujnoZfEyUx8VQyGoN8wFUX0eq1mpMo0GLP/tXn/FwmV/
zgmmxWQKizdrUX4vgFpbdfYOyXus9KXhG/pMx8iagfVK/EIbfwVQ36CxFgi4Q5Rt
OwuSDqbyRGkhnEky7kmeRrz96vBQ1RuZUa45tWeXWYQnZIk2MDIdXfpMPP0g4wBj
C1ZjBnvlrpmg/CF2ZcmIxLu9v5vcF3PRDUfRDtJcMdPCcFPpDdNVkjm7h38iCq9y
D1iSEH6D
=f+rk
-----END PGP SIGNATURE-----

--cClFwTGwHXbya3Sb--

--===============3258250623566232775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3258250623566232775==--
