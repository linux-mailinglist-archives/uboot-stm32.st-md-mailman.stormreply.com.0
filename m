Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF76C9AB512
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Oct 2024 19:29:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA8CFC6DD9F;
	Tue, 22 Oct 2024 17:29:28 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28B5DC6DD6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 17:29:21 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id
 a1e0cc1a2514c-84fe454176bso1884622241.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 10:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1729618160; x=1730222960;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=41PmUGYMqxIldxuh0hIT/DG41DTNJUSPWmhdCXpSoJQ=;
 b=bGpvCd30I2cG2CRgUs5oUBgc6YFbAt3bdP47NJfrRMThcnPyH9/87DG57jR/57vtEl
 acfODKUg6Rn2xCG+EBGPz1vnztCal7A6ATLRR5bZ7HPcIqCVfb//9uS7wI+WxXlMwHGQ
 U5WjxKBpykdggW4vICVBagkZnY/VA29EZFQCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729618160; x=1730222960;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=41PmUGYMqxIldxuh0hIT/DG41DTNJUSPWmhdCXpSoJQ=;
 b=TOam+MrcqxirhLjZZuWQeCZNsAQgBUNpUtVO5+w9NpHjRY8gx8iJ6LpyAl+P4Wxsxc
 03qglZ52uv7tAumV4ZoCQbUu6uAysh73dvlWtn1VLBIA8MWx5X+LyP/zhNDRYE1UpUx7
 s9NEu4cE7R9K2VmYPIVGipehk9XoOF9AUKv7YzoPPKCfStKU+CgtB5fFQx5CD52K8wdM
 rulHlNGHBbS2q+5CJCUAAc274Sksp2AKYSpF8YfPh5P8zI2JO5Q0oloRyrnPD9nhU04G
 eaP3+zhu90xfAZs5UjiUE8ysldSIIq3NiekpLda/+eO3oX9Xy1xGf/WSF7kFDO/waadH
 KEYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJfFFGNq5qguDmOnW9mPTOFJzmRdW2AZg99lQY6bsGt1Yp7HWN/TvHcbWZAuD296l76xRcp10Q9K+cAg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzVUVnH3TErHFUyd4xyNx1oIM1S/tw11URCO6x4WHm1RhzaibcQ
 AeW8G8NYywiLOaE1l90RYpiT1UFGvhB48AJqhWqbWAaYzuTteStabevLWYX6UHU=
X-Google-Smtp-Source: AGHT+IFieOgoQWUpXgt6VXMwVjIKHe80b8BBHFK/+283RL5sKYTet2D3N1q+qcBkF5kRYx16ip5ACA==
X-Received: by 2002:a05:6122:2a09:b0:50a:49d1:f1f with SMTP id
 71dfb90a1353d-50fb62cf120mr3610792e0c.13.1729618159962; 
 Tue, 22 Oct 2024 10:29:19 -0700 (PDT)
Received: from bill-the-cat ([187.144.104.2]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b1659e614fsm298916285a.48.2024.10.22.10.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 10:29:19 -0700 (PDT)
Date: Tue, 22 Oct 2024 11:29:12 -0600
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20241022172912.GG4959@bill-the-cat>
References: <20241021113839.318572-1-sjg@chromium.org>
 <20241021172613.GN4959@bill-the-cat>
 <CAFLszTguu7hRpsSLxADsBkMgTzA_-fAR0t8Axv+8=OvxJvSRCw@mail.gmail.com>
 <20241022140204.GY4959@bill-the-cat>
 <CAFLszTj92aehOTfy_MJmaS316jRs5yYgDKFA5htOoSZs1=faNQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFLszTj92aehOTfy_MJmaS316jRs5yYgDKFA5htOoSZs1=faNQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Wan Yee Lau <wan.yee.lau@intel.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Devarsh Thakkar <devarsht@ti.com>, Sean Edmond <seanedmond@microsoft.com>,
 Sam Edwards <CFSworks@gmail.com>, Sean Anderson <seanga2@gmail.com>,
 Charles Hardin <ckhardin@gmail.com>, Alexander Gendin <agendin@matrox.com>,
 This contributor prefers not to receive mails <noreply@example.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Andy Fleming <afleming@gmail.com>,
 Stefan Roese <sr@denx.de>, Johan Jonker <jbx6244@gmail.com>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Tien Fong Chee <tien.fong.chee@intel.com>, Angelo Dureghello <angelo@sysam.it>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
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
 Okhunjon Sobirjonov <okhunjon72@gmail.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Igor Opaniuk <igor.opaniuk@gmail.com>,
 Jens Scharsig <esw@bus-elektronik.de>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Michal Simek <michal.simek@amd.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Raymond Mao <raymond.mao@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Samuel Holland <samuel@sholland.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kamil Lulko <kamil.lulko@gmail.com>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Richard Weinberger <richard@nod.at>, Artur Rojek <artur@conclusive.pl>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [Uboot-stm32] [PATCH v2 00/25] led: Remove old status-LED code
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
Content-Type: multipart/mixed; boundary="===============8188193850009365439=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8188193850009365439==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Pqe38mgScmr8731+"
Content-Disposition: inline


--Pqe38mgScmr8731+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 07:00:46PM +0200, Simon Glass wrote:
> Hi Tom,
>=20
> On Tue, 22 Oct 2024 at 16:02, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Tue, Oct 22, 2024 at 02:15:34PM +0200, Simon Glass wrote:
> > > Hi Tom,
> > >
> > > On Mon, 21 Oct 2024 at 19:26, Tom Rini <trini@konsulko.com> wrote:
> > > >
> > > > On Mon, Oct 21, 2024 at 01:38:08PM +0200, Simon Glass wrote:
> > > > > There has been an LED framework in U-Boot which uses driver model=
 for
> > > > > about 9 years now. Recent work is underway to improve it and prov=
ide
> > > > > more features. It is probably a good time to drop the old code, w=
hich
> > > > > is only used by 5 boards:
> > > > >
> > > > >    ./tools/qconfig.py -f LED_STATUS
> > > > >    5 matches
> > > > >    eb_cpu5282 eb_cpu5282_internal mx23_olinuxino pinephone
> > > > >    socfpga_vining_fpga
> > > > >
> > > > > This series attempts that.
> > > > >
> > > > > Changes in v2:
> > > > > - Combine code-removal and defconfig changes
> > > > > - Add a patch to enable LED and LED_BOOT for these boards
> > > > > - Add a patch to enable LED and LED_BOOT for these boards
> > > > > - Enable LED on the 5 affected platforms
> > > > > - Reorder patches for bisectability
> > > >
> > > > So I believe this means you missed the feedback of just doing the b=
lind
> > > > migration rather than disabling the feature, like we used to often =
do
> > > > for cases where it's just a matter of changing CONFIG options. It
> > > > should:
> > > > - Not introduce a failure to build
> > > > - Just work on platforms with either OF_UPSTREAM or semi-recent dev=
ice
> > > >   trees
> > > > - Just start working on those platforms when they do move to
> > > >   OF_UPSTREAM.
> > >
> > > Perhaps I didn't understand what you were saying. I thought you meant
> > > to enable LED and LED_BOOT on these 5 boards?
> >
> > Ah, OK, I see the disconnects now, sorry. The first comment I saw was
> > Marek's on patch #2. So yes, along with Peter's request instead of one
> > commit to disable and another commit to enable, just do 5 commits to
> > migrate from one to the other please, thanks.
>=20
> In order to maintain bisectability I need to delete some code in each
> of those commits. But if that is OK, then yes, I believe this is
> possible.

Yes, thanks.

--=20
Tom

--Pqe38mgScmr8731+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmcX4OQACgkQFHw5/5Y0
tywHBQwAj8HaVqBt6h4MuCyFi+aNnN44V8dwjKr+K1CoFIsSUXdNju35n7a1HHOy
9kCgA1UEeTmvS6NuPIs4A2mGJ3fTwcVnEZ76mzQ6ncpLphQOjwz7IudevNZMchAp
GIfT56k0O8J1MMxMmQ90WQQ/loAIdhTpmJMVrc7SKIlbbJRWOv0ZcL+csxxcn9QE
y2bRCQJwKL+glxb2bNHiOgkbqgB13k9SHXUFuImditkYgnyJwq+QxGRL1SV1IIFl
2nTmlhombDDMyx15kvahLMyqdM40aZO+eolXpuaVOF0MJEXNOqvS/wPG0Zg0otjG
/JmVVS76qz6XaLOWGvyW9uXX1cKhdh7xds+KxC3WEEbRa7DP1xR8Sbs/FhrmFE+w
ilUyInU5dQt+MwyndiNOuHYvZTHkYTTVTpY2ZSo4whlD18m9ASveKON1WXLBfwou
Ttu9rwl2ljxSH4MN7j+IVUfJuT00SgKW5rx7ZcQqOft9FPcbg1P0JAYLzidxrjF4
Wj6DXZl6
=4XlM
-----END PGP SIGNATURE-----

--Pqe38mgScmr8731+--

--===============8188193850009365439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8188193850009365439==--
