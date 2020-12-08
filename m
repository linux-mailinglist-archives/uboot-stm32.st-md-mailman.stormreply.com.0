Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 345B22D2F28
	for <lists+uboot-stm32@lfdr.de>; Tue,  8 Dec 2020 17:10:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEEA0C3FADB;
	Tue,  8 Dec 2020 16:10:56 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6396EC3FADA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Dec 2020 16:10:55 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id z11so7204176qkj.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Dec 2020 08:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tm5kr3M8+9lv/Js1m37aVtbQriSJR68lGOdJ+Z0l8Z8=;
 b=cyYAGwF7nH9N8pnr0p2HwvqFAP7PVE9uzgK51idu+R74ooxLtqFw7E4Do4p77oAJ/f
 nqpw2HCQKx948KK+91HXTPeG5d1/zrxhFzDQvcQwtnf6uMlfN4x79aMQXPqzmUTY6XMe
 N6524ajrpp6RcLLupa7wD3cyhmZwW5Cn7w0Gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tm5kr3M8+9lv/Js1m37aVtbQriSJR68lGOdJ+Z0l8Z8=;
 b=pB/A9mGUY6oHgue8BjfBWIA3G5Y4BU4w2DtrzM6B5sj/WtGp5COgxUhdiNC1avHA6K
 B1/XA+5+EFhp1x51VAKLC5hK3izIV8ZOkgSy4uicW51yR6KTo568gkdSv8g7qRDUlDsL
 44V9N0FIohi06J7N1xyeVUxRzjgZVQCTXcDPMpXTfqq4QYooJNUk/Foz0P8amPFx4bk5
 yEjUWIQLWgRnHIIvuLodDn9s/RNgLNzEVErjJJBxG18KktyNYO17B/D5PbNksAKJJucg
 RLh0pTzwjIyE+UHrdDuOTW53KA7YCOlkdzRE+rTw1Yi7670bIXQbQO8gSkhISWch1pE4
 QdUA==
X-Gm-Message-State: AOAM5318NqUmw8bqMzStutaPaqAIMGOMIIjJtqDmBYFnVRrXrMMlMNUY
 Ijy+K5P4mUqAcO09Qru/pAqZ/A==
X-Google-Smtp-Source: ABdhPJy/oOAeuc+lu6TtNnJp1f4wOuBialoRb3coD4/NPO1lDfIcNkBa9edX+PQyGMtz+LAc52FuWw==
X-Received: by 2002:a37:43c2:: with SMTP id
 q185mr13287094qka.257.1607443854157; 
 Tue, 08 Dec 2020 08:10:54 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-135-175.ec.res.rr.com.
 [65.184.135.175])
 by smtp.gmail.com with ESMTPSA id y189sm15242050qka.30.2020.12.08.08.10.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 08 Dec 2020 08:10:53 -0800 (PST)
Date: Tue, 8 Dec 2020 11:10:50 -0500
From: Tom Rini <trini@konsulko.com>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <20201208161050.GO32272@bill-the-cat>
References: <20201125122610.1.I56a5b1310adc1bce11401f8f2e1577be96dee65a@changeid>
 <e2ef8d3d-8725-0737-437d-ba3e2642cf7f@prevas.dk>
MIME-Version: 1.0
In-Reply-To: <e2ef8d3d-8725-0737-437d-ba3e2642cf7f@prevas.dk>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Guillermo Rodriguez Garcia <guille.rodriguez@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] string: Use memcpy() within memmove()
	when we can
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
Content-Type: multipart/mixed; boundary="===============5281361870898835738=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5281361870898835738==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Oa6EVOJlZDYO0U9w"
Content-Disposition: inline


--Oa6EVOJlZDYO0U9w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2020 at 01:07:43PM +0100, Rasmus Villemoes wrote:
> On 25/11/2020 12.26, Patrick Delaunay wrote:
> > A common use of memmove() can be handled by memcpy(). Also memcpy()
> > includes an optimization for large sizes: it copies a word at a time. So
> > we can get a speed-up by calling memcpy() to handle our move in this ca=
se.
> >=20
> > Update memmove() to call also memcpy() if the source don't overlap
> > the destination (src + count <=3D dest).
> >=20
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> > This patch allows to save 38ms for Kernel Image extraction (7327624 Byt=
es)
> > from FIT loaded at 0xC2000000 for ARMV7 board STM32MP157C-EV1,
> > and with kernel destination =3D Load Address: 0xc4000000,
> > located after the FIT without overlap, compared with
> > destination =3D Load Address: 0xc0008000.
> >=20
> > -> 14,332 us vs 52,239 in bootstage report
> >=20
> > In this case the memmove funtion is called in common/image.c::memmove_w=
d()
> > to handle overlap.
> >=20
> >=20
> >  lib/string.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/lib/string.c b/lib/string.c
> > index ae7835f600..ef8ead976c 100644
> > --- a/lib/string.c
> > +++ b/lib/string.c
> > @@ -567,7 +567,7 @@ void * memmove(void * dest,const void *src,size_t c=
ount)
> >  {
> >  	char *tmp, *s;
> > =20
> > -	if (dest <=3D src) {
> > +	if (dest <=3D src || (src + count) <=3D dest) {
> >  		memcpy(dest, src, count);
>=20
> Hm. So the condition you add (src + count <=3D dest) implies no overlap at
> all, so that's ok. So this doesn't really have anything to do with your
> patch per se.
>=20
> The existing condition relies on memcpy doing forward-copying. That's
> the case if the implementation from lib/string.c is in use, i.e. if
> __HAVE_ARCH_MEMCPY is not defined. And if an arch defines
> __HAVE_ARCH_MEMMOVE, this memmove() is not used.
>=20
> But AFAICT, there's a potential problem for the case where
> __HAVE_ARCH_MEMCPY is defined but __HAVE_ARCH_MEMMOVE is not, and e.g.
> arch/arm/include/asm/string.h does
>=20
> #if CONFIG_IS_ENABLED(USE_ARCH_MEMCPY)
> #define __HAVE_ARCH_MEMCPY
> #endif
> #undef __HAVE_ARCH_MEMMOVE
>=20
> Of course, the arch-specific implementation _may_ also do
> forward-copying (I haven't tried to decipher it), but that seems to be a
> rather fragile assumption. At the very least, some comments would be in
> order.

Looking at this deeper, today, ARM (non-64bit) can and usually but not
always does use the asm optimized memcpy / memset.  No other optimized
functions were copied from Linux, and no other arches seem to use them
today either.  I think in sum then, Patrick can you please do a v2 that
adds a comment here, in case we get more optimizations in the future?
And thanks for the review here Rasmus!

--=20
Tom

--Oa6EVOJlZDYO0U9w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl/PpYAACgkQFHw5/5Y0
tyyWbgv+OAPT2oT82hl2XEU+7f4ZNmzkkkw40R5gGzSJ1ZsCkp1tC3TYzgvIwaVR
v6YMl60LnYYG52HzCKWbTZfFuo5ec2wd2imaMb4jwUgn54rtJ4mPaVf51CqnX8CE
trbg8gQN07eJcDz3xvAMs0cEeSoLlb4eRNRY5hITPYZpxySjfgMPlR01YPrwC8+j
AtIOe4rDsbTaUkq5HITr37zetw0RW/glGw44LEAwree5Zn8r/qFSnm2AXZy5+WtD
KT8yTTzNItQqD2qpZInK5o3yqPZNs0mgNVRB/C/+Y9rMQage2Dv/WARyEzYNjKL2
jL+L1Us4sKQbxcZwSPMCSFWtuR9BAXDfI9xapTQ2UFX2qbYxTZrKXSZRwmr4AwBr
mYnOjjH9tiBNkfgHBRoPifdP/JUfkjsFRPUkwisC2TeGzkuCNt7EVIralgqq/SCg
NIPSCZi+qJmHnvqCSiGEV8Cuq1Sfm6op70mMDXl+6TRdYm1lFKxgWEA9P+YCPinI
TCz8M0JE
=sZxG
-----END PGP SIGNATURE-----

--Oa6EVOJlZDYO0U9w--

--===============5281361870898835738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5281361870898835738==--
