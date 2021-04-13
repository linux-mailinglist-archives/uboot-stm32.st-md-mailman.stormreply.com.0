Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B14A635E15D
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Apr 2021 16:27:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71961C57B76;
	Tue, 13 Apr 2021 14:27:22 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5364AC56632
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 14:27:21 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id 1so12861719qtb.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 07:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sZcUJYpw3PPTsnPdGbfCW7xB12Y6cjMKmWE295auhgc=;
 b=CFM9vd11l4hto7Mwj2QyyTyRLoA2RpF0/lMfcGxOpmTqZPsDre+yzxNm1sY85Ssfot
 JjNHY+dboEWaMIBM+PUtb6RGlFTQ7i9bROpr9b0fQzRAFh+y5XoTX5R/SvgFAGrBAfcL
 VrHWM6qyqyAi9aTk+gZXACZZZMilfx4XZk5/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sZcUJYpw3PPTsnPdGbfCW7xB12Y6cjMKmWE295auhgc=;
 b=VnNrixRJMSF4qB3mfzKjVxxRODNgDXaoqIn1Y8dAL/oZRKqAmrvn32tB09rnqJRcZr
 pYy2aAkkdmjFa1C0YeTvsT7A/snQEU+xkXhxcVP3xYVQnNckTudNYJRXB9ZTdTo6iEZq
 Tl0skm+896ZWd8wq0kfDT4P1V9mPTegfvzIP90XlmcTsDQ10TjeLTFLrdhCajlVMIFMe
 3WcgopePMmypZGvOzcDxAb1eRXwL9DYyQEjqUl4P+yCTEe5rKM7gmYm092orlqIPfeYk
 w832KeEHLqc15j1wx3vw/hkSX0E9p/BeI9Z9ccH49Ia7fxqR5PEmGlZExRxWBRtOp4U0
 QEQg==
X-Gm-Message-State: AOAM532r6Jc/E+soYtC9eMimP3MWWQFTXvWWU9FN4PaB/xL6lZaBN5NA
 6lQ0WGfjbcn1cZ2P8o91+6sLwQ==
X-Google-Smtp-Source: ABdhPJxP2Ky8wynblBbNehhyr/LYFHwpnT8wR6KsyxbPt2PiuMaOvZJGrY3no5kqEWo4jHqzc5ODcw==
X-Received: by 2002:a05:622a:349:: with SMTP id
 r9mr30056940qtw.356.1618324040164; 
 Tue, 13 Apr 2021 07:27:20 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-140-239.ec.res.rr.com.
 [65.184.140.239])
 by smtp.gmail.com with ESMTPSA id r5sm739007qtp.75.2021.04.13.07.27.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 13 Apr 2021 07:27:19 -0700 (PDT)
Date: Tue, 13 Apr 2021 10:27:16 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210413142716.GJ1310@bill-the-cat>
References: <20210208135415.1.Ia7aa7196b93409a8618ac1ff79305061d08aa885@changeid>
MIME-Version: 1.0
In-Reply-To: <20210208135415.1.Ia7aa7196b93409a8618ac1ff79305061d08aa885@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: chenshuo <chenshuo@eswin.com>,
 =?iso-8859-1?Q?Fr=E9d=E9ric?= Danis <frederic.danis@collabora.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Simon Glass <sjg@chromium.org>, Hongwei Zhang <hongweiz@ami.com>,
 Tero Kristo <t-kristo@ti.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH] lib: optee: migration
 optee_copy_fdt_nodes for OF_LIVE support
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
Content-Type: multipart/mixed; boundary="===============4024806860481564056=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4024806860481564056==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cU68qg5BuQM4FIV6"
Content-Disposition: inline


--cU68qg5BuQM4FIV6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 08, 2021 at 01:54:31PM +0100, Patrick Delaunay wrote:

> The optee_copy_fdt_nodes is only used to copy op-tee nodes
> of U-Boot device tree (from gd->fdt_blob when OF_LIVE is not activated)
> to external device tree but it is not compatible with OF_LIVE.
>=20
> This patch migrates all used function fdt_ functions to read node on
> old_blob to ofnode functions, compatible with OF_LIVE and remove this
> parameter "old_blob".
>=20
> The generated "device tree" is checked on stm32mp platform with OF_LIVE
> activated.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--cU68qg5BuQM4FIV6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmB1qkQACgkQFHw5/5Y0
tyxRqQv+NURCljhKNCRzIZKVrjiGDhk1XYPwx8UsmCxgVoVuRmQeYkxwST+5oJJ9
D0tFZUcADWO1jjU74AexTZSdIY/oX7Hmvh+e0fF7/9//3foBrtZWSvpsruFmXQcs
fbNlGucO1ievIUvxKwV6+kagPuWfrTs4/deML1xzv0+6a8z+ntyNcUkT6xTVlG7k
C5o5lC5dxBDUm/8NMlJmJ3N42iThzpHS0fXC5qPvDlGrsF7OMzjfNQ8SBtflR+uV
79QMF6NUjZiB+Ppfk2F+DLsJsBafGWwUuWSELRH+oOD6bLHwlponEa10/2N5/Ur9
S8c+4QW3gEk4lVqZeBhANTDtzCJjk1F43atj20cxFljqy0+9hsrzJuDZTVyDXkqF
B/64qMDWdQmVeWu5pTIiVbB4+pCXg6z4CpwlbfQMSW+JLDO8wRx9Z5FPhGzy7Zgd
Tv993Ju2RmxjOrNo0Ptl7Iy8QkC46GfVMH13QQq7+YVJf8oi3uJ1/Ui/XVgso1/6
XKYmfqgQ
=zyry
-----END PGP SIGNATURE-----

--cU68qg5BuQM4FIV6--

--===============4024806860481564056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4024806860481564056==--
