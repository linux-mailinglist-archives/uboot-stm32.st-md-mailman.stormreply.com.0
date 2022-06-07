Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB6854040D
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Jun 2022 18:47:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FAEFC03FFF;
	Tue,  7 Jun 2022 16:47:16 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E738C03FE0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jun 2022 16:47:15 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id hh4so13025982qtb.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jun 2022 09:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=92hyBgbcEJ+uxnHR17eaSKd54Z7+/ys05vipUJ5Oy4E=;
 b=fjPDBajamn5UnuRrBghxq3rXpRrAHvCj1rF7SMChl7DDKWDMOXKT4qtAzQec8jieBv
 A/RyKCsUcC01d1FdeEpUZXrMTm7U91sQ7TWLV0sHMdbWJacVnxJGP9f4ZQjMtXFfdbWZ
 sCXFZQZEiZKNFsivrev5R0a4glXMV8jEQZDdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=92hyBgbcEJ+uxnHR17eaSKd54Z7+/ys05vipUJ5Oy4E=;
 b=4g21nq+Vgqbf2PX25l13Ry+AvrO/98iAd6XVtzlFNLdbdxNUyxn0x0QzbT1aXsoiPH
 L2yxWm6uvIqSshSbnv4f4p/x8jM8PYHsL6KWwwrXMeFXvEi6MEO5FhHJVrpI6ocmN1iV
 CvF8CdhjewZ2TDIS6jhGqz1Aabgy1A1J3YPW9GviQKLRu3bTICwIBJxhqP8NSx3Dk7FZ
 r/U2PfXEwCupeb8TSrE3rz4ZEkl+QzE1k7dVo/LiPtzZK5ODKpxAenJA0JXZEtCcmHSB
 qsb7bu//7YOV2n620bz3GXaFTBlIgHotUjagkMZLPMkEegX8g54w/dLBFK6r35UWsoOi
 kZDQ==
X-Gm-Message-State: AOAM531lds6R+/ga/MF5rriAs8gvzZhcv/sqD05IE5l4D7hITqsrIJGf
 gjcHEYR+g/Op1Yit8DnZTAH12w==
X-Google-Smtp-Source: ABdhPJwAclCSy7RClDkqUmaaHPa21rdwi18fTlClXZeHUVliQY6VC8pSC0icx0On+5bVirKJparJyQ==
X-Received: by 2002:ac8:6b9a:0:b0:304:ba17:c57b with SMTP id
 z26-20020ac86b9a000000b00304ba17c57bmr24048754qts.450.1654620429272; 
 Tue, 07 Jun 2022 09:47:09 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com.
 [65.184.195.139]) by smtp.gmail.com with ESMTPSA id
 d19-20020a05620a241300b006a6c230f5e0sm5012565qkn.31.2022.06.07.09.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 09:47:08 -0700 (PDT)
Date: Tue, 7 Jun 2022 12:47:06 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20220607164706.GO2484912@bill-the-cat>
References: <20220517143655.1.I4d61d5a725e965f1476b26412ed1e8329aa9ba98@changeid>
MIME-Version: 1.0
In-Reply-To: <20220517143655.1.I4d61d5a725e965f1476b26412ed1e8329aa9ba98@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] dm: core: convert
	of_machine_is_compatible to livetree
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
Content-Type: multipart/mixed; boundary="===============1466117627826086149=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1466117627826086149==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2/+Vq7w28QOSGzSM"
Content-Disposition: inline


--2/+Vq7w28QOSGzSM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2022 at 02:37:05PM +0200, Patrick Delaunay wrote:

> Replace in the function of_machine_is_compatible(), the used API
> fdt_node_check_compatible() by ofnode_device_is_compatible()
> to support a live tree.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--2/+Vq7w28QOSGzSM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmKfgQoACgkQFHw5/5Y0
tyyvvQv/bpWYMeRA9v+znhSkworqJeyPSr9x5W0vKtBdQ0CPS8YSeL93D3oW37Rs
zjzZMUeH6Ja7MGlc8vyHIHSIp4rSZlHcgKj+BSijMG+FK4PxPd8p9KL0veMKxBwK
doq8/f7AbqHSGpJMw27Uw6j99jWbEKYqvz/jDZInR50jp4rjXbvl4/qnUPyLwXr/
7jxs+a1EMn+x+DgJ/nIwpW7/uTM1X0mp4XWGQe301Dd5lx1HzkDqmpagJWT3MNF6
S7QNtW3IjWpMvJS7sGwYvfOTeSkGs3bwgl5uFWwq02TLMcSYGb7YspPzogUYT/v7
78SMhJiOHA2QZvQcKphBajI7gP+oZlvWO/Ga0xMIy1BoNXBmVw0XCZ56SGbKzOgK
H0kd5+7LJiD+yWLMW4zWzZ/zjxQnN6Dwt4uq6qymzV5Uyuaq7oSfAKPu0u9MnvOC
oo0J2ZSQhpx4crnnfOELYuidvfQTqC8hYUikFvyYJLKHdsAtLSuttIT8A6sLgpYo
oKUUG7ww
=fafH
-----END PGP SIGNATURE-----

--2/+Vq7w28QOSGzSM--

--===============1466117627826086149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1466117627826086149==--
