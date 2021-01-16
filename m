Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CFD2F8DA4
	for <lists+uboot-stm32@lfdr.de>; Sat, 16 Jan 2021 17:21:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF008C5718F;
	Sat, 16 Jan 2021 16:21:42 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F21B3C3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 16:21:41 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id b64so14812061qkc.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 08:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4ipTcJULKNvm7NBZeVRwM5OvIkH0s/1HrZ8UyDPxqf4=;
 b=iPRvNrFz7twvVGCaS1EFt0+lJCoB0B0HNQgI1gIsMLGZ2OD8OLxuajsUb2s8jhIsb9
 h0XvDWk7Cwy1pBVTRHSKlb0c5GdecjdWqbqma+3tvcJ8IboHy6peGfMC3pdoXasjAfud
 XOPvebUQuWsGELq7swnF/cNhbxDG+Nsr7Z8LE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4ipTcJULKNvm7NBZeVRwM5OvIkH0s/1HrZ8UyDPxqf4=;
 b=frAyFEu7vovE5UcRAR44H25DwholsaBBf5kngbPpyGRh4xK191mez2oG/YY4MV5QWW
 faVEMpLiz5JSFxeuSmPCTAmhA8wItd1Gqd/5SbcJh1bKPFKVRJfR58kJalGfBsswoxQr
 MDxfpaBvP7+27u+IPm22Xn0hWtHOEt+NPvR9e24+4ksq7TsGU42rpQY53Z0E3rc4AXe6
 YhPs2nKjBMI9F0SC1pQcPhQMAT7nx/weTvTxynawmu32CpIQ214BH3L6Me5nDs8U0sOw
 fj9lqpCdcFrcPJwnfTGxYI/5NU7jSFNX+7XWM18/XkwPPNXYoCmlOm39TSlTobbcL2cW
 GiuA==
X-Gm-Message-State: AOAM530hG0vEQWInz0EMWyKCG/dp+VuWMrQuGAgohOSHp/tlFVeJimEB
 pfAO0N3Xw+otkTM+kbHzK5umMg==
X-Google-Smtp-Source: ABdhPJytxsVrb7vEM7l/PMxQhHaLJ8a2Pe92uplJ+ZKPHfLYwPW+b/ECXDH5OTCjScllbGSn62QyXA==
X-Received: by 2002:a37:aec5:: with SMTP id
 x188mr17704562qke.144.1610814100991; 
 Sat, 16 Jan 2021 08:21:40 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b42-3f4c-bc5a-f8b8-3605-e048.res6.spectrum.com.
 [2603:6081:7b42:3f4c:bc5a:f8b8:3605:e048])
 by smtp.gmail.com with ESMTPSA id 16sm7275663qkf.112.2021.01.16.08.21.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 16 Jan 2021 08:21:40 -0800 (PST)
Date: Sat, 16 Jan 2021 11:21:38 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20210116162138.GM9782@bill-the-cat>
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127102100.11721-4-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20201127102100.11721-4-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 3/9] test: log: add test for dropped
	messages
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
Content-Type: multipart/mixed; boundary="===============7588654016690267952=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7588654016690267952==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hdhkc9EpVJoq6PQ6"
Content-Disposition: inline


--hdhkc9EpVJoq6PQ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2020 at 11:20:53AM +0100, Patrick Delaunay wrote:

> Add a new test to check the dropped messages when LOG is not ready
> with log_drop_count and the result of _log().
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--hdhkc9EpVJoq6PQ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmADEpIACgkQFHw5/5Y0
tyzlsQwAgQ5CshWd6ZaNxt3Y+0Bbi7NSgTc5ZSmYKrmMaCqNDotexEi0EV3UmhxW
uw1TFObdP/dQ3ASMqiv3xFbMC3eo/7N3xGk2qYdQvW3EVodG3mqwRnAoK22ktnIS
Ak1ZX0kmAicYdICwtSu4UkKW16hfhVRCWbQ9FccaS70Mh19pZWUHoYD15RhmhqYB
JbhDJMqOOdhh42r1OWNYmDEmWztiq6NUt/6SDFWUPpQ0SlVRmPtw+ImRvE647BoD
TkvEVW7uWFd6by4N4Zl5aJhwntBtlHQNFwe8Mi+ICE0vPmVFdhfxFBHxo4pszE7F
bMOxfiksaSyAXBAioDSQPqh6Cm/Ysb1UiKKut0QH3IiivNX+PjyQeUlszkLEpiQ4
sVz+0xTRqvWoIVqpkQTMTbMqmplApuFzjGm2SNNGGJY9CCaF1B4hyujjUW/xkZ3p
LvnxoP7QRoF3QTJ9rcqbFiRU7Np5eBRuF4Zn/A7hcMosT250r+148nSu+R/0N5g0
rp10R+tK
=5Kzs
-----END PGP SIGNATURE-----

--hdhkc9EpVJoq6PQ6--

--===============7588654016690267952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7588654016690267952==--
