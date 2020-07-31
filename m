Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8456C234D42
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 23:41:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DA1EC36B33
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 21:41:44 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B571C36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 21:41:42 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id b14so28488580qkn.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RlWj2FsFznGVGqkor1uqwyrIQo0Czw8m0WGL3c3UTxM=;
 b=eTWgN3GAdj7ZPqJUGKm5Ykm7JaZsXVtOqEhA9AWQIj8PID+zVxHkj5Nt9swQbtHPy7
 uVQSLlq70hNmlhkVXj/lym5ea/9dN1xbpNBoV2TDoZNN+xBvA5szmfIngdWnCIKqQbAs
 /NCl1VFAKqaPi7xuhdiQusA0xs3DZVIUaWNm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RlWj2FsFznGVGqkor1uqwyrIQo0Czw8m0WGL3c3UTxM=;
 b=p1ekXjc+dfAOSwGcObVcA+EWGh0iEXnciu7f18kUv5TCcValR4tg+xBaaQOodiqdnT
 cvQUmwHXi6+jLLRLaOpvHmXtHidWdejZ2LH+W2Eei069eQW78cOpEYjRs7ODbJehC7uH
 HPhQayK5QZNU0A+UwUyAX8bpFqBquDJsBAoUkHQKXRn5uj2D8xt/RO80qtkbgBPrP6YP
 hrMZ3q3Qst+kgt8BDDhoQXjoZ+TS9TqNYNQ603M+7uydujU6nCQpcovE3p5SFylyigV9
 bn/4ldTjZdTmrXwI5lqHMAZ851n11E+pnJw1YuqxWuMK5BPKXBtGy5JPf71vY0hl9xpQ
 1aXw==
X-Gm-Message-State: AOAM531HnspyTNA/DaRBK7UAKf/931gy/4MpCqUB+Ajr7L3jsWyNisR+
 Lft2gOGU9/ZEfqLlmlTMU4dufQ==
X-Google-Smtp-Source: ABdhPJzOSzvzddFfYLnvk/ojtNkTMvDvB9gixfVXuyHCSrUsQJxmmAlPhTLeqRnBHBHGA2USYfawrQ==
X-Received: by 2002:a37:4249:: with SMTP id p70mr5892222qka.496.1596231701192; 
 Fri, 31 Jul 2020 14:41:41 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-18ee-3919-a84c-b555.inf6.spectrum.com.
 [2606:a000:1401:8c61:18ee:3919:a84c:b555])
 by smtp.gmail.com with ESMTPSA id 65sm9434399qkn.103.2020.07.31.14.41.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 31 Jul 2020 14:41:40 -0700 (PDT)
Date: Fri, 31 Jul 2020 17:41:38 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200731214138.GE6965@bill-the-cat>
References: <20200728095128.2363-1-patrick.delaunay@st.com>
 <20200728095128.2363-11-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200728095128.2363-11-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Mario Six <mario.six@gdsys.cc>
Subject: Re: [Uboot-stm32] [PATCH v4 10/14] configs: sandbox: activate
 command env select and env load
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
Content-Type: multipart/mixed; boundary="===============4043558742785613692=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4043558742785613692==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oW7sRvnhM3o6r0iO"
Content-Disposition: inline


--oW7sRvnhM3o6r0iO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2020 at 11:51:23AM +0200, Patrick Delaunay wrote:

> Add support of environment location with the new env command:
> 'env select' and 'env load'
>=20
> The ENV backend is selected by priority order
> - 0 =3D "nowhere" (default at boot)
> - 1 =3D "EXT4"
>=20
> To test EXT4 env support, this backend is selected by name:
> > env select EXT4
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--oW7sRvnhM3o6r0iO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8kkBIACgkQFHw5/5Y0
tyxItAwAsOwoylmTfSnI58Ef7GswcIMDdXOMmrUrl75H19cpkjiwI+in8rGt4wtm
7r4KHXFaeLLgwXDlTW8P6oxv+Fdj0a0QkM4/ISZgTkK9rQ+uxgVRKHTD+Ajg9ox9
EdA+AoAxpiTbZ++6fziZECesfE0dY1CRKP5uJEY/hs8MdezvNhNQadiksfCt4pq+
3HAVKbQdimvjTSsciNqEXXUA21d+GyiAuj8M0SBAfk8oGtZ/3M/9jVFuKhqlhw3F
WjvshuaukoE3FnJ7mZ7gbtlCONPg3PCmhPKlk7BcwCR/dk61NY1TCvENFmWDnl+q
/fQ5xU4bX6oCr4fB7auCi3Lb5BchtgTvc0fRU/e1UHIO2pnkcVoQvpBI2d0m9lT3
oSz8SGmpxQ6z4QuMTHA17H2nMlyM6EzqgWtos/3Hozll/76VC0WPSgJM8QkDKABa
8y9SV0vz0o08oaHAs5k0we4ae2CfAC1prM4PlhXE2p/6Zw90MdpD++ZW7DgJJu1i
2H3v6Df4
=/o/m
-----END PGP SIGNATURE-----

--oW7sRvnhM3o6r0iO--

--===============4043558742785613692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4043558742785613692==--
