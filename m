Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C20AE2CAB7E
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Dec 2020 20:12:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87A8CC424BE;
	Tue,  1 Dec 2020 19:12:11 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7A01C3089F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Dec 2020 19:12:08 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id 7so1992745qtp.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Dec 2020 11:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FlU3mjmirzXDNJSFzFdqxac5lHdGrgzEGALEBAFukk4=;
 b=jJDSyTfMEEgswSelekSXeoN6lEM17Ve89ltynvwFYKqt1RC65q+fuwZDEejtA3uwLr
 iy7YZwAWedyt913/hLdtIQlnyKBfj9uL94HDyrh1cqcqwPb6z17QBFOrorgS7oDwCcYd
 GILJZPFeL0I7xsWar2EVQ6MXsR1a6AxVo6BCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FlU3mjmirzXDNJSFzFdqxac5lHdGrgzEGALEBAFukk4=;
 b=O30uRfs6IWJXLlFfNxNIgXDqkHXKBZigkP3FrLvpx+xA+NzZTLIWQTI533KUGI0h7d
 L7B2B1T4R9izNwYOWpe2goIpah3VPjjb2lLbx12uZlnwt5lu7eqNEzALz0sgnuXS0GVb
 rp9/W4W3e8owkn8/Ci55gEU9Sbe5Luqu/sm/FogBmcyx1f7USi7uvt6e/gfM0UvWbvxg
 cMsoadK5PtjKn+rZhxHJehR9SSyYRzzLTxYBeLjPzN9Cteay/4rPi9Ln30vSANwbUz3v
 6EPZ+c86yz3VCkJKGa1+HDopgZSsjET/gfHy8NEW+lvYlheFcuzkFYAONaVaaNwoRyco
 5AaQ==
X-Gm-Message-State: AOAM5335eaCJOWjSJMJ+k41HzzozTXUFoRtyYgpK53evmAFF4O/PywOc
 nsNsR44MRQ3H1omautN8Sfy98A==
X-Google-Smtp-Source: ABdhPJyDEVBeshd0tgiLzo34yatw4u4JOFbqKvC4Cdfdkw+R41moq6LBsSZh3uczdTUN1a2nyoKhXQ==
X-Received: by 2002:aed:308a:: with SMTP id 10mr2649601qtf.312.1606849927568; 
 Tue, 01 Dec 2020 11:12:07 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-135-175.ec.res.rr.com.
 [65.184.135.175])
 by smtp.gmail.com with ESMTPSA id s11sm487181qkm.124.2020.12.01.11.12.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 01 Dec 2020 11:12:06 -0800 (PST)
Date: Tue, 1 Dec 2020 14:12:04 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20201201191204.GA20093@bill-the-cat>
References: <20201103120047.1.I30ef60ea8b13322a6ec7b675dc2de5f63f336fc3@changeid>
MIME-Version: 1.0
In-Reply-To: <20201103120047.1.I30ef60ea8b13322a6ec7b675dc2de5f63f336fc3@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Masahiro Yamada <masahiroy@kernel.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] arm: cache-cp15: add error when
 region is not aligned on MMU_SECTION
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
Content-Type: multipart/mixed; boundary="===============2727171401819914369=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2727171401819914369==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2020 at 12:01:10PM +0100, Patrick Delaunay wrote:

> Since commit d877f8fd0f09 ("arm: provide a function for boards init code =
to
> modify MMU virtual-physical map"), the mmu_set_region_dcache_behaviour_ph=
ys
> parameter need to be aligned on MMU_SECTION_SIZE to avoid unpredictable
> behavior (alignment was done previously done in the function
> mmu_set_region_dcache_behaviour_phys).
>=20
> This patch raised a error when this alignment is not respected.
> Even if this function is called so early, this  message can be printed
> when CONFIG_DEBUG_UART is activated or can be treated later with
> CONFIG_PRE_CONSOLE_BUFFER.
>=20
> CC: Marek Szyprowski <m.szyprowski@samsung.com>
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

So, this series causes build problems on rpi_4_32b dra7xx_evm
dra7xx_hs_evm dra7xx_hs_evm_usb at least.  Please address as soon as
possible as I'd like to pull this in to -next for maximum testing time.
Thanks!

--=20
Tom

--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl/GlYAACgkQFHw5/5Y0
tyzoIAv/eHH3jXToFrToGpExKi0nc7LuQ5v03lKHiVFC0z9G0B6oPy/9cnkPjjPT
B+xyqwz75kQX7GqO/hogCKmIaSGTWZUxFBihnKg5RIQJUjXOwincQzSY6UlcGbzX
kihHzo2/7HhgyaXeWT71ClIa2kNFV9o5ACssMBH7v1AN7wkEEW5PvhNxJ8V/R0JV
KY0ZmGx06t1H0O1/Vrm8q5cV3zT+YaMZWGwnVzM53c26wvqPRcLFW1T8kOEFwl4c
tg3vt45qhFFywzSHQn6s171FY28OWlDxtY5aqJhggImANJA4gjkApbCp4KJ8ZLqn
LotMk1Jttmp2x80MwjIRpVd1VHoxX+qC2YQvJgr1u1b7/tH5LP7JBzYSEehFY/DO
Th72h7KiI1uizZueayFHhQsgZWc6+SzaU/f5WWR07bT1qHa+nrKyaIhmzYKghrfY
Q3i27FiuG77khroXRP5yeFgZ1bUTNbRgmhjBmvEwRAIB5dgK2N5HS4PRHCsub5B8
0t1B8g98
=I/JT
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--

--===============2727171401819914369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2727171401819914369==--
