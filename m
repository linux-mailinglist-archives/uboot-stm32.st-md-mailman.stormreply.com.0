Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BCE423324
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Oct 2021 00:01:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0109BC5AB7F;
	Tue,  5 Oct 2021 22:01:53 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2A37C5AB7F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Oct 2021 22:01:50 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id b65so465007qkc.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Oct 2021 15:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4TT/tcLvWe/yAdK8lKKTqZ1qLge+PCEntzQuCcty5dc=;
 b=q9M6atqQEpfI6nnTj4zWlwBBViCy794IYrCP3Uu5lxOgTVu7xWMdep+HrSp/0FKpOL
 L9vISsJwPgdew40OCuUiOX9gnCBf/1wvXfxohi1I5c4P/KOHT5v0M/1DJNV98JcUSKYa
 g9gv3XFh6sESTt6RaZ+xu5FAIkW85o81FiW18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4TT/tcLvWe/yAdK8lKKTqZ1qLge+PCEntzQuCcty5dc=;
 b=7gH0z1eah9MygFyYaierdh5Qm4Gptr7+/Tl8nk8jNHD59mmtElvMwM2DAt6L9vH1lB
 U8PCVsSvn0J0Yu4YAKk2QVg69Rd6hPrGnmcTXzIuUV5htz8eBjHDTZNHmH7GW0aYo5MK
 TYoEOdIcNtyW2ZhuE//a8SDcujWnG53n07MRg7AfRKe070mW1zc/OweWXH7c8KbpwqKK
 rkYJgOizheGUcBMj2OHcs88xgfUETWHlnY7N0hsUNiFlYAjmEtJu2f9o++1OWG9qHLLN
 x6ySfV6WyKbSqZgSuPmncqXKnZJD3F7T13ZYe1iaT2WXWeDwnY/3MznwKoUakywklgfl
 wtUw==
X-Gm-Message-State: AOAM5323OirmetJxzAvJ9gi8/068xyJHql3xwoKdO05DQYoKzEL/LOGv
 0Mv+Dg/ssZPyVPG5Neg+7+PDAw==
X-Google-Smtp-Source: ABdhPJw/E2Ilba/13JgJFDVJjBwSAa9X9xV/6kh9c9fpi4i90trED6XsVVxnK5nNJrm0Zf/nl28XIw==
X-Received: by 2002:a37:64ce:: with SMTP id
 y197mr17219240qkb.399.1633471309776; 
 Tue, 05 Oct 2021 15:01:49 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-acff-2c31-c6db-812f.res6.spectrum.com.
 [2603:6081:7b01:cbda:acff:2c31:c6db:812f])
 by smtp.gmail.com with ESMTPSA id v3sm10236784qkf.131.2021.10.05.15.01.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 05 Oct 2021 15:01:49 -0700 (PDT)
Date: Tue, 5 Oct 2021 18:01:47 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20211005220147.GB31748@bill-the-cat>
References: <20210902115512.1.I1c6536da7609f8240549cccae2708e075dc9fcf3@changeid>
 <20210902115512.2.Ibfbc7792766c73de7904b13321d9fc5658d929a8@changeid>
MIME-Version: 1.0
In-Reply-To: <20210902115512.2.Ibfbc7792766c73de7904b13321d9fc5658d929a8@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Simon Glass <sjg@chromium.org>, Jens Wiklander <jens.wiklander@linaro.org>,
 u-boot@lists.denx.de, "Alex G ." <mr.nuke.me@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com, etienne.carriere@linaro.org
Subject: Re: [Uboot-stm32] [PATCH 2/2] tee: add a stub for tee_find_device
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
Content-Type: multipart/mixed; boundary="===============7147575409176655183=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7147575409176655183==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f1mdG47JcDrWf2Io"
Content-Disposition: inline


--f1mdG47JcDrWf2Io
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 02, 2021 at 11:56:17AM +0200, Patrick Delaunay wrote:

> Add stub for tee_find_device function when CONFIG_TEE is not activated
> to simplify the caller code.
>=20
> This patch allows to remove the CONFIG_IS_ENABLED(OPTEE) tests
> for stm32 platform.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Acked-by: Etienne Carriere <etienne.carriere@inaro.org>
> Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Applied to u-boot/master, thanks!

--=20
Tom

--f1mdG47JcDrWf2Io
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFcy0sACgkQFHw5/5Y0
tyzLzQwAsETfgkcCX0vf4BMfxoOCOsuXAmtE1ZgeqKrYPOsvhhiMVurexep0juD0
wG5m6E/xXlwLNsrfcA7lrShShAgY4Z+C45JZy6zB87mq81tmjJKkb2IjHcFL+Fc3
3WezTw+Krjgw/JifAXY3BtYeVcfuVmHnKXExpW7cEysQoOL8yo2GCrfD3R4H5AYc
jD3gZiRh16bpFexF2D0c/h2KsZuJisK2CIbXTxIuZHtSsYOo2PIkfUfJ13uSqsMg
e4IVbHsBveiYY6M4OPGrmu3bYnP4pqnGqJmS+nG2vg+IZr7H4stS126jUB0Rg+aQ
6wASRwDsIMqwGH+Kx/sksz3sVet0OFOD06IhycWOsLBc5rqQVb8pn2gKE6QBpVOl
Z0cZxCYg5WTHFM65CZXEJ1aT6NBn5Z5j4qifklkdnQhmgJHaAvKkXTnn+yt6U/pV
9AE6asYbSlmecYXzjF03La+Zmx4/dRhOEgx+rgQ9bZW/aSx8zOHW6F0WvpA+hoR3
hy46kxrT
=3tx1
-----END PGP SIGNATURE-----

--f1mdG47JcDrWf2Io--

--===============7147575409176655183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7147575409176655183==--
