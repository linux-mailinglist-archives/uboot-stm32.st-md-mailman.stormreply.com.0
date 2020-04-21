Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2931B25EF
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 14:26:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2666CC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 12:26:41 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83D84C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 12:26:40 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id v18so6387110qvx.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 05:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=x8KEoh6IWtzWZX5lpKttTsnk+7IzIXUcLPZtJ3uq10I=;
 b=FKyFZEIAd29eQElO1DZVHeII3cIuKcfyAfwgPtdf4OIo4JEnhqP785/Z5hTDYdwwUo
 WeotKw8SLk0TkavqPQAQ8fGSLj53fc6TeyER4nMg8LOah0aKCrqaFySizw/SawIXPqCc
 2mC1OG9ThMkn7cxBelmuZglaADBsnErOswZb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=x8KEoh6IWtzWZX5lpKttTsnk+7IzIXUcLPZtJ3uq10I=;
 b=iHJZ0tSaI/kB6qleK47MFzWrrMAGqcBk/JHr7B/CZSrXtYVxBAaLofNeZg9Pw5nLsN
 tiSD6HkqvLZ34KEv0rlM2XK9n+DGxPQJP3hzpO+UP5ZOCbMP4kntZx/Siuc73Gx6xOy+
 X9V+As3E4Bh3GJ0fRcJEW7kjnJjMjBylq2nulN6BwbP2zsPHvBXrR3ugTSpZqP1NwjxX
 z6VbrUAf8tE+UTjMQvV3cOJBWrkNfJ+eA4X+810hA71H1RZMy3sa6kewFii3jenrRq6r
 thRp4pyc0tDbWIMdtiyD6xQR2ChXmgbkZ7vpYyuk06EJpEUBxsKZDLNVpvcTsUv69LWQ
 OYAg==
X-Gm-Message-State: AGi0PuahSRa8ucwXnBiZXnfPRl+tG2OWXk8ZdWxC3I81rROciFO/l6Ou
 j8V+nIcXMSqqY4auQL2YbEPUxA==
X-Google-Smtp-Source: APiQypJeK3H3fD68t2HipqJ0EYe70FMKmfcN0SkXZjZzXNUOC2kBqCEXJEp/tKT3ykSaHFYJJbRzGg==
X-Received: by 2002:ad4:4e84:: with SMTP id dy4mr17993211qvb.139.1587471999099; 
 Tue, 21 Apr 2020 05:26:39 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-3d58-7014-cb56-b1a9.inf6.spectrum.com.
 [2606:a000:1401:826f:3d58:7014:cb56:b1a9])
 by smtp.gmail.com with ESMTPSA id t67sm1643407qka.17.2020.04.21.05.26.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 Apr 2020 05:26:38 -0700 (PDT)
Date: Tue, 21 Apr 2020 08:26:36 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200421122636.GC4555@bill-the-cat>
References: <20200302122153.20670-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200302122153.20670-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Anatolij Gustschin <agust@denx.de>, Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH] tee: optee: use dev_info in
	print_os_revision
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
Content-Type: multipart/mixed; boundary="===============6293876903317699417=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6293876903317699417==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MEAi/rlBiy15p0nd"
Content-Disposition: inline


--MEAi/rlBiy15p0nd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2020 at 01:21:53PM +0100, Patrick Delaunay wrote:

> Display TEE version at information level; this patch replaces
> debug() call to dev_info() in print_os_revision() function.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Acked-by: Jens Wiklander <jens.wiklander@linaro.org>

Applied to u-boot/master, thanks!

--=20
Tom

--MEAi/rlBiy15p0nd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6e5nsACgkQFHw5/5Y0
tyxmoQv+KjZXWrPpdzeBoPyOkRMeQwSx6vb8gaPQYAYYPerFYgVWRUXK789kKJKj
Fe2deK6XN7UihsFvaqfE7bSqxjMITc8SI/mrxZxIF9izw+1RGoPBrUZS4L2DXXNC
xo3lj9cPBQjLXMrkO7Zr8zCDKEvYcp6gdyfAAjXJTNbYG/uHpFtRaWd1N9mEkDDF
PSkrC1pgTAjoluT0YOxiBBNZ/oa46JGuVe5VqDEt+COoFjI1sUgdhlZQ61Gv6TWe
p11eWTB//CgOFWMMoXG5PGCRu8G2oZ0iu5rAOa8eea/whBqXsfeztYPMJMD+ErvU
gIac9/RDrZmLlN4kpbJ7kCM3IMW8iaZAE2yNuuEjD87Bsu8qUVIBNhNsoVwgg2M8
1HivxHz9jmohnOIwM4z7xGiz2gjdaQ3p0kXGIVJdG+SzlGdZUfjt/R47pdqI1XZD
ym5v1kfQHiQ6RoffHkNV+3I9f4W5xB9RZ9d4HWQPiS5sLRbkwyUiHfuaDlY+c7P2
S1PNbvNY
=CoNV
-----END PGP SIGNATURE-----

--MEAi/rlBiy15p0nd--

--===============6293876903317699417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6293876903317699417==--
