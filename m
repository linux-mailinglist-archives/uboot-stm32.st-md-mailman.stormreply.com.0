Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C65A09F5265
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Dec 2024 18:18:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C26CC78014;
	Tue, 17 Dec 2024 17:18:51 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74BB5C78012
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 17:18:50 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7b6e5c74cb7so438563785a.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 09:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1734455929; x=1735060729;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Xn3jsNxk2jjBSnXeoz9lCqFbRu2oK4cR2KQOGHF6aE8=;
 b=gto58uRCvwVhWCd1Hi+5LXVe/zto/BrCldC9Hlxjws65Lialwz5FJNCjAsYcLzFmJ3
 igUtCUew/YZXOCv/ktOHPt/nw4TRpy0A6AkJZBSrX3VzjV8MilEvODvmNElRo1IxpHqk
 rL/nUGFGWZ6OSCXjJK6gMpMrSUkMc/5pH7OwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734455929; x=1735060729;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xn3jsNxk2jjBSnXeoz9lCqFbRu2oK4cR2KQOGHF6aE8=;
 b=ATaxpIi9tj6ChBcydOj2CjZnqRxEkxjM75KyGgIo5617jA2Oc0YIQuezxEBz64tAAQ
 qnv05BlVcUH2nljOF+mZg3jFNYFNreaM3JZTf1NuN+7IrFSoUEh0DDTB3WzHSMUQg8/4
 ZDBHscWhz7IipFlwbQpr8qHHKEeXfym7RpNwjLbmliN56oX8nyL+PK2ZE/c26V0wDU2g
 q2f4U3deTnAMY9x3ylRhvyMV5N6VRAh1RxG6fOQYnggum6d0zMh9U/gZkQF+ohjktLSW
 afK/jn0q9ZoSl07QkFGnTyD1Xifd2P/KbHtq85g8djF/MzMEnXTTIAx7J5pfu8HTtNWa
 WKag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrzl7rwl9e7KpBjynDJ7CaNohavR3nOv/CTqEjsd2RceLbk851TAqlKW/YvWccLKsmOgpUqSOCrY41yg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzUExz1WHGdaFnRb5SOS+uxZcLIOgh1uvO2i6cuqCu4Bu+7W8EV
 OUEN53UabikOpeZkPDtI21WKBFrH2lPKuxRH5kJJnEssu2KluliUckABn3Si0m4=
X-Gm-Gg: ASbGnct34V5zhz7N78WsMbLo9j9rEhIvigK4CFE/poW35ULfZEQtYXcKkwBnraAO9KC
 8N7gt31Oi4UBlCoEAFbNl3srebYDymAlERLa00CwkuR3Y9VJUyN7aLGpL3LgJIJzmOS4sfRqsGw
 JI62NpC40r46rcgfbYsoasU8bTuRlEiv0WklPt2p6S+iMGLACr2jShJ1/wbO/QCnMlCBuGwAZF5
 W3i82JiMA2wPtFINzevhc91D559IwLzTZCKH/ZGYpZ9eeL7A05+WqrJ
X-Google-Smtp-Source: AGHT+IEuks7onLNBv7sttLpVCV+pf8BIK+/wb8nzJCcI6BSmbaxfwu8SUbpTyT0TlJjqWQzGuPaaqQ==
X-Received: by 2002:a05:620a:4089:b0:7b6:de3e:1831 with SMTP id
 af79cd13be357-7b85949635bmr502476485a.9.1734455929457; 
 Tue, 17 Dec 2024 09:18:49 -0800 (PST)
Received: from bill-the-cat ([187.144.29.192])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b7047aa3b3sm337018885a.4.2024.12.17.09.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 09:18:48 -0800 (PST)
Date: Tue, 17 Dec 2024 11:18:45 -0600
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de, Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20241217171845.GP1505244@bill-the-cat>
References: <20241213132655.670837-1-patrice.chotard@foss.st.com>
 <173445589585.4187054.717117017229929078.b4-ty@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <173445589585.4187054.717117017229929078.b4-ty@konsulko.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Igor Opaniuk <igor.opaniuk@foundries.io>,
 Sughosh Ganu <sughosh.ganu@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32mp: Fix dram_bank_mmu_setup()
 for LMB located above ram_top
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
Content-Type: multipart/mixed; boundary="===============7916265462540320137=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7916265462540320137==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4+VuBoM0gevy55G1"
Content-Disposition: inline


--4+VuBoM0gevy55G1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 11:18:15AM -0600, Tom Rini wrote:
> On Fri, 13 Dec 2024 14:26:55 +0100, Patrice Chotard wrote:
>=20
> > Previously, all LMB marked with LMB_NOMAP (above and below ram_top)
> > are considered as invalid entry in TLB.
> >=20
> > Since commit 1a48b0be93d4 ("lmb: prohibit allocations above ram_top
> >  even from same bank") all LMB located above ram_top are now marked
> > LMB_NOOVERWRITE and no more LMB_MAP.
> >=20
> > [...]
>=20
> Applied to u-boot/master, thanks!

And apologies for applying this directly, I wanted to make sure the
regression fix got in ASAP.

--=20
Tom

--4+VuBoM0gevy55G1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmdhsnIACgkQFHw5/5Y0
tyxqFwv/XL65oalDpLtqmnjmpXon4KsfHBiZbr6wVymXDwIWfYC9hI3zQdWIuCps
c5avuV2D7BtKUaMQZBWEl7RyVQY9YOdBtq8P2HiZGnmXCoadpGnTHJWt/k+2At2u
ij+E67sboRHtKn2XHK6di23UEztU5x68r2Qh4b96L0ZMt/j8rJO2H1VPN0coBWcp
xpqCeiWy/FHt6EVXmeMW1zRX2mhZtVg4xFTLpZOt1udMFts/AcHXeJXags2MV9RN
xn5rl9Hp8GPOBSsxbKI96Oujta8PYC+4J0cxKxKnjLK5nNjee5eBtXdUZhCkjINQ
UURNemcwV11A6u1xyMuLzL+UvPk+vTCrlAmYyJLIeQXGPcDS+M5uSCya4sZwyP47
lXaDqcxs4Z/RDNMHdBExc4eLcyIYl3A6sn2HvwLGkMfW5qHbuXWkTypbj9zJJEwp
NRFBXvun3g8bBgus7FVVTIEl8L5KNycTlIsDJrJ5IpvMqBIJi4vGUABmOmYKkAsq
wIb6J6jl
=+Xzk
-----END PGP SIGNATURE-----

--4+VuBoM0gevy55G1--

--===============7916265462540320137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7916265462540320137==--
