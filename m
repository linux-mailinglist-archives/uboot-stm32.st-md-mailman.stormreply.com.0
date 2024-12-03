Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3339E2C4F
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Dec 2024 20:49:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B055C6C841;
	Tue,  3 Dec 2024 19:49:03 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68EE8C5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 19:48:56 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-466943679bfso53473061cf.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Dec 2024 11:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1733255335; x=1733860135;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sMCDoxCEzwxRUq+0lQMe7xvx+8AC4XXddrt4LsZ2xb4=;
 b=rIc36O84VOsbHDgQuq04ncrU5vD7hManAQKRfENYutxiZgAkYjvweqAM3I383PaNU6
 qSxljbBq08Sjg7xktnkC9b2ylCDHmZnyTolVLx3Gem2RNOm+mCGKguywctp7pgYzavuy
 gHAUbPaG8c/n3xwSIPRM6SGtXteu2i7nPhzNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733255335; x=1733860135;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sMCDoxCEzwxRUq+0lQMe7xvx+8AC4XXddrt4LsZ2xb4=;
 b=QzcLG09/h+JwLbgnTp+dUa/jyDiIRuDlVQjE9USKiz9ZEbaUHlelH94cyH/xNpChSW
 6fx+Wq6BZdZ7rxzsYDiBz87E0AvTKSILU8EaSS6w3AWgZ+0FC8JPEWNZ/6Qr4mQ3wK+3
 kCK6AaIwBi+3yT20B3ewhfp+ZC7+p6VX4Y0lbiapr/6EU2TvWaAjc+nJdOzJ/hqplfzT
 Jep+UyhZXXAlO7sXDHNBsZpewuwwzr5H/EeKErUd2BmQVwxQqVRsgRDNVlOtEZu4xhhQ
 qDqKm0ZezcBJVc34m1pMIBo9qXC2636cXSgwbWdNqAMdSehQOhP8LPc3jSwrH4Kp50kb
 P7pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeYpyPL8ejkzdx6ZLZG+QdV3I0ffEbBQ+9PxdyNCb6DDY8LL0JmTCGIXE9lWlFfCGcNHPZW3nnqNuaSA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy1TQG7HXgznC2EQ2ODDtP7Pg5uws508UnmTy3EFvcXdxm1DOpY
 prXQ+GVSxVdcNbolhFT7XIKHr0H27ZmdszV0C/31Lbsi8uWzaE3BfAPIqD08pHY=
X-Gm-Gg: ASbGncuKd+K0xeblFpnNWvzJ9JpCwn33mIuWz+9jiN4H5k7UVyiR8CC1K4sbNy+ThLv
 g5H+iCs9Mv9IxqdIu7xidEeVtqsLzHKWxwLrmS108QO1oP/3qLM/gUTHHSYUzBOcL+z3VzTP7z3
 ARVM8SeHDQZAIyRBU2GPHIV5vhxF1PQrFLOMxLOopD9MHDGip4IC6BhRBM91cGvyR+K6fVNFnws
 FQy77Rkshs+nYY2Jjy46ZR0J71hBDsk43qK1H2GuwLThus5CA==
X-Google-Smtp-Source: AGHT+IEbitIYAXt7ZZaRZOMs46GmyHKxxPKvNboGd3OF7Ltwwy5E08yN8XZpsBOiOXnAHAvzsCFJBA==
X-Received: by 2002:ac8:7e96:0:b0:466:9a61:273a with SMTP id
 d75a77b69052e-46717ce5b21mr30973181cf.52.1733255335246; 
 Tue, 03 Dec 2024 11:48:55 -0800 (PST)
Received: from bill-the-cat ([187.144.30.219])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-466c4054bf2sm64636811cf.17.2024.12.03.11.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 11:48:54 -0800 (PST)
Date: Tue, 3 Dec 2024 13:48:47 -0600
From: Tom Rini <trini@konsulko.com>
To: Peter Robinson <pbrobinson@gmail.com>
Message-ID: <20241203194847.GA4022002@bill-the-cat>
References: <20241103003322.626036-1-sjg@chromium.org>
 <CALeDE9MfWEAb91uzQPa6_jSo6beJv_GNHTY2TeKnSzFm6V97gw@mail.gmail.com>
 <CAFLszTito2+-qgOc=7bc3i9WmBZZCcAVWSY5hoH0neGjTg6zEQ@mail.gmail.com>
 <CALeDE9MORdUY440JAgHNXdoqWfJy5V9bC=TK5U242QG4Lc1Ptg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALeDE9MORdUY440JAgHNXdoqWfJy5V9bC=TK5U242QG4Lc1Ptg@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Wan Yee Lau <wan.yee.lau@intel.com>, Devarsh Thakkar <devarsht@ti.com>,
 Sean Edmond <seanedmond@microsoft.com>, Sean Anderson <seanga2@gmail.com>,
 Charles Hardin <ckhardin@gmail.com>, Alexander Gendin <agendin@matrox.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Andy Fleming <afleming@gmail.com>,
 Stefan Roese <sr@denx.de>, Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Tien Fong Chee <tien.fong.chee@intel.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Doug Zobel <douglas.zobel@climate.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Angelo Dureghello <angelo@kernel-space.org>,
 Ramon Fried <rfried.dev@gmail.com>, Christian Marangi <ansuelsmth@gmail.com>,
 Michael Polyntsov <michael.polyntsov@iopsys.eu>, Marek Vasut <marex@denx.de>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Wolfgang Denk <wd@denx.de>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Enric Balletbo i Serra <eballetbo@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Alison Wang <alison.wang@nxp.com>,
 Maxim Moskalets <maximmosk4@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Igor Opaniuk <igor.opaniuk@gmail.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Raymond Mao <raymond.mao@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Samuel Holland <samuel@sholland.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kamil Lulko <kamil.lulko@gmail.com>, Mario Six <mario.six@gdsys.cc>,
 Richard Weinberger <richard@nod.at>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: Re: [Uboot-stm32] [PATCH v3 00/25] led: Remove old status-LED code
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
Content-Type: multipart/mixed; boundary="===============1812768395751148228=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1812768395751148228==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s7q5Ss9MtVH/krld"
Content-Disposition: inline


--s7q5Ss9MtVH/krld
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 07, 2024 at 07:33:51PM +0000, Peter Robinson wrote:
> Hi Simon,
>=20
> > On Tue, 5 Nov 2024 at 07:18, Peter Robinson <pbrobinson@gmail.com> wrot=
e:
> > >
> > > On Sun, 3 Nov 2024 at 00:34, Simon Glass <sjg@chromium.org> wrote:
> > > >
> > > > There has been an LED framework in U-Boot which uses driver model f=
or
> > > > about 9 years now. Recent work is underway to improve it and provide
> > > > more features. It is probably a good time to drop the old code, whi=
ch
> > > > is only used by 5 boards:
> > >
> > > I don't believe, from what I can tell, they are feature comparable, at
> > > the very least I have not been able to get the Pinephone working with
> > > this so as it stands I still don't think this patch set is ready yet.
> >
> > I don't have that hardware, nor the other 4, so cannot do anything
> > with this feedback.
>=20
> Don't you have any HW that has a LED on it that you can substitute to
> see what it does?
>=20
> > Can you please be clear what you are asking me to do?
>=20
> Either produce patches that work on the the pinephone, or docs I, or
> other developers, can use to implement the functionality.
>=20
> Currently on the Pinephone the green LED lights up in the TPL/SPL
> (very early before ATF) stage and is lit up right through the the
> various FW stages, with your patch set I get no LED what so ever.

Please note that needing to confirm that we have equivalent
functionality between old and new frameworks (and
https://lore.kernel.org/all/20241110115054.2555-1-ansuelsmth@gmail.com/
might cover that) is why this series isn't ready for -next at this time.

--=20
Tom

--s7q5Ss9MtVH/krld
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmdPYJsACgkQFHw5/5Y0
tyzYlQv/UvIv0/ZyO4EbCPO7yWd8hSWUZS6mxCKkyK8SR6CQzrcLxT0LaPXRFyAx
wbD4rpzXflKjkrETlgaGm8q9mDnHFIct7JB1++PHxlPsAJf1cSl+TvdtbAt37ntn
Vy6Aj7lsPfabnYsSD37+bCpE+aNg0oebaZypNoaAD8YqMEqZ/TcoK9AGE8nuVewt
x/I8JeFyGx9H4DI7rImc3omxt2D2ilKR6GigIK/ALLOhj9ObWMa3FOHgtkMTE/c+
oUeuDgXBo8tWmvK1CGiKSiPJz8tgDibOXVmudvu5hBIu6Y3ZQy3RD38mT7LdV5zQ
8o+aYzNdesK+Tmx1iT40jynFSpNiZpnkJOz51KIRs3KF+Z7tOKhp5jh4fL331jMO
I6gmR+j4kAvz+9LJKvA17Aaibwq0t9QMFwUuSLDIchmKS0snZzrdwHnKUHgmQ/kC
bNIJ9XFZFFX6SAU4vTMK5pRf6Ise6qETuzPJw6ZpA4VFDFTUeSXrmWrC507bVP4z
XFEFaBBu
=IlS9
-----END PGP SIGNATURE-----

--s7q5Ss9MtVH/krld--

--===============1812768395751148228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1812768395751148228==--
