Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6FD9A710D
	for <lists+uboot-stm32@lfdr.de>; Mon, 21 Oct 2024 19:26:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B013C78012;
	Mon, 21 Oct 2024 17:26:32 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 682BDC6C855
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 17:26:24 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7b14077ec5aso506955785a.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 10:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1729531583; x=1730136383;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ly/UiLuZr7Xfdz8fHzVwcyMy2T7g34lLEuUrEDQhkYg=;
 b=dp5Ksu+brF7RS36V9Kc5bhGd0mSGrUW3koAz/sfHXJm2muSfntdcds8chY3J/7m1Jm
 wRBpw4Asctdd26sJ3cRhB+7m2YrLpfu5o5X3jos8uVz4oGUwPnG8JnUham6XGBJvwdHO
 2utCGkBek7HZQz+DWu3sbinyOAB5+qtaGWJ3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729531583; x=1730136383;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ly/UiLuZr7Xfdz8fHzVwcyMy2T7g34lLEuUrEDQhkYg=;
 b=AFaZEKtHg84L8I1gqU6STAdrOqhMMFoFi94zRjrcm1jNyBkuTSJdgM9F5cPeVlUP9h
 8YF3cmPGwofohnm3ggehulUk0DEh6NyrU832oia5u6HcCIi+CoslEBiOrbIrhdy+hdTz
 q/Vn8nhVfiWrdC46bP1T9KQXFB2YKpLJ93OfPF6uw6GikNx7yyBk+/4GuyJRQdtsb83Y
 Sn9uspdkNx4Yyt/ld2lG8itXnjX+S/DPiK3iErvJCGDoM9oW8Av6Zb2zmZ9nGWGQ4AEB
 aFWpEL80m3FyqTBDCBMHMe7Ii+pTxZaEoaEyXRnZHiiSEtKE3szeeiRO6y6lrkUxZzii
 BDYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj7CHtBHouNGv8r6gJExJvu+K9Q+ht0DuoTTUhs9MUR65OYVRbL4oY2XJlbjWKW6yF5NzWiGaIJ7LUow==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwDOJ/1XF+zF1eoYZ0gjPtr7CvE7qfRx+bCmg2dDiigDJiACCEG
 b11Z+XnASI07CtEQ15R/s4HPWhLF/GYgSJ68auJTzhHDfqCpt6A3z2xuPpaGSyQ=
X-Google-Smtp-Source: AGHT+IFuP9u7KYEpS10iBl15Z5HlPW1oWKxzIANwAJQiNMzxpVzG+VxLUCO49cansxqFxMJRKOX24A==
X-Received: by 2002:a05:620a:4047:b0:7b1:3c0e:3289 with SMTP id
 af79cd13be357-7b1755b6600mr58412185a.22.1729531583247; 
 Mon, 21 Oct 2024 10:26:23 -0700 (PDT)
Received: from bill-the-cat ([187.144.65.244])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b165a89216sm191017885a.135.2024.10.21.10.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 10:26:22 -0700 (PDT)
Date: Mon, 21 Oct 2024 11:26:13 -0600
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20241021172613.GN4959@bill-the-cat>
References: <20241021113839.318572-1-sjg@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20241021113839.318572-1-sjg@chromium.org>
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
Content-Type: multipart/mixed; boundary="===============2174762531836418758=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2174762531836418758==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0/RB41bhVlUorVM2"
Content-Disposition: inline


--0/RB41bhVlUorVM2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 01:38:08PM +0200, Simon Glass wrote:
> There has been an LED framework in U-Boot which uses driver model for
> about 9 years now. Recent work is underway to improve it and provide
> more features. It is probably a good time to drop the old code, which
> is only used by 5 boards:
>=20
>    ./tools/qconfig.py -f LED_STATUS
>    5 matches
>    eb_cpu5282 eb_cpu5282_internal mx23_olinuxino pinephone
>    socfpga_vining_fpga
>=20
> This series attempts that.
>=20
> Changes in v2:
> - Combine code-removal and defconfig changes
> - Add a patch to enable LED and LED_BOOT for these boards
> - Add a patch to enable LED and LED_BOOT for these boards
> - Enable LED on the 5 affected platforms
> - Reorder patches for bisectability

So I believe this means you missed the feedback of just doing the blind
migration rather than disabling the feature, like we used to often do
for cases where it's just a matter of changing CONFIG options. It
should:
- Not introduce a failure to build
- Just work on platforms with either OF_UPSTREAM or semi-recent device
  trees
- Just start working on those platforms when they do move to
  OF_UPSTREAM.

--=20
Tom

--0/RB41bhVlUorVM2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmcWjrUACgkQFHw5/5Y0
tyyFiAv/aHo3Tokt2eUZXHos4TznuQUnW1QEkLbjCBK7u9mU+aEH3CfMHzKLXNsH
4JpdEG6Y8Bebt4NcHmkJwQinPeZYWYCv6Vje+L3PfISCIIj2x6mi1sdNKwM6qYUr
4V8ywmb+AnBDawPz19//9niWmhYNhCiW5W/xfKSM34R6T6O/qpNkb6XcqmbURv5t
gYQi3OpvMHlMb6EEgzW+HDEQOiFo5qAPIE0gL0DOb/ZUxbEdm7uW7D7BzbpjSKlF
g6LKAaSI7hnaHsFXn17yTgnQnPfYs3UrWcEIrUCuks+d4/gvkfRhJBV348GRurtE
kn4+vC5N3Hji12572pDuCwRvSH37l7jLYWO40EjIhC0cMySpvVITOO+N1Mgx3jlX
oxUfS+y+zPmW61bi7p7GhuvWp3JTBH01z1hbfhZMDloW/mMUoP3adzmXQ60ase2c
tYcG++HwX6+HNu7k5g+dO5zjQZkv9m/t/Bog51ouX+gZkSkxTfUk1g4siplhB5Bd
CE9uAD17
=gtKj
-----END PGP SIGNATURE-----

--0/RB41bhVlUorVM2--

--===============2174762531836418758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2174762531836418758==--
