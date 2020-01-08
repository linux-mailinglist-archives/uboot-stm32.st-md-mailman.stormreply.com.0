Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AA0134CE1
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Jan 2020 21:12:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D245AC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Jan 2020 20:12:01 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 481BBC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2020 20:12:00 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id j9so3887744qkk.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Jan 2020 12:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=A8BEPZriCDcytqtG6xDKeiiaj/4sUZMs6QtPWCbz9MA=;
 b=oUh4EmTVpMAEHiKSaihyyqRxUcPZ/lLc/9D/WYDF3A6rtxA99PdudCwnHquYwSkzqo
 9C1OraLjgzyDKdqcX5IkuSkKmBgiP7LbTIsQJKtW1Uk42p05fageh/cORNSbCH944qx1
 gbeY2sUrMK8eCJMjVttUN9d0byTARCbavCa8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=A8BEPZriCDcytqtG6xDKeiiaj/4sUZMs6QtPWCbz9MA=;
 b=C1Gq/fLp8CEUDQUClZscDZ9IuLAi2+cwmZQIsnEettJR7oi3RWxG0WawYFbnSQLYc0
 78cNszy6GM6aAKRP7PKSmWMTBB9XWkyhRXZO4K6vs607WcMm3BgKsRFvUhur5HRwYQdi
 AKOWzpXvkVEFUQA359OHkjEStIuox+HVqN/3J2l63ZC9Yuy5A8XkGx7qosndoOAcPdqe
 esaf7eR9AjSx5Zq4C/wrfd3u2w5/YfeGP4RmHl/Oztasz+TY0ybhKC0EFEWFf03cIQ7M
 tSZLHEYZNiwIPQX47DtGp7eq6UF8Qwhi9z0Ihhb7SV1mzheAi9Yahkcdnlk7jhLgQ3yw
 e7pQ==
X-Gm-Message-State: APjAAAWvbPjNoUTRaarljaOPeJaLZyNed7SgIcIASb/3PG7Xwx08dc0y
 mdDN++fTsF2KO3Mh8DVAOBX2AQ==
X-Google-Smtp-Source: APXvYqymWFmzBLDfWXD8Og4gmZKTNULk+iDKZqAmupEOzI7w6Xjf4yFk9aMh2tyf8W4JoNTMwNu4dQ==
X-Received: by 2002:ae9:f205:: with SMTP id m5mr6181522qkg.152.1578514319247; 
 Wed, 08 Jan 2020 12:11:59 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
 by smtp.gmail.com with ESMTPSA id t42sm2238960qtt.84.2020.01.08.12.11.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 Jan 2020 12:11:58 -0800 (PST)
Date: Wed, 8 Jan 2020 15:11:56 -0500
From: Tom Rini <trini@konsulko.com>
To: Fabien Dessenne <fabien.dessenne@st.com>
Message-ID: <20200108201156.GF31026@bill-the-cat>
References: <1572442713-26353-1-git-send-email-fabien.dessenne@st.com>
 <1572442713-26353-4-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
In-Reply-To: <1572442713-26353-4-git-send-email-fabien.dessenne@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Simon Glass <sjg@chromium.org>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, Suman Anna <s-anna@ti.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v2 3/6] stm32mp1: reset
 coprocessor status at cold boot
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
Content-Type: multipart/mixed; boundary="===============2037644804785985251=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2037644804785985251==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PUgybOivvlPvn0/l"
Content-Disposition: inline


--PUgybOivvlPvn0/l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2019 at 02:38:30PM +0100, Fabien Dessenne wrote:

> Reset ResourceTableAddress and CoprocessorState at cold boot, preserve
> these values at standby wakeup.
>=20
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> Acked-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--PUgybOivvlPvn0/l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4WN4wACgkQh/n2NdMd
dlLp1BAApKQW3RuZfllEAjJOi12153AtZ8b/PACuUgn2BlpOReNCzaugtsunOKPL
L1XAayupw8StG+/RmeTF39PKXo6dDW584LHMidby3q/fzhIwX+xgHBvn5TgN77+K
n/cxjFTDW3Kbf1GAPXO1L5ZB0jwXNw477ZdnAsMiIuzEJKeA+mDK5X8nCdKZ7vN/
QdnpfnoqN6q/71pek0DIfGTIyUyi8Qp8xUUE0Eb2F622xXc5MZXTO4MNZKFRehMT
EDenraaWgQ1+2iajJWtdplAQ1+/PlGDv7/apYL7LUGEg8emzd9HhrDkmGq2dGt9s
mI9yGEeEwq8bWTpi5JQq8E5wDSOPJVA7WybYFyjopLkKKPJdpiHMcb0NtpYHfof/
MF+EK2QUh9kSN7fPxp1Sfa4dW7MGTMqPJSjkk/Y8Hhbt116OJ3NDgaJb5TRkiYMU
S8gC4S3KyhCfDbDbw0Ix8z7Yg/OyX6AEB186cMO8TEofdxetO9AoUN/c9LcWx9Ik
dIwQeUHkzDbjCkPv55tSbSUbkZiq1oYCIX3+3QGPIzuMYPcpt2Y1a0R7dXe4zjkd
VBxeP+Qtu4WlnvetZ/LAYQW61niSha0I/6Jef35FuWRI1qgtD3TILnqk6Vof+pk9
SvGMRs6TQwHxIfVFYe/xauRs6OQqkNEEyy7JISP7uFxtIdx4hPU=
=XcFa
-----END PGP SIGNATURE-----

--PUgybOivvlPvn0/l--

--===============2037644804785985251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2037644804785985251==--
