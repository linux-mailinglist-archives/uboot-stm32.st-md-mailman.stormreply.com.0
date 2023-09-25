Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE6E7ACD23
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Sep 2023 02:37:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 915E3C6A5F2;
	Mon, 25 Sep 2023 00:37:38 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3239C6A5EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Sep 2023 00:37:36 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-59be6bcf408so62919497b3.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Sep 2023 17:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1695602256; x=1696207056;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1DyHRlZC1e+ykEDW1kW/LABAXczw/9dcVSGFsScICWs=;
 b=E3wYN6LcFUx1IPJKQhKujAmjSqA2SqFybeqg+TsIuFEafTIzRWZ6FrR0SuTEfH95zs
 6cjASMgulOSF/huBEMTbzcFLi4QT14dYgqsBM+8SguN5an2XGc5mzCOm2k3UvsEszrBm
 uOKlT59qsRTO5d3blTph2ZE3S/naUviqpewnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695602256; x=1696207056;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1DyHRlZC1e+ykEDW1kW/LABAXczw/9dcVSGFsScICWs=;
 b=YF2mpwuyMQb9jxn3d/P+4EIsqBN/lU99HUyQd3K0ukYQTQACaJPgGM6QQ+WcONoctw
 Eq8K8ZGjkQQNwxZOeYu9iJh0bj/G6wZR/38fTgqpLdOsrSW5y+PyW9kCmdBAwIS/pIzf
 XGTKX2C+eLkUWz4q7McM8kr/S6uQ13Ys7mFaA/s4f3KVMusFXWME7QLZU/K8hWUWyu40
 h3YeYVpOgLZ0AcJKpFnudqB+UBUA02PUlNTgIqOQ21bz5jwNUkS0AWqjhFas8A3NgSv2
 35QrkQh5Kfrh/EDpQSqHkY/AG/3+9DxXnVz83uTJ4TMznwsLfPsq+Mxu1pwMQxcuikIz
 McYw==
X-Gm-Message-State: AOJu0YyYMm/n71r9voPXmwwiGW0QPApd7dIeIe/qm4RdoZt6U+C2LypA
 QWcH9re9GSAK/SzpWFbpGEoYlg==
X-Google-Smtp-Source: AGHT+IFe7oacKqC3/WPkOIwveN623MYJa9QXe/pdK4nfx7S93JIJAL1JLA++vfeyL8gAhAnRRP/6xw==
X-Received: by 2002:a81:5709:0:b0:59f:72b3:e590 with SMTP id
 l9-20020a815709000000b0059f72b3e590mr1541154ywb.45.1695602255752; 
 Sun, 24 Sep 2023 17:37:35 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-d32b-b307-decd-cdc4.res6.spectrum.com.
 [2603:6081:7b00:6400:d32b:b307:decd:cdc4])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a0df802000000b00582b239674esm2146890ywf.129.2023.09.24.17.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 17:37:35 -0700 (PDT)
Date: Sun, 24 Sep 2023 20:37:32 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20230925003732.GN305624@bill-the-cat>
References: <20230924203953.1829820-1-sjg@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20230924203953.1829820-1-sjg@chromium.org>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@denx.de>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Devarsh Thakkar <devarsht@ti.com>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Rick Chen <rick@andestech.com>, Joe Hershberger <joe.hershberger@ni.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 Troy Kisky <troykiskyboundary@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Mark Kettenis <kettenis@openbsd.org>,
 Dzmitry Sankouski <dsankouski@gmail.com>,
 Sean Anderson <sean.anderson@seco.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Jerry Van Baren <vanbaren@cideas.com>, Ramon Fried <rfried.dev@gmail.com>,
 Harald Seiler <hws@denx.de>, Alexey Romanov <avromanov@sberdevices.ru>,
 Michal Suchanek <msuchanek@suse.de>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Stephen Warren <swarren@wwwdotorg.org>, Safae Ouajih <souajih@baylibre.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Evgeny Bachinin <EABachinin@sberdevices.ru>, Stefano Babic <sbabic@denx.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, Anatolij Gustschin <agust@denx.de>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Tom Warren <twarren@nvidia.com>, Bin Meng <bmeng.cn@gmail.com>,
 Tobias Waldekranz <tobias@waldekranz.com>
Subject: Re: [Uboot-stm32] [PATCH 00/25] Tidy up use of CONFIG_CMDLINE
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
Content-Type: multipart/mixed; boundary="===============2901863652343383996=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2901863652343383996==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="at3BdeWA/ipiBw1y"
Content-Disposition: inline


--at3BdeWA/ipiBw1y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 24, 2023 at 02:39:18PM -0600, Simon Glass wrote:

> It should be possible to disable CONFIG_CMDLINE and have all commands
> and related functionality dropped from U-Boot. This is useful when
> trying to reduce the size of U-Boot.
>=20
> Recent changes have stopped this from working.
>=20
> This series repairs the feature for sandbox and adds a test to stop it
> breaking again.
>=20
> Note that quite a lot of functionality is lost of CONFIG_CMDLINE is
> disabled, e.g. networking and most booting options. Further work is
> needed to make the option more generally useful.

I worry there's a lot of "make it compile, deal with it later" in here
rather than unwinding so that $X works with CMDLINE disabled or we truly
must have CMDLINE.  Perhaps it would be better to start with to take one
of the platforms that enables say networking in SPL, where we
functionally don't have a cmdline, and make that build with CMDLINE off.
Having *PL build and link and work with CMDLINE disabled would possibly
save some space too, which is always a good thing there.

--=20
Tom

--at3BdeWA/ipiBw1y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmUQ1kkACgkQFHw5/5Y0
tyy6xQv+OmIa3JulIeFO0EzpiRW8pWX8S/tufRGYnP8vb7li/Umzf8OsRESlRuLL
PobvrHDArshHmVu0DyQnCx2awpjUr/cPuMf2Gsf71f9qo4zvJx0guzzkUG37ArcS
7Pr1hPlGcG3MgYARIZKdwiWoKHdwIhmvxZTpctqyCIlZptPAT7r7tc3Z/OnAZ3BG
Rjj8pzFiABR6JZzq2h0VLpvOvcroifYhQLi6+S8E6++d10pzUHOC0hmwuXmMrQLq
u9AJr0I2voNIYG9UiTO2kYE/OL9dQklh+NGDzHzBCmXb1Ce9GMSGpiosgvO6ffDP
zpXm3D1aAl2c5Y1T3xetC7Kqbt1YUaQ0N0QTB8JhN8OCkf4gf7jAWyxq84gRYjQb
AnjnLpbdpZrfYlmjkBiqKVvwB/WuqTrYUqc0a4t6MsOWtyyE92lveyDTEkTwN0Vo
ZiSKlz9wnjUt446NwNS+wPRmYtz59JoBu2zOxZWjn/y71OpCiDPeps/phCjslUua
isu6yPOU
=mh/t
-----END PGP SIGNATURE-----

--at3BdeWA/ipiBw1y--

--===============2901863652343383996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2901863652343383996==--
