Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2541AE735
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:07:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6081C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:07:37 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52919C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:07:36 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id 71so3185893qtc.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=np0LD/4Fy6DIBpQOyhJQ5B+Nit4jRotB+Ih0wUGxSUc=;
 b=EeNFcPsMf0FPs+WainD01a/eExzX2lmSV6ZEBe55wufCgb5kNg1ilZztI0RmcMN1Fx
 Jz/DFSSoTkuzDkuHZ6hdPsRkL4pFfg6LYO1orE8Sjk5hac3zqp1AdV9/fkrf7QGK5YO3
 l80rXMKrY5T0sGtdBU5LYw0Ww4h6wG5c1EF3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=np0LD/4Fy6DIBpQOyhJQ5B+Nit4jRotB+Ih0wUGxSUc=;
 b=Ms/B1ExTS4AGpp5uhJpUPGDEfMIBCmX2cOCM2JgP8ASctT3gKAxuEnojiY72RR/6uo
 jIFm4CgKtdldLQL1PQ7A5IcyLUg5elduIh+ZZ3X//fru2RA71zE+GuOI4THnQQM+IPy5
 4ebI9se4h7l0lVG8BgJgs2dc9PnIfwaG6hzX1bUoOYZmGw6pZQdgA6lMDyGUWE9esJJO
 4EAU16Jbf8CJeZzL76SIIQElbsIGPEtOADq8JuR0/z7Sit8I8s4ogtp1ifS9v8WkmNtO
 NSXwJ95V3FOqSgbiBDlumJRwSHPpE11hwrLESRqZxe+SPhnmZlq8fE1Cbv0PVBYls+CA
 BRqg==
X-Gm-Message-State: AGi0PuYf0RUpo/T/hQfQJXqCteiFMQgyJPQFetIiA3l3rHg32Yc7aMbB
 5XL8NxIqh13+ILPeyrSprGYORA==
X-Google-Smtp-Source: APiQypIBueBksJ/tnnk6E3wYjNIG41nhDtHGcOErGKrTNiEInj6ezNc70gpC04XhOYuXVPLQA/GPbw==
X-Received: by 2002:ac8:3707:: with SMTP id o7mr5235011qtb.172.1587157655204; 
 Fri, 17 Apr 2020 14:07:35 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id q57sm6479335qtj.55.2020.04.17.14.07.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:07:34 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:07:32 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210732.GZ4555@bill-the-cat>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-20-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200113103515.20879-20-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 19/21] gpio: sandbox: cleanup binding
	support
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
Content-Type: multipart/mixed; boundary="===============6670078120830713527=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6670078120830713527==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dg6Tyglv1qyvGx3q"
Content-Disposition: inline


--dg6Tyglv1qyvGx3q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:35:13AM +0100, Patrick Delaunay wrote:

> Cleanup binding support, use the generic binding by default
> (test u-class gpio_xlate_offs_flags function) and add
> specific binding for added value.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--dg6Tyglv1qyvGx3q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGpQACgkQFHw5/5Y0
tyx5PAv/QQSMp3CRX1N5FwtEh1fjbczbii62qGnV7BXTGL40WEFhJ6QydtnSdSXi
+cebp6q2FPotzXWZxSANwO3w6DT7We5C+zN4MwZDXywN2EOqE6icD2EFZbwAVRh2
ztokcT3Jq66WAp1CxT8b2kca7Gw9Bh/JUejMq78ti7F/39QqotIAqEd6yC8BdZw+
ftiAtNzcmqmh2v+qH4tY0l7plFPxFcAEODuyGQRdQWZRhDy4pqbkKynBWHbx2HRZ
/Nr9OdyCPvcV7+zBTxbVLW+mQnxRGHugSW146FLQ/X8ZQS9OHGlslNEumQ7InQyd
XvYP3/XjemvFT9/Ud03D8Z+6ZYBYodWkfKnoh+dSMkxcuBsncrBwhqXSdnsQJb/a
4LoFB7YOVx/OvrdG9Dc+T6aAMTEzW9yFXr/JvuTKiRrE4rdU+UqfNEocZbALLVeU
LoptFGVyiozRcZJk11zy6WfWQQVLR+swtJUzUPgvF0TcQNsChuHq+gPQ8DBW2pBs
C+RY4uHG
=wlrT
-----END PGP SIGNATURE-----

--dg6Tyglv1qyvGx3q--

--===============6670078120830713527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6670078120830713527==--
