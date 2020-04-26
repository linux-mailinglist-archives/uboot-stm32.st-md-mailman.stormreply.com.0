Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F95D1B8F6D
	for <lists+uboot-stm32@lfdr.de>; Sun, 26 Apr 2020 13:27:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD0D8C36B0A
	for <lists+uboot-stm32@lfdr.de>; Sun, 26 Apr 2020 11:26:59 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BBBFC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Apr 2020 11:26:57 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id v10so7056826qvr.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Apr 2020 04:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZdDgqfcTW/Z5M3uZ7vhDP1Qs67J3JuhB8Lmh8r8qwoo=;
 b=Vx46pwGPNPfoDjtzqsu8jvUxwE+no3BIE+5Cwsvlg/2e1A2wrY3MFL9igMMEyVj0Ia
 lpIQPNGNnTBEJ9gugkkrhFweQ1P/20GsRSd/J7GFn/h9fyGIvqqkXGE+xAjjxUhXa/35
 /4lREcD9E8jgKr1WpnzQPiVxlvv8Dxvbc9zb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZdDgqfcTW/Z5M3uZ7vhDP1Qs67J3JuhB8Lmh8r8qwoo=;
 b=fQ4L0DYtuIcf8CiEbTCXS0whGQ1kLc3QodJR6d4ho76xeRsqmL0r3mGumliW7zrvor
 H9sAfkFJ7kdc3IFz1cJSz4oXw5BhgA0bhOQ/PfzRC+EgPIjRnzDMk/CanIcnm4U/wKa6
 sI3r0QXKSLRLes+KoBQNOI6he+CokFbBSoYIGIHrmbjNBuQRcK+20nYdrWyanYcmOgSY
 QPBAtPi5ZabEO9bivyqZ3Ah/JArRA+FIzQH7A5c7bHquYkVd11fuqbSxhT1+V/PlkXga
 RXtoym+4OM+ZZpa8l0TQnqS2xXs+gaKaOrSdSpiO+dzImHaLhFVMkgQhOVYxrVHE4BMr
 dUKQ==
X-Gm-Message-State: AGi0PuasDejlSODVDZz0PhX/vLPgg42gL90FzJ9piION2mH1xJt2qC8k
 AuS/xcnwC9MxBOvWavOr+ScW9A==
X-Google-Smtp-Source: APiQypJSrNzJuzmqycv1o1g6hetqE5jYAOTuS/nRjFTMVpD7vhEcy1zQolXoaSqWmK9Y1VhmK3LQ9g==
X-Received: by 2002:a0c:e4d3:: with SMTP id g19mr14509051qvm.110.1587900416299; 
 Sun, 26 Apr 2020 04:26:56 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-0077-5706-6f89-bef6.inf6.spectrum.com.
 [2606:a000:1401:826f:77:5706:6f89:bef6])
 by smtp.gmail.com with ESMTPSA id u35sm7419446qtd.88.2020.04.26.04.26.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 26 Apr 2020 04:26:55 -0700 (PDT)
Date: Sun, 26 Apr 2020 07:26:53 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200426112653.GV4555@bill-the-cat>
References: <20200410163403.1.I3190d9b77167a808c65f44883fd1bc1c1d15218a@changeid>
MIME-Version: 1.0
In-Reply-To: <20200410163403.1.I3190d9b77167a808c65f44883fd1bc1c1d15218a@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, Simon Glass <sjg@chromium.org>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>, u-boot@lists.denx.de,
 Thomas Hebb <tommyhebb@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] cosmetic: README: Fix one CONFIG name
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
Content-Type: multipart/mixed; boundary="===============4421757349848338863=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4421757349848338863==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ixld1Vb3X5DTED84"
Content-Disposition: inline


--ixld1Vb3X5DTED84
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 04:34:40PM +0200, Patrick Delaunay wrote:

> Only replace CONFIF_ by CONFIG_
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--ixld1Vb3X5DTED84
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6lb/0ACgkQFHw5/5Y0
tyy12wwAkXQN3lbrYa/0g2UanefIgTFiz0lq/SI0MbtbrJ+3+sUtiug9320/KID5
O2cScUDNUr3xG64t3prwIfDvoNiTJUevAdQE4W84wnZNfE2e4iDOQOUfJ76I9DLB
hBNlm9eDgCuWmsndFcyOkgsJkd9Vx93XvHJ9f6rOPlvXZSWgRgPZSmH2gXmjA/fl
OVLqfC01t4t0CBDYVzfoauEMS08yU4s6lc0aRRZ6XiQ1iFZZdT0SF0uNxCh733Lx
qBXqfrY5FQvRJf4Kn8Aeu3zo6NpJCt/+UjXwUgG7ucUBUzTPPM5+nPUqqMFQ+yNM
6H7jkOH+FES8K/f5wWhD0WtIjJllxeOvV5yemUVg6jCbImoFKveDzgv1jnwlEhT5
batFXorPxxU44RtAbVK6YXpXepn4BhwCel7qLZy7pGgaZF/ro9KV8k7PhoPWBW2F
Ng0Gzq984ysnQKsdzdPIsxX/OS49S1mXDp58UfRQZypNBYIIbmualKWegrLXb7k0
bBlNwWQE
=8ghl
-----END PGP SIGNATURE-----

--ixld1Vb3X5DTED84--

--===============4421757349848338863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4421757349848338863==--
