Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C69502967ED
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Oct 2020 02:29:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C588C3FAD5;
	Fri, 23 Oct 2020 00:29:57 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B3D3C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Oct 2020 00:29:55 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id bl9so2003551qvb.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Oct 2020 17:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rZQyPAeXprnI3SdY6K+znHa1AdXFdSlLCHDM5Bn/bck=;
 b=O+kmkuzHkKtux3bIA/YfHmqC114GOjD2NgNaihQjCqjaa9oQqS+NnK8BnIguiM+LKl
 BnpuSpk3J84hFSEt5GDHcf/OqSXRVHvkI9p+yFXNKEtCTwHq34X4qq7/+zfUmUi8EE+F
 LCbeb3AlmVY14k0L7PHRQsSWWdSdZ5zsPFL1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rZQyPAeXprnI3SdY6K+znHa1AdXFdSlLCHDM5Bn/bck=;
 b=qnIqCbheniVeNoUlrL/y1izJtBw5ilOR4DppWFCkB1CpGQ+rdG2TYwun9RGghMUH0U
 Wh7L0Bou9tHhgknr/3fspPaq1RSE4uGP5i6/B/CwveTbSojOwHcyYRFVR8qfNyaSmA1Y
 FZJC838lDZEexroWv5GmeQeT1Qf/X94u1CsY2PLNwzM3MYBmSG//kQc0afa0sTseGkFL
 /zl81oqVjc1SX7QNdccB15WuBvRigEWLs7NqO6IfJt1cswsvqjXYHLPwQ6Eal/v9a3O3
 Y+LN0P4rEIv55mDSpKiqFVKrWkI8HKVqxbuKuma3/sToTobSJ9hZ0jjyCUbJK7Tb9w3m
 1+cA==
X-Gm-Message-State: AOAM532bIe7qZR6sVScJcdKkfFgZcgod8/ccoJ0pmIbbEsdDKR8xmbEK
 uZa+5M0of4hJ2JwKWxiPzX0hpQ==
X-Google-Smtp-Source: ABdhPJzvwa3WzAP2UNNgBEtBPaRnyDTAIXLzwwItmmp5NOA2siFADoPOIPqzKeF17gMB+TPGAUQcFQ==
X-Received: by 2002:a05:6214:4b2:: with SMTP id
 w18mr5127044qvz.14.1603412994430; 
 Thu, 22 Oct 2020 17:29:54 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8ebe-545f-9691-be58-8292.inf6.spectrum.com.
 [2606:a000:1401:8ebe:545f:9691:be58:8292])
 by smtp.gmail.com with ESMTPSA id g11sm2176087qkl.30.2020.10.22.17.29.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 22 Oct 2020 17:29:53 -0700 (PDT)
Date: Thu, 22 Oct 2020 20:29:51 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20201023002951.GW14816@bill-the-cat>
References: <20201012074750.15602-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20201012074750.15602-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] Remove default value of CONFIG_PREBOOT
 for CONFIG_USB_STORAGE
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
Content-Type: multipart/mixed; boundary="===============1035315110600312598=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1035315110600312598==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RL2wp5SU9DpvSuVO"
Content-Disposition: inline


--RL2wp5SU9DpvSuVO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 09:47:50AM +0200, Patrick Delaunay wrote:

> Remove the default value "usb start" for CONFIG_USB_STORAGE as the USB
> storage boot initialization is correctly managed by  distro boot command
> ('usb_boot' defined in include/config_distro_bootcmd.h already include
> the command 'usb  start').
>=20
> Fixes: 324d77998ed6 ("Define default CONFIG_PREBOOT with right config opt=
ion")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--RL2wp5SU9DpvSuVO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl+SI/8ACgkQFHw5/5Y0
tyxHTgv+Kb9Jtjz3Two+Wt7pjzumAjKrhhcO8/1zKLsavLqma5h2u02LjY+ZQRH1
iPuWh8wgQy8lHxm4IEyHXzIMbCNZjwQnWNIZlm9XjJRAf03V10vAWmH+/IsdHbin
zr+y1Sg38xb379XX21O9ta7QAktcQp93xvxuL2CrXsw2YXH1j2MwY0xtj8AP3hky
B8JW7U5lo7LrfJRJTguFw+QnJgawSl16VUo4DJby1wL9DHXmJN+j6THY9teyEgOv
AkA50SRaTZf4EZytnD7ulXj/rXd2r5kalcA0pLB/6tQK/omdO0H+YaRE6S8BQVj0
f5RfD1o8p0PydpnPubHX+qV0PIy0X2G31byqV1OBgmJTlg6yjdrXoki5N5ED2SxI
oM9HoM3wFHQRJghN4m5rG43fCL7OWq4opNtG16AdqSsiCXmwIKUvYmY2SRlhlIr8
xIIY4bTW6ZSxz0lXcgZBYd8UbFACRkwt7STVJr5UTncjCRu4AkFKzbHmEBQcunCT
t2VtfZ0M
=/9x9
-----END PGP SIGNATURE-----

--RL2wp5SU9DpvSuVO--

--===============1035315110600312598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1035315110600312598==--
